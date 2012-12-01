<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="NoRecordCertificateRegisteraspx.aspx.cs" Inherits="Register_and_marriage_NoRecordCertificateRegisteraspx" %>

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

    function AllowAlphabet(e) {
        isIE = document.all ? 1 : 0
        keyEntry = !isIE ? e.which : event.keyCode;
        if (((keyEntry >= '65') && (keyEntry <= '90')) || ((keyEntry >= '97') && (keyEntry <= '122')) || (keyEntry == '46') || (keyEntry == '32') || keyEntry == '45')
            return true;
        else {
            alert('Please Enter Only Character values.');
            return false;
        }
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

        var datePickers = ["ApplicationDisposalDate", "ApplicationDate"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
</script>
<br />
<br />
<center>
<asp:Panel id="infoDiv" runat="server" Visible="false" CssClass="infoBar" >&nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
<hr /><br /></script></center>
<asp:MultiView ID="Multiview_NoRecordCertificate" runat="server" 
        ActiveViewIndex="0">
<asp:View ID="view1_GridView" runat="server">
    <br />
<h1 style="text-align: center" align="center">No Record Certificate Register</h1>
<table>
          <tr>
                  <td align="right">
                  <table>  
                      <tr>
                          <td align="right" style="width:641px;">
                              <asp:Label ID="lbllls" runat="server" meta:resourcekey="lblllsResource1" 
                                  Text="Enter File Number :"></asp:Label>
                          </td>
                          <td align="left">
                              <asp:TextBox ID="txtFileNo" runat="server" 
                                  meta:resourcekey="txtFileNoResource1" Width="160"></asp:TextBox>
                          </td>
                          <td align="right">
                              <asp:LinkButton ID="btnSearchAppNo" runat="server" CssClass="standardButton" 
                                  meta:resourcekey="btnSearchAppNoResource1" Text="Search" />
                          </td>
                      </tr>
                    </table>
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_NoRecordCertificate" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_NoRecordCertificate" 
                      EnableModelValidation="True" 
                      onrowdeleted="GridView_NoRecordCertificate_RowDeleted" 
                      onrowdeleting="GridView_NoRecordCertificate_RowDeleting" 
                      onrowediting="GridView_NoRecordCertificate_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="Sr No" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="ApplicantName" HeaderText="Applicant Name" 
                              SortExpression="ApplicantName" />
                          <asp:BoundField DataField="Address" HeaderText="Address" 
                              SortExpression="Address" Visible="False" />
                          <asp:BoundField DataField="ApplicationDate" HeaderText="Application Date" 
                              SortExpression="ApplicationDate" Visible="False" />
                          <asp:BoundField DataField="Purpose" HeaderText="Purpose" 
                              SortExpression="Purpose" Visible="False" />
                          <asp:BoundField DataField="SignOfMarriageSubRegistrar" 
                              HeaderText="Sign Of Marriage SubRegistrar" 
                              SortExpression="SignOfMarriageSubRegistrar" />
                          <asp:BoundField DataField="ApplicationDisposalDate" 
                              HeaderText="Application Disposal Date" 
                              SortExpression="ApplicationDisposalDate" Visible="False" />
                          <asp:BoundField DataField="SignOfOfficer" HeaderText="Sign Of Officer" 
                              SortExpression="SignOfOfficer" />
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
        onclick="Button_new_Click" CssClass="standardButton" />
</asp:View>

<asp:View ID="View2_Formview" runat="server">
<center>
<h1 align="center">no record certificate Register</h1>
    <asp:FormView ID="FormView_NoRecordCertificate" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_NoRecordCertificate" DefaultMode="Insert" 
        EnableModelValidation="True" 
        onitemcommand="FormView_NoRecordCertficate_ItemCommand" 
        oniteminserted="FormView_NoRecordCertificate_ItemInserted" 
        onitemupdated="FormView_NoRecordCertificate_ItemUpdated">
        <EditItemTemplate>
               <table align="center" cellspacing="5">
			   <tr align="left"><td> Name Of Applicant :</td><td>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                       ControlToValidate="ApplicantNameTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                   </td><td> 
                   <asp:TextBox ID="ApplicantNameTextBox" runat="server"  onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("ApplicantName") %>' Width="160px" MaxLength="30" /></td></tr>
             
           
            <tr align="left"><td>Address :</td><td></td><td>
                <asp:TextBox ID="AddressTextBox" runat="server" 
                    Text='<%# Bind("Address") %>' TabIndex="1" Width="160px" MaxLength="200" /></td></tr>
            
            
            <tr align="left"><td>Date Of Application :</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="ApplicationDateTextBox" EnableViewState="False" 
                    ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td>
                <asp:TextBox ID="ApplicationDateTextBox" runat="server" 
                Text='<%# Bind("ApplicationDate") %>' TabIndex="2" Width="160px" MaxLength="20" /></td></tr>
            
            
            <tr align="left"><td>Purpose:</td><td></td><td> 
                <asp:TextBox ID="PurposeTextBox" runat="server"  onkeypress="return AllowAlphabet(event)"
                    Text='<%# Bind("Purpose") %>' TabIndex="3" Width="160px" MaxLength="100" /></td></tr>
            
           
            <tr><td>Sign Of Marriage SubRegistrar:</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="SignOfMarriageSubRegistrarTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td> 
                <asp:TextBox ID="SignOfMarriageSubRegistrarTextBox" runat="server"  onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("SignOfMarriageSubRegistrar") %>' TabIndex="4" Width="160px" 
                        MaxLength="30" /></td></tr>
            
           
            <tr align="left"><td>Date Of Application Disposal:</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="ApplicationDisposalDateTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td>
                <asp:TextBox ID="ApplicationDisposalDateTextBox" runat="server" 
                Text='<%# Bind("ApplicationDisposalDate") %>' TabIndex="5" Width="160px" 
                        MaxLength="20" /></td></tr>
            
            
            <tr align="left"><td> Sign Of Officer:</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="SignOfOfficerTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                </td><td> 
                <asp:TextBox ID="SignOfOfficerTextBox" runat="server"  onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("SignOfOfficer") %>' TabIndex="6" Width="160px" MaxLength="30" /></td></tr>
           
            <tr><td align="center" colspan="3"> 
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" CssClass="standardButton" />
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" /></td></tr>
        </EditItemTemplate>
        <InsertItemTemplate>
            
                 <table align="center" cellspacing="5">
			   <tr align="left"><td> Name Of Applicant :</td><td>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                       ControlToValidate="ApplicantNameTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                   </td><td> 
                   <asp:TextBox ID="ApplicantNameTextBox" runat="server"  onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("ApplicantName") %>' Width="160px" MaxLength="30" /></td></tr>
             
           
            <tr align="left"><td>Address :</td><td></td><td>
                <asp:TextBox ID="AddressTextBox" runat="server" 
                    Text='<%# Bind("Address") %>' TabIndex="1" Width="160px" MaxLength="200" /></td></tr>
            
            
            <tr align="left"><td>Date Of Application :</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="ApplicationDateTextBox" EnableViewState="False" 
                    ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td>
                <asp:TextBox ID="ApplicationDateTextBox" runat="server" 
                Text='<%# Bind("ApplicationDate") %>' TabIndex="2" Width="160px" MaxLength="20" /></td></tr>
            
            
            <tr align="left"><td>Purpose:</td><td></td><td> 
                <asp:TextBox ID="PurposeTextBox" runat="server"  onkeypress="return AllowAlphabet(event)"
                    Text='<%# Bind("Purpose") %>' TabIndex="3" Width="160px" MaxLength="100" /></td></tr>
            
           
            <tr align="left"><td>Sign Of Marriage SubRegistrar:</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="SignOfMarriageSubRegistrarTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td> 
                <asp:TextBox ID="SignOfMarriageSubRegistrarTextBox" runat="server"  onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("SignOfMarriageSubRegistrar") %>' TabIndex="4" Width="160px" 
                        MaxLength="30" /></td></tr>
            
           
            <tr align="left"><td>Date Of Application Disposal:</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="ApplicationDisposalDateTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td>
                <asp:TextBox ID="ApplicationDisposalDateTextBox" runat="server" 
                Text='<%# Bind("ApplicationDisposalDate") %>' TabIndex="5" Width="160px" 
                        MaxLength="20" /></td></tr>
            
            
            <tr align="left"><td> Sign Of Officer:</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="SignOfOfficerTextBox" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                </td><td> 
                <asp:TextBox ID="SignOfOfficerTextBox" runat="server"  onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("SignOfOfficer") %>' TabIndex="6" Width="160px" MaxLength="30" /></td></tr>
           
           
            <tr><td align="center" colspan="3"> 
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" CssClass="standardButton" TabIndex="7" />
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" 
                    TabIndex="8" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" TabIndex="9" /></td></tr>
            
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            ApplicantName:
            <asp:Label ID="ApplicantNameLabel" runat="server" 
                Text='<%# Bind("ApplicantName") %>' />
            <br />
            Address:
            <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            ApplicationDate:
            <asp:Label ID="ApplicationDateLabel" runat="server" 
                Text='<%# Bind("ApplicationDate") %>' />
            <br />
            Purpose:
            <asp:Label ID="PurposeLabel" runat="server" Text='<%# Bind("Purpose") %>' />
            <br />
            SignOfMarriageSubRegistrar:
            <asp:Label ID="SignOfMarriageSubRegistrarLabel" runat="server" 
                Text='<%# Bind("SignOfMarriageSubRegistrar") %>' />
            <br />
            ApplicationDisposalDate:
            <asp:Label ID="ApplicationDisposalDateLabel" runat="server" 
                Text='<%# Bind("ApplicationDisposalDate") %>' />
            <br />
            SignOfOfficer:
            <asp:Label ID="SignOfOfficerLabel" runat="server" 
                Text='<%# Bind("SignOfOfficer") %>' />
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
    
    <asp:ObjectDataSource ID="ods_NoRecordCertificate" runat="server" 
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.NoRecordCertificateTableAdapters.NoRecordCertificateregisterTableAdapter" 
        DeleteMethod="DeleteQuery" InsertMethod="Insert" UpdateMethod="UpdateQuery" 
        onselecting="ods_NoRecordCertificate_Selecting" 
        ondeleting="ods_NoRecordCertificate_Deleting">
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ApplicantName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="ApplicationDate" Type="DateTime" />
            <asp:Parameter Name="Purpose" Type="String" />
            <asp:Parameter Name="SignOfMarriageSubRegistrar" Type="String" />
            <asp:Parameter Name="ApplicationDisposalDate" Type="DateTime" />
            <asp:Parameter Name="SignOfOfficer" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ApplicantName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="ApplicationDate" Type="String" />
            <asp:Parameter Name="Purpose" Type="String" />
            <asp:Parameter Name="SignOfMarriageSubRegistrar" Type="String" />
            <asp:Parameter Name="ApplicationDisposalDate" Type="String" />
            <asp:Parameter Name="SignOfOfficer" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>

