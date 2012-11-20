<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="GrantRegister.aspx.cs" Inherits="Account_Department_GrantRegister" %>

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

        var datePickers = ["Date"];
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
<asp:MultiView ID="Multiview_GrantRegister" runat="server" ActiveViewIndex="0">
<asp:View ID="view1_GridView" runat="server">

<h1 style="text-align: center">GRANT REGISTER</h1>
<table>
          <tr>
          <td>
          <table align="center">
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
                  <asp:GridView ID="GridView_GrantRegister" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_GrantRegister" 
                      EnableModelValidation="True" 
                      onrowdeleting="GridView_GrantRegister_RowDeleting" 
                      onrowediting="GridView_GrantRegister_RowEditing" 
                      onrowdeleted="GridView_GrantRegister_RowDeleted">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="BillNo" HeaderText="Bill No" 
                              SortExpression="BillNo" />
                          <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                          <asp:BoundField DataField="DetailOfBill" HeaderText="DetailOfBill" 
                              SortExpression="DetailOfBill" Visible="False" />
                          <asp:BoundField DataField="AmountOfBill" HeaderText="Amount Of Bill" 
                              SortExpression="AmountOfBill" />
                          <asp:BoundField DataField="TotalExpense" HeaderText="Total Expense" 
                              SortExpression="TotalExpense" />
                          <asp:BoundField DataField="Balance" HeaderText="Balance" 
                              SortExpression="Balance" />
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
<h1>GRANT REGISTER</h1>
    <asp:FormView ID="FormView_GrantRegister" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_GrantRegister" DefaultMode="Insert" 
        EnableModelValidation="True" onitemcommand="FormView_GrantRegister_ItemCommand" 
        oniteminserting="FormView_GrantRegister_ItemInserting" 
        oniteminserted="FormView_GrantRegister_ItemInserted" 
        onitemupdated="FormView_GrantRegister_ItemUpdated">
        <EditItemTemplate>
            <table align="center" cellspacing="5">
			 <tr><td> Bill No:</td><td><asp:TextBox ID="BillNoTextBox" runat="server" Text='<%# Bind("BillNo") %>' /></td></tr>
			
            
            <tr><td>Date:</td><td> <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' /></td></tr>
            
           
            <tr><td> Details Of Bill:</td><td><asp:TextBox ID="DetailOfBillTextBox" runat="server" 
                Text='<%# Bind("DetailOfBill") %>' /></td></tr>
           
            
            <tr><td> Amount Of Bill:</td><td> <asp:TextBox ID="AmountOfBillTextBox" runat="server" 
                Text='<%# Bind("AmountOfBill") %>' /></td></tr>
           
           
            <tr><td>Total Expense:</td><td> <asp:TextBox ID="TotalExpenseTextBox" runat="server" 
                Text='<%# Bind("TotalExpense") %>' /></td></tr>
            
           
            <tr><td>Balance:</td><td><asp:TextBox ID="BalanceTextBox" runat="server" Text='<%# Bind("Balance") %>' /></td></tr>
            
            
            <tr><td> Remarks:</td><td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' /></td></tr>
            <tr><td colspan="2" align="center">
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update"  CssClass="standardButton"/>
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back"  CssClass="standardButton"/>
                </td>
                </tr>
        </EditItemTemplate>
        <InsertItemTemplate>
                     <table align="center" cellspacing="5">
			 <tr><td> Bill No:</td><td><asp:TextBox ID="BillNoTextBox" runat="server" Text='<%# Bind("BillNo") %>' /></td></tr>
			
            
            <tr><td>Date:</td><td> <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' /></td></tr>
            
           
            <tr><td> Details Of Bill:</td><td><asp:TextBox ID="DetailOfBillTextBox" runat="server" 
                Text='<%# Bind("DetailOfBill") %>' /></td></tr>
           
            
            <tr><td> Amount Of Bill:</td><td> <asp:TextBox ID="AmountOfBillTextBox" runat="server" 
                Text='<%# Bind("AmountOfBill") %>' /></td></tr>
           
           
            <tr><td>Total Expense:</td><td> <asp:TextBox ID="TotalExpenseTextBox" runat="server" 
                Text='<%# Bind("TotalExpense") %>' /></td></tr>
            
           
            <tr><td>Balance:</td><td><asp:TextBox ID="BalanceTextBox" runat="server" Text='<%# Bind("Balance") %>' /></td></tr>
            
            
            <tr><td> Remarks:</td><td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' /></td></tr>
           
            
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
            BillNo:
            <asp:Label ID="BillNoLabel" runat="server" Text='<%# Bind("BillNo") %>' />
            <br />
            Date:
            <asp:Label ID="DateLabel" runat="server" Text='<%# Bind("Date") %>' />
            <br />
            DetailOfBill:
            <asp:Label ID="DetailOfBillLabel" runat="server" 
                Text='<%# Bind("DetailOfBill") %>' />
            <br />
            AmountOfBill:
            <asp:Label ID="AmountOfBillLabel" runat="server" 
                Text='<%# Bind("AmountOfBill") %>' />
            <br />
            TotalExpense:
            <asp:Label ID="TotalExpenseLabel" runat="server" 
                Text='<%# Bind("TotalExpense") %>' />
            <br />
            Balance:
            <asp:Label ID="BalanceLabel" runat="server" Text='<%# Bind("Balance") %>' />
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
    
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.BillRegisterTableAdapters.BillRegisterTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_BillNo" Type="Int32" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_BillDate" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="BillNo" Type="Int32" />
            <asp:Parameter Name="BillDate" Type="DateTime" />
            <asp:Parameter Name="DetailsOfBill" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="BillNo" Type="Int32" />
            <asp:Parameter Name="BillDate" Type="DateTime" />
            <asp:Parameter Name="DetailsOfBill" Type="String" />
            <asp:Parameter Name="Original_BillNo" Type="Int32" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_BillDate" Type="DateTime" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</center>
    
    <asp:ObjectDataSource ID="ods_GrantRegister" runat="server"  
        SelectMethod="GetDataBy1" 
        DeleteMethod="DeleteQuery" 
        InsertMethod="Insert" 
        UpdateMethod="UpdateQuery" 
        TypeName="IGRSS.DataAccessLayer.GrantRegisterTableAdapters.GrantRegisterTableAdapter" 
        onselecting="ods_GrantRegister_Selecting" 
        ondeleting="ods_GrantRegister_Deleting" 
        >
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="BillNo" Type="Int32" />
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="DetailOfBill" Type="String" />
            <asp:Parameter Name="AmountOfBill" Type="Decimal" />
            <asp:Parameter Name="TotalExpense" Type="Decimal" />
            <asp:Parameter Name="Balance" Type="Decimal" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="BillNo" Type="Int32" />
            <asp:Parameter Name="Date" Type="String" />
            <asp:Parameter Name="DetailOfBill" Type="String" />
            <asp:Parameter Name="AmountOfBill" Type="Decimal" />
            <asp:Parameter Name="TotalExpense" Type="Decimal" />
            <asp:Parameter Name="Balance" Type="Decimal" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</center>
</asp:Content>

