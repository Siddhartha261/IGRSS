﻿<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="ReasonMaster.aspx.cs" Inherits="Central_Administration_Console_Masters_ReasonMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <br />
    <br />
    <center>
        <asp:Panel ID="infoDiv" runat="server" Visible="false" CssClass="infoBar">
            &nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
        <hr />
        <br />
    </center>
    <asp:MultiView ID="Multiview_ReasonMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="ViewGrid" runat="server">
            <br />
            <h1 style="text-align: center; height: 22px;">
                REASON MASTER</h1>
            <table align="center">
                <tr>
                    <td>
                        <asp:GridView ID="GridView_ReasonMaster" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataKeyNames="SrNo" DataSourceID="ods_ReasonMaster" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" ReadOnly="True"
                                    SortExpression="SrNo" Visible="False" />
                                <asp:BoundField DataField="Reason_Name" HeaderText="Reason Name" 
                                    SortExpression="Reason_Name" />
                                <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" />
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
                REASON MASTER</h1>
            <center>
                <asp:FormView ID="FormView_ReasonMaster" runat="server" DataKeyNames="SrNo" DataSourceID="ods_ReasonMaster"
                    DefaultMode="Insert" EnableModelValidation="True" 
                    OnItemCommand="FormView_ReasonMaster_ItemCommand">
                    <EditItemTemplate>
                     <table align="center">
                            <tr align="left">
                                <td>
                                    Reason Name:
                                </td>
                                <td>
                                    <asp:TextBox ID="Reason_NameTextBox" runat="server" 
                                        Text='<%# Bind("Reason_Name") %>' Width="160px" />
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Remarks:
                                </td>
                                <td>
                                    <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                                        MaxLength="60" TextMode="MultiLine" Width="300px" />
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
                                    Reason Name:
                                </td>
                                <td>
                                    <asp:TextBox ID="Reason_NameTextBox" runat="server" 
                                        Text='<%# Bind("Reason_Name") %>' Width="160px" />
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Remarks:
                                </td>
                                <td>
                                    <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                                        MaxLength="60" TextMode="MultiLine" Width="300px" />
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
                        Reason_Name:
                        <asp:Label ID="Reason_NameLabel" runat="server" Text='<%# Bind("Reason_Name") %>' />
                        <br />
                        Remarks:
                        <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
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
            <asp:ObjectDataSource ID="ods_ReasonMaster" runat="server" SelectMethod="GetData"
                TypeName="IGRSS.DataAccessLayer.ReasonMasterTableAdapters.ReasonMasterTableAdapter"
                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" OldValuesParameterFormatString="original_{0}">
                <DeleteParameters>
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_Reason_Name" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Reason_Name" Type="String" />
                    <asp:Parameter Name="Remarks" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Reason_Name" Type="String" />
                    <asp:Parameter Name="Remarks" Type="String" />
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_Reason_Name" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
