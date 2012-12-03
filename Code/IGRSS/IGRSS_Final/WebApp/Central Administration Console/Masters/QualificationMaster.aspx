<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="QualificationMaster.aspx.cs" Inherits="Central_Administration_Console_QualificationMaster"
    Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvQualificationMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewQualificationMaster" runat="server">
            <table width="100%">
                <tr>
                    <td style="width: 751px">
                        <asp:GridView ID="GvFeeMaster" runat="server" AutoGenerateColumns="False" DataKeyNames="QualificationID"
                            DataSourceID="odsQualification" 
                            OnSelectedIndexChanged="GvFeeMaster_SelectedIndexChanged" 
                            meta:resourcekey="GvFeeMasterResource1" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" meta:resourcekey="BoundFieldResource2" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 751px">
                        <asp:Button ID="btnNew" runat="server" Text="Add New" OnClick="btnNew_Click" meta:resourcekey="btnNewResource1" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewMaster" runat="server">
            <asp:FormView ID="FvQualificationMaster" runat="server" DataSourceID="OdsQualificationMaster"
                DefaultMode="Insert" OnItemInserting="FvQualificationMaster_ItemInserting" OnItemUpdating="FvQualificationMaster_ItemUpdating" meta:resourcekey="FvQualificationMasterResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblQualificationMasterIns" runat="server" meta:resourcekey="lblQualificationMasterIns"
                                    SkinID="SubHeading" Text="Qualification Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameIns" runat="server" meta:resourcekey="lblNameIns" Text="Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameIns" runat="server" MaxLength="25" meta:resourcekey="txtNameIns"
                                    Text='<%# Bind("Name") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
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
                                </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnInsert" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="btnInsertResource1" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" CausesValidation="False"
                                    Text="Cancel" OnClick="btnCancel_Click" meta:resourcekey="btnCancelResource1" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblQualificationMasterUpd" runat="server" meta:resourcekey="lblQualificationMasterUpd"
                                    SkinID="SubHeading" Text="Qualification Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameUpd" runat="server" meta:resourcekey="lblNameUpd" Text="Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameUpd" runat="server" MaxLength="25" meta:resourcekey="txtNameUpd"
                                    Text='<%# Bind("Name") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionUpd" runat="server" meta:resourcekey="lblDescriptionUpd"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDescriptionUpd" runat="server" TextMode="MultiLine" MaxLength="50"
                                    meta:resourcekey="txtDescriptionUpd" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnUpdert" runat="server" CommandName="Update" Text="Save" meta:resourcekey="btnUpdertResource1" />
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" OnClick="btnCancel_Click1" meta:resourcekey="btnCancelResource2" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblQualificationMasterItm" runat="server" meta:resourcekey="lblQualificationMasterItm"
                                    SkinID="SubHeading" Text="Qualification Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameItm" runat="server" meta:resourcekey="lblNameItm" Text="Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameItm" runat="server" meta:resourcekey="txtNameItm" Text='<%# Bind("Name") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionItm" runat="server" meta:resourcekey="lblDescriptionItm"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDescriptionItm" runat="server" meta:resourcekey="txtDescriptionItm"
                                    Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="OdsQualificationMaster" runat="server" SelectMethod="GetQualificationMasterDetailsById"
        TypeName="IGRSS.BusinessLogicLayer.Employee" OnInserting="OdsQualificationMaster_Inserting"
        UpdateMethod="UpdateQualificationMaster" OnUpdating="OdsQualificationMaster_Updating"
        OnInserted="OdsQualificationMaster_Inserted" OnUpdated="OdsQualificationMaster_Updated"
        InsertMethod="InsertQualificationMaster">
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:ControlParameter ControlID="GvFeeMaster" Name="QualificationID" PropertyName="SelectedValue"
                Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GvFeeMaster" Name="QualificationID" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsQualification" runat="server" SelectMethod="GetQualificationMasterDetails"
        TypeName="IGRSS.BusinessLogicLayer.Employee" OnInserted="odsQualification_Inserted"
        DeleteMethod="DeleteQualificationMaster"></asp:ObjectDataSource>
</asp:Content>
