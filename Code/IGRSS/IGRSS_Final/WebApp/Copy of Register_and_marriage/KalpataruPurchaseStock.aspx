﻿<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="KalpataruPurchaseStock.aspx.cs" Inherits="Register_and_marriage_KalpataruPurchaseStock" %>

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

         var datePickers = ["BillDateTextBox"];
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
</center>
<asp:MultiView ID="Multiview_Kalpataru" runat="server" ActiveViewIndex="0">
<asp:View ID="View1_GridView_Kalpataru" runat="server">
<br />
<h1 style="text-align: center">Kalpataru Purchase Stock Register</h1>
<table>
          <tr>
                    <td align="right" style="width:641px;" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" >
                        <asp:TextBox Width="160" ID="txtSearch" runat="server" 
                            meta:resourcekey="txtFileNoResource1" ></asp:TextBox></td>
                        <td align="right">
                        <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_Kalpataru" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_Kalpataru" 
                      EnableModelValidation="True" onrowdeleted="GridView_Kalpataru_RowDeleted" 
                      onrowdeleting="GridView_Kalpataru_RowDeleting" 
                      onrowediting="GridView_Kalpataru_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                              ReadOnly="True" SortExpression="SrNo" InsertVisible="False" 
                              Visible="False" />
                          <asp:BoundField DataField="Billno" HeaderText="Bill No" 
                              SortExpression="Billno" />
                          <asp:BoundField DataField="ListOfConsumableItems" HeaderText="List Of Consumable Items" 
                              SortExpression="ListOfConsumableItems" />
                          <asp:BoundField DataField="BillDate" HeaderText="Bill Date" 
                              SortExpression="BillDate" />
                          <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                              SortExpression="Quantity" />
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

<asp:View ID="View2_Formview_Kalpataru" runat="server">
<center>
<h1>Kalpataru Purchase Stock Register </h1>
    <asp:FormView ID="FormView_Kalpataru" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_Kalpataru" DefaultMode="Insert" 
        EnableModelValidation="True" 
        onitemcommand="FormView_Kalpataru_ItemCommand" 
        oniteminserted="FormView_Kalpataru_ItemInserted" 
        onitemupdated="FormView_Kalpataru_ItemUpdated">
        <EditItemTemplate>
             <table align="center" cellspacing="5">
			<tr>
			<td>
			Bill No:
			</td>
			<td>
			 <asp:TextBox ID="BillnoTextBox" runat="server" Text='<%# Bind("Billno") %>' 
                    Width="160px" />
			</td>
			</tr>
           
            <tr><td>
			List Of Consumable Items:
			</td>
			<td><asp:TextBox ID="ListOfConsumableItemsTextBox" runat="server" 
                Text='<%# Bind("ListOfConsumableItems") %>' Width="160px" /></td></tr>
            
            
            <tr><td>Date Of Bill:</td>
			<td> 
                <asp:TextBox ID="BillDateTextBox" runat="server" 
                Text='<%# Bind("BillDate") %>' Width="140px" /></td></tr>
            
           
            <tr><td>Quantity:</td><td> 
                <asp:TextBox ID="QuantityTextBox" runat="server" 
                Text='<%# Bind("Quantity") %>' Width="160px" /></td></tr>
            
           <tr>
           <td colspan="2" align="center">
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" CssClass="standardButton" />
                &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" 
                            CausesValidation="False" CommandName="Reset" CssClass="standardButton" 
                            Text="Reset"   onclientclick="resetTextFields();return false;"/>
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" CssClass="standardButton" />
                </td>
                </tr>
                </table>
        </EditItemTemplate>
        <InsertItemTemplate>
                                  <table align="center" cellspacing="5">
			<tr>
			<td>
			Bill No:
			</td>
			<td>
			 <asp:TextBox ID="BillnoTextBox" runat="server" Text='<%# Bind("Billno") %>' 
                    Width="160px" />
			</td>
			</tr>
           
            <tr><td>
			List Of Consumable Items:
			</td>
			<td><asp:TextBox ID="ListOfConsumableItemsTextBox" runat="server" 
                Text='<%# Bind("ListOfConsumableItems") %>' Width="160px" /></td></tr>
            
            
            <tr><td>Date Of Bill:</td>
			<td> 
                <asp:TextBox ID="BillDateTextBox" runat="server" 
                Text='<%# Bind("BillDate") %>' Width="140px" /></td></tr>
            
           
            <tr><td>Quantity:</td><td> 
                <asp:TextBox ID="QuantityTextBox" runat="server" 
                Text='<%# Bind("Quantity") %>' Width="160px" /></td></tr>
            
           
            <tr><td colspan="2">
			<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" CssClass="standardButton" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" 
                            CausesValidation="False" CommandName="Reset" CssClass="standardButton" 
                            Text="Reset"   onclientclick="resetTextFields();return false;"/>
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Back" CssClass="standardButton" 
                            Text="Back" />
                            
                            
			</td></tr>
           
           
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            Billno:
            <asp:Label ID="BillnoLabel" runat="server" Text='<%# Bind("Billno") %>' />
            <br />
            ListOfConsumableItems:
            <asp:Label ID="ListOfConsumableItemsLabel" runat="server" 
                Text='<%# Bind("ListOfConsumableItems") %>' />
            <br />
            BillDate:
            <asp:Label ID="BillDateLabel" runat="server" 
                Text='<%# Bind("BillDate") %>' />
            <br />
            Quantity:
            <asp:Label ID="QuantityLabel" runat="server" Text='<%# Bind("Quantity") %>' />
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
    
    <asp:ObjectDataSource ID="ods_Kalpataru" runat="server"  
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.Kalpataru_Purachase_StockTableAdapters.Kalpataru_Purchase_Stock_RegisterTableAdapter" 
        DeleteMethod="DeleteQuery" InsertMethod="Insert" UpdateMethod="UpdateQuery" 
        onselecting="ods_Kalpataru_Selecting" ondeleting="ods_Kalpataru_Deleting">
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Billno" Type="Int32" />
            <asp:Parameter Name="ListOfConsumableItems" Type="String" />
            <asp:Parameter Name="BillDate" Type="DateTime" />
            <asp:Parameter Name="Quantity" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearch" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Billno" Type="Int32" />
            <asp:Parameter Name="BillDate" Type="String" />
            <asp:Parameter Name="ListOfConsumableItems" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>


