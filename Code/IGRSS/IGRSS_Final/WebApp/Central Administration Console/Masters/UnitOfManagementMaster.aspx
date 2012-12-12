<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="UnitOfManagementMaster.aspx.cs" Inherits="Central_Administration_Console_UnitOfManagementMaster"
    Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvUOMMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewUOMMasterDetails" runat="server">
            <table width="100%">
                <tr>
                    <td style="width: 749px">
                        <asp:GridView ID="GvItemMaster" runat="server" AutoGenerateColumns="False" DataKeyNames="UomID"
                            DataSourceID="odsUOMMasterDetails" 
                            OnSelectedIndexChanged="GvItemMaster_SelectedIndexChanged" 
                            meta:resourcekey="GvItemMasterResource1" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" meta:resourcekey="BoundFieldResource2" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 749px">
                        <asp:LinkButton ID="btnNew" runat="server" Text="Add New" OnClick="btnNew_Click" 
                            meta:resourcekey="btnNewResource1" CssClass="standardButton" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewUOMMaster" runat="server">
            <asp:FormView ID="FvUOMMaster" runat="server" DataSourceID="OdsUOMMaster" DefaultMode="Insert"
                OnItemInserting="FvUOMMaster_ItemInserting" OnItemUpdating="FvUOMMaster_ItemUpdating" meta:resourcekey="FvUOMMasterResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="4">
                                <asp:Label ID="lblFileDetailsHeaderIns" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
                                    SkinID="SubHeading" Text="UOM Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblUOMNameIns" runat="server" meta:resourcekey="lblUOMNameIns" Text="UOM Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameIns" runat="server" MaxLength="25" meta:resourcekey="txtReceiptNumberIns"
                                    Text='<%# Bind("Name") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="2">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNameIns"
                                    ErrorMessage="Please Enter UOM Name">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblUOMDescriptionIns" runat="server" meta:resourcekey="lblUOMDescriptionIns"
                                    Text="UOM Description"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="2">
                                <asp:TextBox ID="txtUOMDescriptionIns" runat="server" TextMode="MultiLine" MaxLength="125"
                                    meta:resourcekey="txtUOMDescriptionIns" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUOMDescriptionIns"
                                    ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                        <td align="right" colspan="4">
                            <asp:LinkButton ID="BtnUOMMasterSaveIns" runat="server" CommandName="Insert" 
                                Text="Save" meta:resourcekey="BtnUOMMasterSaveInsResource1" 
                                CssClass="standardButton" />
                            <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" CausesValidation="False"
                                Text="Cancel" OnClick="btnCancel_Click" 
                                meta:resourcekey="btnCancelResource1" CssClass="standardButton" />
                        </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="4">
                                <asp:Label ID="lblFileDetailsHeaderUpd" runat="server" meta:resourcekey="lblFileDetailsHeaderUpd"
                                    SkinID="SubHeading" Text="UOM Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblUOMNameUpd" runat="server" meta:resourcekey="lblUOMNameUpd" Text="UOM Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameUpd" runat="server" MaxLength="25" meta:resourcekey="txtReceiptNumberUpd"
                                    Text='<%# Bind("Name") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="2">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtNameUpd"
                                    ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblUOMDescriptionUpd" runat="server" meta:resourcekey="lblUOMDescriptionUpd"
                                    Text="UOM Description"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="2">
                                <asp:TextBox ID="txtUOMDescriptionUpd" runat="server" TextMode="MultiLine" MaxLength="50"
                                    meta:resourcekey="txtUOMDescriptionUpd" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtUOMDescriptionUpd"
                                    ErrorMessage="Please Enter UOM name">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="4">
                                <asp:LinkButton ID="BtnUOMMasterUpd" runat="server" CommandName="Update" 
                                    Text="Update" meta:resourcekey="BtnUOMMasterUpdResource1" 
                                    CssClass="standardButton" />
                                <asp:LinkButton ID="BtnCancel" runat="server" CommandName="Cancel" CausesValidation="False"
                                    Text="Cancel" OnClick="BtnCancel_Click" 
                                    meta:resourcekey="BtnCancelResource2" CssClass="standardButton" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="OdsUOMMaster" runat="server" InsertMethod="InsertUomMaster"
        SelectMethod="GetUOMMasterByUOMID" TypeName="IGRSS.BusinessLogicLayer.Purchase"
        UpdateMethod="UpdateUOMMaster" OnUpdating="OdsUOMMaster_Updating1" OnInserted="OdsUOMMaster_Inserted"
        OnUpdated="OdsUOMMaster_Updated" OnInserting="OdsUOMMaster_Inserting1">
        <UpdateParameters>
            <asp:ControlParameter ControlID="GvItemMaster" Name="UomID" PropertyName="SelectedValue"
                Type="Object" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GvItemMaster" Name="UomID" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsUOMMasterDetails" runat="server" DeleteMethod="DeleteUomMaster"
        SelectMethod="GetUOMMasterTableDetails" TypeName="IGRSS.BusinessLogicLayer.Purchase">
    </asp:ObjectDataSource>
</asp:Content>
