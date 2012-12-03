<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="LibraryRegister.aspx.cs" Inherits="Register_and_marriage_LibraryRegisteraspx" %>

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
                dateFormat: "dd/mm/yy",
                onClose: function () {
                    var dateSelected = $('input[id*="' + id + '"]').datepicker('getDate');
                    var dateNow = new Date();
                    if (dateSelected > dateNow) {
                        alert("Selected Date is greater than Current date");
                        $('input[id*="' + id + '"]').val("");
                        $('input[id*="' + id + '"]').focus();
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

        var datePickers = ["Date_Of_CommunicationTextBox", "Date_Of_ReceiptTextBox"];
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
<asp:MultiView ID="Multiview_LibraryRegister" runat="server" ActiveViewIndex="0">
<asp:View ID="View1_LibraryRgister" runat="server">
<br />
<h1 style="text-align: center">Library Register</h1>
<table>
          <tr>
          <td>
          <table>
          <tr>
                    <td align="right" style="width:641px;" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" >
                        <asp:TextBox Width="160" ID="txtSearch" runat="server" 
                            meta:resourcekey="txtFileNoResource1"></asp:TextBox></td>
                        <td align="right">
                        <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />
                    </td>
                    </tr>
                    </td>
                    </table>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="LibraryRegister" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_LibraryRegister" 
                      EnableModelValidation="True" onrowdeleted="LibraryRegister_RowDeleted" 
                      onrowdeleting="LibraryRegister_RowDeleting" 
                      onrowediting="LibraryRegister_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                              ReadOnly="True" SortExpression="SrNo" 
                              InsertVisible="False" Visible="False" />
                          <asp:BoundField DataField="Title" HeaderText="Title" 
                              SortExpression="Title" />
                          <asp:BoundField DataField="Author" HeaderText="Author" 
                              SortExpression="Author" />
                          <asp:BoundField DataField="Price" HeaderText="Price" 
                              SortExpression="Price" />
                          <asp:BoundField DataField="No_Of_Communication" HeaderText="No Of Communication" 
                              SortExpression="No_Of_Communication" Visible="False" />
                          <asp:BoundField DataField="Date_Of_Communication" HeaderText="Date Of Communication" 
                              SortExpression="Date_Of_Communication" Visible="False" />
                          <asp:BoundField DataField="Date_Of_Receipt" 
                              HeaderText="Date Of Receipt" SortExpression="Date_Of_Receipt" 
                              Visible="False" />
                          <asp:BoundField DataField="No_Of_Copies_Receivecd" 
                              HeaderText="No Of Copies Receivecd" 
                              SortExpression="No_Of_Copies_Receivecd" />
                          <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                              SortExpression="Remarks" Visible="False" />
                              <asp:TemplateField HeaderText="Actions"><ItemTemplate><table><tr><td><asp:ImageButton ID="ImageButton1" CommandName="Edit" runat="server" 
                                                ImageUrl="~/Styles/css/sunny/images/edit.png" /></td><td><asp:ImageButton ID="ImageButton2" CommandName="Delete" runat="server" 
                                                ImageUrl="~/Styles/css/sunny/images/deletecross.png" /></td></tr></table></ItemTemplate></asp:TemplateField>
                      </Columns>
                  </asp:GridView>
              </td>
          </tr>
 </table>
 <asp:LinkButton ID="Button_new" runat="server" Text="New" 
        onclick="Button_new_Click" CssClass="standardButton" AccessKey="n" />
</asp:View>

<asp:View ID="View2_LibraryRegister" runat="server">
<center>
<h1>Library Register</h1>
    <asp:FormView ID="FormView_LibraryRegister" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_LibraryRegister" DefaultMode="Insert" 
        EnableModelValidation="True" onitemcommand="FormView_LibraryRegister_ItemCommand" 
        oniteminserted="FormView_LibraryRegister_ItemInserted" 
        onitemupdated="FormView_LibraryRegister_ItemUpdated">
        <EditItemTemplate>
                                                   
                                                           <table align="center" cellspacing="5">
															 <tr align="left">
															 <td>
															 Title Of Book :
															 </td><td>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                                         ErrorMessage="*" ControlToValidate="TitleTextBox">*</asp:RequiredFieldValidator>
                                                                 </td>
															 <td><asp:TextBox ID="TitleTextBox" runat="server" onkeypress="return AllowAlphabet(event)" Text='<%# Bind("Title") %>' 
                                                                     MaxLength="25" Width="160px" />
															 </td>
															 </tr>

															 
                                                              <tr align="left"><td> Author Of Book :</td><td>
                                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                                      ErrorMessage="*" ControlToValidate="AuthorTextBox">*</asp:RequiredFieldValidator>
                                                                  </td><td>
                                                                  <asp:TextBox ID="AuthorTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                                                                      Text='<%# Bind("Author") %>' MaxLength="30" Width="160px" /></td></tr>
                                                             
                                                           
                                                              
                                                              <tr align="left" ><td>Price:</td><td>
                                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                                      ErrorMessage="*" ControlToValidate="PriceTextBox">*</asp:RequiredFieldValidator>
                                                                  </td><td><asp:TextBox ID="PriceTextBox" runat="server" 
                                                                      Text='<%# Bind("Price") %>' MaxLength="5" numeric="integer" 
                                                                      Width="160px" /></td></tr>
                                                              
                                                              <tr align="left"><td>No Of Communication :</td><td>
                                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                                      ErrorMessage="*" ControlToValidate="No_Of_CommunicationTextBox">*</asp:RequiredFieldValidator>
                                                                  </td><td>
                                                                  <asp:TextBox ID="No_Of_CommunicationTextBox" runat="server" 
                                                                  Text='<%# Bind("No_Of_Communication") %>' MaxLength="5" numeric="integer" 
                                                                      Width="160px" /></td></tr>
                                                              
                                                              
                                                              <tr align="left"><td> Date Of Communication :</td><td>
                                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                                      ErrorMessage="*" ControlToValidate="Date_Of_CommunicationTextBox">*</asp:RequiredFieldValidator>
                                                                  </td><td>
                                                                  <asp:TextBox ID="Date_Of_CommunicationTextBox" runat="server" 
                                                                  Text='<%# Bind("Date_Of_Communication") %>' MaxLength="20" Width="160px" /></td></tr>
                                                             
                                                              
                                                              <tr align="left"><td>Date Of Receipt :</td><td></td><td>
                                                                  <asp:TextBox ID="Date_Of_ReceiptTextBox" runat="server" 
                                                                  Text='<%# Bind("Date_Of_Receipt") %>' MaxLength="20" Width="160px" /></td></tr>
                                                              
                                                              
                                                              <tr align="left"><td>No Of Copies Receivecd :</td><td>
                                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                                      ErrorMessage="*" ControlToValidate="No_Of_Copies_ReceivecdTextBox">*</asp:RequiredFieldValidator>
                                                                  </td><td> 
                                                                  <asp:TextBox ID="No_Of_Copies_ReceivecdTextBox" runat="server" 
                                                                  Text='<%# Bind("No_Of_Copies_Receivecd") %>' MaxLength="5" numeric="integer" 
                                                                      Width="160px" /></td></tr>
                                                              
                                                             
                                                              <tr align="left"><td style="height: 68px"> Remarks :</td><td></td><td style="height: 68px"> 
                                                                  <asp:TextBox ID="RemarksTextBox" runat="server" 
                                                                      Text='<%# Bind("Remarks") %>' AccessKey="i" Height="60px" 
                                                                      TextMode="MultiLine" Width="160px" /></td></tr>
                                                             
                                                             
                                                             
                                                              <tr><td colspan="3" align="center">
                                                                  <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Update" CssClass="standardButton" Text="Update" AccessKey="U" />
                            &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" 
                            CausesValidation="False" CommandName="Cancel" CssClass="standardButton" 
                            Text="Reset" onclientclick="resetTextFields();return false;" AccessKey="R" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Back" CssClass="standardButton" 
                            Text="Back" AccessKey="B" /></td></tr>
        </EditItemTemplate>
        <InsertItemTemplate>
                                                                                                    
                                                                     
                                                                                                    
                                                                                                   
                                                              <table align="center" cellspacing="5">
															 <tr align="left">
															 <td>
															 Title Of Book :
															 </td><td>
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                                         ErrorMessage="*" ControlToValidate="TitleTextBox">*</asp:RequiredFieldValidator>
                                                                 </td>
															 <td><asp:TextBox ID="TitleTextBox" runat="server" onkeypress="return AllowAlphabet(event)" Text='<%# Bind("Title") %>' 
                                                                     MaxLength="25" Width="160px" />
															 </td>
															 </tr>

															 
                                                              <tr align="left"><td> Author Of Book :</td><td>
                                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                                      ErrorMessage="*" ControlToValidate="AuthorTextBox">*</asp:RequiredFieldValidator>
                                                                  </td><td>
                                                                  <asp:TextBox ID="AuthorTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                                                                      Text='<%# Bind("Author") %>' MaxLength="30" Width="160px" /></td></tr>
                                                             
                                                           
                                                              
                                                              <tr align="left" ><td>Price:</td><td>
                                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                                      ErrorMessage="*" ControlToValidate="PriceTextBox">*</asp:RequiredFieldValidator>
                                                                  </td><td><asp:TextBox ID="PriceTextBox" runat="server" 
                                                                      Text='<%# Bind("Price") %>' MaxLength="5" numeric="integer" 
                                                                      Width="160px" /></td></tr>
                                                              
                                                              <tr align="left"><td>No Of Communication :</td><td>
                                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                                      ErrorMessage="*" ControlToValidate="No_Of_CommunicationTextBox">*</asp:RequiredFieldValidator>
                                                                  </td><td>
                                                                  <asp:TextBox ID="No_Of_CommunicationTextBox" runat="server" 
                                                                  Text='<%# Bind("No_Of_Communication") %>' MaxLength="5" numeric="integer" 
                                                                      Width="160px" /></td></tr>
                                                              
                                                              
                                                              <tr align="left"><td> Date Of Communication :</td><td>
                                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                                                      ErrorMessage="*" ControlToValidate="Date_Of_CommunicationTextBox">*</asp:RequiredFieldValidator>
                                                                  </td><td>
                                                                  <asp:TextBox ID="Date_Of_CommunicationTextBox" runat="server" 
                                                                  Text='<%# Bind("Date_Of_Communication") %>' MaxLength="20" Width="160px" /></td></tr>
                                                             
                                                              
                                                              <tr align="left"><td>Date Of Receipt :</td><td></td><td>
                                                                  <asp:TextBox ID="Date_Of_ReceiptTextBox" runat="server" 
                                                                  Text='<%# Bind("Date_Of_Receipt") %>' MaxLength="20" Width="160px" /></td></tr>
                                                              
                                                              
                                                              <tr align="left"><td>No Of Copies Receivecd :</td><td>
                                                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                                      ErrorMessage="*" ControlToValidate="No_Of_Copies_ReceivecdTextBox">*</asp:RequiredFieldValidator>
                                                                  </td><td> 
                                                                  <asp:TextBox ID="No_Of_Copies_ReceivecdTextBox" runat="server" 
                                                                  Text='<%# Bind("No_Of_Copies_Receivecd") %>' MaxLength="5" numeric="integer" 
                                                                      Width="160px" /></td></tr>
                                                              
                                                             
                                                              <tr align="left"><td style="height: 68px"> Remarks :</td><td></td><td style="height: 68px"> 
                                                                  <asp:TextBox ID="RemarksTextBox" runat="server" 
                                                                      Text='<%# Bind("Remarks") %>' AccessKey="i" Height="60px" 
                                                                      TextMode="MultiLine" Width="160px" /></td></tr>
                                                             
                                                             
                                                              <tr><td colspan="3" align="center">
                                                                  <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" CssClass="standardButton" Text="Insert" OnClientClick="checkForEmptyFields();" AccessKey="I" />
                            &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" 
                            CausesValidation="False" CommandName="Cancel" CssClass="standardButton" 
                            Text="Reset" onclientclick="resetTextFields();return false;" AccessKey="R" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Back" CssClass="standardButton" 
                            Text="Back" AccessKey="B" /></td></tr>
                            </table>
                                                              
        

                                                              
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            Title:
            <asp:Label ID="TitleLabel" runat="server" 
                Text='<%# Bind("Title") %>' />
            <br />
            Author:
            <asp:Label ID="AuthorLabel" runat="server" 
                Text='<%# Bind("Author") %>' />
            <br />
            Price:
            <asp:Label ID="PriceLabel" runat="server" 
                Text='<%# Bind("Price") %>' />
            <br />
            No_Of_Communication:
            <asp:Label ID="No_Of_CommunicationLabel" runat="server" 
                Text='<%# Bind("No_Of_Communication") %>' />
            <br />
            Date_Of_Communication:
            <asp:Label ID="Date_Of_CommunicationLabel" runat="server" 
                Text='<%# Bind("Date_Of_Communication") %>' />
            <br />
            Date_Of_Receipt:
            <asp:Label ID="Date_Of_ReceiptLabel" runat="server" 
                Text='<%# Bind("Date_Of_Receipt") %>' />
            <br />
            No_Of_Copies_Receivecd:
            <asp:Label ID="No_Of_Copies_ReceivecdLabel" runat="server" 
                Text='<%# Bind("No_Of_Copies_Receivecd") %>' />
            <br />
            Remarks:
            <asp:Label ID="RemarksLabel" runat="server" 
                Text='<%# Bind("Remarks") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
</center>
    
    <asp:ObjectDataSource ID="ods_LibraryRegister" runat="server" 
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.LibraryRegisterTableAdapters.LibraryRegisterTableAdapter" 
        DeleteMethod="DeleteQuery" InsertMethod="Insert" UpdateMethod="UpdateQuery" 
        onselecting="ods_Library_Selecting" 
        ondeleting="ods_LibraryRegister_Deleting">
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="No_Of_Communication" Type="Int32" />
            <asp:Parameter Name="Date_Of_Communication" Type="DateTime" />
            <asp:Parameter Name="Date_Of_Receipt" Type="DateTime" />
            <asp:Parameter Name="No_Of_Copies_Receivecd" Type="Int32" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearch" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Author" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="No_Of_Communication" Type="Int32" />
            <asp:Parameter Name="Date_Of_Communication" Type="String" />
            <asp:Parameter Name="Date_Of_Receipt" Type="String" />
            <asp:Parameter Name="No_Of_Copies_Receivecd" Type="Int32" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>

</asp:Content>

