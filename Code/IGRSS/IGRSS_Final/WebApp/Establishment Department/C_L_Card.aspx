<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="C_L_Card.aspx.cs" Inherits="Establishment_Department_C_L_Card" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<script type="text/javascript" language="javascript">

    function generateDatePicker(id) {
        $('input[id*="' + id + '"]').datepicker({
            showOn: "both",
            buttonImage: "/WebApp/Styles/css/sunny/images/calendar.gif",
            buttonImageOnly: true,
            changeMonth: true,
            changeYear: true,
            yearRange: '1940:2025',
            //            dateFormat: "dd/mm/yy",
            dateFormat: "mm/dd/yy",
            onClose: function () {
                var dateSelected = $('input[id*="' + id + '"]').datepicker('getDate');
                var dateNow = new Date();
                if (dateSelected > dateNow) {
                    alert("Selected Date is greater than Current date");
                    $('input[id*="' + id + '"]').val("");
                    $('input[id*="' + id + '"]').focus();
                }
            }
        });
    }

    $(function () {
        var datePickers = ["C_L_DateTextBox", "As_OnTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
 
    
</script>
<br />
<br />
<center>
<asp:Panel id="infoDiv" runat="server" Visible="false" CssClass="infoBar" >&nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
<hr /><br />
</center>
<asp:MultiView ID="Multiview_C_L_Card" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<hr /><br />
<h1>C.L. Card</h1>
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
                  <asp:GridView ID="GridView_C_L_Card" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo,Leave_Approved_Or_Not" DataSourceID="ods_C_L_Card" 
                      EnableModelValidation="True" 
                      onrowdatabound="GridView_C_L_Card_RowDataBound" 
                      onrowdeleted="GridView_C_L_Card_RowDeleted" 
                      onrowdeleting="GridView_C_L_Card_RowDeleting" 
                      onrowediting="GridView_C_L_Card_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="Calendar_Year" HeaderText="Calendar Year" 
                              SortExpression="Calendar_Year" />
                          <asp:BoundField DataField="OfficeName" HeaderText="Office Name" 
                              SortExpression="OfficeName" />
                          <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" 
                              SortExpression="Employee_Name" />
                          <asp:BoundField DataField="Designation" HeaderText="Designation" 
                              SortExpression="Designation" />
                          <asp:BoundField DataField="Casual_SrNo" HeaderText="Casual_SrNo" 
                              SortExpression="Casual_SrNo" Visible="False" />
                          <asp:BoundField DataField="C_L_Date" HeaderText="C.L. Date" 
                              SortExpression="C_L_Date" />
                          <asp:BoundField DataField="HalfDay_FullDay" HeaderText="HalfDay/FullDay" 
                              SortExpression="HalfDay_FullDay" Visible="False" />
                          <asp:BoundField DataField="FirstShift_SecondShift" HeaderText="FirstShift/SecondShift" 
                              SortExpression="FirstShift_SecondShift" Visible="False" />
                          <asp:BoundField DataField="Reasons_Of_Leave" HeaderText="Reasons_Of_Leave" 
                              SortExpression="Reasons_Of_Leave" Visible="False" />
                          <asp:BoundField DataField="Total_Of_Taken_Leaves" 
                              HeaderText="Total Of Taken Leaves" 
                              SortExpression="Total_Of_Taken_Leaves" />
                          <asp:BoundField DataField="Total_Of_Remaining_Leaves" 
                              HeaderText="Total Of Remaining Leaves" 
                              SortExpression="Total_Of_Remaining_Leaves" />
                          <asp:BoundField DataField="As_On" HeaderText="As On" SortExpression="As_On" />
                          <asp:TemplateField HeaderText="Leave Approved Or Not" 
                              SortExpression="Leave_Approved_Or_Not" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblLeave_Approved_Or_Not"  runat="server" Text="No" 
                                        Font-Names="Times New Roman" Font-Bold="false"></asp:Label>
                                </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" />
                              </asp:TemplateField>
                        
                          <asp:BoundField DataField="Leave_Applicant" HeaderText="Leave Applicant" 
                              SortExpression="Leave_Applicant" />
                          <asp:BoundField DataField="Leave_Approved_By" HeaderText="Leave Approved By" 
                              SortExpression="Leave_Approved_By" />
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
<h1>C.L. Card</h1>
<asp:FormView ID="FormView_C_L_Card" runat="server" DataKeyNames="SrNo,Leave_Approved_Or_Not" 
        DataSourceID="ods_C_L_Card" EnableModelValidation="True" 
        DefaultMode="Insert" oniteminserting="FormView_C_L_Card_ItemInserting" 
        onitemcommand="FormView_C_L_Card_ItemCommand" 
        ondatabound="FormView_C_L_Card_DataBound" 
        oniteminserted="FormView_C_L_Card_ItemInserted" 
        onitemupdated="FormView_C_L_Card_ItemUpdated" 
        onitemupdating="FormView_C_L_Card_ItemUpdating" >
        <EditItemTemplate>
            <table border>
      <tr align="left">
	     <td>Calendar Year:</td>
		 <td><asp:TextBox ID="Calendar_YearTextBox" 
                 runat="server" numeric="integer"                                                                                                                                   
                 Text='<%# Bind("Calendar_Year") %>' Width="160px" MaxLength="4" /></td>
		 
		 <td></td>
		 <td></td>
	 </tr>                                                                                                                                                      
      
      <tr><td>Office/Department Name:</td>
		<td align="left">
            <asp:DropDownList ID="DropDownList_Office" runat="server" Width="160px" 
                DataSourceID="ods_office" DataTextField="OfficeName" 
                DataValueField="OfficeName">
            </asp:DropDownList>
                                                                                                                                                                          </td>
																																									    <td></td>
		<td></td></tr>                                                                                                                                                                <tr>
		
	<%--</tr>--%>                                                                                                                                                      
                                                                                                                                                                     <tr>
		<td>Employee Name:</td>
		<td align="left">
            <asp:DropDownList ID="DropDownList_EmployeeName" runat="server" 
                DataSourceID="ods_EmployeeName" DataTextField="FirstName" 
                DataValueField="FirstName" Width="160px">
            </asp:DropDownList>
                                                                                                                                                                         </td>
																																										<td></td>
		<td></td>
	</tr>
	
    <tr align="left">
	    <td>Designation:</td>
		<td>
            <asp:DropDownList ID="DropDownList_Designation" runat="server" 
                DataSourceID="ods_Designation" DataTextField="Name" DataValueField="Name" 
                Width="160px">
            </asp:DropDownList>
        </td>
		
		<td></td>
		<td></td>
	</tr>
    
	<tr>
	   <td colspan="4">&nbsp;<h3>CASUAL LEAVE CARD</h3></td>
	</tr>
    
	      <tr align="left">
              <td>
                  Sr No:</td>
              <td>
                  <asp:TextBox ID="Casual_SrNoTextBox" runat="server" numeric="integer"
                      Text='<%# Bind("Casual_SrNo") %>' Width="160px" MaxLength="10" />
              </td>
              <td>
                  Total Of Remaining Leaves:</td>
              <td>
                  <asp:TextBox ID="Total_Of_Remaining_LeavesTextBox" runat="server" numeric="integer"
                      Text='<%# Bind("Total_Of_Remaining_Leaves") %>' Width="160px" 
                      MaxLength="2" />
              </td>
          </tr>
    
	<tr align="left">
	   <td>C.L. Date/Optional Leave:</td>
	   <td><asp:TextBox ID="C_L_DateTextBox" runat="server" 
            Text='<%# Bind("C_L_Date") %>' Width="160px" /></td>
	   
	   <td>As On:</td>
	   <td><asp:TextBox ID="As_OnTextBox" runat="server" Text='<%# Bind("As_On") %>' 
               Width="160px" /></td>
	</tr>
    
	<tr align="left">
	   <td>HalfDay/FullDay:</td>
	   <td>
           <asp:RadioButtonList ID="RadioButtonList_HalfFullDay" runat="server" 
               RepeatDirection="Horizontal" Width="160px">
               <asp:ListItem Text="Half Day" Value="Half Day"></asp:ListItem>
               <asp:ListItem Text="Full Day" Value="Full Day"></asp:ListItem>
           </asp:RadioButtonList>
        </td>
	   
	   <td>Leave Approved Or Not:</td>
	   <td>
           <asp:RadioButtonList ID="RadioButtonList_LeaveApproved" runat="server" 
               RepeatDirection="Horizontal" Width="160px">
               <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
               <asp:ListItem Text="No" Value="False"></asp:ListItem>
           </asp:RadioButtonList>
        </td>
	</tr>                                                                                                                                                            
    <tr align="left">
	   <td>FirstShift/SecondShift:</td>
	   <td>
           <asp:RadioButtonList ID="RadioButtonList_shift" runat="server" 
               RepeatDirection="Horizontal" Width="200px">
               <asp:ListItem>First Shift</asp:ListItem>
               <asp:ListItem>Second Shift</asp:ListItem>
           </asp:RadioButtonList>
        </td>
	   
	   <td>Leave Applicant:</td>
	   <td><asp:TextBox ID="Leave_ApplicantTextBox" runat="server" 
          Text='<%# Bind("Leave_Applicant") %>' Width="160px" MaxLength="30" /></td>
	</tr>
    
	<tr align="left">
	    <td>Reasons Of Leave:</td>
		<td><asp:TextBox ID="Reasons_Of_LeaveTextBox" runat="server" 
            Text='<%# Bind("Reasons_Of_Leave") %>' Height="60px" Width="160px" /></td>
		
		<td>Leave Approved By:</td>
		<td><asp:TextBox ID="Leave_Approved_ByTextBox" runat="server" 
            Text='<%# Bind("Leave_Approved_By") %>' Width="160px" MaxLength="30" /></td>
	</tr>
    
	<tr align="left">
	   <td>Total Of Taken Leaves:</td>
	   <td><asp:TextBox ID="Total_Of_Taken_LeavesTextBox" runat="server" 
           Text='<%# Bind("Total_Of_Taken_Leaves") %>' Width="160px" MaxLength="2" /></td>
	   
	   <td></td>
	   <td></td>
	</tr>

    <tr><td align="center" colspan=4>
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
      <tr align="left">
	     <td>Calendar Year:</td>
		 <td><asp:TextBox ID="Calendar_YearTextBox" numeric="integer"
                 runat="server"                                                                                                                                   
                 Text='<%# Bind("Calendar_Year") %>' Width="160px" MaxLength="4" /></td>
		 
		 <td></td>
		 <td></td>
	 </tr>                                                                                                                                                      
                                                                                                                                                                      <tr>
		<td>Office/Department Name:</td>
		<td align="left">
            <asp:DropDownList ID="DropDownList_Office" runat="server" Width="160px" 
                DataSourceID="ods_office" DataTextField="OfficeName" 
                DataValueField="OfficeName">
            </asp:DropDownList>
                                                                                                                                                                          </td>
																																									    <td></td>
		<td></td>
	</tr>                                                                                                                                                      
                                                                                                                                                                     <tr>
		<td>Employee Name:</td>
		<td align="left">
            <asp:DropDownList ID="DropDownList_EmployeeName" runat="server" 
                DataSourceID="ods_EmployeeName" DataTextField="FirstName" 
                DataValueField="FirstName" Width="160px">
            </asp:DropDownList>
                                                                                                                                                                         </td>
																																										<td></td>
		<td></td>
	</tr>
	
    <tr align="left">
	    <td>Designation:</td>
		<td>
            <asp:DropDownList ID="DropDownList_Designation" runat="server" 
                DataSourceID="ods_Designation" DataTextField="Name" DataValueField="Name" 
                Width="160px">
            </asp:DropDownList>
        </td>
		
		<td></td>
		<td></td>
	</tr>
    
	<tr>
	   <td colspan="4">&nbsp;<h3>CASUAL LEAVE CARD</h3></td>
	</tr>
    
	      <tr align="left">
              <td>
                  Sr No:</td>
              <td>
                  <asp:TextBox ID="Casual_SrNoTextBox" runat="server" numeric="integer"
                      Text='<%# Bind("Casual_SrNo") %>' Width="160px" MaxLength="10" />
              </td>
              <td>
                  Total Of Remaining Leaves:</td>
              <td>
                  <asp:TextBox ID="Total_Of_Remaining_LeavesTextBox" runat="server" numeric="integer"
                      Text='<%# Bind("Total_Of_Remaining_Leaves") %>' Width="160px" 
                      MaxLength="2" />
              </td>
          </tr>
    
	<tr align="left">
	   <td>C.L. Date/Optional Leave:</td>
	   <td><asp:TextBox ID="C_L_DateTextBox" runat="server" 
            Text='<%# Bind("C_L_Date") %>' Width="160px" /></td>
	   
	   <td>As On:</td>
	   <td><asp:TextBox ID="As_OnTextBox" runat="server" Text='<%# Bind("As_On") %>' 
               Width="160px" /></td>
	</tr>
    
	<tr align="left">
	   <td>HalfDay/FullDay:</td>
	   <td>
           <asp:RadioButtonList ID="RadioButtonList_HalfFullDay" runat="server" 
               RepeatDirection="Horizontal" Width="160px">
               <asp:ListItem Text="Half Day" Value="Half Day"></asp:ListItem>
               <asp:ListItem Text="Full Day" Value="Full Day"></asp:ListItem>
           </asp:RadioButtonList>
        </td>
	   
	   <td>Leave Approved Or Not:</td>
	   <td>
           <asp:RadioButtonList ID="RadioButtonList_LeaveApproved" runat="server" 
               RepeatDirection="Horizontal" Width="160px">
               <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
               <asp:ListItem Text="No" Value="False"></asp:ListItem>
           </asp:RadioButtonList>
        </td>
	</tr>                                                                                                                                                            
    <tr align="left">
	   <td>FirstShift/SecondShift:</td>
	   <td>
           <asp:RadioButtonList ID="RadioButtonList_shift" runat="server" 
               RepeatDirection="Horizontal" Width="200px">
               <asp:ListItem>First Shift</asp:ListItem>
               <asp:ListItem>Second Shift</asp:ListItem>
           </asp:RadioButtonList>
        </td>
	   
	   <td>Leave Applicant:</td>
	   <td><asp:TextBox ID="Leave_ApplicantTextBox" runat="server" 
          Text='<%# Bind("Leave_Applicant") %>' Width="160px" MaxLength="30" /></td>
	</tr>
    
	<tr align="left">
	    <td>Reasons Of Leave:</td>
		<td><asp:TextBox ID="Reasons_Of_LeaveTextBox" runat="server" 
            Text='<%# Bind("Reasons_Of_Leave") %>' Height="60px" Width="160px" /></td>
		
		<td>Leave Approved By:</td>
		<td><asp:TextBox ID="Leave_Approved_ByTextBox" runat="server" 
            Text='<%# Bind("Leave_Approved_By") %>' Width="160px" MaxLength="30" /></td>
	</tr>
    
	<tr align="left">
	   <td>Total Of Taken Leaves:</td>
	   <td><asp:TextBox ID="Total_Of_Taken_LeavesTextBox" runat="server" numeric="integer"
           Text='<%# Bind("Total_Of_Taken_Leaves") %>' Width="160px" MaxLength="2" /></td>
	   
	   <td></td>
	   <td></td>
	</tr>

    <tr><td align="center" colspan=4>
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
            Calendar_Year:
            <asp:Label ID="Calendar_YearLabel" runat="server" 
                Text='<%# Bind("Calendar_Year") %>' />
            <br />
            OfficeName:
            <asp:Label ID="OfficeNameLabel" runat="server" 
                Text='<%# Bind("OfficeName") %>' />
            <br />
            Employee_Name:
            <asp:Label ID="Employee_NameLabel" runat="server" 
                Text='<%# Bind("Employee_Name") %>' />
            <br />
            Designation:
            <asp:Label ID="DesignationLabel" runat="server" 
                Text='<%# Bind("Designation") %>' />
            <br />
            Casual_SrNo:
            <asp:Label ID="Casual_SrNoLabel" runat="server" 
                Text='<%# Bind("Casual_SrNo") %>' />
            <br />
            C_L_Date:
            <asp:Label ID="C_L_DateLabel" runat="server" 
                Text='<%# Bind("C_L_Date") %>' />
            <br />
            HalfDay_FullDay:
            <asp:Label ID="HalfDay_FullDayLabel" runat="server" 
                Text='<%# Bind("HalfDay_FullDay") %>' />
            <br />
            FirstShift_SecondShift:
            <asp:Label ID="FirstShift_SecondShiftLabel" runat="server" 
                Text='<%# Bind("FirstShift_SecondShift") %>' />
            <br />
            Reasons_Of_Leave:
            <asp:Label ID="Reasons_Of_LeaveLabel" runat="server" 
                Text='<%# Bind("Reasons_Of_Leave") %>' />
            <br />
            Total_Of_Taken_Leaves:
            <asp:Label ID="Total_Of_Taken_LeavesLabel" runat="server" 
                Text='<%# Bind("Total_Of_Taken_Leaves") %>' />
            <br />
            Total_Of_Remaining_Leaves:
            <asp:Label ID="Total_Of_Remaining_LeavesLabel" runat="server" 
                Text='<%# Bind("Total_Of_Remaining_Leaves") %>' />
            <br />
            As_On:
            <asp:Label ID="As_OnLabel" runat="server" Text='<%# Bind("As_On") %>' />
            <br />
            Leave_Approved_Or_Not:
            <asp:CheckBox ID="Leave_Approved_Or_NotCheckBox" runat="server" 
                Checked='<%# Bind("Leave_Approved_Or_Not") %>' Enabled="false" />
            <br />
            Leave_Applicant:
            <asp:Label ID="Leave_ApplicantLabel" runat="server" 
                Text='<%# Bind("Leave_Applicant") %>' />
            <br />
            Leave_Approved_By:
            <asp:Label ID="Leave_Approved_ByLabel" runat="server" 
                Text='<%# Bind("Leave_Approved_By") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
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
    <asp:ObjectDataSource ID="ods_office" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
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
    
    <asp:ObjectDataSource ID="ods_C_L_Card" runat="server" DeleteMethod="DeleteQuery" 
        InsertMethod="Insert" 
        SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.C_L_CardTableAdapters.C_L_CardTableAdapter" 
        UpdateMethod="UpdateQuery" onselecting="ods_C_L_Card_Selecting" 
        ondeleting="ods_C_L_Card_Deleting" >
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Calendar_Year" Type="Int32" />
            <asp:Parameter Name="OfficeName" Type="String" />
            <asp:Parameter Name="Employee_Name" Type="String" />
            <asp:Parameter Name="Designation" Type="String" />
            <asp:Parameter Name="Casual_SrNo" Type="Int32" />
            <asp:Parameter Name="C_L_Date" Type="DateTime" />
            <asp:Parameter Name="HalfDay_FullDay" Type="String" />
            <asp:Parameter Name="FirstShift_SecondShift" Type="String" />
            <asp:Parameter Name="Reasons_Of_Leave" Type="String" />
            <asp:Parameter Name="Total_Of_Taken_Leaves" Type="Int32" />
            <asp:Parameter Name="Total_Of_Remaining_Leaves" Type="Int32" />
            <asp:Parameter Name="As_On" Type="DateTime" />
            <asp:Parameter Name="Leave_Approved_Or_Not" Type="Boolean" />
            <asp:Parameter Name="Leave_Applicant" Type="String" />
            <asp:Parameter Name="Leave_Approved_By" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Calendar_Year" Type="Int32" />
            <asp:Parameter Name="OfficeName" Type="String" />
            <asp:Parameter Name="Employee_Name" Type="String" />
            <asp:Parameter Name="Designation" Type="String" />
            <asp:Parameter Name="Casual_SrNo" Type="Int32" />
            <asp:Parameter Name="C_L_Date" Type="DateTime" />
            <asp:Parameter Name="HalfDay_FullDay" Type="String" />
            <asp:Parameter Name="FirstShift_SecondShift" Type="String" />
            <asp:Parameter Name="Reasons_Of_Leave" Type="String" />
            <asp:Parameter Name="Total_Of_Taken_Leaves" Type="Int32" />
            <asp:Parameter Name="Total_Of_Remaining_Leaves" Type="Int32" />
            <asp:Parameter Name="As_On" Type="DateTime" />
            <asp:Parameter Name="Leave_Approved_Or_Not" Type="Boolean" />
            <asp:Parameter Name="Leave_Applicant" Type="String" />
            <asp:Parameter Name="Leave_Approved_By" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView>
</asp:Content>

