<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="ApplicationDisposalRegister.aspx.cs" Inherits="Register_and_marriage_ApplicationDisposalRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<script language="javascript">
    function generateDatePicker(id) {
        $('input[id*="' + id + '"]').datepicker({
            showOn: "both",
            buttonImage: "/WebApp/Styles/css/sunny/images/calendar.gif",
            buttonImageOnly: true,
            changeMonth: true,
            changeYear: true,
            yearRange: '1940:2025',
            onClose: function () {
                var dateSelected = $('input[id*="' + id + '"]').datepicker('getDate');
                var dateNow = new Date();
                if (dateSelected > dateNow) {
                    alert("Selected Date is greater than Current date");
                }
            }
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
<br />
<br />
<center>
<asp:Panel id="infoDiv" runat="server" Visible="false" CssClass="infoBar" >&nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
<hr /><br /></center>
<asp:MultiView ID="Multiview_ApplicationDisposal" runat="server" 
        ActiveViewIndex="0">
<asp:View ID="View1_GridView" runat="server">
    <br />
<h1 style="text-align: center">APPLICATION DISPOSAL REGISTER</h1>
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
                      EnableModelValidation="True" 
                      onrowdeleted="GridView_ApplicationDisposal_RowDeleted" 
                      onrowdeleting="GridView_ApplicationDisposal_RowDeleting" 
                      onrowediting="GridView_ApplicationDisposal_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                          <asp:BoundField DataField="ApplicantName" HeaderText="Applicant Name" 
                              SortExpression="ApplicantName" />
                          <asp:BoundField DataField="ApplicantAddress" HeaderText="Applicant Address" 
                              SortExpression="ApplicantAddress" Visible="False" />
                          <asp:BoundField DataField="NoOfCopiesIssued" HeaderText="No Of Copies Issued" 
                              SortExpression="NoOfCopiesIssued" />
                          <asp:BoundField DataField="FeesTaken" HeaderText="Fees Taken" 
                              SortExpression="FeesTaken" />
                          <asp:BoundField DataField="ReceiptNo" HeaderText="Receipt No" 
                              SortExpression="ReceiptNo" />
                          <asp:BoundField DataField="DisposalDate" HeaderText="Disposal Date" 
                              SortExpression="DisposalDate" />
                                <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="ImageButton1" CommandName="Edit" runat="server" 
                                                ImageUrl="~/Styles/css/sunny/images/edit.png" />
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="ImageButton2" CommandName="Delete" runat="server" 
                                                ImageUrl="~/Styles/css/sunny/images/deletecross.png" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                          </asp:TemplateField>
                      </Columns>
                  </asp:GridView>
              </td>
          </tr>
 </table>
 <asp:LinkButton ID="Button_new" runat="server" Text="New" 
        onclick="Button_new_Click" CssClass="standardButton" AccessKey="n" />
</asp:View>

<asp:View ID="view2_Formview" runat="server">
<center>
<h1>APPLICATION DISPOSAL REGISTER</h1>
    <asp:FormView ID="FormView_ApplicationDisposal" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_ApplicationDisposal" DefaultMode="Insert" 
        EnableModelValidation="True" 
        onitemcommand="FormView_ApplicationDisposal_ItemCommand" 
        oniteminserted="FormView_ApplicationDisposal_ItemInserted" 
        onitemupdated="FormView_ApplicationDisposal_ItemUpdated">
        <EditItemTemplate>
             <table align="center" cellspacing="5">
                 <tr align="left"><td>Date:</td> <td>
                     &nbsp;<td>
                   <asp:TextBox ID="DateTextBox" runat="server" MaxLength="20" 
                       Text='<%# Bind("Date") %>' Width="160px" />
                   <tr align="left">
                       <td>
                           Name Of Applicant:</td>
                       <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                               ControlToValidate="ApplicantNameTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                       </td>
                       <td>
                           <asp:TextBox ID="ApplicantNameTextBox" runat="server" MaxLength="30" 
                               onkeypress="return AllowAlphabet(event)" 
                               Text='<%# Bind("ApplicantName") %>' Width="160px" />
                       </td>
                   </tr>
                   <tr align="left">
                       <td>
                           Address Of Applicant:</td>
                       <td>
                       </td>
                       <td>
                           <asp:TextBox ID="ApplicantAddressTextBox" runat="server" Height="60px" 
                               Text='<%# Bind("ApplicantAddress") %>' TextMode="MultiLine" 
                               Width="160px" />
                       </td>
                   </tr>
                   <tr align="left">
                       <td>
                           No Of Copies Issued:</td>
                       <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                               ControlToValidate="NoOfCopiesIssuedTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                       </td>
                       <td>
                           <asp:TextBox ID="NoOfCopiesIssuedTextBox" runat="server" MaxLength="10" 
                               numeric="integer" Text='<%# Bind("NoOfCopiesIssued") %>' 
                               Width="160px" />
                       </td>
                   </tr>
                   <tr align="left">
                       <td>
                           Fees Taken:</td>
                       <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                               ControlToValidate="FeesTakenTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                       </td>
                       <td>
                           <asp:TextBox ID="FeesTakenTextBox" runat="server" MaxLength="5" numeric="integer"
                               Text='<%# Bind("FeesTaken") %>' Width="160px" />
                       </td>
                   </tr>
                   <tr align="left">
                       <td>
                           Receipt No:</td>
                       <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                               ControlToValidate="ReceiptNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                       </td>
                       <td>
                           <asp:TextBox ID="ReceiptNoTextBox" runat="server" MaxLength="10" 
                               numeric="integer" Text='<%# Bind("ReceiptNo") %>' Width="160px" />
                       </td>
                   </tr>
                   <tr align="left">
                       <td>
                           Date Of Disposal:</td>
                       <td>
                       </td>
                       <td>
                           <asp:TextBox ID="DisposalDateTextBox" runat="server" MaxLength="20" 
                               Text='<%# Bind("DisposalDate") %>' Width="160px" />
                       </td>
                   </tr>
                <tr>
                <td colspan="3" align="center">
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" CssClass="standardButton" />
                &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" CssClass="standardButton" />
                </td>
                </tr>
                </table>
        </EditItemTemplate>
        
        <InsertItemTemplate>
                     
             <table align="center" cellspacing="5">
           <tr align="left"><td>Date:</td> <td>
               &nbsp;<td>
                   <asp:TextBox ID="DateTextBox" runat="server" MaxLength="20" 
                       Text='<%# Bind("Date") %>' Width="160px" />
                   <tr align="left">
                       <td>
                           Name Of Applicant:</td>
                       <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                               ControlToValidate="ApplicantNameTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                       </td>
                       <td>
                           <asp:TextBox ID="ApplicantNameTextBox" runat="server" MaxLength="30" 
                               onkeypress="return AllowAlphabet(event)" 
                               Text='<%# Bind("ApplicantName") %>' Width="160px" />
                       </td>
                   </tr>
                   <tr align="left">
                       <td>
                           Address Of Applicant:</td>
                       <td>
                       </td>
                       <td>
                           <asp:TextBox ID="ApplicantAddressTextBox" runat="server" Height="60px" 
                               Text='<%# Bind("ApplicantAddress") %>' TextMode="MultiLine" 
                               Width="160px" />
                       </td>
                   </tr>
                   <tr align="left">
                       <td>
                           No Of Copies Issued:</td>
                       <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                               ControlToValidate="NoOfCopiesIssuedTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                       </td>
                       <td>
                           <asp:TextBox ID="NoOfCopiesIssuedTextBox" runat="server" MaxLength="10" 
                               numeric="integer" Text='<%# Bind("NoOfCopiesIssued") %>' 
                               Width="160px" />
                       </td>
                   </tr>
                   <tr align="left">
                       <td>
                           Fees Taken:</td>
                       <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                               ControlToValidate="FeesTakenTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                       </td>
                       <td>
                           <asp:TextBox ID="FeesTakenTextBox" runat="server" MaxLength="5" numeric="integer"
                               Text='<%# Bind("FeesTaken") %>' Width="160px" />
                       </td>
                   </tr>
                   <tr align="left">
                       <td>
                           Receipt No:</td>
                       <td>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                               ControlToValidate="ReceiptNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                       </td>
                       <td>
                           <asp:TextBox ID="ReceiptNoTextBox" runat="server" MaxLength="10" 
                               numeric="integer" Text='<%# Bind("ReceiptNo") %>' Width="160px" />
                       </td>
                   </tr>
                   <tr align="left">
                       <td>
                           Date Of Disposal:</td>
                       <td>
                       </td>
                       <td>
                           <asp:TextBox ID="DisposalDateTextBox" runat="server" MaxLength="20" 
                               Text='<%# Bind("DisposalDate") %>' Width="160px" />
                       </td>
                   </tr>
                   <tr>
                       <td align="center" colspan="3">
                           <asp:LinkButton ID="InsertButton" runat="server" AccessKey="I" 
                               CausesValidation="True" CommandName="Insert" CssClass="standardButton" 
                               Text="Insert" />
                           &nbsp;<asp:LinkButton ID="ResetButton" runat="server" AccessKey="R" 
                               CausesValidation="False" CommandName="reset" CssClass="standardButton" 
                               onclientclick="resetTextFields();return false;" Text="Reset" />
                           &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" AccessKey="B" 
                               CausesValidation="False" CommandName="Back" CssClass="standardButton" 
                               Text="Back" />
                       </td>
                   </tr>
               </td>
               </td>
          
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
       SelectMethod="GetData" 
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
    
    <asp:ObjectDataSource ID="ods_ApplicationDisposal" runat="server"  
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.ApplicationDisposalRegisterTableAdapters.ApplicationDisposalRegisterTableAdapter" 
        DeleteMethod="DeleteQuery" InsertMethod="Insert" UpdateMethod="UpdateQuery" 
        onselecting="ods_ApplicationDisposal_Selecting" 
        ondeleting="ods_ApplicationDisposal_Deleting" 
       >
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
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
            <asp:Parameter Name="Date" Type="String" />
            <asp:Parameter Name="ApplicantName" Type="String" />
            <asp:Parameter Name="ApplicantAddress" Type="String" />
            <asp:Parameter Name="NoOfCopiesIssued" Type="Int32" />
            <asp:Parameter Name="FeesTaken" Type="Decimal" />
            <asp:Parameter Name="ReceiptNo" Type="Int32" />
            <asp:Parameter Name="DisposalDate" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>

