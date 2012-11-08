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
<asp:MultiView ID="Multiview_DeadStock" runat="server" ActiveViewIndex="0">
<asp:View ID="View1_GridView" runat="server">
<hr /><br />
<h1>Dead stock register</h1>
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
                  <asp:GridView ID="GridView_DeadStock" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_DeadStock" 
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                              ReadOnly="True" SortExpression="SrNo" InsertVisible="False" 
                              Visible="False" />
                          <asp:BoundField DataField="DescOfArticle" HeaderText="DescOfArticle" 
                              SortExpression="DescOfArticle" Visible="False" />
                          <asp:BoundField DataField="Authority_For_purchase" HeaderText="Authority_For_purchase" 
                              SortExpression="Authority_For_purchase" />
                          <asp:BoundField DataField="Purchase_date" HeaderText="Purchase_date" 
                              SortExpression="Purchase_date" />
                          <asp:BoundField DataField="Noofqty" HeaderText="Noofqty" 
                              SortExpression="Noofqty" />
                          <asp:BoundField DataField="Value" HeaderText="Value" 
                              SortExpression="Value" />
                          <asp:BoundField DataField="InitialsOfHO" HeaderText="InitialsOfHO" 
                              SortExpression="InitialsOfHO" />
                          <asp:BoundField DataField="NoQty" HeaderText="NoQty" 
                              SortExpression="NoQty" Visible="False" />
                          <asp:BoundField DataField="NatureDisposal" HeaderText="NatureDisposal" 
                              SortExpression="NatureDisposal" />
                          <asp:BoundField DataField="Authorityvoucher" HeaderText="Authorityvoucher" 
                              SortExpression="Authorityvoucher" Visible="False" />
                          <asp:BoundField DataField="AmtRealize" HeaderText="AmtRealize" 
                              SortExpression="AmtRealize" />
                          <asp:BoundField DataField="DateCredit" HeaderText="DateCredit" 
                              SortExpression="DateCredit" />
                          <asp:BoundField DataField="AmtWritten_off" HeaderText="AmtWritten_off" 
                              SortExpression="AmtWritten_off" />
                          <asp:BoundField DataField="BalanceStock" HeaderText="BalanceStock" 
                              SortExpression="BalanceStock" />
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

