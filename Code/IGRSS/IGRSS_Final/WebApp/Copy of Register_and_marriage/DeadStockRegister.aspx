<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="DeadStockRegister.aspx.cs" Inherits="Register_and_marriage_DeadStockRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
>
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

            var datePickers = ["Purchase_dateTextBox", "DateCreditTextBox"];
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
<asp:MultiView ID="Multiview_DeadStock" runat="server" ActiveViewIndex="0">
<asp:View ID="View1_GridView" runat="server">
<br />
<h1 style="text-align: center">DEAD STOCK REGISTER</h1>
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
                  <asp:GridView ID="GridView_DeadStock" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_DeadStock" 
                      EnableModelValidation="True" onrowdeleted="GridView_DeadStock_RowDeleted" 
                      onrowdeleting="GridView_DeadStock_RowDeleting" 
                      onrowediting="GridView_DeadStock_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                              ReadOnly="True" SortExpression="SrNo" InsertVisible="False" 
                              Visible="False" />
                          <asp:BoundField DataField="DescOfArticle" HeaderText="DescOfArticle" 
                              SortExpression="DescOfArticle" Visible="False" />
                          <asp:BoundField DataField="Authority_For_purchase" HeaderText="Authority For Purchase" 
                              SortExpression="Authority_For_purchase" />
                          <asp:BoundField DataField="Purchase_date" HeaderText="Purchase Date" 
                              SortExpression="Purchase_date" />
                          <asp:BoundField DataField="Noofqty" HeaderText="No Of Quantity" 
                              SortExpression="Noofqty" />
                          <asp:BoundField DataField="Value" HeaderText="Value" 
                              SortExpression="Value" />
                          <asp:BoundField DataField="InitialsOfHO" HeaderText="Initials Of H.O." 
                              SortExpression="InitialsOfHO" />
                          <asp:BoundField DataField="NoQty" HeaderText="No Of Quantity" 
                              SortExpression="NoQty" Visible="False" />
                          <asp:BoundField DataField="NatureDisposal" HeaderText="Nature Of Disposal" 
                              SortExpression="NatureDisposal" />
                          <asp:BoundField DataField="Authorityvoucher" HeaderText="Authority/Voucher" 
                              SortExpression="Authorityvoucher" />
                          <asp:BoundField DataField="AmtRealize" HeaderText="Amount Realized" 
                              SortExpression="AmtRealize" />
                          <asp:BoundField DataField="DateCredit" HeaderText="Date Of Credit" 
                              SortExpression="DateCredit" />
                          <asp:BoundField DataField="AmtWritten_off" HeaderText="AmtWritten_off" 
                              SortExpression="AmtWritten_off" />
                          <asp:BoundField DataField="BalanceStock" HeaderText="BalanceStock" 
                              SortExpression="BalanceStock" />
                          <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                              SortExpression="Remarks" />
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
<h1>DEAD STOCK REGISTER</h1>
    <asp:FormView ID="FormView_DeadStock" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_DeadStock" DefaultMode="Insert" 
        EnableModelValidation="True" onitemcommand="FormView_DeadStock_ItemCommand" 
        oniteminserting="FormView_DeadStock_ItemInserting" 
        oniteminserted="FormView_DeadStock_ItemInserted" 
        onitemupdated="FormView_DeadStock_ItemUpdated" 
        onitemupdating="FormView_DeadStock_ItemUpdating">
        <EditItemTemplate>
                                           
                               <table align="center" cellspacing="5">
							   <tr>
			                   <td>
			                   <table>
							   <tr>
							   <td>Description Of Article:
							   </td>
							   <td><asp:TextBox ID="DescOfArticleTextBox" runat="server" 
                                    Text='<%# Bind("DescOfArticle") %>' Height="60px" Width="160px" />
							   </td>
							   </tr>
							   
                                
                                <tr><td>Authority For purchase :</td><td> 
                                    <asp:TextBox ID="Authority_For_purchaseTextBox" runat="server" 
                                    Text='<%# Bind("Authority_For_purchase") %>' Width="160px" /></td></tr>
                                
                               
                                <tr><td>Purchase date:</td><td>
                                    <asp:TextBox ID="Purchase_dateTextBox" runat="server" 
                                    Text='<%# Bind("Purchase_date") %>' Width="140px" /></td></tr>
                                
                                
                                <tr><td> No Of Quantity:</td><td> <asp:TextBox ID="NoofqtyTextBox" runat="server" 
                                        Text='<%# Bind("Noofqty") %>' Width="160px" /></td></tr>
                               
                               
                                <tr><td>Value :</td><td><asp:TextBox ID="ValueTextBox" runat="server" 
                                        Text='<%# Bind("Value") %>' Width="160px" /></td></tr>
                                
                                
                                <tr><td>Initials Of HO:</td><td> 
                                    <asp:TextBox ID="InitialsOfHOTextBox" runat="server" 
                                    Text='<%# Bind("InitialsOfHO") %>' Width="160px" /></td></tr>
                                
                               
                                <tr><td> No Of Quantity:</td><td>  <asp:TextBox ID="NoQtyTextBox" runat="server" 
                                        Text='<%# Bind("NoQty") %>' Width="160px" /></td></tr>
                               
                              </table>
			                    </td>
                                <td>
			                  <table>
                                <tr><td> Nature  Disposal:</td><td>
                                    <asp:TextBox ID="NatureDisposalTextBox" runat="server" 
                                    Text='<%# Bind("NatureDisposal") %>' Width="160px" /></td></tr>
                               
                                
                                <tr><td>Authority Voucher:</td><td>
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                        RepeatDirection="Horizontal" Width="160px">
                                        <asp:ListItem>Authority</asp:ListItem>
                                        <asp:ListItem>Voucher</asp:ListItem>
                                    </asp:RadioButtonList>
                                    </td></tr>
                                
                                
                                <tr><td>Amount Realized:</td><td>
                                    <asp:TextBox ID="AmtRealizeTextBox" runat="server" 
                                    Text='<%# Bind("AmtRealize") %>' Width="160px" /></td></tr>
                                
                                
                                <tr><td> Date Of Credit:</td><td>
                                    <asp:TextBox ID="DateCreditTextBox" runat="server" 
                                    Text='<%# Bind("DateCredit") %>' Width="140px" /></td></tr>
                               
                                
                                <tr><td>Amount Written Off:</td><td> 
                                    <asp:TextBox ID="AmtWritten_offTextBox" runat="server" 
                                    Text='<%# Bind("AmtWritten_off") %>' Width="160px" /></td></tr>
                                
                               
                                <tr><td>Balance Stock:</td><td>
                                    <asp:TextBox ID="BalanceStockTextBox" runat="server" 
                                    Text='<%# Bind("BalanceStock") %>' Width="160px" /></td></tr>
                                
                                
                                <tr><td> Remarks:</td><td> <asp:TextBox ID="RemarksTextBox" runat="server" 
                                        Text='<%# Bind("Remarks") %>' Height="60px" Width="160px" /></td></tr>
                               </table>
				</td>
				
				
				
				</tr>
                <tr>
                <td colspan="2" align="center">
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" CssClass="standardButton"/>
                &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" />
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
			                   <table>
							   <tr>
							   <td>Description Of Article:
							   </td>
							   <td><asp:TextBox ID="DescOfArticleTextBox" runat="server" 
                                    Text='<%# Bind("DescOfArticle") %>' Height="60px" Width="160px" />
							   </td>
							   </tr>
							   
                                
                                <tr><td>Authority For purchase :</td><td> 
                                    <asp:TextBox ID="Authority_For_purchaseTextBox" runat="server" 
                                    Text='<%# Bind("Authority_For_purchase") %>' Width="160px" /></td></tr>
                                
                               
                                <tr><td>Purchase date:</td><td>
                                    <asp:TextBox ID="Purchase_dateTextBox" runat="server" 
                                    Text='<%# Bind("Purchase_date") %>' Width="140px" /></td></tr>
                                
                                
                                <tr><td> No Of Quantity:</td><td> <asp:TextBox ID="NoofqtyTextBox" runat="server" 
                                        Text='<%# Bind("Noofqty") %>' Width="160px" /></td></tr>
                               
                               
                                <tr><td>Value :</td><td><asp:TextBox ID="ValueTextBox" runat="server" 
                                        Text='<%# Bind("Value") %>' Width="160px" /></td></tr>
                                
                                
                                <tr><td>Initials Of HO:</td><td> 
                                    <asp:TextBox ID="InitialsOfHOTextBox" runat="server" 
                                    Text='<%# Bind("InitialsOfHO") %>' Width="160px" /></td></tr>
                                
                               
                                <tr><td> No Of Quantity:</td><td>  <asp:TextBox ID="NoQtyTextBox" runat="server" 
                                        Text='<%# Bind("NoQty") %>' Width="160px" /></td></tr>
                               
                              </table>
			                    </td>
                                <td>
			                  <table>
                                <tr><td> Nature  Disposal:</td><td>
                                    <asp:TextBox ID="NatureDisposalTextBox" runat="server" 
                                    Text='<%# Bind("NatureDisposal") %>' Width="160px" /></td></tr>
                               
                                
                                <tr><td>Authority Voucher:</td><td>
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                        RepeatDirection="Horizontal" Width="160px">
                                        <asp:ListItem>Authority</asp:ListItem>
                                        <asp:ListItem>Voucher</asp:ListItem>
                                    </asp:RadioButtonList>
                                    </td></tr>
                                
                                
                                <tr><td>Amount Realized:</td><td>
                                    <asp:TextBox ID="AmtRealizeTextBox" runat="server" 
                                    Text='<%# Bind("AmtRealize") %>' Width="160px" /></td></tr>
                                
                                
                                <tr><td> Date Of Credit:</td><td>
                                    <asp:TextBox ID="DateCreditTextBox" runat="server" 
                                    Text='<%# Bind("DateCredit") %>' Width="140px" /></td></tr>
                               
                                
                                <tr><td>Amount Written Off:</td><td> 
                                    <asp:TextBox ID="AmtWritten_offTextBox" runat="server" 
                                    Text='<%# Bind("AmtWritten_off") %>' Width="160px" /></td></tr>
                                
                               
                                <tr><td>Balance Stock:</td><td>
                                    <asp:TextBox ID="BalanceStockTextBox" runat="server" 
                                    Text='<%# Bind("BalanceStock") %>' Width="160px" /></td></tr>
                                
                                
                                <tr><td> Remarks:</td><td> <asp:TextBox ID="RemarksTextBox" runat="server" 
                                        Text='<%# Bind("Remarks") %>' Height="60px" Width="160px" /></td></tr>
                               </table>
				</td>
				
				
				
				</tr>
                               
                                <tr>
								 <td align="center" colspan="2"> 
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" CssClass="standardButton" />
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" /></td>
								</tr>
                                
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            DescOfArticle:
            <asp:Label ID="DescOfArticleLabel" runat="server" 
                Text='<%# Bind("DescOfArticle") %>' />
            <br />
            Authority_For_purchase:
            <asp:Label ID="Authority_For_purchaseLabel" runat="server" 
                Text='<%# Bind("Authority_For_purchase") %>' />
            <br />
            Purchase_date:
            <asp:Label ID="Purchase_dateLabel" runat="server" 
                Text='<%# Bind("Purchase_date") %>' />
            <br />
            Noofqty:
            <asp:Label ID="NoofqtyLabel" runat="server" Text='<%# Bind("Noofqty") %>' />
            <br />
            Value:
            <asp:Label ID="ValueLabel" runat="server" Text='<%# Bind("Value") %>' />
            <br />
            InitialsOfHO:
            <asp:Label ID="InitialsOfHOLabel" runat="server" 
                Text='<%# Bind("InitialsOfHO") %>' />
            <br />
            NoQty:
            <asp:Label ID="NoQtyLabel" runat="server" Text='<%# Bind("NoQty") %>' />
            <br />
            NatureDisposal:
            <asp:Label ID="NatureDisposalLabel" runat="server" 
                Text='<%# Bind("NatureDisposal") %>' />
            <br />
            Authorityvoucher:
            <asp:Label ID="AuthorityvoucherLabel" runat="server" 
                Text='<%# Bind("Authorityvoucher") %>' />
            <br />
            AmtRealize:
            <asp:Label ID="AmtRealizeLabel" runat="server" 
                Text='<%# Bind("AmtRealize") %>' />
            <br />
            DateCredit:
            <asp:Label ID="DateCreditLabel" runat="server" 
                Text='<%# Bind("DateCredit") %>' />
            <br />
            AmtWritten_off:
            <asp:Label ID="AmtWritten_offLabel" runat="server" 
                Text='<%# Bind("AmtWritten_off") %>' />
            <br />
            BalanceStock:
            <asp:Label ID="BalanceStockLabel" runat="server" 
                Text='<%# Bind("BalanceStock") %>' />
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
    
    <asp:ObjectDataSource ID="ods_DeadStock" runat="server"  
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.DeadStockRegisterTableAdapters.DeadStockRegisterTableAdapter" 
        DeleteMethod="DeleteQuery" InsertMethod="Insert" UpdateMethod="UpdateQuery" 
        onselecting="ods_DeadStock_Selecting" ondeleting="ods_DeadStock_Deleting">
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DescOfArticle" Type="String" />
            <asp:Parameter Name="Authority_For_purchase" Type="String" />
            <asp:Parameter Name="Purchase_date" Type="DateTime" />
            <asp:Parameter Name="Noofqty" Type="Int32" />
            <asp:Parameter Name="Value" Type="Int32" />
            <asp:Parameter Name="InitialsOfHO" Type="String" />
            <asp:Parameter Name="NoQty" Type="Int32" />
            <asp:Parameter Name="NatureDisposal" Type="String" />
            <asp:Parameter Name="Authorityvoucher" Type="String" />
            <asp:Parameter Name="AmtRealize" Type="Decimal" />
            <asp:Parameter Name="DateCredit" Type="DateTime" />
            <asp:Parameter Name="AmtWritten_off" Type="Decimal" />
            <asp:Parameter Name="BalanceStock" Type="Decimal" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearch" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="DescOfArticle" Type="String" />
            <asp:Parameter Name="Authority_For_purchase" Type="String" />
            <asp:Parameter Name="Purchase_date" Type="String" />
            <asp:Parameter Name="Noofqty" Type="Int32" />
            <asp:Parameter Name="Value" Type="Int32" />
            <asp:Parameter Name="InitialsOfHO" Type="String" />
            <asp:Parameter Name="NoQty" Type="Int32" />
            <asp:Parameter Name="NatureDisposal" Type="String" />
            <asp:Parameter Name="Authorityvoucher" Type="String" />
            <asp:Parameter Name="AmtRealize" Type="Decimal" />
            <asp:Parameter Name="DateCredit" Type="String" />
            <asp:Parameter Name="AmtWritten_off" Type="Decimal" />
            <asp:Parameter Name="BalanceStock" Type="Decimal" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>


</asp:Content>

