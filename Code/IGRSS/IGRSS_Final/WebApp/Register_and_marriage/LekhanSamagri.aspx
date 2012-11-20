<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="LekhanSamagri.aspx.cs" Inherits="Register_and_marriage_LekhanSamagri" %>

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

        var datePickers = ["PurchaseDate", "EmployeeReceivingDate", "ArticleCompletiobDate"];
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
<asp:MultiView ID="Multiview_LekhanSamagri" runat="server" ActiveViewIndex="0">
<asp:View ID="View1_LekhanSamagri" runat="server">
<br />
<h1 style="text-align: center">Lekhan Samagri Register</h1>
<table>
          <tr>
          <td>
          <table align="right">
                    <tr>
                        <td align="right" style="width:641px;">
                            <asp:Label ID="lbllls" runat="server" meta:resourcekey="lblllsResource1" 
                                Text="Enter File Number :"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtSearch" runat="server" 
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
                  <asp:GridView ID="GridView_LekhanSamagri" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_Lekhan_Samagri" 
                      EnableModelValidation="True" 
                      onrowdeleted="GridView_LekhanSamagri_RowDeleted" 
                      onrowdeleting="GridView_LekhanSamagri_RowDeleting" 
                      onrowediting="GridView_LekhanSamagri_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                              ReadOnly="True" SortExpression="SrNo" 
                              InsertVisible="False" Visible="False" />
                          <asp:BoundField DataField="Article_desc" HeaderText="Article_desc" 
                              SortExpression="Article_desc" Visible="False" />
                          <asp:BoundField DataField="Purchaseauthorityname" HeaderText="Name Of Purchase Authority" 
                              SortExpression="Purchaseauthorityname" />
                          <asp:BoundField DataField="PurchaseDate" HeaderText="Purchase Date" 
                              SortExpression="PurchaseDate" />
                          <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                              SortExpression="Quantity" />
                          <asp:BoundField DataField="ArticlePrice" HeaderText="Article Price" 
                              SortExpression="ArticlePrice" />
                          <asp:BoundField DataField="EmployeeReceivingDate" 
                              HeaderText="Employee Receiving Date" 
                              SortExpression="EmployeeReceivingDate" />
                          <asp:BoundField DataField="ArticleCompletiobDate" 
                              HeaderText="Article Completion Date" 
                              SortExpression="ArticleCompletiobDate" />
                          <asp:BoundField DataField="EmployeeSign" HeaderText="EmployeeSign" 
                              SortExpression="EmployeeSign" Visible="False" />
                          <asp:BoundField DataField="Officersign" HeaderText="Officersign" 
                              SortExpression="Officersign" Visible="False" />
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

