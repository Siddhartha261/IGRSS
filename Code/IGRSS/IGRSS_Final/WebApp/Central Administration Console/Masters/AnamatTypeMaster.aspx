﻿<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="AnamatTypeMaster.aspx.cs" Inherits="Central_Administration_Console_Masters_AnamatTypeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <br />
    <br />
    <center>
        <asp:Panel ID="infoDiv" runat="server" Visible="false" CssClass="infoBar">
            &nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
        <hr />
        <br />
    </center>
    <asp:MultiView ID="Multiview_AnamatTypeMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="ViewGrid" runat="server">
            <br />
            <h1 style="text-align: center; height: 22px;">
                ANAMAT TYPE MASTER</h1>
            <table align="center">
                <tr>
                    <td>
                        <asp:GridView ID="GridView_AnamatTypeMaster" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataKeyNames="SrNo" DataSourceID="ods_AnamatTypeMaster" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" ReadOnly="True"
                                    SortExpression="SrNo" Visible="False" />
                                <asp:BoundField DataField="Anamat_Type" HeaderText="Anamat Type" 
                                    SortExpression="Anamat_Type" />
                                <asp:BoundField DataField="Anamat_Details" HeaderText="Anamat Details" 
                                    SortExpression="Anamat_Details" />
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
                ANAMAT TYPE MASTER</h1>
            <center>
                <asp:FormView ID="FormView_AnamatTypeMaster" runat="server" DataKeyNames="SrNo" DataSourceID="ods_AnamatTypeMaster"
                    DefaultMode="Insert" EnableModelValidation="True" 
                    OnItemCommand="FormView_AnamatTypeMaster_ItemCommand">
                    <EditItemTemplate>
                       <table align="center">
                            <tr align="left">
                                <td>
                                    Anamat Type:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="Anamat_TypeTextBox" runat="server" 
                                        Text='<%# Bind("Anamat_Type") %>' Width="160px" />
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Anamat Details:
                                </td>
                                <td>
                                    <asp:TextBox ID="Anamat_DetailsTextBox" runat="server" 
                                        Text='<%# Bind("Anamat_Details") %>' Height="60px" TextMode="MultiLine" 
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
                                    Anamat Type:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="Anamat_TypeTextBox" runat="server" 
                                        Text='<%# Bind("Anamat_Type") %>' Width="160px" />
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Anamat Details:
                                </td>
                                <td>
                                    <asp:TextBox ID="Anamat_DetailsTextBox" runat="server" 
                                        Text='<%# Bind("Anamat_Details") %>' Height="60px" TextMode="MultiLine" 
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
                        Anamat_Type:
                        <asp:Label ID="Anamat_TypeLabel" runat="server" Text='<%# Bind("Anamat_Type") %>' />
                        <br />
                        Anamat_Details:
                        <asp:Label ID="Anamat_DetailsLabel" runat="server" Text='<%# Bind("Anamat_Details") %>' />
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
            <asp:ObjectDataSource ID="ods_AnamatTypeMaster" runat="server" SelectMethod="GetData"
                TypeName="IGRSS.DataAccessLayer.AnamattypeTableAdapters.AnamatMasterTableAdapter"
                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" OldValuesParameterFormatString="original_{0}">
                <DeleteParameters>
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_Anamat_Type" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Anamat_Type" Type="String" />
                    <asp:Parameter Name="Anamat_Details" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Anamat_Type" Type="String" />
                    <asp:Parameter Name="Anamat_Details" Type="String" />
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_Anamat_Type" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
