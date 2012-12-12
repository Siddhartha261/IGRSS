<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="FeeMaster.aspx.cs" Inherits="Central_Administration_Console_FeeMaster"
    Title="Fees Master" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="MvFeeMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="GridToView" runat="server">
            <table width="100%">
                <tr>
                    <td>
                        <asp:GridView ID="GvFeeMaster" runat="server" DataKeyNames="FeeId" DataSourceID="odsFeeMaster"
                            AutoGenerateColumns="False" 
                            OnSelectedIndexChanged="GvFeeMaster_SelectedIndexChanged" 
                            meta:resourcekey="GvFeeMasterResource1" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="FeeId" HeaderText="FeeId" Visible="False" meta:resourcekey="BoundFieldResource2" />
                                <asp:BoundField DataField="Description" HeaderText="Description" meta:resourcekey="BoundFieldResource3" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:F2}"
                                    HtmlEncode="False" meta:resourcekey="BoundFieldResource4" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="btnNew" runat="server" Text="Add New" OnClick="btnNew_Click" meta:resourcekey="btnNewResource1" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View1" runat="server">
            <asp:FormView ID="FvFeeMaster" runat="server" DefaultMode="Insert" DataKeyNames="FeeId"
                DataSourceID="odsFeeMasterById" OnItemInserting="FvFeeMaster_ItemInserting" OnItemUpdating="FvFeeMaster_ItemUpdating" meta:resourcekey="FvFeeMasterResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblFeeMasterHeadingsIns" runat="server" meta:resourcekey="lblFeeMasterHeadingsIns"
                                    SkinID="SubHeading" Text="Fee Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameIns" runat="server" meta:resourcekey="lblNameIns" Text="Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameIns" MaxLength="25" runat="server" meta:resourcekey="txtNameIns"
                                    Text='<%# Bind("Name") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqFldName" runat="server" ControlToValidate="txtNameIns"
                                    ErrorMessage="Name Can't be Blank" meta:resourcekey="ReqFldNameResource1">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblFeeTypeIns" runat="server" meta:resourcekey="lblFeeTypeIns" Text="Fee Type"></asp:Label>
                            </td>
                            <td class="textColumn" style="width: 25%">
                                <asp:DropDownList ID="ddlFeeTypeIns" runat="server" Width="165px" SelectedValue='<%# Bind("FeeType") %>' meta:resourcekey="ddlFeeTypeInsResource1">
                                    <asp:ListItem meta:resourcekey="ListItemResource1" Text="Registration"></asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource2" Text="Stamp"></asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource3" Text="Adjudication"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                                </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblAmountIns" runat="server" meta:resourcekey="lblAmountIns" Text="Amount"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAmountIns" MaxLength="6" runat="server" meta:resourcekey="txtAmountIns"
                                    Text='<%# Bind("Amount") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                                <asp:RequiredFieldValidator ID="ReqfldtxtAmountIns" runat="server" ControlToValidate="txtAmountIns"
                                    ErrorMessage="Amount Can't be Blank" meta:resourcekey="ReqfldtxtAmountInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexptxtAmountIns" runat="server" ControlToValidate="txtAmountIns"
                                    ErrorMessage="Enter Valid Amount" ValidationExpression="<%$ Resources:ValidationRegx, Currency %>" meta:resourcekey="regexptxtAmountInsResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionIns" runat="server" meta:resourcekey="lblDescriptionIns"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDescriptionIns" TextMode="MultiLine" MaxLength="50" runat="server"
                                    meta:resourcekey="txtDescriptionIns" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDescriptionIns" runat="server" ControlToValidate="txtDescriptionIns"
                                    ErrorMessage="Description Can't be Blank" meta:resourcekey="ReqfldtxtDescriptionInsResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                            </td>
                            <td class="textColumn" align="right" style="width: 25%">
                                <asp:Button ID="btnSave" runat="server" Text="Save" CommandName="Insert" meta:resourcekey="btnSaveResource1" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="False"
                                    OnClick="btnCancel_Click" meta:resourcekey="btnCancelResource1" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblFeeMasterHeadingsUpd" runat="server" meta:resourcekey="lblFeeMasterHeadingsUpd"
                                    SkinID="SubHeading" Text="Fee Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameUpd" runat="server" meta:resourcekey="lblNameUpd" Text="Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameUpd" MaxLength="25" runat="server" meta:resourcekey="txtNameUpd"
                                    Text='<%# Bind("Name") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqFldName" runat="server" ControlToValidate="txtNameUpd"
                                    ErrorMessage="Name Can't be Blank" meta:resourcekey="ReqFldNameResource2">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblFeeTypeUpd" runat="server" meta:resourcekey="lblFeeTypeUpd" Text="Fee Type"></asp:Label>
                            </td>
                           <td class="textColumn" style="width: 25%">
                                <asp:DropDownList ID="ddlFeeTypeUpd" runat="server" Width="165px" SelectedValue='<%# Bind("FeeType") %>' meta:resourcekey="ddlFeeTypeUpdResource1">
                                    <asp:ListItem meta:resourcekey="ListItemResource4" Selected="True">Registration</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource5">Stamp</asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource6">Adjudication</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                                </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblAmountUpd" runat="server" meta:resourcekey="lblAmountUpd" Text="Amount"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAmountUpd" MaxLength="6" runat="server" meta:resourcekey="txtAmountUpd"
                                    Text='<%# Bind("Amount", "{0:F}") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                                <asp:RequiredFieldValidator ID="ReqfldtxtAmountUpd" runat="server" ControlToValidate="txtAmountUpd"
                                    ErrorMessage="Amount Can't be Blank" meta:resourcekey="ReqfldtxtAmountUpdResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexptxtAmountUpd" runat="server" ControlToValidate="txtAmountUpd"
                                    ErrorMessage="Enter Valid Amount" ValidationExpression="<%$ Resources:ValidationRegx, Currency %>" meta:resourcekey="regexptxtAmountUpdResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionUpd" runat="server" meta:resourcekey="lblDescriptionUpd"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDescriptionUpd" TextMode="MultiLine" MaxLength="50" runat="server"
                                    meta:resourcekey="txtDescriptionUpd" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtDescriptionUpd" runat="server" ControlToValidate="txtDescriptionUpd"
                                    ErrorMessage="Description Can't be Blank" meta:resourcekey="ReqfldtxtDescriptionUpdResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                            </td>
                            <td class="textColumn">
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" meta:resourcekey="btnUpdateResource1" />
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" OnClick="btnCancel_Click1" meta:resourcekey="btnCancelResource2" />
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView><br />
    <asp:ObjectDataSource ID="odsFeeMaster" runat="server" SelectMethod="GetFees" TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest"
        DeleteMethod="DeleteFeeMaster"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsFeeMasterById" runat="server" InsertMethod="AddNewFeeMaster"
        SelectMethod="GetFeeDetailsById" TypeName="IGRSS.BusinessLogicLayer.AdjudicationRequest"
        UpdateMethod="UpdateFeeMaster" OnInserting="odsFeeMasterById_Inserting" OnUpdating="odsFeeMasterById_Updating"
        OnInserted="odsFeeMasterById_Inserted" OnUpdated="odsFeeMasterById_Updated">
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="FeeId" Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GvFeeMaster" Name="FeeId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <br />
</asp:Content>
