<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="ItemMaster.aspx.cs" Inherits="Central_Administration_Console_ItemMaster"
    Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvItemMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewItemMaster" runat="server">
            <table width="100%">
                <tr>
                    <td style="width: 751px">
                        <asp:GridView ID="GvItemMaster" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID"
                            DataSourceID="odsItemMasterDetails" 
                            OnSelectedIndexChanged="GvItemMaster_SelectedIndexChanged" 
                            meta:resourcekey="GvItemMasterResource1" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" meta:resourcekey="BoundFieldResource2" />
                                <asp:CommandField ShowSelectButton="True" 
                                    meta:resourcekey="CommandFieldResource1" Visible="False" />
                                <asp:CommandField ShowDeleteButton="True" 
                                    meta:resourcekey="CommandFieldResource2" Visible="False" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="height: 26px">
                        <asp:LinkButton ID="btnNew" runat="server" Text="Add New" 
                            OnClick="btnNew_Click" meta:resourcekey="btnNewResource1" 
                            CssClass="standardButton" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="ViewItemMasterdetails" runat="server">
            <asp:FormView ID="FvItemMaster" runat="server" DataSourceID="OdsItemMaster" DefaultMode="Insert"
                OnItemInserting="FvItemMaster_ItemInserting" OnItemUpdating="FvItemMaster_ItemUpdating" meta:resourcekey="FvItemMasterResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblItemMasterIns" runat="server" meta:resourcekey="lblItemMasterIns"
                                    SkinID="SubHeading" Text="Item Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameIns" runat="server" meta:resourcekey="lblNameIns" Text="Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameIns" runat="server" MaxLength="25" onkeypress="return AllowAlphabet(event)" meta:resourcekey="txtNameIns"
                                    Text='<%# Bind("Name") %>' Width="160px"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvNameIns" runat="server" ControlToValidate="txtNameIns"
                                    ErrorMessage="Please Enter Item Name" meta:resourcekey="rfvNameInsResource1">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblUomIDIns" runat="server" meta:resourcekey="lblUomIDIns" Text="Unit Of Management"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlUomIDIns" runat="server" DataSourceID="OdsUOMMaster" DataTextField="Name"
                                    DataValueField="UomID" SelectedValue='<%# Bind("UomID") %>' Width="165px" meta:resourcekey="ddlUomIDInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionIns" runat="server" meta:resourcekey="lblDescriptionIns"
                                    Text="Description "></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDescriptionIns" TextMode="MultiLine" MaxLength="50" runat="server"
                                    meta:resourcekey="txtDescriptionIns" Text='<%# Bind("Description") %>' 
                                    Height="60px"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvDescriptionIns" runat="server" ControlToValidate="txtDescriptionIns"
                                    ErrorMessage="Please Enter Description" meta:resourcekey="rfvDescriptionInsResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:LinkButton ID="btnItemMasterIns" runat="server" CommandName="Insert" 
                                    Text="Save" meta:resourcekey="btnItemMasterInsResource1" 
                                    CssClass="standardButton" />
                                <asp:LinkButton ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" OnClick="btnCancel_Click" 
                                    meta:resourcekey="btnCancelResource1" CssClass="standardButton" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblItemMasterUpd" runat="server" meta:resourcekey="lblItemMasterUpd"
                                    SkinID="SubHeading" Text="Item Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameUpd" runat="server" meta:resourcekey="lblNameUpd" Text="Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameUpd" runat="server" MaxLength="25" onkeypress="return AllowAlphabet(event)" meta:resourcekey="txtNameUpd"
                                    Text='<%# Bind("Name") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvNameUpd" runat="server" ControlToValidate="txtNameUpd"
                                    ErrorMessage="Please Enter Item Name" meta:resourcekey="rfvNameUpdResource1">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblUomIDUpd" runat="server" meta:resourcekey="lblUomIDUpd" Text="Unit Of Management"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlUomIDUpd" runat="server" DataSourceID="OdsUOMMaster" DataTextField="Name"
                                    DataValueField="UomID" SelectedValue='<%# Bind("UomID") %>' Width="165px" meta:resourcekey="ddlUomIDUpdResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionUpd" runat="server" meta:resourcekey="lblDescriptionUpd"
                                    Text="Description "></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDescriptionUpd" runat="server" MaxLength="50" TextMode="MultiLine"
                                    meta:resourcekey="txtDescriptionUpd" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnItemMasterUpd" runat="server" CommandName="Update" Text="Update" meta:resourcekey="btnItemMasterUpdResource1" />
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
                                <asp:Label ID="lblItemMasterItm" runat="server" meta:resourcekey="lblItemMasterItm"
                                    SkinID="SubHeading" Text="Item Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameItm" runat="server" meta:resourcekey="lblNameItm" Text="Item Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameItm" runat="server" meta:resourcekey="txtNameItm" Text='<%# Bind("Name") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionItm" runat="server" meta:resourcekey="lblDescriptionItm"
                                    Text="Item Description "></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDescriptionItm" runat="server" meta:resourcekey="txtDescriptionItm"
                                    Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblUomIDItm" runat="server" meta:resourcekey="lblUomIDItm" Text="Unit Of Management"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlUomIDItm" runat="server" DataSourceID="OdsUOMMaster" DataTextField="Name"
                                    DataValueField="UomID" SelectedValue='<%# Bind("UomID") %>' Width="165px" meta:resourcekey="ddlUomIDItmResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="OdsItemMaster" runat="server" InsertMethod="InsertItemMaster"
        OnInserting="OdsItemMaster_Inserting" OnUpdating="OdsItemMaster_Updating" SelectMethod="GetItemMasterTableDetailsByItemID"
        TypeName="IGRSS.BusinessLogicLayer.Purchase" UpdateMethod="UpdateItemMaster"
        OnInserted="OdsItemMaster_Inserted" OnUpdated="OdsItemMaster_Updated">
        <UpdateParameters>
            <asp:ControlParameter ControlID="GvItemMaster" Name="ItemID" PropertyName="SelectedValue"
                Type="Object" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="UomID" Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GvItemMaster" Name="ItemID" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="UomID" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="OdsUOMMaster" runat="server" InsertMethod="InsertVendorMaster"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetUOMMasterTableDetails"
        TypeName="IGRSS.BusinessLogicLayer.Purchase" UpdateMethod="UpdateVendorMaster">
        <UpdateParameters>
            <asp:Parameter Name="VendorID" Type="Object" />
            <asp:Parameter Name="VendorType" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="VendorName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="ContactPerson" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedAt" Type="DateTime" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="VendorID" Type="Object" />
            <asp:Parameter Name="VendorType" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="VendorName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="ContactPerson" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedAt" Type="DateTime" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsItemMasterDetails" runat="server" DeleteMethod="DeleteItemMaster"
        SelectMethod="GetItemMasterTableDetails" TypeName="IGRSS.BusinessLogicLayer.Purchase">
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="PurchaseRegDetails" Type="Object" />
            <asp:Parameter Name="PurchaseID" Type="Object" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="PurchaseRegDetails" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <br />
</asp:Content>
