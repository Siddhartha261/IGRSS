<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="ReligionMaster.aspx.cs" Inherits="Central_Administration_Console_Masters_ReligionMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:MultiView ID="Multiview_ReligionMaster" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
    <br />

<h1 style="text-align: center">RELIGION MASTER</h1>
<table>
          <tr>
                    <td >
                        <asp:GridView ID="GridView_ReligionMaster" runat="server" AllowPaging="True" 
                            AutoGenerateColumns="False" DataKeyNames="SrNo" 
                            DataSourceID="ods_ReligionMaster" EnableModelValidation="True" >
                            <Columns>
                                <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="SrNo" Visible="False" />
                                <asp:BoundField DataField="Religion_No" HeaderText="Religion No" 
                                    SortExpression="Religion_No" />
                                <asp:BoundField DataField="Religion_Name" HeaderText="Religion Name" 
                                    SortExpression="Religion_Name" />
                                <asp:BoundField DataField="Religion_Details" HeaderText="Religion_Details" 
                                    SortExpression="Religion_Details" Visible="False" />
                            </Columns>
                        </asp:GridView>
                    </td>
          </tr>
 </table>
 <asp:LinkButton ID="Button_new" runat="server" Text="New" 
        onclick="Button_new_Click" CssClass="standardButton" AccessKey="n" />
       
</asp:View>

<asp:View ID="Formview" runat="server">
    <h1 style="text-align: center">
        RELIGION MASTER</h1>
    <center>
        <asp:FormView ID="FormView_ReligionMaster" runat="server" DataKeyNames="SrNo" 
            DataSourceID="ods_ReligionMaster" DefaultMode="Insert" 
            EnableModelValidation="True">
            <EditItemTemplate>
                     <table>
                     <tr><td>Religion Name:</td>
                         <td><asp:TextBox ID="Religion_NameTextBox" runat="server" 
                         Text='<%# Bind("Religion_Name") %>' /></td>
                    </tr>                     
                     
                    <tr><td>Religion No:</td>
                        <td><asp:TextBox ID="Religion_NoTextBox" runat="server" 
                         Text='<%# Bind("Religion_No") %>' /></td>
                   </tr>                    
                     
                  <tr><td>Religion Details:</td>
                      <td><asp:TextBox ID="Religion_DetailsTextBox" runat="server" 
                         Text='<%# Bind("Religion_Details") %>' /></td>
                 </tr>                     
                     
                 <tr><td><asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                         CommandName="Insert" Text="Update" />
                     &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                         CausesValidation="False" CommandName="Cancel" Text="Cancel" /></td></tr>                     
                         </table>
            </EditItemTemplate>
            <InsertItemTemplate>
            <table>
                     <tr><td>Religion Name:</td>
                         <td style="text-align: left"><asp:TextBox ID="Religion_NameTextBox" runat="server" 
                         Text='<%# Bind("Religion_Name") %>' Width="160px" /></td>
                    </tr>                     
                     
                    <tr><td>Religion No:</td>
                        <td align="left"><asp:TextBox ID="Religion_NoTextBox" runat="server" 
                         Text='<%# Bind("Religion_No") %>' /></td>
                   </tr>                    
                     
                  <tr><td>Religion Details:</td>
                      <td><asp:TextBox ID="Religion_DetailsTextBox" runat="server" 
                         Text='<%# Bind("Religion_Details") %>' Height="50px" TextMode="MultiLine" 
                              Width="300px" /></td>
                 </tr>                     
                     
                 <tr><td align="center" colspan="2"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                         CommandName="Insert" Text="Save" />
                     &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                         CausesValidation="False" CommandName="Cancel" Text="Cancel" /></td></tr>                     
                         </table>
            </InsertItemTemplate>
            <ItemTemplate>
                SrNo:
                <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
                <br />
                Religion_Name:
                <asp:Label ID="Religion_NameLabel" runat="server" 
                    Text='<%# Bind("Religion_Name") %>' />
                <br />
                Religion_No:
                <asp:Label ID="Religion_NoLabel" runat="server" 
                    Text='<%# Bind("Religion_No") %>' />
                <br />
                Religion_Details:
                <asp:Label ID="Religion_DetailsLabel" runat="server" 
                    Text='<%# Bind("Religion_Details") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" />
&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
    </center>
    
    <asp:ObjectDataSource ID="ods_ReligionMaster" runat="server" 
        SelectMethod="GetData" 
        
        
        TypeName="IGRSS.DataAccessLayer.ReligionMasterTableAdapters.Religion_MasterTableAdapter" 
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" OldValuesParameterFormatString="original_{0}"   
        >
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Religion_Name" Type="String" />
            <asp:Parameter Name="Original_Religion_No" Type="Int32" />
            <asp:Parameter Name="Original_Religion_Details" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Religion_Name" Type="String" />
            <asp:Parameter Name="Religion_No" Type="Int32" />
            <asp:Parameter Name="Religion_Details" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Religion_Name" Type="String" />
            <asp:Parameter Name="Religion_No" Type="Int32" />
            <asp:Parameter Name="Religion_Details" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Religion_Name" Type="String" />
            <asp:Parameter Name="Original_Religion_No" Type="Int32" />
            <asp:Parameter Name="Original_Religion_Details" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>