<asp:View ID="View2_LekhanSamagri" runat="server">
<center>
<h1>Lekhan Samagri Register</h1>
    <asp:FormView ID="FormView_LekhanSamagri" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_Lekhan_Samagri" DefaultMode="Insert" 
        EnableModelValidation="True" 
        onitemcommand="FormView_LekhanSamagri_ItemCommand" 
        oniteminserted="FormView_LibraryRegister_ItemInserted" 
        onitemupdated="FormView_LibraryRegister_ItemUpdated">
        <EditItemTemplate>
            
               <table align="center" cellspacing="5">
					   <tr>
					   <td align="left">
                        
						<table width="100%">
						<tr>
						<td>
						Description Of Article:
						</td>
						<td>
                        <asp:TextBox ID="Article_descTextBox" runat="server" 
                            Text='<%# Bind("Article_desc") %>' />
							</tr>
                        <tr><td>Name Of Purchase Authority:</td>
                        <td><asp:TextBox ID="PurchaseauthoritynameTextBox" runat="server" 
                            Text='<%# Bind("Purchaseauthorityname") %>' /></td></tr>
                        
                        
                        <tr><td>Date Of Purchase:</td><td><asp:TextBox ID="PurchaseDateTextBox" runat="server" 
                            Text='<%# Bind("PurchaseDate") %>' /></td></tr>
                        
                        
                        <tr><td>Quantity:</td><td><asp:TextBox ID="QuantityTextBox" runat="server" 
                            Text='<%# Bind("Quantity") %>' /></td></tr>
                        
                        
                        <tr><td>Price Of Article:</td><td><asp:TextBox ID="ArticlePriceTextBox" runat="server" 
                            Text='<%# Bind("ArticlePrice") %>' /></td></tr>
							</table>
							</td>
                        
						<td align="right">
                        <table width="100%">
                        <tr><td> Employee Receiving Date:</td><td><asp:TextBox ID="EmployeeReceivingDateTextBox" runat="server" 
                            Text='<%# Bind("EmployeeReceivingDate") %>' /></td></tr>
                       
                        
                        <tr><td>Article Completion Date:</td><td>  <asp:TextBox ID="ArticleCompletiobDateTextBox" runat="server" 
                            Text='<%# Bind("ArticleCompletiobDate") %>' /></td></tr>
                        
                      
                        <tr><td>Signature Of Employee:</td><td> <asp:TextBox ID="EmployeeSignTextBox" runat="server" 
                            Text='<%# Bind("EmployeeSign") %>' /></td></tr>
                        
                       
                        <tr><td>Signature Of Officers:</td><td><asp:TextBox ID="OfficersignTextBox" runat="server" 
                            Text='<%# Bind("Officersign") %>' /></td></tr>
                        
                        
                        <tr><td>Remarks:</td><td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
                        <tr><td></td><td></td></tr></td></tr>
                        </table>
                       <tr><td colspan="2" align="center">
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update"  CssClass="standardButton" />
                &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" 
                            CausesValidation="False" CommandName="Cancel" CssClass="standardButton" 
                            Text="Reset"  onclientclick="resetTextFields();return false;" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back"  CssClass="standardButton" />
                </td>
                </tr>
                </table>
        </EditItemTemplate>
        <InsertItemTemplate>
                     <table align="center" cellspacing="5">
					   <tr>
					   <td align="left">
                        
						<table width="100%">
						<tr>
						<td>
						Description Of Article:
						</td>
						<td>
                        <asp:TextBox ID="Article_descTextBox" runat="server" 
                            Text='<%# Bind("Article_desc") %>' />
							</tr>
                        <tr><td>Name Of Purchase Authority:</td>
                        <td><asp:TextBox ID="PurchaseauthoritynameTextBox" runat="server" 
                            Text='<%# Bind("Purchaseauthorityname") %>' /></td></tr>
                        
                        
                        <tr><td>Date Of Purchase:</td><td><asp:TextBox ID="PurchaseDateTextBox" runat="server" 
                            Text='<%# Bind("PurchaseDate") %>' /></td></tr>
                        
                        
                        <tr><td>Quantity:</td><td><asp:TextBox ID="QuantityTextBox" runat="server" 
                            Text='<%# Bind("Quantity") %>' /></td></tr>
                        
                        
                        <tr><td>Price Of Article:</td><td><asp:TextBox ID="ArticlePriceTextBox" runat="server" 
                            Text='<%# Bind("ArticlePrice") %>' /></td></tr>
							</table>
							</td>
                        
						<td align="right">
                        <table width="100%">
                        <tr><td> Employee Receiving Date:</td><td><asp:TextBox ID="EmployeeReceivingDateTextBox" runat="server" 
                            Text='<%# Bind("EmployeeReceivingDate") %>' /></td></tr>
                       
                        
                        <tr><td>Article Completion Date:</td><td>  <asp:TextBox ID="ArticleCompletiobDateTextBox" runat="server" 
                            Text='<%# Bind("ArticleCompletiobDate") %>' /></td></tr>
                        
                      
                        <tr><td>Signature Of Employee:</td><td> <asp:TextBox ID="EmployeeSignTextBox" runat="server" 
                            Text='<%# Bind("EmployeeSign") %>' /></td></tr>
                        
                       
                        <tr><td>Signature Of Officers:</td><td><asp:TextBox ID="OfficersignTextBox" runat="server" 
                            Text='<%# Bind("Officersign") %>' /></td></tr>
                        
                        
                        <tr><td>Remarks:</td><td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
                        <tr><td></td><td></td></tr></td></tr>
                        </table>
						</td>
                        <tr>
						<td colspan="2" align="center">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" CssClass="standardButton" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" 
                            CausesValidation="False" CommandName="Cancel" CssClass="standardButton" 
                            Text="Reset"  onclientclick="resetTextFields();return false;" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Back" CssClass="standardButton" 
                            Text="Back" />
							</td>
							</tr>
							</table>
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            Article_desc:
            <asp:Label ID="Article_descLabel" runat="server" 
                Text='<%# Bind("Article_desc") %>' />
            <br />
            Purchaseauthorityname:
            <asp:Label ID="PurchaseauthoritynameLabel" runat="server" 
                Text='<%# Bind("Purchaseauthorityname") %>' />
            <br />
            PurchaseDate:
            <asp:Label ID="PurchaseDateLabel" runat="server" 
                Text='<%# Bind("PurchaseDate") %>' />
            <br />
            Quantity:
            <asp:Label ID="QuantityLabel" runat="server" Text='<%# Bind("Quantity") %>' />
            <br />
            ArticlePrice:
            <asp:Label ID="ArticlePriceLabel" runat="server" 
                Text='<%# Bind("ArticlePrice") %>' />
            <br />
            EmployeeReceivingDate:
            <asp:Label ID="EmployeeReceivingDateLabel" runat="server" 
                Text='<%# Bind("EmployeeReceivingDate") %>' />
            <br />
            ArticleCompletiobDate:
            <asp:Label ID="ArticleCompletiobDateLabel" runat="server" 
                Text='<%# Bind("ArticleCompletiobDate") %>' />
            <br />
            EmployeeSign:
            <asp:Label ID="EmployeeSignLabel" runat="server" 
                Text='<%# Bind("EmployeeSign") %>' />
            <br />
            Officersign:
            <asp:Label ID="OfficersignLabel" runat="server" 
                Text='<%# Bind("Officersign") %>' />
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
    
    <asp:ObjectDataSource ID="ods_Lekhan_Samagri" runat="server" 
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.LekhanSamagriTableAdapters.LekhanSamagriRegisterTableAdapter" 
        DeleteMethod="DeleteQuery" InsertMethod="Insert" UpdateMethod="UpdateQuery" 
        onselecting="ods_Lekhan_Selecting" 
        ondeleting="ods_Lekhan_Samagri_Deleting" 
       >
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Article_desc" Type="String" />
            <asp:Parameter Name="Purchaseauthorityname" Type="String" />
            <asp:Parameter Name="PurchaseDate" Type="DateTime" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="ArticlePrice" Type="Decimal" />
            <asp:Parameter Name="EmployeeReceivingDate" Type="DateTime" />
            <asp:Parameter Name="ArticleCompletiobDate" Type="DateTime" />
            <asp:Parameter Name="EmployeeSign" Type="String" />
            <asp:Parameter Name="Officersign" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearch" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Article_desc" Type="String" />
            <asp:Parameter Name="Purchaseauthorityname" Type="String" />
            <asp:Parameter Name="PurchaseDate" Type="DateTime" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="ArticlePrice" Type="Decimal" />
            <asp:Parameter Name="EmployeeReceivingDate" Type="DateTime" />
            <asp:Parameter Name="ArticleCompletiobDate" Type="DateTime" />
            <asp:Parameter Name="EmployeeSign" Type="String" />
            <asp:Parameter Name="Officersign" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>

