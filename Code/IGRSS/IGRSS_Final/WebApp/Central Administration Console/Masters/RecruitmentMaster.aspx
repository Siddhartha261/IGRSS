<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="RecruitmentMaster.aspx.cs" Inherits="Central_Administration_Console_Masters_RecruitmentMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
<br />
<br />
<center>
<asp:Panel id="infoDiv" runat="server" Visible="false" CssClass="infoBar" >&nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
<hr /><br />
</center>
    <asp:MultiView ID="Multiview_RecruitmentMaster" runat="server" 
        ActiveViewIndex="0">
        <asp:View ID="ViewGrid" runat="server">
            <br />
            <h1 style="text-align: center">
                RECRUITMENT MASTER</h1>
            <table align="center">
                <tr>
                    <td>
                        <asp:GridView ID="GridView_RecruitmentMaster" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataKeyNames="SrNo" DataSourceID="ods_RecruitmentMaster" 
                            EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" ReadOnly="True"
                                    SortExpression="SrNo" Visible="False" />
                                <asp:BoundField DataField="Designation" HeaderText="Designation" 
                                    SortExpression="Designation" />
                                <asp:BoundField DataField="Recruitment_Type" HeaderText="Type Of Recruitment" 
                                    SortExpression="Recruitment_Type" />
                                <asp:BoundField DataField="Recruitment_Details" HeaderText="Recruitment Details" 
                                    SortExpression="Recruitment_Details" Visible="False" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
            <table align="center">
                <tr>
                    <td>
                        <asp:LinkButton ID="Button_new" runat="server" Text="New" OnClick="Button_new_Click"
                            CssClass="standardButton" AccessKey="n" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="Formview" runat="server">
            <h1 style="text-align: center">
                RECRUITMENT MASTER</h1>
            <center>
                <asp:FormView ID="FormView_RecruitmentMaster" runat="server" 
                    DataKeyNames="SrNo" DataSourceID="ods_RecruitmentMaster"
                    DefaultMode="Insert" EnableModelValidation="True" 
                    onitemcommand="FormView_RecruitmentMaster_ItemCommand">
                    <EditItemTemplate>
                                                <table align="center">
						<tr align="left"><td>Designation:</td>
						    <td align="left">
                                <asp:TextBox ID="DesignationTextBox" runat="server" 
                            Text='<%# Bind("Designation") %>' Width="240px" /></td>
						</tr>					
                        
                        <tr align="left"><td>Type Of Recruitment:</td>
						    <td align="left"><asp:TextBox ID="Recruitment_TypeTextBox" runat="server" 
                            Text='<%# Bind("Recruitment_Type") %>' Width="240px" /></td>
						</tr>                        
                        
                        <tr align="left"><td>Recruitment Details:</td>
						    <td><asp:TextBox ID="Recruitment_DetailsTextBox" runat="server" 
                            Text='<%# Bind("Recruitment_Details") %>' Height="60px" TextMode="MultiLine" 
                                    Width="300px" /></td>
						</tr>                       
                        
                        <tr><td colspan="2">
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" CssClass="standardButton" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" 
                                CssClass="standardButton" /></td>
						</tr>                        
						</table>	
                    </EditItemTemplate>
                    <InsertItemTemplate>
                                                <table align="center">
						<tr align="left"><td>Designation:</td>
						    <td align="left">
                                <asp:TextBox ID="DesignationTextBox" runat="server" 
                            Text='<%# Bind("Designation") %>' Width="240px" /></td>
						</tr>					
                        
                        <tr align="left"><td>Type Of Recruitment:</td>
						    <td align="left"><asp:TextBox ID="Recruitment_TypeTextBox" runat="server" 
                            Text='<%# Bind("Recruitment_Type") %>' Width="240px" /></td>
						</tr>                        
                        
                        <tr align="left"><td>Recruitment Details:</td>
						    <td><asp:TextBox ID="Recruitment_DetailsTextBox" runat="server" 
                            Text='<%# Bind("Recruitment_Details") %>' Height="60px" TextMode="MultiLine" 
                                    Width="300px" /></td>
						</tr>                       
                        
                        <tr><td colspan="2">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Save" CssClass="standardButton" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" 
                                CssClass="standardButton" /></td>
						</tr>                        
						</table>	
                    </InsertItemTemplate>
                    <ItemTemplate>
                        SrNo:
                        <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
                        <br />
                        Designation:
                        <asp:Label ID="DesignationLabel" runat="server" 
                            Text='<%# Bind("Designation") %>' />
                        <br />
                        Recruitment_Type:
                        <asp:Label ID="Recruitment_TypeLabel" runat="server" 
                            Text='<%# Bind("Recruitment_Type") %>' />
                        <br />
                        Recruitment_Details:
                        <asp:Label ID="Recruitment_DetailsLabel" runat="server" 
                            Text='<%# Bind("Recruitment_Details") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New" />
                    </ItemTemplate>
                </asp:FormView>
            </center>
            <asp:ObjectDataSource ID="ods_RecruitmentMaster" runat="server" SelectMethod="GetData"
                TypeName="IGRSS.DataAccessLayer.Recruitment_MasterTableAdapters.Recruitment_MasterTableAdapter"
                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" 
                OldValuesParameterFormatString="original_{0}">
                <DeleteParameters>
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_Designation" Type="String" />
                    <asp:Parameter Name="Original_Recruitment_Type" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Designation" Type="String" />
                    <asp:Parameter Name="Recruitment_Type" Type="String" />
                    <asp:Parameter Name="Recruitment_Details" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Designation" Type="String" />
                    <asp:Parameter Name="Recruitment_Type" Type="String" />
                    <asp:Parameter Name="Recruitment_Details" Type="String" />
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_Designation" Type="String" />
                    <asp:Parameter Name="Original_Recruitment_Type" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>

