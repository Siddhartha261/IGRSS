<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="DeadStockRegister.aspx.cs" Inherits="Register_and_marriage_DeadStockRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
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

        //temp code for comparing amount realized and amount written-off
        function Compareamt(event) {
            var amt_realized = document.getElementById('<%=FormView_DeadStock.FindControl("AmtRealizeTextBox").ClientID%>');
            var amt_written_off = document.getElementById('<%=FormView_DeadStock.FindControl("AmtWritten_offTextBox").ClientID%>');
            if (amt_realized > amt_written_off) {
                alert("Amount Realized should be greater than Amount Written-off");
                event.preventDefault();
            }
        }
        //ends temp code


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

        function getId() {
            document.getElementById(Form)
        }
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return true;
            return false;
        }
        function removeInlineStyles() {
            $("input[type='text']").each(function (index, element) { $(element).removeAttr("style"); });
            $("table[id*='FvGovtDoc']").removeAttr("style")
        }
        $(function () {

            // removeInlineStyles();
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
        <asp:Panel ID="infoDiv" runat="server" Visible="false" CssClass="infoBar">
            &nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
        <hr />
        <br />
    </center>
    <asp:MultiView ID="Multiview_DeadStock" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1_GridView" runat="server">
            <br />
            <h1 style="text-align: center" align="center">
                DEAD STOCK REGISTER</h1>
            <table>
                <tr>
                    <td align="right">
                        <table>
                            <tr>
                                <td align="right" style="width: 641px;">
                                    <asp:Label ID="lbllls" runat="server" meta:resourcekey="lblllsResource1" Text="Enter File Number :"></asp:Label>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="txtSearch" runat="server" meta:resourcekey="txtFileNoResource1"
                                        Width="160"></asp:TextBox>
                                </td>
                                <td align="right">
                                    <asp:LinkButton ID="btnSearchAppNo" runat="server" CssClass="standardButton" meta:resourcekey="btnSearchAppNoResource1"
                                        Text="Search" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="3">
                        <asp:GridView ID="GridView_DeadStock" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="SrNo" DataSourceID="ods_DeadStock" EnableModelValidation="True"
                            OnRowDeleted="GridView_DeadStock_RowDeleted" OnRowDeleting="GridView_DeadStock_RowDeleting"
                            OnRowEditing="GridView_DeadStock_RowEditing">
                            <Columns>
                                <asp:BoundField DataField="SrNo" HeaderText="SrNo" ReadOnly="True" SortExpression="SrNo"
                                    InsertVisible="False" Visible="False" />
                                <asp:BoundField DataField="DescOfArticle" HeaderText="Description Of Article" SortExpression="DescOfArticle"
                                    Visible="False" />
                                <asp:BoundField DataField="Authority_For_purchase" HeaderText="Authority For Purchase"
                                    SortExpression="Authority_For_purchase" />
                                <asp:BoundField DataField="Purchase_date" HeaderText="Purchase Date" SortExpression="Purchase_date" />
                                <asp:BoundField DataField="Noofqty" HeaderText="No Of Quantity" SortExpression="Noofqty"
                                    Visible="False" />
                                <asp:BoundField DataField="Value" HeaderText="Value" SortExpression="Value" Visible="False" />
                                <asp:BoundField DataField="InitialsOfHO" HeaderText="Initials Of HO" SortExpression="InitialsOfHO" />
                                <asp:BoundField DataField="NoQty" HeaderText="No Of Quantity" SortExpression="NoQty"
                                    Visible="False" />
                                <asp:BoundField DataField="NatureDisposal" HeaderText="Nature Of Disposal" SortExpression="NatureDisposal" />
                                <asp:BoundField DataField="Authorityvoucher" HeaderText="Authority  / Voucher" SortExpression="Authorityvoucher"
                                    Visible="False" />
                                <asp:BoundField DataField="AmtRealize" HeaderText="Amount Realize" SortExpression="AmtRealize"
                                    Visible="False" />
                                <asp:BoundField DataField="DateCredit" HeaderText="Date Of Credit" SortExpression="DateCredit"
                                    Visible="False" />
                                <asp:BoundField DataField="AmtWritten_off" HeaderText="Amount Written Off" SortExpression="AmtWritten_off"
                                    Visible="False" />
                                <asp:BoundField DataField="BalanceStock" HeaderText="Balance Stock" SortExpression="BalanceStock" />
                                <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"
                                    Visible="False" />
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:ImageButton ID="ImageButton1" CommandName="Edit" runat="server" ImageUrl="~/Styles/css/sunny/images/edit.png" />
                                                </td>
                                                <td>
                                                    <asp:ImageButton ID="ImageButton2" CommandName="Delete" runat="server" ImageUrl="~/Styles/css/sunny/images/deletecross.png" />
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
            <asp:LinkButton ID="Button_new" runat="server" Text="New" OnClick="Button_new_Click"
                CssClass="standardButton" AccessKey="N" />
        </asp:View>
        <asp:View ID="View2_Formview" runat="server">
            <center>
                <h1 align="center">
                    DEAD STOCK REGISTER</h1>
                <asp:FormView ID="FormView_DeadStock" runat="server" DataKeyNames="SrNo" DataSourceID="ods_DeadStock"
                    DefaultMode="Insert" EnableModelValidation="True" OnItemCommand="FormView_DeadStock_ItemCommand"
                    OnItemInserting="FormView_DeadStock_ItemInserting" OnItemInserted="FormView_DeadStock_ItemInserted"
                    OnItemUpdated="FormView_DeadStock_ItemUpdated" OnItemUpdating="FormView_DeadStock_ItemUpdating">
                    <EditItemTemplate>
                  <table align="center" cellspacing="5">
                            <tr align="left">
                                <td>
                                    Authority For Purchase :
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                        ControlToValidate="Authority_For_purchaseTextBox">*</asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="Authority_For_purchaseTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                                        Text='<%# Bind("Authority_For_purchase") %>' TabIndex="1" MaxLength="20" Width="160px" />
                                </td>
                                <td>
                                    Nature Of Disposal:
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:TextBox ID="NatureDisposalTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                                        Text='<%# Bind("NatureDisposal") %>' TabIndex="7" MaxLength="30" Width="160px" />
                                </td>
                                <tr align="left">
                                    <td>
                                        Purchase Date:
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                            ControlToValidate="Purchase_dateTextBox">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Purchase_dateTextBox" runat="server" Text='<%# Bind("Purchase_date") %>'
                                            TabIndex="1" MaxLength="20" Width="160px" />
                                    </td>
                                    <td>
                                        Amount Realized:
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                            ControlToValidate="AmtRealizeTextBox">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="AmtRealizeTextBox" runat="server" Text='<%# Bind("AmtRealize") %>'
                                            TabIndex="8" MaxLength="10" numeric="integer" Width="160px" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        No Of Quantity:
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                            ControlToValidate="Purchase_dateTextBox">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="NoofqtyTextBox" runat="server" Text='<%# Bind("Noofqty") %>' TabIndex="2"
                                            MaxLength="10" numeric="integer" Width="160px" />
                                    </td>
                                    <td>
                                        Date Of Credit:
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="DateCreditTextBox" runat="server" Text='<%# Bind("DateCredit") %>'
                                            TabIndex="9" MaxLength="20" Width="160px" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        Value :
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                                            ControlToValidate="ValueTextBox">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ValueTextBox" runat="server" Text='<%# Bind("Value") %>' TabIndex="3"
                                            MaxLength="10" numeric="integer" Width="160px" />
                                    </td>
                                    <td>
                                        Amount Written Off:
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                                            ControlToValidate="AmtWritten_offTextBox">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="AmtWritten_offTextBox" runat="server" Text='<%# Bind("AmtWritten_off") %>'
                                            TabIndex="10" MaxLength="10" numeric="integer" Width="160px" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        Initials Of HO:
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="InitialsOfHOTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                                            Text='<%# Bind("InitialsOfHO") %>' TabIndex="4" MaxLength="10" Width="160px" />
                                    </td>
                                    <td>
                                        Balance Stock:
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                                            ControlToValidate="BalanceStockTextBox">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="BalanceStockTextBox" runat="server" Text='<%# Bind("BalanceStock") %>'
                                            TabIndex="11" MaxLength="10" numeric="integer" Width="160px" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        Authority / Voucher:
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                                            TabIndex="5" Width="160px">
                                            <asp:ListItem>Authority</asp:ListItem>
                                            <asp:ListItem>Voucher</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        Description Of Article:
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="DescOfArticleTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                                            Text='<%# Bind("DescOfArticle") %>' Width="160px" Height="60px" TextMode="MultiLine"
                                            TabIndex="6" />
                                        <td>
                                            Remarks:
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' TabIndex="12"
                                                Height="60px" TextMode="MultiLine" Width="160px" />
                                        </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="6">
                                        <asp:LinkButton ID="InsertButton" runat="server" OnClientClick="Compareamt(event)" CausesValidation="True" CommandName="Update"
                                            Text="Update" CssClass="standardButton" TabIndex="14" AccessKey="I" />
                                        &nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="False" CommandName="reset"
                                            Text="Reset" OnClientClick="resetTextFields();return false;" CssClass="standardButton"
                                            TabIndex="15" AccessKey="R" />
                                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                            CommandName="Back" Text="Back" CssClass="standardButton" TabIndex="16" AccessKey="B" />
                                    </td>
                                </tr>
                        </table>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table align="center" cellspacing="5">
                            <tr align="left">
                                <td>
                                    Authority For Purchase :
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                        ControlToValidate="Authority_For_purchaseTextBox">*</asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:TextBox ID="Authority_For_purchaseTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                                        Text='<%# Bind("Authority_For_purchase") %>' TabIndex="1" MaxLength="20" Width="160px" />
                                </td>
                                <td>
                                    Nature Of Disposal:
                                </td>
                                <td>
                                </td>
                                <td>
                                    <asp:TextBox ID="NatureDisposalTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                                        Text='<%# Bind("NatureDisposal") %>' TabIndex="7" MaxLength="30" Width="160px" />
                                </td>
                                <tr align="left">
                                    <td>
                                        Purchase Date:
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                            ControlToValidate="Purchase_dateTextBox">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Purchase_dateTextBox" runat="server" Text='<%# Bind("Purchase_date") %>'
                                            TabIndex="1" MaxLength="20" Width="160px" />
                                    </td>
                                    <td>
                                        Amount Realized:
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                            ControlToValidate="AmtRealizeTextBox">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="AmtRealizeTextBox" runat="server" Text='<%# Bind("AmtRealize") %>'
                                            TabIndex="8" MaxLength="10" numeric="integer" Width="160px" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        No Of Quantity:
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                            ControlToValidate="Purchase_dateTextBox">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="NoofqtyTextBox" runat="server" Text='<%# Bind("Noofqty") %>' TabIndex="2"
                                            MaxLength="10" numeric="integer" Width="160px" />
                                    </td>
                                    <td>
                                        Date Of Credit:
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="DateCreditTextBox" runat="server" Text='<%# Bind("DateCredit") %>'
                                            TabIndex="9" MaxLength="20" Width="160px" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        Value :
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                                            ControlToValidate="ValueTextBox">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ValueTextBox" runat="server" Text='<%# Bind("Value") %>' TabIndex="3"
                                            MaxLength="10" numeric="integer" Width="160px" />
                                    </td>
                                    <td>
                                        Amount Written Off:
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*"
                                            ControlToValidate="AmtWritten_offTextBox">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="AmtWritten_offTextBox" runat="server" Text='<%# Bind("AmtWritten_off") %>'
                                            TabIndex="10" MaxLength="10" numeric="integer" Width="160px" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        Initials Of HO:
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="InitialsOfHOTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                                            Text='<%# Bind("InitialsOfHO") %>' TabIndex="4" MaxLength="10" Width="160px" />
                                    </td>
                                    <td>
                                        Balance Stock:
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*"
                                            ControlToValidate="BalanceStockTextBox">*</asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="BalanceStockTextBox" runat="server" Text='<%# Bind("BalanceStock") %>'
                                            TabIndex="11" MaxLength="10" numeric="integer" Width="160px" />
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        Authority / Voucher:
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                                            TabIndex="5" Width="160px">
                                            <asp:ListItem>Authority</asp:ListItem>
                                            <asp:ListItem>Voucher</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr align="left">
                                    <td>
                                        Description Of Article:
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="DescOfArticleTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                                            Text='<%# Bind("DescOfArticle") %>' Width="160px" Height="60px" TextMode="MultiLine"
                                            TabIndex="6" />
                                        <td>
                                            Remarks:
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' TabIndex="12"
                                                Height="60px" TextMode="MultiLine" Width="160px" />
                                        </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="6">
                                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                            Text="Insert" CssClass="standardButton" TabIndex="13" AccessKey="I" />
                                        &nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="False" CommandName="reset"
                                            Text="Reset" OnClientClick="resetTextFields();return false;" CssClass="standardButton"
                                            TabIndex="14" AccessKey="R" />
                                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                            CommandName="Back" Text="Back" CssClass="standardButton" TabIndex="15" AccessKey="B" />
                                    </td>
                                </tr>
                        </table>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        SrNo:
                        <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
                        <br />
                        DescOfArticle:
                        <asp:Label ID="DescOfArticleLabel" runat="server" Text='<%# Bind("DescOfArticle") %>' />
                        <br />
                        Authority_For_purchase:
                        <asp:Label ID="Authority_For_purchaseLabel" runat="server" Text='<%# Bind("Authority_For_purchase") %>' />
                        <br />
                        Purchase_date:
                        <asp:Label ID="Purchase_dateLabel" runat="server" Text='<%# Bind("Purchase_date") %>' />
                        <br />
                        Noofqty:
                        <asp:Label ID="NoofqtyLabel" runat="server" Text='<%# Bind("Noofqty") %>' />
                        <br />
                        Value:
                        <asp:Label ID="ValueLabel" runat="server" Text='<%# Bind("Value") %>' />
                        <br />
                        InitialsOfHO:
                        <asp:Label ID="InitialsOfHOLabel" runat="server" Text='<%# Bind("InitialsOfHO") %>' />
                        <br />
                        NoQty:
                        <asp:Label ID="NoQtyLabel" runat="server" Text='<%# Bind("NoQty") %>' />
                        <br />
                        NatureDisposal:
                        <asp:Label ID="NatureDisposalLabel" runat="server" Text='<%# Bind("NatureDisposal") %>' />
                        <br />
                        Authorityvoucher:
                        <asp:Label ID="AuthorityvoucherLabel" runat="server" Text='<%# Bind("Authorityvoucher") %>' />
                        <br />
                        AmtRealize:
                        <asp:Label ID="AmtRealizeLabel" runat="server" Text='<%# Bind("AmtRealize") %>' />
                        <br />
                        DateCredit:
                        <asp:Label ID="DateCreditLabel" runat="server" Text='<%# Bind("DateCredit") %>' />
                        <br />
                        AmtWritten_off:
                        <asp:Label ID="AmtWritten_offLabel" runat="server" Text='<%# Bind("AmtWritten_off") %>' />
                        <br />
                        BalanceStock:
                        <asp:Label ID="BalanceStockLabel" runat="server" Text='<%# Bind("BalanceStock") %>' />
                        <br />
                        Remarks:
                        <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New" />
                    </ItemTemplate>
                </asp:FormView>
            </center>
            <asp:ObjectDataSource ID="ods_DeadStock" runat="server" SelectMethod="GetDataBy"
                TypeName="IGRSS.DataAccessLayer.DeadStockRegisterTableAdapters.DeadStockRegisterTableAdapter"
                DeleteMethod="DeleteQuery" InsertMethod="Insert" UpdateMethod="UpdateQuery" OnSelecting="ods_DeadStock_Selecting"
                OnDeleting="ods_DeadStock_Deleting">
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
                    <asp:ControlParameter ControlID="txtSearch" Name="searchKeyWord" PropertyName="Text"
                        Type="String" />
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
            <br />
        </asp:View>
    </asp:MultiView>
</asp:Content>
