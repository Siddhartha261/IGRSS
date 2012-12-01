<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="LekhanSamagri.aspx.cs" Inherits="Register_and_marriage_LekhanSamagri" %>

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

        var datePickers = ["PurchaseDate", "EmployeeReceivingDate", "ArticleCompletiobDate"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
</script>
<center>
<asp:Panel id="infoDiv" runat="server" Visible="false" CssClass="infoBar" >&nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
<hr /><br />
</center>
<asp:MultiView ID="Multiview_LekhanSamagri" runat="server" ActiveViewIndex="0">
<asp:View ID="View1_LekhanSamagri" runat="server">
    <br />
<h1 align="center">&nbsp;Lekhan Samagri Register</h1>
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
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_LekhanSamagri" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_Lekhan_Samagri" 
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" 
                              InsertVisible="False" />
                          <asp:BoundField DataField="Article_desc" HeaderText="Article Description" 
                              SortExpression="Article_desc" Visible="False" />
                          <asp:BoundField DataField="Purchaseauthorityname" HeaderText="Purchase  Authority Name" 
                              SortExpression="Purchaseauthorityname" />
                          <asp:BoundField DataField="PurchaseDate" HeaderText="Purchase Date" 
                              SortExpression="PurchaseDate" Visible="False" />
                          <asp:BoundField DataField="Quantity" HeaderText="Quantity" 
                              SortExpression="Quantity" Visible="False" />
                          <asp:BoundField DataField="ArticlePrice" HeaderText="Article Price" 
                              SortExpression="ArticlePrice" />
                          <asp:BoundField DataField="EmployeeReceivingDate" 
                              HeaderText="Employee Receiving Date" 
                              SortExpression="EmployeeReceivingDate" Visible="False" />
                          <asp:BoundField DataField="ArticleCompletiobDate" 
                              HeaderText="Article Completion Date" 
                              SortExpression="ArticleCompletiobDate" Visible="False" />
                          <asp:BoundField DataField="EmployeeSign" HeaderText="Employee Sign" 
                              SortExpression="EmployeeSign" />
                          <asp:BoundField DataField="Officersign" HeaderText="Officer Sign" 
                              SortExpression="Officersign" />
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
<h1 align="center">Lekhan Samagri Register</h1>
    <asp:FormView ID="FormView_LekhanSamagri" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_Lekhan_Samagri" DefaultMode="Insert" 
        EnableModelValidation="True" onitemcommand="FormView_LekhanSamagri_ItemCommand">
        <EditItemTemplate>
            <table align="center" cellspacing="5">
				 <tr align="left">
				<td>Name Of Purchase Authority:</td><td>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  
                         ErrorMessage="*" ControlToValidate="TextBoxPurchaseAuthority">*</asp:RequiredFieldValidator>
                     </td>
                        <td><asp:TextBox ID="TextBoxPurchaseAuthority" runat="server" onkeypress="return AllowAlphabet(event)" 
                            Text='<%# Bind("Purchaseauthorityname") %>' MaxLength="30" 
                                Width="160px" /></td>
                              <td> Employee Receiving Date:</td><td>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                         ErrorMessage="*" ControlToValidate="EmployeeReceivingDateTextBox">*</asp:RequiredFieldValidator>
                     </td><td>
                            <asp:TextBox ID="EmployeeReceivingDateTextBox" runat="server" 
                            Text='<%# Bind("EmployeeReceivingDate") %>' TabIndex="5" MaxLength="20" 
                                Width="160px" /></td></tr>
				 
				  <tr align="left"><td>Quantity:</td><td>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                          ErrorMessage="*" ControlToValidate="TextBoxQuantity">*</asp:RequiredFieldValidator>
                      </td><td>
                            <asp:TextBox ID="TextBoxQuantity"  numeric="integer" runat="server" 
                            Text='<%# Bind("Quantity") %>' TabIndex="1" MaxLength="10" Width="160px" /></td><td>Article Completion Date:</td><td></td><td>  
                            <asp:TextBox ID="ArticleCompletiobDateTextBox" runat="server" 
                            Text='<%# Bind("ArticleCompletiobDate") %>' TabIndex="6" MaxLength="20" 
                                Width="160px" /></td></tr>
				  
				   <tr align="left"><td>Date Of Purchase:</td><td>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                           ErrorMessage="*" ControlToValidate="PurchaseDateTextBox">*</asp:RequiredFieldValidator>
                       </td><td>
                            <asp:TextBox ID="PurchaseDateTextBox" runat="server" 
                            Text='<%# Bind("PurchaseDate") %>' TabIndex="2" MaxLength="20" Width="160px" /></td><td>Signature Of Employee:</td><td>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                           ErrorMessage="*" ControlToValidate="EmployeeSignTextBox">*</asp:RequiredFieldValidator>
                       </td><td> 
                            <asp:TextBox ID="EmployeeSignTextBox" runat="server" onkeypress="return AllowAlphabet(event)" 
                            Text='<%# Bind("EmployeeSign") %>' TabIndex="7" MaxLength="20" Width="160px" /></td></tr>
				   
				    <tr align="left"><td>
	Description Of Article:
	</td><td></td>
		<td>
                   <asp:TextBox ID="Article_descTextBox" runat="server" 
                            Text='<%# Bind("Article_desc") %>' Width="160px" TabIndex="3" /></td><td>Signature Of Officers:</td><td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ErrorMessage="*" ControlToValidate="OfficersignTextBox">*</asp:RequiredFieldValidator>
                        </td><td>
                            <asp:TextBox ID="OfficersignTextBox" runat="server" onkeypress="return AllowAlphabet(event)" 
                            Text='<%# Bind("Officersign") %>' TabIndex="8" MaxLength="20" Width="160px" /></td></tr>
					
					 <tr align="left"><td>Remarks:</td><td></td><td>
                         <asp:TextBox ID="RemarksTextBox" runat="server" 
                                Text='<%# Bind("Remarks") %>' TabIndex="4" Height="60px" 
                                TextMode="MultiLine" Width="160px" /></td>
								<td>Price Of Article:</td><td>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                             ControlToValidate="ArticlePriceTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                       </td><td>  <asp:TextBox ID="ArticlePriceTextBox" runat="server" 
                            Text='<%# Bind("ArticlePrice") %>' Width="160px" /></td><td></td><td></td>
								</tr>
                                    
                     <tr><td align="center" colspan="3">   <asp:LinkButton ID="UpdateButton" 
                             runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update"  CssClass="standardButton" 
                             AccessKey="U" />
                             &nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="True" 
           CommandName="Reset" Text="Reset" 
           onclientclick="resetTextFields();return false;" CssClass="standardButton" AccessKey="R"/>
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Back"
                            Text="Back"   CssClass="standardButton" AccessKey="B"/>
                            </td>
                            </tr>
                            </table>
        </EditItemTemplate>
                <InsertItemTemplate>
                       <table align="center" cellspacing="5">
				 <tr align="left">
				<td>Name Of Purchase Authority:</td><td>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  
                         ErrorMessage="*" ControlToValidate="TextBoxPurchaseAuthority">*</asp:RequiredFieldValidator>
                     </td>
                        <td><asp:TextBox ID="TextBoxPurchaseAuthority" runat="server" onkeypress="return AllowAlphabet(event)" 
                            Text='<%# Bind("Purchaseauthorityname") %>' MaxLength="30" 
                                Width="160px" /></td>
                              <td> Employee Receiving Date:</td><td>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                         ErrorMessage="*" ControlToValidate="EmployeeReceivingDateTextBox">*</asp:RequiredFieldValidator>
                     </td><td>
                            <asp:TextBox ID="EmployeeReceivingDateTextBox" runat="server" 
                            Text='<%# Bind("EmployeeReceivingDate") %>' TabIndex="5" MaxLength="20" 
                                Width="160px" /></td></tr>
				 
				  <tr align="left"><td>Quantity:</td><td>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                          ErrorMessage="*" ControlToValidate="TextBoxQuantity">*</asp:RequiredFieldValidator>
                      </td><td>
                            <asp:TextBox ID="TextBoxQuantity"  numeric="integer" runat="server" 
                            Text='<%# Bind("Quantity") %>' TabIndex="1" MaxLength="10" Width="160px" /></td><td>Article Completion Date:</td><td></td><td>  
                            <asp:TextBox ID="ArticleCompletiobDateTextBox" runat="server" 
                            Text='<%# Bind("ArticleCompletiobDate") %>' TabIndex="6" MaxLength="20" 
                                Width="160px" /></td></tr>
				  
				   <tr align="left"><td>Date Of Purchase:</td><td>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                           ErrorMessage="*" ControlToValidate="PurchaseDateTextBox">*</asp:RequiredFieldValidator>
                       </td><td>
                            <asp:TextBox ID="PurchaseDateTextBox" runat="server" 
                            Text='<%# Bind("PurchaseDate") %>' TabIndex="2" MaxLength="20" Width="160px" /></td><td>Signature Of Employee:</td><td>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                           ErrorMessage="*" ControlToValidate="EmployeeSignTextBox">*</asp:RequiredFieldValidator>
                       </td><td> 
                            <asp:TextBox ID="EmployeeSignTextBox" runat="server" onkeypress="return AllowAlphabet(event)" 
                            Text='<%# Bind("EmployeeSign") %>' TabIndex="7" MaxLength="20" Width="160px" /></td></tr>
				   
				    <tr align="left"><td>
	Description Of Article:
	</td><td></td>
		<td>
                   <asp:TextBox ID="Article_descTextBox" runat="server" 
                            Text='<%# Bind("Article_desc") %>' Width="160px" TabIndex="3" /></td><td>Signature Of Officers:</td><td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ErrorMessage="*" ControlToValidate="OfficersignTextBox">*</asp:RequiredFieldValidator>
                        </td><td>
                            <asp:TextBox ID="OfficersignTextBox" runat="server" onkeypress="return AllowAlphabet(event)" 
                            Text='<%# Bind("Officersign") %>' TabIndex="8" MaxLength="20" Width="160px" /></td></tr>
					
					 <tr align="left"><td>Remarks:</td><td></td><td>
                         <asp:TextBox ID="RemarksTextBox" runat="server" 
                                Text='<%# Bind("Remarks") %>' TabIndex="4" Height="60px" 
                                TextMode="MultiLine" Width="160px" /></td>
								<td>Price Of Article:</td><td>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                             ControlToValidate="ArticlePriceTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                       </td><td>  
                             <asp:TextBox ID="ArticlePriceTextBox" runat="server" numeric="integer"
                            Text='<%# Bind("ArticlePrice") %>' Width="160px" TabIndex="9" /></td><td></td><td></td>
								</tr>
                                 <tr>
						<td colspan="6" align="center">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" CssClass="standardButton" Text="Insert" TabIndex="10" 
                                AccessKey="I" />
                            &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" 
                            CausesValidation="False" CommandName="Cancel" CssClass="standardButton" 
                            Text="Reset"  onclientclick="resetTextFields();return false;" TabIndex="11" 
                                AccessKey="R" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Back" CssClass="standardButton" 
                            Text="Back" TabIndex="12" AccessKey="B" />
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
        OldValuesParameterFormatString="original_{0}">
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
            <asp:Parameter Name="PurchaseDate" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="ArticlePrice" Type="Decimal" />
            <asp:Parameter Name="EmployeeReceivingDate" Type="String" />
            <asp:Parameter Name="ArticleCompletiobDate" Type="String" />
            <asp:Parameter Name="EmployeeSign" Type="String" />
            <asp:Parameter Name="Officersign" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>

