<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="OfficeMaster.aspx.cs" Inherits="Central_Administration_Console_Offices_OfficeMaster"
    Title="Office Master" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="MvOfficeMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table width="100%">
                <tr>
                    <td>
                        <asp:GridView ID="GvOfficeMaster" runat="server" AutoGenerateColumns="False" DataSourceID="odsOfficeMasterInGrid"
                            DataKeyNames="OfficeId" 
                            OnSelectedIndexChanged="GvOfficeMaster_SelectedIndexChanged" 
                            meta:resourcekey="GvOfficeMasterResource1" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="OfficeName" HeaderText="Office Name" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="Description" HeaderText="Description" meta:resourcekey="BoundFieldResource2" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="BtnAddNew" runat="server" Text="Add New" OnClick="BtnAddNew_Click" meta:resourcekey="BtnAddNewResource1" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:FormView ID="FvOfficeMaster" runat="server" DataKeyNames="OfficeId" DefaultMode="Insert"
                DataSourceID="odsOfficeMaster" OnItemInserting="FvOfficeMaster_ItemInserting"
                OnItemUpdating="FvOfficeMaster_ItemUpdating" meta:resourcekey="FvOfficeMasterResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblFileDetailsHeaderIns" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
                                    SkinID="SubHeading" Text="Create Office"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblOfficeNameIns" runat="server" meta:resourcekey="lblOfficeNameIns"
                                    Text="Office Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtOfficeNameIns" runat="server" meta:resourcekey="txtOfficeNameIns"
                                    Text='<%# Bind("OfficeName") %>' MaxLength="50"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldTxtOfficeName" runat="server" ControlToValidate="txtOfficeNameIns"
                                    ErrorMessage="Office Name Can't be blank" meta:resourcekey="ReqfldTxtOfficeNameResource1">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDistrictCodeIns" runat="server" meta:resourcekey="lblDistrictCodeIns"
                                    Text="District"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDistrictCodeIns" runat="server" DataSourceID="odsDistrictMaster"
                                    DataTextField="distname" DataValueField="distcd" SelectedValue='<%# Bind("DistrictCode") %>'
                                    Width="180px" meta:resourcekey="ddlDistrictCodeInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="height: 24px">
                                <asp:Label ID="lblTalukaCodeIns" runat="server" meta:resourcekey="lblTalukaCodeIns"
                                    Text="Taluka"></asp:Label>
                            </td>
                            <td class="textColumn" style="height: 24px">
                                <asp:DropDownList ID="ddltalukanameIns" runat="server" DataSourceID="odsTalukaMaster"
                                    DataTextField="talukaname" DataValueField="talcd" SelectedValue='<%# Bind("TalukaCode") %>'
                                    Width="180px" meta:resourcekey="ddltalukanameInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn" style="height: 24px">
                            </td>
                            <td class="labelColumn" style="height: 24px">
                                <asp:Label ID="lblVillageCodeIns" runat="server" meta:resourcekey="lblVillageCodeIns"
                                    Text="Village"></asp:Label>
                            </td>
                            <td class="textColumn" style="height: 24px">
                                <asp:DropDownList ID="ddlVillageCodeIns" runat="server" DataSourceID="odsVillageMaster"
                                    DataTextField="villname" DataValueField="villcd" SelectedValue='<%# Bind("VillageCode") %>'
                                    Width="180px" meta:resourcekey="ddlVillageCodeInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn" style="height: 24px">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblEmailIdIns" runat="server" meta:resourcekey="lblEmailIdIns" Text="Email Id"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtEmailIdIns" runat="server" meta:resourcekey="txtEmailIdIns" Text='<%# Bind("EmailID") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RegularExpressionValidator ID="RegEmail" runat="server" ControlToValidate="txtEmailIdIns"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Email %>" meta:resourcekey="RegComplainNoResource1"
                                    ErrorMessage="Please Enter Valid Email">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblPhoneNoIns" runat="server" meta:resourcekey="lblPhoneNoIns" Text="PhoneNo"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPhoneNoIns" runat="server" MaxLength="13" meta:resourcekey="txtPhoneNoIns" Text='<%# Bind("PhoneNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RegularExpressionValidator ID="regPhoneNoIns" runat="server" ControlToValidate="txtPhoneNoIns"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Numeric %>" meta:resourcekey="regPhoneNoIns"
                                    ErrorMessage="Phone No should'nt be more than 13 digit">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceiptNumberIns" runat="server" meta:resourcekey="lblReceiptNumberIns"
                                    Text="Description"></asp:Label></td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDescriptionIns" TextMode="MultiLine" runat="server" meta:resourcekey="txtDescriptionIns"
                                    Text='<%# Bind("Description") %>'></asp:TextBox></td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblAddressIns" runat="server" meta:resourcekey="lblAddressIns" Text="Address"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtAddressIns" runat="server" TextMode="MultiLine" meta:resourcekey="txtAddressIns"
                                    Text='<%# Bind("Address") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" align="right">
                                <asp:Button ID="btnSave" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="btnSaveResource1" />
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel" OnClick="btnCancel_Click" meta:resourcekey="btnCancelResource1" />
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblFileDetailsHeaderUpd" runat="server" meta:resourcekey="lblFileDetailsHeaderUpd"
                                    SkinID="SubHeading" Text="Update Office"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblOfficeNameUpd" runat="server" meta:resourcekey="lblOfficeNameUpd"
                                    Text="Office Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtOfficeNameUpd" runat="server" meta:resourcekey="txtOfficeNameUpd"
                                    Text='<%# Bind("OfficeName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldTxtOfficeName" runat="server" ControlToValidate="txtOfficeNameUpd"
                                    ErrorMessage="Office Name Can't be blank" meta:resourcekey="ReqfldTxtOfficeNameResource2">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDistrictCodeUpd" runat="server" meta:resourcekey="lblDistrictCodeUpd"
                                    Text="District"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDistrictCodeUpd" runat="server" DataSourceID="odsDistrictMaster"
                                    DataTextField="distname" DataValueField="distcd" SelectedValue='<%# Bind("DistrictCode") %>'
                                    Width="180px" meta:resourcekey="ddlDistrictCodeUpdResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblTalukaCodeUpd" runat="server" meta:resourcekey="lblTalukaCodeUpd"
                                    Text="Taluka"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddltalukanameUpd" runat="server" DataSourceID="odsTalukaMaster"
                                    DataTextField="talukaname" DataValueField="talcd" SelectedValue='<%# Bind("TalukaCode") %>'
                                    Width="180px" meta:resourcekey="ddltalukanameUpdResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblVillageCodeUpd" runat="server" meta:resourcekey="lblVillageCodeUpd"
                                    Text="Village"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlVillageCodeUpd" runat="server" DataSourceID="odsVillageMaster"
                                    DataTextField="villname" DataValueField="villcd" SelectedValue='<%# Bind("VillageCode") %>'
                                    Width="180px" meta:resourcekey="ddlVillageCodeUpdResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblEmailIdUpd" runat="server" meta:resourcekey="lblEmailIdUpd" Text="Email Id"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtEmailIdUpd" runat="server" meta:resourcekey="txtEmailIdUpd" Text='<%# Bind("EmailID") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RegularExpressionValidator ID="RegEmail" runat="server" ControlToValidate="txtEmailIdUpd"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Email %>" meta:resourcekey="RegComplainNoResource1"
                                    ErrorMessage="Please Enter Valid Email">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblPhoneNoUpd" runat="server" meta:resourcekey="lblPhoneNoUpd" Text="PhoneNo"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPhoneNoUpd" MaxLength="13" runat="server" meta:resourcekey="txtPhoneNoUpd" Text='<%# Bind("PhoneNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RegularExpressionValidator ID="regPhoneNoUpd" runat="server" ControlToValidate="txtPhoneNoUpd"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Numeric %>" meta:resourcekey="regPhoneNoUpd"
                                    ErrorMessage="Phone No should'nt be more than 13 digit">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceiptNumberUpd" runat="server" meta:resourcekey="lblReceiptNumberUpd"
                                    Text="Description"></asp:Label></td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDescriptionUpd" TextMode="MultiLine" runat="server" meta:resourcekey="txtDescriptionUpd"
                                    Text='<%# Bind("Description") %>'></asp:TextBox></td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblAddressUpd" runat="server" meta:resourcekey="lblAddressUpd" Text="Address"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtAddressUpd" runat="server" TextMode="MultiLine" meta:resourcekey="txtAddressUpd"
                                    Text='<%# Bind("Address") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnSave" runat="server" CommandName="Update" Text="Update" meta:resourcekey="btnSaveResource2" />
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
    <asp:ObjectDataSource ID="odsOfficeMaster" runat="server" InsertMethod="AddNewOfficeDetails"
        SelectMethod="GetOfficeDetailsById" TypeName="IGRSS.BusinessLogicLayer.Administration.OfficeManagementMaster"
        UpdateMethod="UpdateOfficeDetails" OnInserting="odsOfficeMaster_Inserting" OnUpdating="odsOfficeMaster_Updating" OnInserted="odsOfficeMaster_Inserted" OnUpdated="odsOfficeMaster_Updated">
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="OfficeId" Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GvOfficeMaster" Name="OfficeId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsOfficeTypeMaster" runat="server" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter"
        InsertMethod="AddNewOfficeDetails" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetOfficeDetailsById" TypeName="IGRSS.BusinessLogicLayer.Administration.OfficeManagementMaster"
        UpdateMethod="UpdateOfficeDetails">
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="OfficeId" Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GvOfficeMaster" Name="OfficeId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <br />
    <asp:ObjectDataSource ID="odsDistrictMaster" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDistirctMasterDetails" TypeName="IGRSS.BusinessLogicLayer.Jantri">
    </asp:ObjectDataSource>
    <br />
    <br />
    <asp:ObjectDataSource ID="odsTalukaMaster" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetTalukaMasterDetails" TypeName="IGRSS.BusinessLogicLayer.Jantri">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsVillageMaster" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetVillageMasterDetails" TypeName="IGRSS.BusinessLogicLayer.Jantri">
    </asp:ObjectDataSource>
    <br />
    <br />
    <br />
    <asp:ObjectDataSource ID="odsOfficeMasterInGrid" runat="server" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter"
        InsertMethod="AddNewOfficeDetails" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetOfficesDetails" TypeName="IGRSS.BusinessLogicLayer.Administration.OfficeManagementMaster"
        UpdateMethod="UpdateOfficeDetails">
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="OfficeId" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <br />
    <br />
</asp:Content>
