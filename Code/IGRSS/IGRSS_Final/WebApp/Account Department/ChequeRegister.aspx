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
<asp:MultiView ID="Multiview_ChequeRegister" runat="server" ActiveViewIndex="0">
<asp:View ID="View1_GridView" runat="server">
<hr /><br />
<h1>cheque register</h1>
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
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="ChequeReceivedDate" HeaderText="ChequeReceivedDate" 
                              SortExpression="ChequeReceivedDate" />
                          <asp:BoundField DataField="PersonNamegivingcheque" 
                              HeaderText="PersonNamegivingcheque" SortExpression="PersonNamegivingcheque" />
                          <asp:BoundField DataField="BankName" HeaderText="BankName" 
                              SortExpression="BankName" />
                          <asp:BoundField DataField="ChequeNo" HeaderText="ChequeNo" 
                              SortExpression="ChequeNo" />
                          <asp:BoundField DataField="ChequeDate" HeaderText="ChequeDate" 
                              SortExpression="ChequeDate" />
                          <asp:BoundField DataField="Amount" HeaderText="Amount" 
                              SortExpression="Amount" />
                          <asp:BoundField DataField="AccountName" HeaderText="AccountName" 
                              SortExpression="AccountName" />
                          <asp:BoundField DataField="DateChequeSent" HeaderText="DateChequeSent" 
                              SortExpression="DateChequeSent" />
                          <asp:BoundField DataField="DateOfHisab" HeaderText="DateOfHisab" 
                              SortExpression="DateOfHisab" />
                          <asp:BoundField DataField="InitialsOfOfficer" HeaderText="InitialsOfOfficer" 
                              SortExpression="InitialsOfOfficer" />
                          <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                              SortExpression="Remarks" Visible="False" />
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
<h1>cheque register&nbsp;</h1>
    <asp:FormView ID="FormView_ChequeRgister" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_ChequeRegister" DefaultMode="Insert" 
        EnableModelValidation="True" 
        onitemcommand="FormView_ChequeRegister_ItemCommand">
        <EditItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel1" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            ChequeReceivedDate:
            <asp:TextBox ID="ChequeReceivedDateTextBox" runat="server" 
                Text='<%# Bind("ChequeReceivedDate") %>' />
            <br />
            PersonNamegivingcheque:
            <asp:TextBox ID="PersonNamegivingchequeTextBox" runat="server" 
                Text='<%# Bind("PersonNamegivingcheque") %>' />
            <br />
            BankName:
            <asp:TextBox ID="BankNameTextBox" runat="server" 
                Text='<%# Bind("BankName") %>' />
            <br />
            ChequeNo:
            <asp:TextBox ID="ChequeNoTextBox" runat="server" 
                Text='<%# Bind("ChequeNo") %>' />
            <br />
            ChequeDate:
            <asp:TextBox ID="ChequeDateTextBox" runat="server" 
                Text='<%# Bind("ChequeDate") %>' />
            <br />
            Amount:
            <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' />
            <br />
            AccountName:
            <asp:TextBox ID="AccountNameTextBox" runat="server" 
                Text='<%# Bind("AccountName") %>' />
            <br />
            DateChequeSent:
            <asp:TextBox ID="DateChequeSentTextBox" runat="server" 
                Text='<%# Bind("DateChequeSent") %>' />
            <br />
            DateOfHisab:
            <asp:TextBox ID="DateOfHisabTextBox" runat="server" 
                Text='<%# Bind("DateOfHisab") %>' />
            <br />
            InitialsOfOfficer:
            <asp:TextBox ID="InitialsOfOfficerTextBox" runat="server" 
                Text='<%# Bind("InitialsOfOfficer") %>' />
            <br />
            Remarks:
            <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
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
    
    <asp:ObjectDataSource ID="ods_ChequeRegister" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.ChequeRegisterTableAdapters.ChequeRegisterTableAdapter" 
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" 
        onselecting="ods_ChequeRegister_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_ChequeReceivedDate" Type="DateTime" />
            <asp:Parameter Name="Original_PersonNamegivingcheque" Type="String" />
            <asp:Parameter Name="Original_BankName" Type="String" />
            <asp:Parameter Name="Original_ChequeNo" Type="Int32" />
            <asp:Parameter Name="Original_ChequeDate" Type="DateTime" />
            <asp:Parameter Name="Original_Amount" Type="Decimal" />
            <asp:Parameter Name="Original_AccountName" Type="String" />
            <asp:Parameter Name="Original_DateChequeSent" Type="DateTime" />
            <asp:Parameter Name="Original_DateOfHisab" Type="DateTime" />
            <asp:Parameter Name="Original_InitialsOfOfficer" Type="String" />
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
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_ChequeReceivedDate" Type="DateTime" />
            <asp:Parameter Name="Original_PersonNamegivingcheque" Type="String" />
            <asp:Parameter Name="Original_BankName" Type="String" />
            <asp:Parameter Name="Original_ChequeNo" Type="Int32" />
            <asp:Parameter Name="Original_ChequeDate" Type="DateTime" />
            <asp:Parameter Name="Original_Amount" Type="Decimal" />
            <asp:Parameter Name="Original_AccountName" Type="String" />
            <asp:Parameter Name="Original_DateChequeSent" Type="DateTime" />
            <asp:Parameter Name="Original_DateOfHisab" Type="DateTime" />
            <asp:Parameter Name="Original_InitialsOfOfficer" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>

