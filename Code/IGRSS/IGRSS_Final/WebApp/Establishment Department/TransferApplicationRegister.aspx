<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="TransferApplicationRegister.aspx.cs" Inherits="Establishment_Department_TransferApplicationRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<script type="text/javascript" language="javascript">

    function generateDatePicker(id) {
        $('input[id*="' + id + '"]').datepicker({
            showOn: "both",
            buttonImage: "/WebApp/Styles/css/sunny/images/calendar.gif",
            buttonImageOnly: true
        });
    }

    $(function () {
        var datePickers = ["Application_DateTextBox", "Disposed_OnTextBox", "Joining_DateTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
 
    
</script>
<br />
<br />
<center>
<asp:Panel id="infoDiv" runat="server" Visible="false" CssClass="infoBar" >&nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
<hr /><br /></center>
<asp:MultiView ID="Multiview_TransferAppl" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<hr /><br />
<h1>Transfer Application Register</h1>
<table>
          <tr>
                    <td align="right" style="width:641px;" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" >
                        <asp:TextBox Width="160" ID="txtFileNo" runat="server" 
                            meta:resourcekey="txtFileNoResource1"></asp:TextBox></td>
                        <td align="right">
                        <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_TransferAppl" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_TransferAppl" 
                      EnableModelValidation="True" 
                      onrowdeleted="GridView_TransferAppl_RowDeleted" 
                      onrowdeleting="GridView_TransferAppl_RowDeleting" 
                      onrowediting="GridView_TransferAppl_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="Details_Of_Designation" HeaderText="Details_Of_Designation" 
                              SortExpression="Details_Of_Designation" Visible="False" />
                          <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" 
                              SortExpression="Employee_Name" />
                          <asp:BoundField DataField="Application_Date" HeaderText="Application Date" 
                              SortExpression="Application_Date" />
                          <asp:BoundField DataField="Current_Place" HeaderText="Current Place" 
                              SortExpression="Current_Place" />
                          <asp:BoundField DataField="Joining_Date" HeaderText="Joining Date" 
                              SortExpression="Joining_Date" />
                          <asp:BoundField DataField="Residence_District" HeaderText="Residence District" 
                              SortExpression="Residence_District" />
                          <asp:BoundField DataField="Place_Of_Request" HeaderText="Place Of Request" 
                              SortExpression="Place_Of_Request" />
                          <asp:BoundField DataField="Reason_For_Request" HeaderText="Reason_For_Request" 
                              SortExpression="Reason_For_Request" Visible="False" />
                          <asp:BoundField DataField="Disposed_On" HeaderText="Disposed On" 
                              SortExpression="Disposed_On" />
                          <asp:BoundField DataField="Remarks" 
                              HeaderText="Remarks" 
                              SortExpression="Remarks" Visible="False" />
                              <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:ImageButton ID="ImageButton1" CommandName="Edit" runat="server" 
                                                ImageUrl="~/Styles/css/sunny/images/edit.png" />
                                        </td>
                                        <td>
                                            <asp:ImageButton ID="ImageButton2" CommandName="Delete" runat="server" 
                                                ImageUrl="~/Styles/css/sunny/images/deletecross.png" />
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                          </asp:TemplateField>
                      </Columns>
                  </asp:GridView>
              </td>
          </tr>
 </table>
 <asp:LinkButton ID="Button_new" runat="server" Text="New" 
        onclick="Button_new_Click" CssClass="standardButton" />
</asp:View>

<asp:View ID="Formview" runat="server">
<center>
<h1>Transfer Application Register</h1>
<asp:FormView ID="FormView_TransferAppl" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_TransferAppl" EnableModelValidation="True" 
        DefaultMode="Insert" onitemcommand="FormView_TransferAppl_ItemCommand" 
        oniteminserting="FormView_TransferAppl_ItemInserting" 
        oniteminserted="FormView_TransferAppl_ItemInserted" 
        onitemupdated="FormView_TransferAppl_ItemUpdated" 
        onitemupdating="FormView_TransferAppl_ItemUpdating" >
        <EditItemTemplate>
                                   <table>           
			        <tr>
					   <td>Details Of Designation:</td>
					   <td>
                           <asp:ListBox ID="ListBox_Designation" runat="server" 
                               DataSourceID="ods_Designation" DataTextField="Description" 
                               DataValueField="Description"></asp:ListBox>
                        </td>
					   
					   <td>Residence District:</td>
					   <td>
                           <asp:DropDownList ID="DropDownList_ResidenceDistrict" runat="server" 
                               DataSourceID="ods_ResidenceDistrict" DataTextField="District_Name" 
                               DataValueField="District_Name" Width="160px">
                           </asp:DropDownList>
                        </td>
					</tr>				   
                       
                    <tr>
					   <td>Employee Name:</td>
					   <td>
                           <asp:DropDownList ID="DropDownList_EmployeeName" runat="server" 
                               DataSourceID="ods_EmployeeName" DataTextField="FirstName" 
                               DataValueField="FirstName" Width="160px">
                           </asp:DropDownList>
                        </td>
					   
					   <td>Place Of Request:</td>
					   <td>
                           <asp:DropDownList ID="DropDownList_Place_Of_Request" runat="server" 
                               DataSourceID="ods_Place_Of_Request" DataTextField="Place_Name" 
                               DataValueField="Place_Name" Width="160px">
                           </asp:DropDownList>
                        </td>
					</tr>                       
                       
                    <tr>
					   <td>Application Date:</td>
					   <td><asp:TextBox ID="Application_DateTextBox" runat="server" 
                           Text='<%# Bind("Application_Date") %>' Width="140px" /></td>
					   
					   <td>Reason For Request:</td>
					   <td>
                           <asp:TextBox ID="Reason_For_RequestTextBox" runat="server" 
                               Text='<%# Bind("Reason_For_Request") %>' Height="60px" Width="160px" />
                        </td>
					</tr>                      
                       
                    <tr>
					   <td>Current Place:</td>
					   <td>
                           <asp:DropDownList ID="DropDownList_CurrentPlace" runat="server" 
                               DataSourceID="ods_CurrentPlace" DataTextField="OfficeName" 
                               DataValueField="OfficeName">
                           </asp:DropDownList>
                        </td>
					   
					   <td>Disposed On:</td>
					   <td>
                           <asp:TextBox ID="Disposed_OnTextBox" runat="server" 
                               Text='<%# Bind("Disposed_On") %>' Width="140px" />
                        </td>
					</tr>		
                                              
                    <tr>
					   <td>Joining Date On Current Place:</td>
					   <td><asp:TextBox ID="Joining_DateTextBox" runat="server" 
                           Text='<%# Bind("Joining_Date") %>' Width="140px" /></td>
					   
					   <td>Remarks:</td>
					   <td>
                           <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                               Height="60px" Width="160px" />
                        </td>
					</tr>                      
                       
                    <tr><td align="center" colspan=4 >
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                           CommandName="Update" Text="Update" CssClass="standardButton" />
						&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                           CausesValidation="False" CommandName="Reset" Text="Reset" 
                            CssClass="standardButton" onclientclick="resetTextFields();return false;" />   
                       &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                           CausesValidation="False" CommandName="Back" Text="Back" 
                            CssClass="standardButton" /></td>
					</tr>                        
            </table>
            
        </EditItemTemplate>
        <InsertItemTemplate>
                                   <table>           
			        <tr>
					   <td>Details Of Designation:</td>
					   <td>
                           <asp:ListBox ID="ListBox_Designation" runat="server" 
                               DataSourceID="ods_Designation" DataTextField="Description" 
                               DataValueField="Description"></asp:ListBox>
                        </td>
					   
					   <td>Residence District:</td>
					   <td>
                           <asp:DropDownList ID="DropDownList_ResidenceDistrict" runat="server" 
                               DataSourceID="ods_ResidenceDistrict" DataTextField="District_Name" 
                               DataValueField="District_Name" Width="160px">
                           </asp:DropDownList>
                        </td>
					</tr>				   
                       
                    <tr>
					   <td>Employee Name:</td>
					   <td>
                           <asp:DropDownList ID="DropDownList_EmployeeName" runat="server" 
                               DataSourceID="ods_EmployeeName" DataTextField="FirstName" 
                               DataValueField="FirstName" Width="160px">
                           </asp:DropDownList>
                        </td>
					   
					   <td>Place Of Request:</td>
					   <td>
                           <asp:DropDownList ID="DropDownList_Place_Of_Request" runat="server" 
                               DataSourceID="ods_Place_Of_Request" DataTextField="Place_Name" 
                               DataValueField="Place_Name" Width="160px">
                           </asp:DropDownList>
                        </td>
					</tr>                       
                       
                    <tr>
					   <td>Application Date:</td>
					   <td><asp:TextBox ID="Application_DateTextBox" runat="server" 
                           Text='<%# Bind("Application_Date") %>' Width="140px" /></td>
					   
					   <td>Reason For Request:</td>
					   <td>
                           <asp:TextBox ID="Reason_For_RequestTextBox" runat="server" 
                               Text='<%# Bind("Reason_For_Request") %>' Height="60px" Width="160px" />
                        </td>
					</tr>                      
                       
                    <tr>
					   <td>Current Place:</td>
					   <td>
                           <asp:DropDownList ID="DropDownList_CurrentPlace" runat="server" 
                               DataSourceID="ods_CurrentPlace" DataTextField="OfficeName" 
                               DataValueField="OfficeName">
                           </asp:DropDownList>
                        </td>
					   
					   <td>Disposed On:</td>
					   <td>
                           <asp:TextBox ID="Disposed_OnTextBox" runat="server" 
                               Text='<%# Bind("Disposed_On") %>' Width="140px" />
                        </td>
					</tr>		
                                              
                    <tr>
					   <td>Joining Date On Current Place:</td>
					   <td><asp:TextBox ID="Joining_DateTextBox" runat="server" 
                           Text='<%# Bind("Joining_Date") %>' Width="140px" /></td>
					   
					   <td>Remarks:</td>
					   <td>
                           <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                               Height="60px" Width="160px" />
                        </td>
					</tr>                      
                       
                    <tr><td align="center" colspan=4 >
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                           CommandName="Insert" Text="Insert" CssClass="standardButton" />
						&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                           CausesValidation="False" CommandName="Reset" Text="Reset" 
                            CssClass="standardButton" onclientclick="resetTextFields();return false;" />   
                       &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                           CausesValidation="False" CommandName="Back" Text="Back" 
                            CssClass="standardButton" /></td>
					</tr>                        
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            Details_Of_Designation:
            <asp:Label ID="Details_Of_DesignationLabel" runat="server" 
                Text='<%# Bind("Details_Of_Designation") %>' />
            <br />
            Employee_Name:
            <asp:Label ID="Employee_NameLabel" runat="server" 
                Text='<%# Bind("Employee_Name") %>' />
            <br />
            Application_Date:
            <asp:Label ID="Application_DateLabel" runat="server" 
                Text='<%# Bind("Application_Date") %>' />
            <br />
            Current_Place:
            <asp:Label ID="Current_PlaceLabel" runat="server" 
                Text='<%# Bind("Current_Place") %>' />
            <br />
            Joining_Date:
            <asp:Label ID="Joining_DateLabel" runat="server" 
                Text='<%# Bind("Joining_Date") %>' />
            <br />
            Residence_District:
            <asp:Label ID="Residence_DistrictLabel" runat="server" 
                Text='<%# Bind("Residence_District") %>' />
            <br />
            Place_Of_Request:
            <asp:Label ID="Place_Of_RequestLabel" runat="server" 
                Text='<%# Bind("Place_Of_Request") %>' />
            <br />
            Reason_For_Request:
            <asp:Label ID="Reason_For_RequestLabel" runat="server" 
                Text='<%# Bind("Reason_For_Request") %>' />
            <br />
            Disposed_On:
            <asp:Label ID="Disposed_OnLabel" runat="server" 
                Text='<%# Bind("Disposed_On") %>' />
            <br />
            Remarks:
            <asp:Label ID="RemarksLabel" runat="server" 
                Text='<%# Bind("Remarks") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New"/>
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ods_ResidenceDistrict" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.ResidenceDistrictTableAdapters.DistrictMasterTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_District_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="District_Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="District_Name" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_District_Name" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_Place_Of_Request" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.Place_Of_RequestTableAdapters.PlaceMasterTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Place_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Place_Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Place_Name" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Place_Name" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_EmployeeName" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.EmployeeNameTableAdapters.EmployeeMasterTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter DbType="Guid" Name="Original_EmployeeID" />
            <asp:Parameter Name="Original_FirstName" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Guid" Name="EmployeeID" />
            <asp:Parameter Name="FirstName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter DbType="Guid" Name="Original_EmployeeID" />
            <asp:Parameter Name="Original_FirstName" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</center>
    
    <asp:ObjectDataSource ID="ods_Designation" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.DesignationMasterTableAdapters.DesignationMasterTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter DbType="Guid" Name="Original_DesignationID" />
            <asp:Parameter Name="Original_Name" Type="String" />
            <asp:Parameter Name="Original_Description" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Guid" Name="DesignationID" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter DbType="Guid" Name="Original_DesignationID" />
            <asp:Parameter Name="Original_Name" Type="String" />
            <asp:Parameter Name="Original_Description" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="ods_CurrentPlace" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.officenameTableAdapters.OfficesTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter DbType="Guid" Name="Original_OfficeId" />
            <asp:Parameter Name="Original_OfficeName" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Guid" Name="OfficeId" />
            <asp:Parameter Name="OfficeName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="OfficeName" Type="String" />
            <asp:Parameter DbType="Guid" Name="Original_OfficeId" />
            <asp:Parameter Name="Original_OfficeName" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="ods_TransferAppl" runat="server" DeleteMethod="DeleteQuery" 
        InsertMethod="Insert" 
        SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.TransferApplTableAdapters.Transfer_Appl_RegisterTableAdapter" 
        UpdateMethod="UpdateQuery" onselecting="ods_TransferAppl_Selecting" 
        ondeleting="ods_TransferAppl_Deleting" >
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Details_Of_Designation" Type="String" />
            <asp:Parameter Name="Employee_Name" Type="String" />
            <asp:Parameter Name="Application_Date" Type="DateTime" />
            <asp:Parameter Name="Current_Place" Type="String" />
            <asp:Parameter Name="Joining_Date" Type="DateTime" />
            <asp:Parameter Name="Residence_District" Type="String" />
            <asp:Parameter Name="Place_Of_Request" Type="String" />
            <asp:Parameter Name="Reason_For_Request" Type="String" />
            <asp:Parameter Name="Disposed_On" Type="DateTime" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Details_Of_Designation" Type="String" />
            <asp:Parameter Name="Employee_Name" Type="String" />
            <asp:Parameter Name="Application_Date" Type="DateTime" />
            <asp:Parameter Name="Current_Place" Type="String" />
            <asp:Parameter Name="Joining_Date" Type="DateTime" />
            <asp:Parameter Name="Residence_District" Type="String" />
            <asp:Parameter Name="Place_Of_Request" Type="String" />
            <asp:Parameter Name="Reason_For_Request" Type="String" />
            <asp:Parameter Name="Disposed_On" Type="DateTime" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView>
</asp:Content>

