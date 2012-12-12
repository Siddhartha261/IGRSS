<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="RevenueStampMaster.aspx.cs" Inherits="Central_Administration_Console_RevenueStampMaster"
    Title="Untitled Page" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvRevenueStampMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewRevenueStampDetails" runat="server">
            <table width="100%">
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataKeyNames="RevenueStampId" DataSourceID="OdsRevenueStampMaster" 
                            OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" 
                            meta:resourcekey="GridView1Resource1" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="Description" HeaderText="Description" meta:resourcekey="BoundFieldResource2" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" DataFormatString="{0:F2}"
                                    HtmlEncode="False" meta:resourcekey="BoundFieldResource3" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:LinkButton ID="Button1" runat="server" OnClick="Button1_Click" 
                            Text="Add New " meta:resourcekey="Button1Resource1" CssClass="standardButton" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewRevenueStampMaster" runat="server">
            <asp:FormView ID="FVRevenueStampMaster" runat="server" DataKeyNames="RevenueStampId"
                DataSourceID="odsSelectedStampDetails" DefaultMode="Insert" meta:resourcekey="FVRevenueStampMasterResource1" EnableViewState="False" OnLoad="FVRevenueStampMaster_Load">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblRevenueStampHeaderIns" runat="server" meta:resourcekey="lblRevenueStampHeaderIns"
                                    SkinID="SubHeading" Text="Revenue Stamps Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameIns" runat="server" Text="Name" meta:resourcekey="lblNameInsResource1"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameIns" runat="server" MaxLength="25" onkeypress="return AllowAlphabet(event)"
                                    Text='<%# Bind("Name") %>' meta:resourcekey="txtNameInsResource1" Width="160px"></asp:TextBox></td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvNameIns" runat="server" ControlToValidate="txtNameIns"
                                    ErrorMessage="*" meta:resourcekey="RfvNameInsResource1"></asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAmount" runat="server" Text="Amount" meta:resourcekey="lblAmountResource1"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAmount" runat="server" MaxLength="12" numeric="integer"
                                    Text='<%# Bind("Amount") %>' meta:resourcekey="txtAmountResource1" 
                                    Width="160px"></asp:TextBox></td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="ReqfldtxtAmountIns" runat="server" ControlToValidate="txtAmount"
                                    ErrorMessage="*" meta:resourcekey="ReqfldtxtAmountInsResource1"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regexptxtAmountIns" runat="server" ControlToValidate="txtAmount"
                                    ErrorMessage="Enter Valid Amount" ValidationExpression="<%$ Resources:ValidationRegx, Currency %>" meta:resourcekey="regexptxtAmountInsResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionIns" runat="server" Text="Description" meta:resourcekey="lblDescriptionInsResource1"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDescriptionIns" runat="server" TextMode="MultiLine" MaxLength="125"
                                    Text='<%# Bind("Description") %>' 
                                    meta:resourcekey="txtDescriptionInsResource1" Height="60px" Width="160px"></asp:TextBox></td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDescriptionIns" runat="server" ControlToValidate="txtDescriptionIns"
                                    ErrorMessage="*" meta:resourcekey="RfvDescriptionInsResource1"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="3">
                                <asp:LinkButton ID="btnSaveIns" runat="server" CommandName="Insert" Text="Save" 
                                    meta:resourcekey="btnSaveInsResource1" CssClass="standardButton" />
                                <asp:LinkButton ID="btnCancelIns" runat="server" Text="Cancel" 
                                    CausesValidation="False" OnClick="btnCancelIns_Click" 
                                    meta:resourcekey="btnCancelInsResource1" CssClass="standardButton" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblRevenueStampHeaderUpd" runat="server" meta:resourcekey="lblRevenueStampHeaderUpd"
                                    SkinID="SubHeading" Text="Revenue Stamps Master"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblNameUpd" runat="server" Text="Name" meta:resourcekey="lblNameUpdResource1"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtNameUpd" runat="server" MaxLength="25" onkeypress="return AllowAlphabet(event)" Text='<%# Bind("Name") %>' meta:resourcekey="txtNameUpdResource1"></asp:TextBox></td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvNameIns" runat="server" ControlToValidate="txtNameUpd"
                                    ErrorMessage="Please Enter Name" meta:resourcekey="RfvNameInsResource2">*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAmount" runat="server" Text="Amount" meta:resourcekey="lblAmountResource2"></asp:Label></td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAmount" runat="server" MaxLength="12" numeric="integer" Text='<%# Bind("Amount", "{0:F}") %>' meta:resourcekey="txtAmountResource2"></asp:TextBox></td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvAmountIns" runat="server" ControlToValidate="txtAmount"
                                    ErrorMessage="Please Enter Amount" meta:resourcekey="RfvAmountInsResource1">*</asp:RequiredFieldValidator></td>
                            <asp:RegularExpressionValidator ID="regexptxtAmountIns" runat="server" ControlToValidate="txtAmount"
                                ErrorMessage="Enter Valid Amount" ValidationExpression="<%$ Resources:ValidationRegx, Currency %>" meta:resourcekey="regexptxtAmountInsResource2">*</asp:RegularExpressionValidator></tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionUpd" runat="server" Text="Description" meta:resourcekey="lblDescriptionUpdResource1"></asp:Label></td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtDescriptionUpd" runat="server" TextMode="MultiLine" MaxLength="125"
                                    Text='<%# Bind("Description") %>' meta:resourcekey="txtDescriptionUpdResource1"></asp:TextBox></td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RfvDescriptionIns" runat="server" ControlToValidate="txtDescriptionUpd"
                                    ErrorMessage="Please Enter Description" meta:resourcekey="RfvDescriptionInsResource2">*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" colspan="6">
                                <asp:Button ID="btnSaveUpd" runat="server" CommandName="Update" Text="Update" meta:resourcekey="btnSaveUpdResource1" />
                                <asp:Button ID="btnCancelUpd" runat="server" Text="Cancel" CausesValidation="False" OnClick="btnCancelUpd_Click" meta:resourcekey="btnCancelUpdResource1" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="odsSelectedStampDetails" runat="server" InsertMethod="NewRevenueStampMaster"
        SelectMethod="GetRevenueStampDetailsById" TypeName="IGRSS.BusinessLogicLayer.RevenueStampMaster"
        UpdateMethod="UpdateRevenueStampMaster" OnInserted="odsSelectedStampDetails_Inserted"
        OnUpdated="odsSelectedStampDetails_Updated">
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Amount" Type="Decimal" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="RevenueStampId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Amount" Type="Decimal" />
            <asp:Parameter Name="RevenueStampId" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OdsRevenueStampMaster" runat="server" SelectMethod="GetrevenueStampMasterDetails"
        TypeName="IGRSS.BusinessLogicLayer.RevenueStampMaster" DeleteMethod="DeleteRevenueStampMaster"
        InsertMethod="NewRevenueStampMaster">
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Amount" Type="Decimal" />
        </InsertParameters>
    </asp:ObjectDataSource>
</asp:Content>