<asp:View ID="View2_Formview" runat="server">
<center>
<h1>dead stock register</h1>
    <asp:FormView ID="FormView_DeadStock" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_DeadStock" DefaultMode="Insert" 
        EnableModelValidation="True" onitemcommand="FormView_DeadStock_ItemCommand" 
        oniteminserting="FormView_DeadStock_ItemInserting">
        <EditItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel1" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            DescOfArticle:
            <asp:TextBox ID="DescOfArticleTextBox" runat="server" 
                Text='<%# Bind("DescOfArticle") %>' />
            <br />
            Authority_For_purchase:
            <asp:TextBox ID="Authority_For_purchaseTextBox" runat="server" 
                Text='<%# Bind("Authority_For_purchase") %>' />
            <br />
            Purchase_date:
            <asp:TextBox ID="Purchase_dateTextBox" runat="server" 
                Text='<%# Bind("Purchase_date") %>' />
            <br />
            Noofqty:
            <asp:TextBox ID="NoofqtyTextBox" runat="server" 
                Text='<%# Bind("Noofqty") %>' />
            <br />
            Value:
            <asp:TextBox ID="ValueTextBox" runat="server" Text='<%# Bind("Value") %>' />
            <br />
            InitialsOfHO:
            <asp:TextBox ID="InitialsOfHOTextBox" runat="server" 
                Text='<%# Bind("InitialsOfHO") %>' />
            <br />
            NoQty:
            <asp:TextBox ID="NoQtyTextBox" runat="server" Text='<%# Bind("NoQty") %>' />
            <br />
            NatureDisposal:
            <asp:TextBox ID="NatureDisposalTextBox" runat="server" 
                Text='<%# Bind("NatureDisposal") %>' />
            <br />
            Authorityvoucher:
            <asp:TextBox ID="AuthorityvoucherTextBox" runat="server" 
                Text='<%# Bind("Authorityvoucher") %>' />
            <br />
            AmtRealize:
            <asp:TextBox ID="AmtRealizeTextBox" runat="server" 
                Text='<%# Bind("AmtRealize") %>' />
            <br />
            DateCredit:
            <asp:TextBox ID="DateCreditTextBox" runat="server" 
                Text='<%# Bind("DateCredit") %>' />
            <br />
            AmtWritten_off:
            <asp:TextBox ID="AmtWritten_offTextBox" runat="server" 
                Text='<%# Bind("AmtWritten_off") %>' />
            <br />
            BalanceStock:
            <asp:TextBox ID="BalanceStockTextBox" runat="server" 
                Text='<%# Bind("BalanceStock") %>' />
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
			                   <td>
			                   <table>
							   <tr>
							   <td>Description Of Article:
							   </td>
							   <td><asp:TextBox ID="DescOfArticleTextBox" runat="server" 
                                    Text='<%# Bind("DescOfArticle") %>' />
							   </td>
							   </tr>
							   
                                
                                <tr><td>Authority For purchase :</td><td> <asp:TextBox ID="Authority_For_purchaseTextBox" runat="server" 
                                    Text='<%# Bind("Authority_For_purchase") %>' /></td></tr>
                                
                               
                                <tr><td>Purchase date:</td><td><asp:TextBox ID="Purchase_dateTextBox" runat="server" 
                                    Text='<%# Bind("Purchase_date") %>' /></td></tr>
                                
                                
                                <tr><td> No Of Quantity:</td><td> <asp:TextBox ID="NoofqtyTextBox" runat="server" Text='<%# Bind("Noofqty") %>' /></td></tr>
                               
                               
                                <tr><td>Value :</td><td><asp:TextBox ID="ValueTextBox" runat="server" Text='<%# Bind("Value") %>' /></td></tr>
                                
                                
                                <tr><td>Initials Of HO:</td><td> <asp:TextBox ID="InitialsOfHOTextBox" runat="server" 
                                    Text='<%# Bind("InitialsOfHO") %>' /></td></tr>
                                
                               
                                <tr><td> No Of Quantity:</td><td>  <asp:TextBox ID="NoQtyTextBox" runat="server" Text='<%# Bind("NoQty") %>' /></td></tr>
                               
                              </table>
			                    </td>
                                <td>
			                  <table>
                                <tr><td> Nature  Disposal:</td><td><asp:TextBox ID="NatureDisposalTextBox" runat="server" 
                                    Text='<%# Bind("NatureDisposal") %>' /></td></tr>
                               
                                
                                <tr><td>Authority Voucher:</td><td>
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                                        RepeatDirection="Horizontal">
                                        <asp:ListItem>Authority</asp:ListItem>
                                        <asp:ListItem>Voucher</asp:ListItem>
                                    </asp:RadioButtonList>
                                    </td></tr>
                                
                                
                                <tr><td>Amount Realized:</td><td><asp:TextBox ID="AmtRealizeTextBox" runat="server" 
                                    Text='<%# Bind("AmtRealize") %>' /></td></tr>
                                
                                
                                <tr><td> Date Of Credit:</td><td><asp:TextBox ID="DateCreditTextBox" runat="server" 
                                    Text='<%# Bind("DateCredit") %>' /></td></tr>
                               
                                
                                <tr><td>Amount Written Off:</td><td> <asp:TextBox ID="AmtWritten_offTextBox" runat="server" 
                                    Text='<%# Bind("AmtWritten_off") %>' /></td></tr>
                                
                               
                                <tr><td>Balance Stock:</td><td><asp:TextBox ID="BalanceStockTextBox" runat="server" 
                                    Text='<%# Bind("BalanceStock") %>' /></td></tr>
                                
                                
                                <tr><td> Remarks:</td><td> <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' /></td></tr>
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
    
    <asp:ObjectDataSource ID="ods_DeadStock" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.DeadStockRegisterTableAdapters.DeadStockRegisterTableAdapter" 
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" 
        onselecting="ods_DeadStock_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_DescOfArticle" Type="String" />
            <asp:Parameter Name="Original_Authority_For_purchase" Type="String" />
            <asp:Parameter Name="Original_Purchase_date" Type="DateTime" />
            <asp:Parameter Name="Original_Noofqty" Type="Int32" />
            <asp:Parameter Name="Original_Value" Type="Int32" />
            <asp:Parameter Name="Original_InitialsOfHO" Type="String" />
            <asp:Parameter Name="Original_NoQty" Type="Int32" />
            <asp:Parameter Name="Original_NatureDisposal" Type="String" />
            <asp:Parameter Name="Original_Authorityvoucher" Type="String" />
            <asp:Parameter Name="Original_AmtRealize" Type="Decimal" />
            <asp:Parameter Name="Original_DateCredit" Type="DateTime" />
            <asp:Parameter Name="Original_AmtWritten_off" Type="Decimal" />
            <asp:Parameter Name="Original_BalanceStock" Type="Decimal" />
            <asp:Parameter Name="Original_Remarks" Type="String" />
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
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_DescOfArticle" Type="String" />
            <asp:Parameter Name="Original_Authority_For_purchase" Type="String" />
            <asp:Parameter Name="Original_Purchase_date" Type="DateTime" />
            <asp:Parameter Name="Original_Noofqty" Type="Int32" />
            <asp:Parameter Name="Original_Value" Type="Int32" />
            <asp:Parameter Name="Original_InitialsOfHO" Type="String" />
            <asp:Parameter Name="Original_NoQty" Type="Int32" />
            <asp:Parameter Name="Original_NatureDisposal" Type="String" />
            <asp:Parameter Name="Original_Authorityvoucher" Type="String" />
            <asp:Parameter Name="Original_AmtRealize" Type="Decimal" />
            <asp:Parameter Name="Original_DateCredit" Type="DateTime" />
            <asp:Parameter Name="Original_AmtWritten_off" Type="Decimal" />
            <asp:Parameter Name="Original_BalanceStock" Type="Decimal" />
            <asp:Parameter Name="Original_Remarks" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>


</asp:Content>

