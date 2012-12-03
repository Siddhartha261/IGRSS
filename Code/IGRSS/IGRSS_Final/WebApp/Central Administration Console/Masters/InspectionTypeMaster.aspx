<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="InspectionTypeMaster.aspx.cs" Inherits="Central_Administration_Console_InspectionTypeMaster"
    Title="Inspection Type Entry" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvInspectionTypeMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewInspectionTypeMaster" runat="server">
            <table width="100%">
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataKeyNames="InspectionTypeId" DataSourceID="odsInspectionDetails" 
                            OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
                            meta:resourcekey="GridView1Resource1" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" meta:resourcekey="BoundFieldResource2" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="Button1" runat="server" Text="Add New" OnClick="Button1_Click" meta:resourcekey="Button1Resource1" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewInspectionMaster" runat="server">
            <asp:FormView ID="FvInspectionTypeMaster" runat="server" DataSourceID="odsInspectionDetails"
                DefaultMode="Insert" 
                OnItemInserting="FvInspectionTypeMaster_ItemInserting" 
                OnItemUpdating="FvInspectionTypeMaster_ItemUpdating" 
                meta:resourcekey="FvInspectionTypeMasterResource1" EnableModelValidation="True">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblInspectionTypeMasterIns" runat="server" meta:resourcekey="lblInspectionTypeMasterIns"
                                    SkinID="SubHeading" Text="Inspection Type Master"></asp:Label>
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
                            <td class="validationColumn" colspan="4">
                                <asp:RequiredFieldValidator ID="RfvNameIns" runat="server" ControlToValidate="txtNameIns"
                                    ErrorMessage="Please Enter Name" meta:resourcekey="RfvNameInsResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionIns" runat="server" meta:resourcekey="lblDescriptionIns"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDescriptionIns" TextMode="MultiLine" MaxLength="125" runat="server"
                                    meta:resourcekey="txtDescriptionIns" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDescriptionIns" runat="server" ControlToValidate="txtDescriptionIns"
                                    ErrorMessage="Please Enter Description" meta:resourcekey="RfvDescriptionInsResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnInsert" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="btnInsertResource1" />
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" OnClick="btnCancel_Click" meta:resourcekey="btnCancelResource1" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblUpdpectionTypeMasterUpd" runat="server" meta:resourcekey="lblUpdpectionTypeMasterUpd"
                                    SkinID="SubHeading" Text="Updpection Type Master"></asp:Label>
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
                            <td class="validationColumn" colspan="4">
                                <asp:RequiredFieldValidator ID="RfvNameUpd" runat="server" ControlToValidate="txtNameUpd"
                                    ErrorMessage="Please Enter Name" meta:resourcekey="RfvNameUpdResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionUpd" runat="server" meta:resourcekey="lblDescriptionUpd"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDescriptionUpd" TextMode="MultiLine" MaxLength="25" runat="server"
                                    meta:resourcekey="txtDescriptionUpd" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" meta:resourcekey="btnUpdateResource1" />
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" Text="Cancel" OnClick="btnCancel_Click1" meta:resourcekey="btnCancelResource2" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblItmpectionTypeMasterItm" runat="server" meta:resourcekey="lblItmpectionTypeMasterItm"
                                    SkinID="SubHeading" Text="Itmpection Type Master"></asp:Label>
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
    <asp:ObjectDataSource ID="odsInspectionDetails" runat="server" InsertMethod="AddNewInspectionAction"
        SelectMethod="GetAllInspectionTypeMaster" TypeName="IGRSS.BusinessLogicLayer.Inspection"
        UpdateMethod="UpdateInspectionItenary" DeleteMethod="DeleteInspectionTypeMaster">
        <UpdateParameters>
            <asp:Parameter Type="Object" Name="Parameter"></asp:Parameter>
            <asp:Parameter Type="Object" Name="ItenaryId"></asp:Parameter>
            <asp:Parameter Type="Object" Name="ScheduleId"></asp:Parameter>
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Type="Object" Name="Parameter"></asp:Parameter>
            <asp:Parameter Type="Object" Name="InspectionMemoId"></asp:Parameter>
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OdsInspectionTypeMaster" runat="server" InsertMethod="AddNewInspectionTypeMaster"
        OnInserting="OdsInspectionTypeMaster_Inserting" SelectMethod="GetInspectionTypeMasterByInspectionTypeId"
        TypeName="IGRSS.BusinessLogicLayer.Inspection" UpdateMethod="UpdateInspectionTypeMaster"
        OnUpdating="OdsInspectionTypeMaster_Updating" OnInserted="OdsInspectionTypeMaster_Inserted"
        OnUpdated="OdsInspectionTypeMaster_Updated">
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:ControlParameter ControlID="GridView1" Name="InspectionTypeId" PropertyName="SelectedValue"
                Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="InspectionTypeId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
