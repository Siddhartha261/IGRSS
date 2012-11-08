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
<asp:MultiView ID="Multiview_Kalpataru" runat="server" ActiveViewIndex="0">
<asp:View ID="View1_GridView_Kalpataru" runat="server">
<hr /><br />
<h1>Kalpataru Purchase Stock Register</h1>
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
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                              ReadOnly="True" SortExpression="SrNo" InsertVisible="False" 
                              Visible="False" />
                          <asp:BoundField DataField="Billno" HeaderText="Billno" 
                              SortExpression="Billno" />
                          <asp:BoundField DataField="ListOfConsumableItems" HeaderText="ListOfConsumableItems" 
                              SortExpression="ListOfConsumableItems" />
                          <asp:BoundField DataField="BillDate" HeaderText="BillDate" 
                              SortExpression="BillDate" />
                          <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                              SortExpression="Quantity" />
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
        EnableModelValidation="True" onitemcommand="FormView_Kalpataru_ItemCommand">
        <EditItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel1" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            Billno:
            <asp:TextBox ID="BillnoTextBox" runat="server" Text='<%# Bind("Billno") %>' />
            <br />
            ListOfConsumableItems:
            <asp:TextBox ID="ListOfConsumableItemsTextBox" runat="server" 
                Text='<%# Bind("ListOfConsumableItems") %>' />
            <br />
            BillDate:
            <asp:TextBox ID="BillDateTextBox" runat="server" 
                Text='<%# Bind("BillDate") %>' />
            <br />
            Quantity:
            <asp:TextBox ID="QuantityTextBox" runat="server" 
                Text='<%# Bind("Quantity") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
                                   <table align="center" cellspacing="5">
			<tr>
			<td>
			Bill No:
			</td>
			<td>
			 <asp:TextBox ID="BillnoTextBox" runat="server" Text='<%# Bind("Billno") %>' />
			</td>
			</tr>
           
            <tr><td>
			List Of Consumable Items:
			</td>
			<td><asp:TextBox ID="ListOfConsumableItemsTextBox" runat="server" 
                Text='<%# Bind("ListOfConsumableItems") %>' /></td></tr>
            
            
            <tr><td>Date Of Bill:</td>
			<td> <asp:TextBox ID="BillDateTextBox" runat="server" 
                Text='<%# Bind("BillDate") %>' /></td></tr>
            
           
            <tr><td>Quantity:</td><td> <asp:TextBox ID="QuantityTextBox" runat="server" 
                Text='<%# Bind("Quantity") %>' /></td></tr>
            
           
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
    
    <asp:ObjectDataSource ID="ods_Kalpataru" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.Kalpataru_Purachase_StockTableAdapters.Kalpataru_Purchase_Stock_RegisterTableAdapter" 
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" 
        onselecting="ods_Kalpataru_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Billno" Type="Int32" />
            <asp:Parameter Name="Original_ListOfConsumableItems" Type="String" />
            <asp:Parameter Name="Original_BillDate" Type="DateTime" />
            <asp:Parameter Name="Original_Quantity" Type="Int32" />
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
            <asp:Parameter Name="ListOfConsumableItems" Type="String" />
            <asp:Parameter Name="BillDate" Type="DateTime" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Billno" Type="Int32" />
            <asp:Parameter Name="Original_ListOfConsumableItems" Type="String" />
            <asp:Parameter Name="Original_BillDate" Type="DateTime" />
            <asp:Parameter Name="Original_Quantity" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>


