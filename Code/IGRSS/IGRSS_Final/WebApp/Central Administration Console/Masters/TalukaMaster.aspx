﻿<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="TalukaMaster.aspx.cs" Inherits="Central_Administration_Console_Masters_TalukaMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <br />
    <br />
    <center>
        <asp:Panel ID="infoDiv" runat="server" Visible="false" CssClass="infoBar">
            &nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
        <hr />
        <br />
    </center>
    <asp:MultiView ID="Multiview_TalukaMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="ViewGrid" runat="server">
            <br />
            <h1 style="text-align: center; height: 22px;">
                TALUKA MASTER</h1>
            <table align="center">
                <tr>
                    <td>
                        <asp:GridView ID="GridView_TalukaMaster" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataKeyNames="SrNo" DataSourceID="ods_TalukaMaster" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" ReadOnly="True"
                                    SortExpression="SrNo" Visible="False" />
                                <asp:BoundField DataField="Taluka_No" HeaderText="Taluka No" 
                                    SortExpression="Taluka_No" />
                                <asp:BoundField DataField="Taluka_Name" HeaderText="Taluka Name" 
                                    SortExpression="Taluka_Name" />
                                <asp:BoundField DataField="Taluka_Details" HeaderText="Taluka Details" 
                                    SortExpression="Taluka_Details" Visible="False" />
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
                TALUKA MASTER</h1>
            <center>
                <asp:FormView ID="FormView_TalukaMaster" runat="server" DataKeyNames="SrNo" DataSourceID="ods_TalukaMaster"
                    DefaultMode="Insert" EnableModelValidation="True" 
                    OnItemCommand="FormView_TalukaMaster_ItemCommand">
                    <EditItemTemplate>
                        <table align="center">
                            <tr align="left">
                                <td>
                                    Taluka No:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="Taluka_NoTextBox" runat="server" 
                                        Text='<%# Bind("Taluka_No") %>' Width="140px" />
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Taluka Name:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="Taluka_NameTextBox" runat="server" 
                                        Text='<%# Bind("Taluka_Name") %>' Width="240px" />
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Taluka Details:
                                </td>
                                <td>
                                    <asp:TextBox ID="Taluka_DetailsTextBox" runat="server" 
                                        Text='<%# Bind("Taluka_Details") %>' Height="60px" TextMode="MultiLine" 
                                        Width="300px" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                        Text="Update" CssClass="standardButton" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancel" CssClass="standardButton" />
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table align="center">
                            <tr align="left">
                                <td>
                                    Taluka No:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="Taluka_NoTextBox" runat="server" 
                                        Text='<%# Bind("Taluka_No") %>' Width="140px" />
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Taluka Name:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="Taluka_NameTextBox" runat="server" 
                                        Text='<%# Bind("Taluka_Name") %>' Width="240px" />
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Taluka Details:
                                </td>
                                <td>
                                    <asp:TextBox ID="Taluka_DetailsTextBox" runat="server" 
                                        Text='<%# Bind("Taluka_Details") %>' Height="60px" TextMode="MultiLine" 
                                        Width="300px" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                        Text="Save" CssClass="standardButton" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancel" CssClass="standardButton" />
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        SrNo:
                        <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
                        <br />
                        Taluka_No:
                        <asp:Label ID="Taluka_NoLabel" runat="server" Text='<%# Bind("Taluka_No") %>' />
                        <br />
                        Taluka_Name:
                        <asp:Label ID="Taluka_NameLabel" runat="server" Text='<%# Bind("Taluka_Name") %>' />
                        <br />
                        Taluka_Details:
                        <asp:Label ID="Taluka_DetailsLabel" runat="server" Text='<%# Bind("Taluka_Details") %>' />
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
            <asp:ObjectDataSource ID="ods_TalukaMaster" runat="server" SelectMethod="GetData"
                TypeName="IGRSS.DataAccessLayer.TalukaMasterTableAdapters.TalukaMasterTableAdapter"
                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" OldValuesParameterFormatString="original_{0}">
                <DeleteParameters>
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_Taluka_No" Type="Int32" />
                    <asp:Parameter Name="Original_Taluka_Name" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Taluka_No" Type="Int32" />
                    <asp:Parameter Name="Taluka_Name" Type="String" />
                    <asp:Parameter Name="Taluka_Details" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Taluka_No" Type="Int32" />
                    <asp:Parameter Name="Taluka_Name" Type="String" />
                    <asp:Parameter Name="Taluka_Details" Type="String" />
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_Taluka_No" Type="Int32" />
                    <asp:Parameter Name="Original_Taluka_Name" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
