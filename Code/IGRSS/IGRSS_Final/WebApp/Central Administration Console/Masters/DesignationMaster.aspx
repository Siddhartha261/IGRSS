<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="DesignationMaster.aspx.cs" Inherits="Central_Administration_Console_DesignationMaster"
    Title="Designation Entry Details" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="MvDesignationMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="ViewDesignationGrid" runat="server">
            <table width="100%">
                <tr>
                    <td style="width: 750px">
                        <asp:GridView ID="GvDesignationGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="DesignationId"
                            DataSourceID="OdsDesignationMaster" OnSelectedIndexChanged="GvDesignationGrid_SelectedIndexChanged"
                            OnRowDeleted="GvDesignationGrid_RowDeleted" 
                            meta:resourcekey="GvDesignationGridResource1" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Designation" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="Description" HeaderText="Description" meta:resourcekey="BoundFieldResource2" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 750px; height: 26px">
                        <asp:LinkButton ID="btnNew" runat="server" Text="Add New" 
                            OnClick="btnNew_Click" meta:resourcekey="btnNewResource1" 
                            CssClass="standardButton" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View1" runat="server">
            <asp:FormView ID="FvDesignationMaster" runat="server" DataSourceID="OdsDesignationMasterById"
                DefaultMode="Insert" OnItemInserting="FvDesignationMaster_ItemInserting" OnItemUpdating="FvDesignationMaster_ItemUpdating"
                DataKeyNames="DesignationId" OnItemInserted="FvDesignationMaster_ItemInserted"
                OnItemUpdated="FvDesignationMaster_ItemUpdated" meta:resourcekey="FvDesignationMasterResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="5">
                                <asp:Label ID="lblDesignationMasterIns" runat="server" meta:resourcekey="lblDesignationMasterIns"
                                    SkinID="SubHeading" Text="Designation Master "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameIns" runat="server" meta:resourcekey="lblNameIns" Text="Designation"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameIns" runat="server" meta:resourcekey="txtNameIns" MaxLength="25" onkeypress="return AllowAlphabet(event)"
                                    Text='<%# Bind("Name") %>' Width="160px"></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="3">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtNameIns" ErrorMessage="*">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionIns" runat="server" meta:resourcekey="lblDescriptionIns"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDescriptionIns" runat="server" MaxLength="50" TextMode="MultiLine"
                                    meta:resourcekey="txtDescriptionIns" Text='<%# Bind("Description") %>' 
                                    Height="60px" Width="160px"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtDescriptionIns" ErrorMessage="*">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            
                            <td align="center" colspan="3">
                                <asp:LinkButton ID="btnSave" runat="server" CommandName="Insert" Text="Save" 
                                    meta:resourcekey="btnSaveResource1" CssClass="standardButton" />
                                <asp:LinkButton ID="btnCancelIns" runat="server" Text="Cancel" CausesValidation="False" OnClick="btnCancelIns_Click" meta:resourcekey="btnCancelInsResource1" CssClass="standardButton" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblDesignationMasterUpd" runat="server" meta:resourcekey="lblDesignationMasterUpd"
                                    SkinID="SubHeading" Text="Designation Master "></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameUpd" runat="server" meta:resourcekey="lblNameUpd" Text="Designation"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameUpd" MaxLength="25" runat="server" meta:resourcekey="txtNameUpd" onkeypress="return AllowAlphabet(event)"
                                    Text='<%# Bind("Name") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                                <asp:RequiredFieldValidator ID="RfvNameIns" runat="server" ControlToValidate="txtNameUpd"
                                    ErrorMessage="Please Enter Name" meta:resourcekey="RfvNameInsResource2">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionUpd" runat="server" meta:resourcekey="lblDescriptionUpd"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDescriptionUpd" runat="server" MaxLength="50" TextMode="MultiLine"
                                    meta:resourcekey="txtDescriptionUpd" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDescriptionIns" runat="server" ControlToValidate="txtDescriptionUpd"
                                    ErrorMessage="Please Enter Description" meta:resourcekey="RfvDescriptionInsResource2">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                            </td>
                            <td align="right">
                                <asp:Button ID="btnSave" runat="server" CommandName="Update" Text="Update" meta:resourcekey="btnSaveResource2" />
                                <asp:Button ID="btnCancelUpd" runat="server" CausesValidation="False" Text="Cancel" OnClick="btnCancelUpd_Click" meta:resourcekey="btnCancelUpdResource1" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="OdsDesignationMaster" runat="server" SelectMethod="GetDesignationMasterDetails"
        TypeName="IGRSS.BusinessLogicLayer.Employee" DeleteMethod="DeleteDesignationMaster">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OdsDesignationMasterById" runat="server" DeleteMethod="DeleteEmployeeQualification"
        InsertMethod="InsertDesignationMaster" OnUpdating="OdsDesignationMasterById_Updating"
        SelectMethod="GetDesignationMasterDetailsById" TypeName="IGRSS.BusinessLogicLayer.Employee"
        UpdateMethod="UpdateDesignationMaster" OnInserted="OdsDesignationMasterById_Inserted"
        OnUpdated="OdsDesignationMasterById_Updated">
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="DesignationID" Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GvDesignationGrid" Name="DesignationID" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="DesignationId" Type="Object" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedAt" Type="DateTime" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
