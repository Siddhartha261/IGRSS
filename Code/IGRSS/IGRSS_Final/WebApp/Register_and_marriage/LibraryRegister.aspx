<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="LibraryRegister.aspx.cs" Inherits="Register_and_marriage_LibraryRegisteraspx" %>

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

        var datePickers = ["Date_Of_CommunicationTextBox", "Date_Of_ReceiptTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
</script>
<asp:MultiView ID="Multiview_LibraryRegister" runat="server" ActiveViewIndex="0">
<asp:View ID="View1_LibraryRgister" runat="server">
<hr /><br />
<h1>Library Register</h1>
<table>
          <tr>
          <td align="right">
          <table>
          
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
                    
                    
                    </table>
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="LibraryRegister" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_LibraryRegister" 
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" 
                              InsertVisible="False" />
                          <asp:BoundField DataField="Title" HeaderText="Title" 
                              SortExpression="Title" />
                          <asp:BoundField DataField="Author" HeaderText="Author" 
                              SortExpression="Author" />
                          <asp:BoundField DataField="Price" HeaderText="Price" 
                              SortExpression="Price" />
                          <asp:BoundField DataField="No_Of_Communication" HeaderText="No_Of_Communication" 
                              SortExpression="No_Of_Communication" />
                          <asp:BoundField DataField="Date_Of_Communication" HeaderText="Date_Of_Communication" 
                              SortExpression="Date_Of_Communication" />
                          <asp:BoundField DataField="Date_Of_Receipt" 
                              HeaderText="Date_Of_Receipt" SortExpression="Date_Of_Receipt" />
                          <asp:BoundField DataField="No_Of_Copies_Receivecd" 
                              HeaderText="No_Of_Copies_Receivecd" 
                              SortExpression="No_Of_Copies_Receivecd" />
                          <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                              SortExpression="Remarks" />
                      </Columns>
                  </asp:GridView>
              </td>
          </tr>
 </table>
 <asp:LinkButton ID="Button_new" runat="server" Text="New" 
        onclick="Button_new_Click" CssClass="standardButton" />
</asp:View>

<asp:View ID="View2_LibraryRegister" runat="server">
<center>
<h1>Library Register</h1>
    <asp:FormView ID="FormView_LibraryRegister" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_LibraryRegister" DefaultMode="Insert" 
        EnableModelValidation="True" 
        onitemcommand="FormView_LibraryRegister_ItemCommand">
        <EditItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel1" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            Title:
            <asp:TextBox ID="TitleTextBox" runat="server" 
                Text='<%# Bind("Title") %>' />
            <br />
            Author:
            <asp:TextBox ID="AuthorTextBox" runat="server" 
                Text='<%# Bind("Author") %>' />
            <br />
            Price:
            <asp:TextBox ID="PriceTextBox" runat="server" 
                Text='<%# Bind("Price") %>' />
            <br />
            No_Of_Communication:
            <asp:TextBox ID="No_Of_CommunicationTextBox" runat="server" 
                Text='<%# Bind("No_Of_Communication") %>' />
            <br />
            Date_Of_Communication:
            <asp:TextBox ID="Date_Of_CommunicationTextBox" runat="server" 
                Text='<%# Bind("Date_Of_Communication") %>' />
            <br />
            Date_Of_Receipt:
            <asp:TextBox ID="Date_Of_ReceiptTextBox" runat="server" 
                Text='<%# Bind("Date_Of_Receipt") %>' />
            <br />
            No_Of_Copies_Receivecd:
            <asp:TextBox ID="No_Of_Copies_ReceivecdTextBox" runat="server" 
                Text='<%# Bind("No_Of_Copies_Receivecd") %>' />
            <br />
            Remarks:
            <asp:TextBox ID="RemarksTextBox" runat="server" 
                Text='<%# Bind("Remarks") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
                                                                                                    
                                                              <table align="center" cellspacing="5">
															 <tr>
															 <td>
															 Title Of Book :
															 </td>
															 <td><asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
															 </td>
															 </tr>

															 
                                                              <tr><td> Author Of Book :</td><td><asp:TextBox ID="AuthorTextBox" runat="server" Text='<%# Bind("Author") %>' /></td></tr>
                                                             
                                                              
                                                              <tr><td>Price:</td><td><asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' /></td></tr>
                                                              
                                                              
                                                              <tr><td>No Of Communication :</td><td><asp:TextBox ID="No_Of_CommunicationTextBox" runat="server" 
                                                                  Text='<%# Bind("No_Of_Communication") %>' /></td></tr>
                                                              
                                                              
                                                              <tr><td> Date Of Communication :</td><td><asp:TextBox ID="Date_Of_CommunicationTextBox" runat="server" 
                                                                  Text='<%# Bind("Date_Of_Communication") %>' /></td></tr>
                                                             
                                                              
                                                              <tr><td>Date Of Receipt :</td><td><asp:TextBox ID="Date_Of_ReceiptTextBox" runat="server" 
                                                                  Text='<%# Bind("Date_Of_Receipt") %>' /></td></tr>
                                                              
                                                              
                                                              <tr><td>No Of Copies Receivecd :</td><td> <asp:TextBox ID="No_Of_Copies_ReceivecdTextBox" runat="server" 
                                                                  Text='<%# Bind("No_Of_Copies_Receivecd") %>' /></td></tr>
                                                              
                                                             
                                                              <tr><td> Remarks :</td><td> <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' /></td></tr>
                                                             
                                                             
                                                              <tr><td colspan="2" align="center"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" CssClass="standardButton" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" 
                            CausesValidation="False" CommandName="Cancel" CssClass="standardButton" 
                            Text="Reset" onclientclick="resetTextFields();return false;" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Back" CssClass="standardButton" 
                            Text="Back" /></td></tr>
                                                              
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
    
    <asp:ObjectDataSource ID="ods_LibraryRegister" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.LibraryRegisterTableAdapters.LibraryRegisterTableAdapter" 
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" 
        onselecting="ods_Library_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Title" Type="String" />
            <asp:Parameter Name="Original_Author" Type="String" />
            <asp:Parameter Name="Original_Price" Type="Decimal" />
            <asp:Parameter Name="Original_No_Of_Communication" Type="Int32" />
            <asp:Parameter Name="Original_Date_Of_Communication" Type="DateTime" />
            <asp:Parameter Name="Original_Date_Of_Receipt" Type="DateTime" />
            <asp:Parameter Name="Original_No_Of_Copies_Receivecd" Type="Int32" />
            <asp:Parameter Name="Original_Remarks" Type="String" />
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
            <asp:Parameter Name="Date_Of_Communication" Type="DateTime" />
            <asp:Parameter Name="Date_Of_Receipt" Type="DateTime" />
            <asp:Parameter Name="No_Of_Copies_Receivecd" Type="Int32" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Title" Type="String" />
            <asp:Parameter Name="Original_Author" Type="String" />
            <asp:Parameter Name="Original_Price" Type="Decimal" />
            <asp:Parameter Name="Original_No_Of_Communication" Type="Int32" />
            <asp:Parameter Name="Original_Date_Of_Communication" Type="DateTime" />
            <asp:Parameter Name="Original_Date_Of_Receipt" Type="DateTime" />
            <asp:Parameter Name="Original_No_Of_Copies_Receivecd" Type="Int32" />
            <asp:Parameter Name="Original_Remarks" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>

</asp:Content>

