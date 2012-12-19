<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="RecordClassificationMaster.aspx.cs" Inherits="Central_Administration_Console_Masters_RecordClassificationMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <br />
    <br />
    <center>
        <asp:Panel ID="infoDiv" runat="server" Visible="false" CssClass="infoBar">
            &nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
        <hr />
        <br />
    </center>
    <asp:MultiView ID="Multiview_RecordClassificationMaster" runat="server" 
        ActiveViewIndex="0">
        <asp:View ID="ViewGrid" runat="server">
            <br />
            <h1 style="text-align: center; height: 22px;">
                RECORD CLASSIFICATION MASTER</h1>
            <table align="center">
                <tr>
                    <td>
                        <asp:GridView ID="GridView_RecordClassificationMaster" runat="server" 
                            AllowPaging="True" AutoGenerateColumns="False"
                            DataKeyNames="SrNo" DataSourceID="ods_RecordClassificationMaster" 
                            EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" ReadOnly="True"
                                    SortExpression="SrNo" Visible="False" />
                                <asp:BoundField DataField="FileNo" HeaderText="File No" 
                                    SortExpression="FileNo" />
                                <asp:BoundField DataField="File_Storage_Period" HeaderText="File Storage Period" 
                                    SortExpression="File_Storage_Period" />
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
                RECORD CLASSIFICATION MASTER</h1>
            <center>
                <asp:FormView ID="FormView_RecordClassificationMaster" runat="server" 
                    DataKeyNames="SrNo" DataSourceID="ods_RecordClassificationMaster"
                    DefaultMode="Insert" EnableModelValidation="True" 
                    OnItemCommand="FormView_RecordClassificationMaster_ItemCommand">
                    <EditItemTemplate>
                       <table align="center">
                        <tr align="left"><td>File No:</td>
                            <td><asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                                    Width="160px" /></td>
                       </tr>                       
                        
                       <tr align="left"><td>File Storage Period:</td>
                           <td><asp:TextBox ID="File_Storage_PeriodTextBox" runat="server" 
                            Text='<%# Bind("File_Storage_Period") %>' Width="240px" /></td></tr>                        
                        
                       <tr><td colspan="2">
                           <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Save" CssClass="standardButton" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" 
                               CssClass="standardButton" /></td>
                      </tr>
                        
                            </table>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                    <table align="center">
                        <tr align="left"><td>File No:</td>
                            <td><asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                                    Width="160px" /></td>
                       </tr>                       
                        
                       <tr align="left"><td>File Storage Period:</td>
                           <td><asp:TextBox ID="File_Storage_PeriodTextBox" runat="server" 
                            Text='<%# Bind("File_Storage_Period") %>' Width="240px" /></td></tr>                        
                        
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
                        FileNo:
                        <asp:Label ID="FileNoLabel" runat="server" Text='<%# Bind("FileNo") %>' />
                        <br />
                        File_Storage_Period:
                        <asp:Label ID="File_Storage_PeriodLabel" runat="server" 
                            Text='<%# Bind("File_Storage_Period") %>' />
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
            <asp:ObjectDataSource ID="ods_RecordClassificationMaster" runat="server" SelectMethod="GetData"
                TypeName="IGRSS.DataAccessLayer.RecordClassificationMasterTableAdapters.Record_ClassificationMasterTableAdapter"
                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" 
                OldValuesParameterFormatString="original_{0}">
                <DeleteParameters>
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_FileNo" Type="Int32" />
                    <asp:Parameter Name="Original_File_Storage_Period" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="FileNo" Type="Int32" />
                    <asp:Parameter Name="File_Storage_Period" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FileNo" Type="Int32" />
                    <asp:Parameter Name="File_Storage_Period" Type="String" />
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_FileNo" Type="Int32" />
                    <asp:Parameter Name="Original_File_Storage_Period" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>

