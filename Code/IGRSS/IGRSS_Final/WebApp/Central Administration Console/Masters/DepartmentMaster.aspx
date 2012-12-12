<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="DepartmentMaster.aspx.cs" Inherits="Central_Administration_Console_DepartmentMaster"
    Title="Department Master" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="MvDepartmentMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table width="100%">
                <tr>
                    <td>
                        <asp:GridView ID="GvDepartmentMaster" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="DepartmentId" DataSourceID="OdsDepartmentMaster" 
                            OnSelectedIndexChanged="GvDepartmentMaster_SelectedIndexChanged" 
                            meta:resourcekey="GvDepartmentMasterResource1" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="DepartmentId" HeaderText="DepartmentId" Visible="False" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="Name" HeaderText="Name" meta:resourcekey="BoundFieldResource2" />
                                <asp:BoundField DataField="Description" HeaderText="Description" meta:resourcekey="BoundFieldResource3" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="text-align: right">
                        <asp:LinkButton ID="btnNew" runat="server" Text="Add New" 
                            OnClick="btnNew_Click" meta:resourcekey="btnNewResource1" 
                            CssClass="standardButton" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewDepartmentMaster" runat="server">
            <asp:FormView ID="fvDepartmentMaster" runat="server" DataSourceID="odsDepartmentMasterById"
                DefaultMode="Insert" OnItemUpdating="fvDepartmentMaster_ItemUpdating" meta:resourcekey="fvDepartmentMasterResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="5">
                                <asp:Label ID="lblQualificationMasterIns" runat="server" meta:resourcekey="lblQualificationMasterIns"
                                    SkinID="SubHeading" Text="Department Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameIns" runat="server" meta:resourcekey="lblNameIns" Text="Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameIns" MaxLength="25" runat="server" onkeypress="return AllowAlphabet(event)" meta:resourcekey="txtNameIns"
                                    Text='<%# Bind("Name") %>' Width="160px"></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="3">
                                <asp:RequiredFieldValidator ID="RfvNameIns" runat="server" ControlToValidate="txtNameIns"
                                    ErrorMessage="Please Enter Name" meta:resourcekey="RfvNameInsResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionIns" runat="server" meta:resourcekey="lblDescriptionIns"
                                    Text="Description"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDescriptionIns" MaxLength="50" TextMode="MultiLine" runat="server"
                                    meta:resourcekey="txtDescriptionIns" Text='<%# Bind("Description") %>' 
                                    Height="60px" Width="160px"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDescriptionIns" runat="server" ControlToValidate="txtDescriptionIns"
                                    ErrorMessage="Please Enter Description" meta:resourcekey="RfvDescriptionInsResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            
                            <td align="center" colspan="3">
                                <asp:LinkButton ID="btnInsert" runat="server" CommandName="Insert" Text="Save" 
                                    meta:resourcekey="btnInsertResource1" CssClass="standardButton" />
                                <asp:LinkButton ID="btnCancelIns" CommandName="Cancel" CausesValidation="False" runat="server"
                                    Text="Cancel" OnClick="btnCancelIns_Click" 
                                    meta:resourcekey="btnCancelInsResource1" CssClass="standardButton" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblQualificationMasterUpd" runat="server" meta:resourcekey="lblQualificationMasterUpd"
                                    SkinID="SubHeading" Text="Department Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameUpd" runat="server" meta:resourcekey="lblNameUpd" Text="Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameUpd" MaxLength="25" runat="server" onkeypress="return AllowAlphabet(event)" meta:resourcekey="txtNameUpd"
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
                                <asp:TextBox ID="txtDescriptionUpd" MaxLength="50" TextMode="MultiLine" runat="server"
                                    meta:resourcekey="txtDescriptionUpd" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDescriptionUpd" runat="server" ControlToValidate="txtDescriptionUpd"
                                    ErrorMessage="Please Enter Description" meta:resourcekey="RfvDescriptionUpdResource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                            </td>
                            <td align="right">
                                <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" meta:resourcekey="btnUpdateResource1" />
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" OnClick="btnCancel_Click" meta:resourcekey="btnCancelResource1" />
                            </td>
                            <td>
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="OdsDepartmentMaster" runat="server" SelectMethod="GetDepartmentMasterDetails"
        TypeName="IGRSS.BusinessLogicLayer.Employee" DeleteMethod="DeleteDepartmentMaster"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsDepartmentMasterById" runat="server" DeleteMethod="DeleteEmployeeQualification"
        InsertMethod="InsertDepartmentMaster" SelectMethod="GetDepartmentMasterDetailsByDepartmentId"
        TypeName="IGRSS.BusinessLogicLayer.Employee" UpdateMethod="UpdateDepartmentMaster"
        OnUpdating="odsDepartmentMasterById_Updating" OnInserted="odsDepartmentMasterById_Inserted"
        OnUpdated="odsDepartmentMasterById_Updated">
        <UpdateParameters>
            <asp:ControlParameter ControlID="GvDepartmentMaster" Name="DepartmentId" PropertyName="SelectedValue"
                Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GvDepartmentMaster" Name="DepartmentId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="DepartmentId" Type="Object" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedAt" Type="DateTime" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <br />
</asp:Content>
