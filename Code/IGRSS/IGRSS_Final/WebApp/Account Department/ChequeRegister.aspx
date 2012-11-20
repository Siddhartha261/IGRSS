<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="ChequeRegister.aspx.cs" Inherits="Account_Department_ChequeRegister" %>

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

        var datePickers = ["DateOfHisabTextBox", "DateChequeSentTextBox", "ChequeReceivedDateTextBox", "ChequeDateTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
</script>

<br />
<br />
<center>
<asp:Panel id="infoDiv" runat="server" Visible="false" CssClass="infoBar" >&nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
<hr /><br />
<asp:MultiView ID="Multiview_ChequeRegister" runat="server" ActiveViewIndex="0">
<asp:View ID="View1_GridView" runat="server">
    <br />
<h1 style="text-align: center">CHEQUE REGISTER</h1>
<table>
          <tr>
          <td align="right">
          <table>
          <tr>
                    <td align="right" style="width:641px;" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" >
                        <asp:TextBox Width="160" ID="txtFileNo" runat="server" 
                            meta:resourcekey="txtFileNoResource1" ></asp:TextBox></td>
                        <td align="right">
                        <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />
                    </td>
          </tr>
          </table>
          </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_ChequeRegister" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_ChequeRegister" 
                      EnableModelValidation="True" 
                      onrowdeleted="GridView_ChequeRegister_RowDeleted" 
                      onrowdeleting="GridView_ChequeRegister_RowDeleting" 
                      onrowediting="GridView_ChequeRegister_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="ChequeReceivedDate" HeaderText="Cheque Received Date" 
                              SortExpression="ChequeReceivedDate" />
                          <asp:BoundField DataField="PersonNamegivingcheque" 
                              HeaderText="Name Of Person Giving Cheque" 
                              SortExpression="PersonNamegivingcheque" />
                          <asp:BoundField DataField="BankName" HeaderText="Bank Name" 
                              SortExpression="BankName" />
                          <asp:BoundField DataField="ChequeNo" HeaderText="Cheque No" 
                              SortExpression="ChequeNo" />
                          <asp:BoundField DataField="ChequeDate" HeaderText="Cheque Date" 
                              SortExpression="ChequeDate" />
                          <asp:BoundField DataField="Amount" HeaderText="Amount" 
                              SortExpression="Amount" />
                          <asp:BoundField DataField="AccountName" HeaderText="Account Name" 
                              SortExpression="AccountName" />
                          <asp:BoundField DataField="DateChequeSent" HeaderText="Date Cheque Sent" 
                              SortExpression="DateChequeSent" />
                          <asp:BoundField DataField="DateOfHisab" HeaderText="Date Of Hisab" 
                              SortExpression="DateOfHisab" />
                          <asp:BoundField DataField="InitialsOfOfficer" HeaderText="InitialsOfOfficer" 
                              SortExpression="InitialsOfOfficer" Visible="False" />
                          <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                              SortExpression="Remarks" Visible="False" />
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

<asp:View ID="view2_Formview" runat="server">
<center>
<h1>CHEQUE REGISTER</h1>
    <asp:FormView ID="FormView_ChequeRgister" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_ChequeRegister" DefaultMode="Insert" 
        EnableModelValidation="True" 
        onitemcommand="FormView_ChequeRegister_ItemCommand" 
        oniteminserted="FormView_ChequeRgister_ItemInserted" 
        onitemupdated="FormView_ChequeRgister_ItemUpdated">
        <EditItemTemplate>
                              <table align="center" cellspacing="5">
			
			<tr>
             <td>Date Of Cheque Received:
             </td>
              <td><asp:TextBox ID="ChequeReceivedDateTextBox" runat="server" 
                Text='<%# Bind("ChequeReceivedDate") %>' />
                </td>	
                 <td>Person Name giving The cheque:</td>
			<td> <asp:TextBox ID="PersonNamegivingchequeTextBox" runat="server" 
                Text='<%# Bind("PersonNamegivingcheque") %>' /></td>
				</tr>
				
            <tr>
           
            <td>Bank Name:</td><td> <asp:TextBox ID="BankNameTextBox" runat="server" 
                Text='<%# Bind("BankName") %>' /></td>
            
           
            <td> Cheque No:</td><td> <asp:TextBox ID="ChequeNoTextBox" runat="server" 
                Text='<%# Bind("ChequeNo") %>' /></td>
           </tr>
           <tr>
            <td>Date Of Cheque:</td><td> <asp:TextBox ID="ChequeDateTextBox" runat="server" 
                Text='<%# Bind("ChequeDate") %>' /></td>
            
           
            <td> Amount:</td><td> <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' /></td>
          
           </tr>
		   <tr>
            <td>Account Name:</td><td><asp:TextBox ID="AccountNameTextBox" runat="server" 
                Text='<%# Bind("AccountName") %>' /></td>
            
            
            <td>Date Of Cheque Sent:</td><td> <asp:TextBox ID="DateChequeSentTextBox" runat="server" 
                Text='<%# Bind("DateChequeSent") %>' /></td>
				</tr>
            
           <tr>
            <td> Date Of Hisab:</td><td> <asp:TextBox ID="DateOfHisabTextBox" runat="server" 
                Text='<%# Bind("DateOfHisab") %>' /></td>
           
           
            <td>Initials Of Officer:</td><td> <asp:TextBox ID="InitialsOfOfficerTextBox" runat="server" 
                Text='<%# Bind("InitialsOfOfficer") %>' /></td>
            <tr>
                <td>
                    Remarks:</td>
                <td>
                    <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
                </td>
                <td>
                </td>
             <tr><td colspan="4" align="center"><asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                 CommandName="Update" Text="Update" CssClass="standardButton"/>
                  &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" />
             &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                 CausesValidation="False" CommandName="Back" Text="Back"  CssClass="standardButton"/></td></tr>
             
        </EditItemTemplate>

        <InsertItemTemplate>                                            
        
                                <table align="center" cellspacing="5">
			
			<tr>
             <td>Date Of Cheque Received:
             </td>
              <td><asp:TextBox ID="ChequeReceivedDateTextBox" runat="server" 
                Text='<%# Bind("ChequeReceivedDate") %>' />
                </td>	
                 <td>Person Name giving The cheque:</td>
			<td> <asp:TextBox ID="PersonNamegivingchequeTextBox" runat="server" 
                Text='<%# Bind("PersonNamegivingcheque") %>' /></td>
				</tr>
				
            <tr>
           
            <td>Bank Name:</td><td> <asp:TextBox ID="BankNameTextBox" runat="server" 
                Text='<%# Bind("BankName") %>' /></td>
            
           
            <td> Cheque No:</td><td> <asp:TextBox ID="ChequeNoTextBox" runat="server" 
                Text='<%# Bind("ChequeNo") %>' /></td>
           </tr>
           <tr>
            <td>Date Of Cheque:</td><td> <asp:TextBox ID="ChequeDateTextBox" runat="server" 
                Text='<%# Bind("ChequeDate") %>' /></td>
            
           
            <td> Amount:</td><td> <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' /></td>
          
           </tr>
		   <tr>
            <td>Account Name:</td><td><asp:TextBox ID="AccountNameTextBox" runat="server" 
                Text='<%# Bind("AccountName") %>' /></td>
            
            
            <td>Date Of Cheque Sent:</td><td> <asp:TextBox ID="DateChequeSentTextBox" runat="server" 
                Text='<%# Bind("DateChequeSent") %>' /></td>
				</tr>
            
           <tr>
            <td> Date Of Hisab:</td><td> <asp:TextBox ID="DateOfHisabTextBox" runat="server" 
                Text='<%# Bind("DateOfHisab") %>' /></td>
           
           
            <td>Initials Of Officer:</td><td> <asp:TextBox ID="InitialsOfOfficerTextBox" runat="server" 
                Text='<%# Bind("InitialsOfOfficer") %>' /></td>
            <tr>
                <td>
                    Remarks:</td>
                <td>
                    <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
                </td>
                <td>
                </td>
           
            
            <tr>
			<td  align="center" colspan="4"> 
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" CssClass="standardButton" />
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" /></td></tr>
           
           
           
           
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            ChequeReceivedDate:
            <asp:Label ID="ChequeReceivedDateLabel" runat="server" 
                Text='<%# Bind("ChequeReceivedDate") %>' />
            <br />
            PersonNamegivingcheque:
            <asp:Label ID="PersonNamegivingchequeLabel" runat="server" 
                Text='<%# Bind("PersonNamegivingcheque") %>' />
            <br />
            BankName:
            <asp:Label ID="BankNameLabel" runat="server" Text='<%# Bind("BankName") %>' />
            <br />
            ChequeNo:
            <asp:Label ID="ChequeNoLabel" runat="server" Text='<%# Bind("ChequeNo") %>' />
            <br />
            ChequeDate:
            <asp:Label ID="ChequeDateLabel" runat="server" 
                Text='<%# Bind("ChequeDate") %>' />
            <br />
            Amount:
            <asp:Label ID="AmountLabel" runat="server" Text='<%# Bind("Amount") %>' />
            <br />
            AccountName:
            <asp:Label ID="AccountNameLabel" runat="server" 
                Text='<%# Bind("AccountName") %>' />
            <br />
            DateChequeSent:
            <asp:Label ID="DateChequeSentLabel" runat="server" 
                Text='<%# Bind("DateChequeSent") %>' />
            <br />
            DateOfHisab:
            <asp:Label ID="DateOfHisabLabel" runat="server" 
                Text='<%# Bind("DateOfHisab") %>' />
            <br />
            InitialsOfOfficer:
            <asp:Label ID="InitialsOfOfficerLabel" runat="server" 
                Text='<%# Bind("InitialsOfOfficer") %>' />
            <br />
            Remarks:
            <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
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
    
    <asp:ObjectDataSource ID="ods_ChequeRegister" runat="server"  
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.ChequeRegisterTableAdapters.ChequeRegisterTableAdapter" 
        DeleteMethod="DeleteQuery" InsertMethod="Insert" UpdateMethod="UpdateQuery" 
        onselecting="ods_ChequeRegister_Selecting" 
        ondeleting="ods_ChequeRegister_Deleting" 
        >
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ChequeReceivedDate" Type="DateTime" />
            <asp:Parameter Name="PersonNamegivingcheque" Type="String" />
            <asp:Parameter Name="BankName" Type="String" />
            <asp:Parameter Name="ChequeNo" Type="Int32" />
            <asp:Parameter Name="ChequeDate" Type="DateTime" />
            <asp:Parameter Name="Amount" Type="Decimal" />
            <asp:Parameter Name="AccountName" Type="String" />
            <asp:Parameter Name="DateChequeSent" Type="DateTime" />
            <asp:Parameter Name="DateOfHisab" Type="DateTime" />
            <asp:Parameter Name="InitialsOfOfficer" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ChequeReceivedDate" Type="String" />
            <asp:Parameter Name="PersonNamegivingcheque" Type="String" />
            <asp:Parameter Name="BankName" Type="String" />
            <asp:Parameter Name="ChequeNo" Type="Int32" />
            <asp:Parameter Name="ChequeDate" Type="String" />
            <asp:Parameter Name="Amount" Type="Decimal" />
            <asp:Parameter Name="AccountName" Type="String" />
            <asp:Parameter Name="DateChequeSent" Type="String" />
            <asp:Parameter Name="DateOfHisab" Type="DateTime" />
            <asp:Parameter Name="InitialsOfOfficer" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</center>
</asp:Content>

