<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="InspectionTypeMaster.aspx.cs" Inherits="Central_Administration_Console_InspectionTypeMaster"
    Title="Inspection Type Entry" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="mvInspectionTypeMaster" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewInspectionTypeMaster" runat="server">
            <table width="100%">
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            DataKeyNames="InspectionTypeId" DataSourceID="OdsInspectionTypeMaster" 
                            OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
                            meta:resourcekey="GridView1Resource1" EnableModelValidation="True">
                            <Columns>
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" meta:resourcekey="BoundFieldResource2" />
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button ID="Button1" runat="server" Text="Add New" OnClick="Button1_Click" meta:resourcekey="Button1Resource1" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="viewInspectionMaster" runat="server">
            <asp:FormView ID="FvInspectionTypeMaster" runat="server" DataSourceID="ods_InspectionMaster"
                DefaultMode="Insert" 
                OnItemInserting="FvInspectionTypeMaster_ItemInserting" 
                OnItemUpdating="FvInspectionTypeMaster_ItemUpdating" 
                meta:resourcekey="FvInspectionTypeMasterResource1" 
                EnableModelValidation="True" DataKeyNames="InspectionTypeId">
                <InsertItemTemplate>
                   <%-- InspectionTypeId:
                    <asp:TextBox ID="InspectionTypeIdTextBox" runat="server" 
                        Text='<%# Bind("InspectionTypeId") %>' />
                    <br />--%>
                    <table>
                        <tr>
                           <td>Name:</td>
                           <td><asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' 
                                   Width="200px" /></td>
                       </tr>                   
                    
                       <tr>
                           <td>Description:</td>
                           <td><asp:TextBox ID="DescriptionTextBox" runat="server" 
                        Text='<%# Bind("Description") %>' TextMode="MultiLine" Width="300px" /></td>
                      </tr>                   
                    
                    <tr><td><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" /></td></tr>
                    </table>
                    
                </InsertItemTemplate>
                <EditItemTemplate>
                    InspectionTypeId:
                    <asp:Label ID="InspectionTypeIdLabel1" runat="server" 
                        Text='<%# Eval("InspectionTypeId") %>' />
                    <br />
                    Name:
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    Description:
                    <asp:TextBox ID="DescriptionTextBox" runat="server" 
                        Text='<%# Bind("Description") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    InspectionTypeId:
                    <asp:Label ID="InspectionTypeIdLabel" runat="server" 
                        Text='<%# Eval("InspectionTypeId") %>' />
                    <br />
                    Name:
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" 
                        Text='<%# Bind("Description") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                        CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    <asp:ObjectDataSource ID="odsInspectionDetails" runat="server" InsertMethod="AddNewInspectionAction"
        SelectMethod="GetAllInspectionTypeMaster" TypeName="IGRSS.BusinessLogicLayer.Inspection"
        UpdateMethod="UpdateInspectionItenary" DeleteMethod="DeleteInspectionTypeMaster">
        <UpdateParameters>
            <asp:Parameter Type="Object" Name="Parameter"></asp:Parameter>
            <asp:Parameter Type="Object" Name="ItenaryId"></asp:Parameter>
            <asp:Parameter Type="Object" Name="ScheduleId"></asp:Parameter>
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Type="Object" Name="Parameter"></asp:Parameter>
            <asp:Parameter Type="Object" Name="InspectionMemoId"></asp:Parameter>
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OdsInspectionTypeMaster" runat="server" InsertMethod="AddNewInspectionTypeMaster"
        OnInserting="OdsInspectionTypeMaster_Inserting" SelectMethod="GetInspectionTypeMasterByInspectionTypeId"
        TypeName="IGRSS.BusinessLogicLayer.Inspection" UpdateMethod="UpdateInspectionTypeMaster"
        OnUpdating="OdsInspectionTypeMaster_Updating" OnInserted="OdsInspectionTypeMaster_Inserted"
        OnUpdated="OdsInspectionTypeMaster_Updated">
        <UpdateParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:ControlParameter ControlID="GridView1" Name="InspectionTypeId" PropertyName="SelectedValue"
                Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="InspectionTypeId" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_InspectionMaster" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.InspectionMasterTableAdapters.InspectionTypeMasterTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter DbType="Guid" Name="Original_InspectionTypeId" />
            <asp:Parameter Name="Original_Name" Type="String" />
            <asp:Parameter Name="Original_Description" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Guid" Name="InspectionTypeId" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter DbType="Guid" Name="Original_InspectionTypeId" />
            <asp:Parameter Name="Original_Name" Type="String" />
            <asp:Parameter Name="Original_Description" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
