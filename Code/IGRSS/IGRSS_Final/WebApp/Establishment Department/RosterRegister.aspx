<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="RosterRegister.aspx.cs" Inherits="Establishment_Department_RosterRegister" %>

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
        var datePickers = ["Date_Of_AppointmentTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
 
    
</script>
<asp:MultiView ID="Multiview_Roster" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<hr /><br />
<h1>Roster Register</h1>
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
                  <asp:GridView ID="GridView_Roster" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_Roster" EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="Deatils_Of_Designation" HeaderText="Deatils Of Designation" 
                              SortExpression="Deatils_Of_Designation" Visible="False" />
                          <asp:BoundField DataField="Anamat_Type" HeaderText="Anamat Type" 
                              SortExpression="Anamat_Type" />
                          <asp:BoundField DataField="Types_Of_Recruitment" HeaderText="Types Of Recruitment" 
                              SortExpression="Types_Of_Recruitment" />
                          <asp:BoundField DataField="Recruitment_Year" HeaderText="Recruitment Year" 
                              SortExpression="Recruitment_Year" />
                          <asp:BoundField DataField="Roster_SrNo" HeaderText="Roster SrNo" 
                              SortExpression="Roster_SrNo" />
                          <asp:BoundField DataField="Reserved_For_Category" HeaderText="Reserved For Category" 
                              SortExpression="Reserved_For_Category" />
                          <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" 
                              SortExpression="Employee_Name" />
                          <asp:BoundField DataField="Date_Of_Appointment" HeaderText="Date Of Appointment" 
                              SortExpression="Date_Of_Appointment" />
                          <asp:BoundField DataField="Appointed_Authority" HeaderText="Appointed Authority" 
                              SortExpression="Appointed_Authority" />
                          <asp:BoundField DataField="Remarks" 
                              HeaderText="Remarks" 
                              SortExpression="Remarks" Visible="False" />
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
<h1>Roster Register</h1>
<asp:FormView ID="FormView_Roster" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_Roster" EnableModelValidation="True" 
        DefaultMode="Insert" oniteminserting="FormView_Roster_ItemInserting" 
        onitemcommand="FormView_Roster_ItemCommand" >
        <EditItemTemplate>
                        <table>
            <tr>
			    <td>Deatils Of Designation:</td>
				<td>
                    <asp:ListBox ID="ListBox_Designation" runat="server" 
                        DataSourceID="ods_Designation" DataTextField="Description" 
                        DataValueField="Description"></asp:ListBox>
                </td>
				
				<td>Reserved For Category:</td>
				<td>
                    <asp:DropDownList ID="DropDownList_ReservedCategory" runat="server" 
                        Width="160px">
                        <asp:ListItem Text="Schedule Cast" Value="Schedule Cast" ></asp:ListItem>
                        <asp:ListItem Text="Scheduled Tribe" Value="Scheduled Tribe"></asp:ListItem>
                        <asp:ListItem Text="Social and Educational Backward Tribe" Value="Social and Educational Backward Tribe"></asp:ListItem>
                        <asp:ListItem Text="Handicapped" Value="Handicapped"></asp:ListItem>
                        <asp:ListItem Text="General" Value="General"></asp:ListItem>
                        <asp:ListItem Text="None" Value="None"></asp:ListItem>
                    </asp:DropDownList>
                </td>
			</tr>        			
                
            <tr>
			    <td>Anamat Type:</td>
				<td>
                    <asp:DropDownList ID="DropDownList_AnamatType" runat="server" Width="160px">
                        <asp:ListItem Text="Schedule Cast" Value="Schedule Cast"></asp:ListItem>
                        <asp:ListItem Text="Scheduled Tribe" Value="Scheduled Tribe"></asp:ListItem>
                        <asp:ListItem Text="Social and Educational Backward Tribe" Value="Social and Educational Backward Tribe"></asp:ListItem>
                        <asp:ListItem Text="Handicapped"></asp:ListItem>
                        <asp:ListItem Text="General" Value="General"></asp:ListItem>
                        <asp:ListItem Text="None" Value="None"></asp:ListItem>
                    </asp:DropDownList>
                </td>
				
				<td>Employee Name:</td>
				<td><asp:TextBox ID="Employee_NameTextBox" runat="server" 
                    Text='<%# Bind("Employee_Name") %>' Width="160px" /></td>
			</tr>                       
                
            <tr>
				<td>Types Of Recruitment:</td>
				<td><asp:TextBox ID="Types_Of_RecruitmentTextBox" runat="server" 
                    Text='<%# Bind("Types_Of_Recruitment") %>' Width="160px" /></td>
				
				<td>Date Of Appointment:</td>
				<td><asp:TextBox ID="Date_Of_AppointmentTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Appointment") %>' Width="160px" /></td>
			</tr>   
                                
            <tr>
			    <td>Recruitment Year:</td>
				<td><asp:TextBox ID="Recruitment_YearTextBox" runat="server" 
                    Text='<%# Bind("Recruitment_Year") %>' Width="160px" /></td>
				
				<td>Appointed Authority:</td>
				<td><asp:TextBox ID="Appointed_AuthorityTextBox" runat="server" 
                    Text='<%# Bind("Appointed_Authority") %>' Width="160px" /></td>				
			</tr> 
                                
            <tr>
			    <td>Roster SrNo:</td>
				<td><asp:TextBox ID="Roster_SrNoTextBox" runat="server" 
                    Text='<%# Bind("Roster_SrNo") %>' Width="160px" /></td>
				
				<td>Remarks:</td>
				<td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                        Height="60px" Width="160px" /></td>
			</tr>                      
                 
            <tr><td align="center" colspan=4 >
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" CssClass="standardButton" />
				&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                    CausesValidation="False" CommandName="Reset" Text="Reset" 
                    CssClass="standardButton" onclientclick="resetTextFields();return false;" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" /></td></tr>    
        </table>			
            
        </EditItemTemplate>
        <InsertItemTemplate>
                       <table>
            <tr>
			    <td>Deatils Of Designation:</td>
				<td>
                    <asp:ListBox ID="ListBox_Designation" runat="server" 
                        DataSourceID="ods_Designation" DataTextField="Description" 
                        DataValueField="Description"></asp:ListBox>
                </td>
				
				<td>Reserved For Category:</td>
				<td>
                    <asp:DropDownList ID="DropDownList_ReservedCategory" runat="server" 
                        Width="160px">
                        <asp:ListItem Text="Schedule Cast" Value="Schedule Cast" ></asp:ListItem>
                        <asp:ListItem Text="Scheduled Tribe" Value="Scheduled Tribe"></asp:ListItem>
                        <asp:ListItem Text="Social and Educational Backward Tribe" Value="Social and Educational Backward Tribe"></asp:ListItem>
                        <asp:ListItem Text="Handicapped" Value="Handicapped"></asp:ListItem>
                        <asp:ListItem Text="General" Value="General"></asp:ListItem>
                        <asp:ListItem Text="None" Value="None"></asp:ListItem>
                    </asp:DropDownList>
                </td>
			</tr>        			
                
            <tr>
			    <td>Anamat Type:</td>
				<td>
                    <asp:DropDownList ID="DropDownList_AnamatType" runat="server" Width="160px">
                        <asp:ListItem Text="Schedule Cast" Value="Schedule Cast"></asp:ListItem>
                        <asp:ListItem Text="Scheduled Tribe" Value="Scheduled Tribe"></asp:ListItem>
                        <asp:ListItem Text="Social and Educational Backward Tribe" Value="Social and Educational Backward Tribe"></asp:ListItem>
                        <asp:ListItem Text="Handicapped"></asp:ListItem>
                        <asp:ListItem Text="General" Value="General"></asp:ListItem>
                        <asp:ListItem Text="None" Value="None"></asp:ListItem>
                    </asp:DropDownList>
                </td>
				
				<td>Employee Name:</td>
				<td><asp:TextBox ID="Employee_NameTextBox" runat="server" 
                    Text='<%# Bind("Employee_Name") %>' Width="160px" /></td>
			</tr>                       
                
            <tr>
				<td>Types Of Recruitment:</td>
				<td><asp:TextBox ID="Types_Of_RecruitmentTextBox" runat="server" 
                    Text='<%# Bind("Types_Of_Recruitment") %>' Width="160px" /></td>
				
				<td>Date Of Appointment:</td>
				<td><asp:TextBox ID="Date_Of_AppointmentTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Appointment") %>' Width="160px" /></td>
			</tr>   
                                
            <tr>
			    <td>Recruitment Year:</td>
				<td><asp:TextBox ID="Recruitment_YearTextBox" runat="server" 
                    Text='<%# Bind("Recruitment_Year") %>' Width="160px" /></td>
				
				<td>Appointed Authority:</td>
				<td><asp:TextBox ID="Appointed_AuthorityTextBox" runat="server" 
                    Text='<%# Bind("Appointed_Authority") %>' Width="160px" /></td>				
			</tr> 
                                
            <tr>
			    <td>Roster SrNo:</td>
				<td><asp:TextBox ID="Roster_SrNoTextBox" runat="server" 
                    Text='<%# Bind("Roster_SrNo") %>' Width="160px" /></td>
				
				<td>Remarks:</td>
				<td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                        Height="60px" Width="160px" /></td>
			</tr>                      
                 
            <tr><td align="center" colspan=4 >
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" CssClass="standardButton" />
				&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                    CausesValidation="False" CommandName="Reset" Text="Reset" 
                    CssClass="standardButton" onclientclick="resetTextFields();return false;" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" /></td></tr>    
        </table>			
            
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            Deatils_Of_Designation:
            <asp:Label ID="Deatils_Of_DesignationLabel" runat="server" 
                Text='<%# Bind("Deatils_Of_Designation") %>' />
            <br />
            Anamat_Type:
            <asp:Label ID="Anamat_TypeLabel" runat="server" 
                Text='<%# Bind("Anamat_Type") %>' />
            <br />
            Types_Of_Recruitment:
            <asp:Label ID="Types_Of_RecruitmentLabel" runat="server" 
                Text='<%# Bind("Types_Of_Recruitment") %>' />
            <br />
            Recruitment_Year:
            <asp:Label ID="Recruitment_YearLabel" runat="server" 
                Text='<%# Bind("Recruitment_Year") %>' />
            <br />
            Roster_SrNo:
            <asp:Label ID="Roster_SrNoLabel" runat="server" 
                Text='<%# Bind("Roster_SrNo") %>' />
            <br />
            Reserved_For_Category:
            <asp:Label ID="Reserved_For_CategoryLabel" runat="server" 
                Text='<%# Bind("Reserved_For_Category") %>' />
            <br />
            Employee_Name:
            <asp:Label ID="Employee_NameLabel" runat="server" 
                Text='<%# Bind("Employee_Name") %>' />
            <br />
            Date_Of_Appointment:
            <asp:Label ID="Date_Of_AppointmentLabel" runat="server" 
                Text='<%# Bind("Date_Of_Appointment") %>' />
            <br />
            Appointed_Authority:
            <asp:Label ID="Appointed_AuthorityLabel" runat="server" 
                Text='<%# Bind("Appointed_Authority") %>' />
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
    
    <asp:ObjectDataSource ID="ods_Roster" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.RosterTableAdapters.RosterRegisterTableAdapter" 
        UpdateMethod="Update" onselecting="ods_Roster_Selecting" >
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Deatils_Of_Designation" Type="String" />
            <asp:Parameter Name="Original_Anamat_Type" Type="String" />
            <asp:Parameter Name="Original_Types_Of_Recruitment" Type="String" />
            <asp:Parameter Name="Original_Recruitment_Year" Type="Int32" />
            <asp:Parameter Name="Original_Roster_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Reserved_For_Category" Type="String" />
            <asp:Parameter Name="Original_Employee_Name" Type="String" />
            <asp:Parameter Name="Original_Date_Of_Appointment" Type="DateTime" />
            <asp:Parameter Name="Original_Appointed_Authority" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Deatils_Of_Designation" Type="String" />
            <asp:Parameter Name="Anamat_Type" Type="String" />
            <asp:Parameter Name="Types_Of_Recruitment" Type="String" />
            <asp:Parameter Name="Recruitment_Year" Type="Int32" />
            <asp:Parameter Name="Roster_SrNo" Type="Int32" />
            <asp:Parameter Name="Reserved_For_Category" Type="String" />
            <asp:Parameter Name="Employee_Name" Type="String" />
            <asp:Parameter Name="Date_Of_Appointment" Type="DateTime" />
            <asp:Parameter Name="Appointed_Authority" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Deatils_Of_Designation" Type="String" />
            <asp:Parameter Name="Anamat_Type" Type="String" />
            <asp:Parameter Name="Types_Of_Recruitment" Type="String" />
            <asp:Parameter Name="Recruitment_Year" Type="Int32" />
            <asp:Parameter Name="Roster_SrNo" Type="Int32" />
            <asp:Parameter Name="Reserved_For_Category" Type="String" />
            <asp:Parameter Name="Employee_Name" Type="String" />
            <asp:Parameter Name="Date_Of_Appointment" Type="DateTime" />
            <asp:Parameter Name="Appointed_Authority" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Deatils_Of_Designation" Type="String" />
            <asp:Parameter Name="Original_Anamat_Type" Type="String" />
            <asp:Parameter Name="Original_Types_Of_Recruitment" Type="String" />
            <asp:Parameter Name="Original_Recruitment_Year" Type="Int32" />
            <asp:Parameter Name="Original_Roster_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Reserved_For_Category" Type="String" />
            <asp:Parameter Name="Original_Employee_Name" Type="String" />
            <asp:Parameter Name="Original_Date_Of_Appointment" Type="DateTime" />
            <asp:Parameter Name="Original_Appointed_Authority" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView>
</asp:Content>

