<%@ page language="C#" masterpagefile="~/IGRSS_Default.master" autoeventwireup="true" inherits="Central_Administration_Console_VendorMaster, App_Web_qawyqul4" title="Vendor Maaster" culture="auto" uiculture="auto" meta:resourcekey="PageResource1" stylesheettheme="IGRSS_Skin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="MvVendorMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <table width="100%">
                <tr>
                    <td>
                        <asp:GridView ID="GvDepartmentMaster" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="VendorID" DataSourceID="odsVendorMasterById" OnSelectedIndexChanged="GvDepartmentMaster_SelectedIndexChanged" meta:resourcekey="GvDepartmentMasterResource1">
                            <Columns>
                                <asp:BoundField DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="VendorName" HeaderText="VendorName" SortExpression="VendorName" meta:resourcekey="BoundFieldResource2" />
                                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" meta:resourcekey="BoundFieldResource3" />
                                <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
                                <asp:CommandField ShowDeleteButton="True" meta:resourcekey="CommandFieldResource2" />
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
        <asp:View ID="viewVendorMaster" runat="server">
            <asp:FormView ID="FvvendorMaster" runat="server" DataSourceID="OdsVendorMaster" DefaultMode="Insert"
                OnItemInserting="FvvendorMaster_ItemInserting" meta:resourcekey="FvvendorMasterResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblFileDetailsHeaderIns" runat="server" meta:resourcekey="lblFileDetailsHeaderIns"
                                    SkinID="SubHeading" Text="Vendor Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label1" runat="server" meta:resourcekey="lblReceiptNumberIns" Text="Vendor Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtVendorNameIns" runat="server" MaxLength="50" meta:resourcekey="txtVendorNameIns"
                                    Text='<%# Bind("VendorName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtVendorNameIns"
                                    ErrorMessage="VendorName can't be Blank" meta:resourcekey="RequiredFieldValidator1Resource1">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceiptNumberIns" runat="server" meta:resourcekey="lblReceiptNumberIns"
                                    Text="Vendor Type"></asp:Label>
                            </td>
                            <td class="textColumn">
                                       
                          <asp:DropDownList ID="ddlVendorTypeIns" runat="server" SelectedValue='<%# Bind("VendorType") %>' meta:resourcekey="ddlVendorTypeInsResource1">
                               <asp:ListItem meta:resourcekey="ListItemResource1" Selected="True">Supplier</asp:ListItem>
                           </asp:DropDownList> </td>
                           <td class="validationColumn">
                                </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblAdjudicationTotalFeesIns" runat="server" meta:resourcekey="lblAdjudicationTotalFeesIns"
                                    Text="Company Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAdjudicationTotalFeesIns" runat="server" MaxLength="50" meta:resourcekey="txtAdjudicationTotalFeesIns"
                                    Text='<%# Bind("CompanyName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                                <asp:RequiredFieldValidator ID="Reqfld2" runat="server" ControlToValidate="txtAdjudicationTotalFeesIns"
                                    ErrorMessage="Company Name can't be Blank" meta:resourcekey="Reqfld2Resource1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblAddressIns" runat="server" meta:resourcekey="lblAddressIns" Text="Address"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtAddressIns" runat="server" TextMode="MultiLine" MaxLength="100"
                                    meta:resourcekey="txtAddressIns" Text='<%# Bind("Address") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblPhoneIns" runat="server" meta:resourcekey="lblPhoneIns" Text="Phone"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPhoneIns" runat="server" MaxLength="13" meta:resourcekey="txtPhoneIns"
                                    Text='<%# Bind("Phone") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ValidateText" ControlToValidate="txtPhoneIns" runat="server"
                                    ErrorMessage="Please Enter Phone No" meta:resourcekey="ValidateTextResource1">
							*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="pssksks" runat="server" ControlToValidate="txtPhoneIns"
                                    ValidationExpression="^\d{10}$" ErrorMessage="Phone No Should be Numeric and 10 Digit"
                                    meta:resourcekey="pssksksResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblContactPersonIns" runat="server" meta:resourcekey="lblContactPersonIns"
                                    Text="ContactPerson"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtContactPersonIns" runat="server" MaxLength="50" meta:resourcekey="txtContactPersonIns"
                                    Text='<%# Bind("ContactPerson") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" align="right">
                                <asp:Button ID="btnVendorMasterIns" runat="server" CommandName="Insert" Text="Save" meta:resourcekey="btnVendorMasterInsResource1" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="False" meta:resourcekey="btnCancelResource1" OnClick="btnCancel_Click" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblFileDetailsHeaderUpd" runat="server" meta:resourcekey="lblFileDetailsHeaderUpd"
                                    SkinID="SubHeading" Text="Vendor Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label1" runat="server" meta:resourcekey="lblReceiptNumberUpd" Text="VendorName"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtVendorNameUpd" runat="server" T MaxLength="25" meta:resourcekey="txtVendorNameUpd"
                                    Text='<%# Bind("VendorName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtVendorNameUpd"
                                    ErrorMessage="VendorName can't be Blank" meta:resourcekey="RequiredFieldValidator1Resource3">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceiptNumberUpd" runat="server" meta:resourcekey="lblReceiptNumberUpd"
                                    Text="VendorType"></asp:Label>
                            </td>
                            <td class="textColumn">
                                       
                          <asp:DropDownList ID="ddlVendorTypeUpd" runat="server" SelectedValue='<%# Bind("VendorType") %>' meta:resourcekey="ddlVendorTypeUpdResource1">
                               <asp:ListItem  Selected="True">S</asp:ListItem>
                           </asp:DropDownList> </td>
                            <td class="validationColumn">
                                </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblAdjudicationTotalFeesUpd" runat="server" meta:resourcekey="lblAdjudicationTotalFeesUpd"
                                    Text="CompanyName"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAdjudicationTotalFeesUpd" runat="server" MaxLength="50" meta:resourcekey="txtAdjudicationTotalFeesUpd"
                                    Text='<%# Bind("CompanyName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                                <asp:RequiredFieldValidator ID="Reqfld2" runat="server" ControlToValidate="txtAdjudicationTotalFeesUpd"
                                    ErrorMessage="Company Name can't be Blank" meta:resourcekey="Reqfld2Resource3">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblAddressUpd" runat="server" meta:resourcekey="lblAddressUpd" Text="Address"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtAddressUpd" runat="server" TextMode="MultiLine" MaxLength="150"
                                    meta:resourcekey="txtAddressUpd" Text='<%# Bind("Address") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblPhoneUpd" runat="server" meta:resourcekey="lblPhoneUpd" Text="Phone"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPhoneUpd" runat="server" MaxLength="13" meta:resourcekey="txtPhoneUpd"
                                    Text='<%# Bind("Phone") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ValidateTextdd" ControlToValidate="txtPhoneUpd" runat="server"
                                    ErrorMessage="Please Enter Phone No" meta:resourcekey="ValidateTextResource1">
							*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="pssksksdd" runat="server" ControlToValidate="txtPhoneUpd"
                                    ValidationExpression="^\d{10}$" ErrorMessage="Phone No Should be Numeric and 10 Digit"
                                    meta:resourcekey="pssksksResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblContactPersonUpd" runat="server" meta:resourcekey="lblContactPersonUpd"
                                    Text="ContactPerson"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtContactPersonUpd" runat="server" meta:resourcekey="txtContactPersonUpd"
                                    Text='<%# Bind("ContactPerson") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" align="right">
                                <asp:Button ID="btnVendorMasterUpd" runat="server" CommandName="Update" Text="Update" meta:resourcekey="btnVendorMasterUpdResource1" />
                                <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="False" meta:resourcekey="btnCancelResource2" OnClick="btnCancel_Click1" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblFileDetailsHeaderItm" runat="server" meta:resourcekey="lblFileDetailsHeaderItm"
                                    SkinID="SubHeading" Text="Vendor Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblReceiptNumberItm" runat="server" meta:resourcekey="lblReceiptNumberItm"
                                    Text="VendorType"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtReceiptNumberItm" runat="server" meta:resourcekey="txtReceiptNumberItm"
                                    Text='<%# Bind("VendorType") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtReceiptNumberItm" runat="server" ControlToValidate="txtReceiptNumberItm"
                                    ErrorMessage="VendorType can't be Blank" meta:resourcekey="ReqfldtxtReceiptNumberItmResource1">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAdjudicationTotalFeesItm" runat="server" meta:resourcekey="lblAdjudicationTotalFeesItm"
                                    Text="CompanyName"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAdjudicationTotalFeesItm" runat="server" meta:resourcekey="txtAdjudicationTotalFeesItm"
                                    Text='<%# Bind("CompanyName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="Reqfld2" runat="server" ControlToValidate="txtAdjudicationTotalFeesItm"
                                    ErrorMessage="Company Name can't be Blank" meta:resourcekey="Reqfld2Resource2">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label1" runat="server" meta:resourcekey="lblReceiptNumberItm" Text="VendorName"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtVendorNameItm" runat="server" meta:resourcekey="txtVendorNameItm"
                                    Text='<%# Bind("VendorName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtVendorNameItm"
                                    ErrorMessage="VendorName can't be Blank" meta:resourcekey="RequiredFieldValidator1Resource2">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAddressItm" runat="server" meta:resourcekey="lblAddressItm" Text="Address"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAddressItm" runat="server" meta:resourcekey="txtAddressItm" Text='<%# Bind("Address") %>'
                                    TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblPhoneItm" runat="server" meta:resourcekey="lblPhoneItm" Text="Phone"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtPhoneItm" runat="server" meta:resourcekey="txtPhoneItm" Text='<%# Bind("Phone") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblContactPersonItm" runat="server" meta:resourcekey="lblContactPersonItm"
                                    Text="ContactPerson"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtContactPersonItm" runat="server" meta:resourcekey="txtContactPersonItm"
                                    Text='<%# Bind("ContactPerson") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="OdsVendorMaster" runat="server" OnInserting="OdsVendorMaster_Inserting"
        SelectMethod="GetVendorMasterByVendorId" TypeName="IGRSS.BusinessLogicLayer.Purchase"
        UpdateMethod="UpdateVendorMaster" OnInserted="OdsVendorMaster_Inserted" OnUpdated="OdsVendorMaster_Updated"
        InsertMethod="InsertVendorMaster">
        <UpdateParameters>
            <asp:ControlParameter ControlID="GvDepartmentMaster" Name="VendorID" PropertyName="SelectedValue"
                Type="Object" />
            <asp:Parameter Name="VendorType" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="VendorName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="ContactPerson" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GvDepartmentMaster" Name="VendorID" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsVendorMasterById" runat="server" DeleteMethod="DeleteVendorMaster"
        SelectMethod="GetVendorMasterTableDetails" TypeName="IGRSS.BusinessLogicLayer.Purchase">
        <DeleteParameters>
            <asp:Parameter Name="VendorID" Type="Object" />
            <asp:Parameter Name="VendorType" Type="String" />
            <asp:Parameter Name="CompanyName" Type="String" />
            <asp:Parameter Name="VendorName" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="ContactPerson" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedAt" Type="DateTime" />
        </DeleteParameters>
    </asp:ObjectDataSource>
</asp:Content>
