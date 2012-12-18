<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="DistrictMaster.aspx.cs" Inherits="Central_Administration_Console_Masters_DistrictMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
<br />
<br />
<center>
<asp:Panel id="infoDiv" runat="server" Visible="false" CssClass="infoBar" >&nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
<hr /><br />
</center>
    <asp:MultiView ID="Multiview_DistrictMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="ViewGrid" runat="server">
            <br />
            <h1 style="text-align: center">
                DISTRICT MASTER</h1>
            <table align="center">
                <tr>
                    <td>
                        <asp:GridView ID="GridView_DistrictMaster" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataKeyNames="SrNo" DataSourceID="ods_DistrictMaster" 
                            EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" ReadOnly="True"
                                    SortExpression="SrNo" Visible="False" />
                                <asp:BoundField DataField="District_ID" HeaderText="District No" 
                                    SortExpression="District_ID" />
                                <asp:BoundField DataField="District_Name" HeaderText="District Name" 
                                    SortExpression="District_Name" />
                                <asp:BoundField DataField="District_Location" HeaderText="District Location" 
                                    SortExpression="District_Location" />
                                <asp:BoundField DataField="District_Details" HeaderText="District Details" 
                                    SortExpression="District_Details" Visible="False" />
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
                DISTRICT MASTER</h1>
            <center>
                <asp:FormView ID="FormView_DistrictMaster" runat="server" DataKeyNames="SrNo" DataSourceID="ods_DistrictMaster"
                    DefaultMode="Insert" EnableModelValidation="True" 
                    onitemcommand="FormView_DistrictMaster_ItemCommand">
                    <EditItemTemplate>
                                         <table align="center">
					<tr align="left"><td>District No:</td>
					    <td align="left">
                            <asp:TextBox ID="District_IDTextBox" runat="server" 
                        Text='<%# Bind("District_ID") %>' Width="140px" /></td>
					</tr>					
                    
                    <tr align="left"><td>District Name:</td>
					    <td align="left">
                            <asp:TextBox ID="District_NameTextBox" runat="server" 
                        Text='<%# Bind("District_Name") %>' Width="240px" /></td>
					</tr>                   
                    
                    <tr align="left"><td>District Location:</td>
					    <td align="left">
                            <asp:TextBox ID="District_LocationTextBox" runat="server" 
                        Text='<%# Bind("District_Location") %>' Width="200px" /></td>
					</tr>                   
                    
                    <tr align="left"><td>District Details:</td>
					    <td><asp:TextBox ID="District_DetailsTextBox" runat="server" 
                        Text='<%# Bind("District_Details") %>' Height="60px" TextMode="MultiLine" 
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
					<tr align="left"><td>District No:</td>
					    <td align="left">
                            <asp:TextBox ID="District_IDTextBox" runat="server" 
                        Text='<%# Bind("District_ID") %>' Width="140px" /></td>
					</tr>					
                    
                    <tr align="left"><td>District Name:</td>
					    <td align="left">
                            <asp:TextBox ID="District_NameTextBox" runat="server" 
                        Text='<%# Bind("District_Name") %>' Width="240px" /></td>
					</tr>                   
                    
                    <tr align="left"><td>District Location:</td>
					    <td align="left">
                            <asp:TextBox ID="District_LocationTextBox" runat="server" 
                        Text='<%# Bind("District_Location") %>' Width="200px" /></td>
					</tr>                   
                    
                    <tr align="left"><td>District Details:</td>
					    <td><asp:TextBox ID="District_DetailsTextBox" runat="server" 
                        Text='<%# Bind("District_Details") %>' Height="60px" TextMode="MultiLine" 
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
                        District_ID:
                        <asp:Label ID="District_IDLabel" runat="server" 
                            Text='<%# Bind("District_ID") %>' />
                        <br />
                        District_Name:
                        <asp:Label ID="District_NameLabel" runat="server" 
                            Text='<%# Bind("District_Name") %>' />
                        <br />
                        District_Location:
                        <asp:Label ID="District_LocationLabel" runat="server" 
                            Text='<%# Bind("District_Location") %>' />
                        <br />
                        District_Details:
                        <asp:Label ID="District_DetailsLabel" runat="server" 
                            Text='<%# Bind("District_Details") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New" />
                    </ItemTemplate>
                </asp:FormView>
            </center>
            <asp:ObjectDataSource ID="ods_DistrictMaster" runat="server" SelectMethod="GetData"
                TypeName="IGRSS.DataAccessLayer.District_MasterTableAdapters.District_MasterTableAdapter"
                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" 
                OldValuesParameterFormatString="original_{0}">
                <DeleteParameters>
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_District_ID" Type="Int32" />
                    <asp:Parameter Name="Original_District_Name" Type="String" />
                    <asp:Parameter Name="Original_District_Location" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="District_ID" Type="Int32" />
                    <asp:Parameter Name="District_Name" Type="String" />
                    <asp:Parameter Name="District_Location" Type="String" />
                    <asp:Parameter Name="District_Details" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="District_ID" Type="Int32" />
                    <asp:Parameter Name="District_Name" Type="String" />
                    <asp:Parameter Name="District_Location" Type="String" />
                    <asp:Parameter Name="District_Details" Type="String" />
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_District_ID" Type="Int32" />
                    <asp:Parameter Name="Original_District_Name" Type="String" />
                    <asp:Parameter Name="Original_District_Location" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>

