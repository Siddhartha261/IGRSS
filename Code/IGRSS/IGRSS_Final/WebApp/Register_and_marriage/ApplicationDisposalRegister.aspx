<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="ApplicationDisposalRegister.aspx.cs" Inherits="Register_and_marriage_ApplicationDisposalRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<script language="javascript">
    function generateDatePicker(id) {
        $('input[id*="' + id + '"]').datepicker({
            showOn: "both",
            buttonImage: "/WebApp/Styles/css/sunny/images/calendar.gif",
            buttonImageOnly: true
        });
    }
    $(function () {
        $('input[id*="InwardNoTextBox"]').keydown(function (event) {
            // Allow: backspace, delete, tab, escape, and enter
            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 ||
            // Allow: Ctrl+A
            (event.keyCode == 65 && event.ctrlKey === true) ||
            // Allow: home, end, left, right
            (event.keyCode >= 35 && event.keyCode <= 39)) {
                // let it happen, don't do anything
                return;
            }
            else {
                // Ensure that it is a number and stop the keypress
                if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                    event.preventDefault();
                }
            }
        });

        $('input[id*="InwardNoTextBox"]').blur(function () {
            if (isNaN($('input[id*="InwardNoTextBox"]').val()) || $('input[id*="InwardNoTextBox"]').val().length == 0) { $('input[id*="InwardNoTextBox"]').val(''); return; }
            var formattedNumber = 'IGR\/' + $('input[id*="InwardNoTextBox"]').val() + '\/' + new Date().getFullYear();
            $('input[id*="InwardNoTextBox"]').val(formattedNumber.toString());
        });

        var datePickers = ["DateTextBox","DisposalDateTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
</script>
<asp:MultiView ID="Multiview_ApplicationDisposal" runat="server" 
        ActiveViewIndex="0">
<asp:View ID="View1_GridView" runat="server">
<hr /><br />
<h1>application disposal register</h1>
<table>
          <tr>
                    <td align="right" style="width:641px;" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" >
                        <asp:TextBox Width="160" ID="txtFileNo" runat="server" 
                            meta:resourcekey="txtFileNoResource1"></asp:TextBox></td>
                        <td align="right">
                        <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_ApplicationDisposal" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_ApplicationDisposal" 
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                          <asp:BoundField DataField="ApplicantName" HeaderText="ApplicantName" 
                              SortExpression="ApplicantName" />
                          <asp:BoundField DataField="ApplicantAddress" HeaderText="ApplicantAddress" 
                              SortExpression="ApplicantAddress" />
                          <asp:BoundField DataField="NoOfCopiesIssued" HeaderText="NoOfCopiesIssued" 
                              SortExpression="NoOfCopiesIssued" />
                          <asp:BoundField DataField="FeesTaken" HeaderText="FeesTaken" 
                              SortExpression="FeesTaken" />
                          <asp:BoundField DataField="ReceiptNo" HeaderText="ReceiptNo" 
                              SortExpression="ReceiptNo" />
                          <asp:BoundField DataField="DisposalDate" HeaderText="DisposalDate" 
                              SortExpression="DisposalDate" />
                      </Columns>
                  </asp:GridView>
              </td>
          </tr>
 </table>
 <asp:LinkButton ID="Button_new" runat="server" Text="New" 
        onclick="Button_new_Click" CssClass="standardButton" />
</asp:View>

<asp:View ID="view2_Formview" runat="server">
<center>
<h1>application disposal register</h1>
    <asp:FormView ID="FormView_ApplicationDisposal" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_ApplicationDisposal" DefaultMode="Insert" 
        EnableModelValidation="True" 
        onitemcommand="FormView_ApplicationDisposal_ItemCommand">
        <EditItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel1" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            Date:
            <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
            <br />
            ApplicantName:
            <asp:TextBox ID="ApplicantNameTextBox" runat="server" 
                Text='<%# Bind("ApplicantName") %>' />
            <br />
            ApplicantAddress:
            <asp:TextBox ID="ApplicantAddressTextBox" runat="server" 
                Text='<%# Bind("ApplicantAddress") %>' />
            <br />
            NoOfCopiesIssued:
            <asp:TextBox ID="NoOfCopiesIssuedTextBox" runat="server" 
                Text='<%# Bind("NoOfCopiesIssued") %>' />
            <br />
            FeesTaken:
            <asp:TextBox ID="FeesTakenTextBox" runat="server" 
                Text='<%# Bind("FeesTaken") %>' />
            <br />
            ReceiptNo:
            <asp:TextBox ID="ReceiptNoTextBox" runat="server" 
                Text='<%# Bind("ReceiptNo") %>' />
            <br />
            DisposalDate:
            <asp:TextBox ID="DisposalDateTextBox" runat="server" 
                Text='<%# Bind("DisposalDate") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
                     
           <table align="center" cellspacing="5">
           <tr><td>Date:</td><td> <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
            <tr><td> Name Of Applicant:</td><td> <asp:TextBox ID="ApplicantNameTextBox" runat="server" 
                Text='<%# Bind("ApplicantName") %>' /></td></tr>
           
           
           
           
            <tr><td>Address Of Applicant:</td><td> <asp:TextBox ID="ApplicantAddressTextBox" runat="server" 
                Text='<%# Bind("ApplicantAddress") %>' /></td></tr>
            
           
            <tr><td>No Of Copies Issued:</td><td> <asp:TextBox ID="NoOfCopiesIssuedTextBox" runat="server" 
                Text='<%# Bind("NoOfCopiesIssued") %>' /></td></tr>
            
           
            <tr><td>Fees Taken:</td><td> <asp:TextBox ID="FeesTakenTextBox" runat="server" 
                Text='<%# Bind("FeesTaken") %>' /></td></tr>
            
           
            <tr><td>Receipt No:</td><td> <asp:TextBox ID="ReceiptNoTextBox" runat="server" 
                Text='<%# Bind("ReceiptNo") %>' /></td></tr>
            
           
            <tr><td> Date Of Disposal:</td><td> <asp:TextBox ID="DisposalDateTextBox" runat="server" 
                Text='<%# Bind("DisposalDate") %>' /></td></tr>
           
           
            <tr><td align="center" colspan="2"> 
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" CssClass="standardButton" />
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" /></td></tr>
          
				</table>
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            Date:
            <asp:Label ID="DateLabel" runat="server" Text='<%# Bind("Date") %>' />
            <br />
            ApplicantName:
            <asp:Label ID="ApplicantNameLabel" runat="server" 
                Text='<%# Bind("ApplicantName") %>' />
            <br />
            ApplicantAddress:
            <asp:Label ID="ApplicantAddressLabel" runat="server" 
                Text='<%# Bind("ApplicantAddress") %>' />
            <br />
            NoOfCopiesIssued:
            <asp:Label ID="NoOfCopiesIssuedLabel" runat="server" 
                Text='<%# Bind("NoOfCopiesIssued") %>' />
            <br />
            FeesTaken:
            <asp:Label ID="FeesTakenLabel" runat="server" Text='<%# Bind("FeesTaken") %>' />
            <br />
            ReceiptNo:
            <asp:Label ID="ReceiptNoLabel" runat="server" Text='<%# Bind("ReceiptNo") %>' />
            <br />
            DisposalDate:
            <asp:Label ID="DisposalDateLabel" runat="server" 
                Text='<%# Bind("DisposalDate") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.DataSetDepartmentTableAdapters.DepartmentMasterTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter DbType="Guid" Name="Original_DepartmentID" />
            <asp:Parameter Name="Original_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Guid" Name="DepartmentID" />
            <asp:Parameter Name="Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter DbType="Guid" Name="Original_DepartmentID" />
            <asp:Parameter Name="Original_Name" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</center>
    
    <asp:ObjectDataSource ID="ods_ApplicationDisposal" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.ApplicationDisposalRegisterTableAdapters.ApplicationDisposalRegisterTableAdapter" 
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" 
        onselecting="ods_ApplicationDisposal5_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Date" Type="DateTime" />
            <asp:Parameter Name="Original_ApplicantName" Type="String" />
            <asp:Parameter Name="Original_NoOfCopiesIssued" Type="Int32" />
            <asp:Parameter Name="Original_FeesTaken" Type="Decimal" />
            <asp:Parameter Name="Original_ReceiptNo" Type="Int32" />
            <asp:Parameter Name="Original_DisposalDate" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="ApplicantName" Type="String" />
            <asp:Parameter Name="ApplicantAddress" Type="String" />
            <asp:Parameter Name="NoOfCopiesIssued" Type="Int32" />
            <asp:Parameter Name="FeesTaken" Type="Decimal" />
            <asp:Parameter Name="ReceiptNo" Type="Int32" />
            <asp:Parameter Name="DisposalDate" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="ApplicantName" Type="String" />
            <asp:Parameter Name="ApplicantAddress" Type="String" />
            <asp:Parameter Name="NoOfCopiesIssued" Type="Int32" />
            <asp:Parameter Name="FeesTaken" Type="Decimal" />
            <asp:Parameter Name="ReceiptNo" Type="Int32" />
            <asp:Parameter Name="DisposalDate" Type="DateTime" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Date" Type="DateTime" />
            <asp:Parameter Name="Original_ApplicantName" Type="String" />
            <asp:Parameter Name="Original_NoOfCopiesIssued" Type="Int32" />
            <asp:Parameter Name="Original_FeesTaken" Type="Decimal" />
            <asp:Parameter Name="Original_ReceiptNo" Type="Int32" />
            <asp:Parameter Name="Original_DisposalDate" Type="DateTime" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>

