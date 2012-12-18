<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="CasteMaster.aspx.cs" Inherits="Central_Administration_Console_Masters_CasteMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
<br />
<br />
<center>
<asp:Panel id="infoDiv" runat="server" Visible="false" CssClass="infoBar" >&nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
<hr /><br />
</center>
    <asp:MultiView ID="Multiview_CasteMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="ViewGrid" runat="server">
            <br />
            <h1 style="text-align: center">
                CASTE MASTER</h1>
            <table align="center">
                <tr>
                    <td>
                        <asp:GridView ID="GridView_CasteMaster" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataKeyNames="SrNo" DataSourceID="ods_CasteMaster" 
                            EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" ReadOnly="True"
                                    SortExpression="SrNo" Visible="False" />
                                <asp:BoundField DataField="Cast_ID" HeaderText="Cast No" 
                                    SortExpression="Cast_ID" />
                                <asp:BoundField DataField="Cast_Name" HeaderText="Cast Name" 
                                    SortExpression="Cast_Name" />
                                <asp:BoundField DataField="Description" HeaderText="Description" 
                                    SortExpression="Description" Visible="False" />
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
                CASTE MASTER</h1>
            <center>
                <asp:FormView ID="FormView_CasteMaster" runat="server" DataKeyNames="SrNo" DataSourceID="ods_CasteMaster"
                    DefaultMode="Insert" EnableModelValidation="True" 
                    onitemcommand="FormView_CasteMaster_ItemCommand">
                    <EditItemTemplate>
                                               <table align="center">
						<tr>
						    <td>Cast No:</td>
							<td align="left"><asp:TextBox ID="Cast_IDTextBox" runat="server" 
                                    Text='<%# Bind("Cast_ID") %>' Width="160px" /></td>
						</tr>					
                        
                        <tr><td>Cast Name:</td>
						    <td align="left"><asp:TextBox ID="Cast_NameTextBox" runat="server" 
                            Text='<%# Bind("Cast_Name") %>' Width="240px" /></td>
						</tr>                       
                        
                        <tr><td>Description:</td>
						    <td><asp:TextBox ID="DescriptionTextBox" runat="server" 
                            Text='<%# Bind("Description") %>' Height="60px" Width="300px" /></td>
						</tr>                       
                        
                        <tr><td colspan="2">
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" CssClass="standardButton" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" 
                                CssClass="standardButton" /></td></tr>                        
						</table>	
                    </EditItemTemplate>
                    <InsertItemTemplate>
                                                <table align="center">
						<tr>
						    <td>Cast No:</td>
							<td align="left"><asp:TextBox ID="Cast_IDTextBox" runat="server" 
                                    Text='<%# Bind("Cast_ID") %>' Width="160px" /></td>
						</tr>					
                        
                        <tr><td>Cast Name:</td>
						    <td align="left"><asp:TextBox ID="Cast_NameTextBox" runat="server" 
                            Text='<%# Bind("Cast_Name") %>' Width="240px" /></td>
						</tr>                       
                        
                        <tr><td>Description:</td>
						    <td><asp:TextBox ID="DescriptionTextBox" runat="server" 
                            Text='<%# Bind("Description") %>' Height="60px" TextMode="MultiLine" 
                                    Width="300px" /></td>
						</tr>                       
                        
                        <tr><td colspan="2">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Save" CssClass="standardButton" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" 
                                CssClass="standardButton" /></td></tr>                        
						</table>	
                    </InsertItemTemplate>
                    <ItemTemplate>
                        SrNo:
                        <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
                        <br />
                        Cast_ID:
                        <asp:Label ID="Cast_IDLabel" runat="server" Text='<%# Bind("Cast_ID") %>' />
                        <br />
                        Cast_Name:
                        <asp:Label ID="Cast_NameLabel" runat="server" Text='<%# Bind("Cast_Name") %>' />
                        <br />
                        Description:
                        <asp:Label ID="DescriptionLabel" runat="server" 
                            Text='<%# Bind("Description") %>' />
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
            <asp:ObjectDataSource ID="ods_CasteMaster" runat="server" SelectMethod="GetData"
                TypeName="IGRSS.DataAccessLayer.CastMasterTableAdapters.Cast_MasterTableAdapter"
                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" 
                OldValuesParameterFormatString="original_{0}">
                <DeleteParameters>
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_Cast_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Cast_ID" Type="Int32" />
                    <asp:Parameter Name="Cast_Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Cast_ID" Type="Int32" />
                    <asp:Parameter Name="Cast_Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_Cast_ID" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>

