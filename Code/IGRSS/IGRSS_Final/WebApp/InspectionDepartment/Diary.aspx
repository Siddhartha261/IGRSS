<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="Diary.aspx.cs" Inherits="InspectionDepartment_Diary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<script language="javascript">

    function generateDatePicker(id) {
        $('input[id*="' + id + '"]').datepicker({
            showOn: "both",
            buttonImage: "/WebApp/Styles/css/sunny/images/calendar.gif",
            buttonImageOnly: true,
            changeMonth: true,
            changeYear: true,
            yearRange: '1940:2025',
            onClose: function () {
                var dateSelected = $('input[id*="' + id + '"]').datepicker('getDate');
                var dateNow = new Date();
                if (dateSelected > dateNow) {
                    alert("Selected Date is greater than Current date");
                }
            }
        });
    }

    $(function () {
        var datePickers = ["deptdateTextBox", "letterdateTextBox", "reportdate", "closedateTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
 
    
</script>
<asp:MultiView ID="Multiview_Diary" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<hr /><br />
<h1>Diary</h1>
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
                  <asp:GridView ID="GridView_Diary" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_Diary" 
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" />
                          <asp:BoundField DataField="Daysduringmonth" HeaderText="Daysduringmonth" 
                              SortExpression="Daysduringmonth" />
                          <asp:BoundField DataField="TakenLeave" HeaderText="TakenLeave" 
                              SortExpression="TakenLeave" />
                          <asp:BoundField DataField="workingDays" HeaderText="workingDays" 
                              SortExpression="workingDays" />
                          <asp:BoundField DataField="InspectionFromDate" HeaderText="InspectionFromDate" 
                              SortExpression="InspectionFromDate" />
                          <asp:BoundField DataField="InspectionToDate" HeaderText="InspectionToDate" 
                              SortExpression="InspectionToDate" />
                          <asp:BoundField DataField="NoOfOfficeinspected" HeaderText="NoOfOfficeinspected" 
                              SortExpression="NoOfOfficeinspected" />
                          <asp:BoundField DataField="Timetakenduringinspection" HeaderText="Timetakenduringinspection" 
                              SortExpression="Timetakenduringinspection" />
                          <asp:BoundField DataField="NoOfDocuments" HeaderText="NoOfDocuments" 
                              SortExpression="NoOfDocuments" />
                          <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                              SortExpression="Remarks" />
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
<h1>Diary</h1>
<asp:FormView ID="FormView_Diary" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_Diary" EnableModelValidation="True" DefaultMode="Insert" 
        Width="50%" oniteminserting="FormView_Diary_ItemInserting" 
        oniteminserted="FormView_Diary_ItemInserted" >
        <EditItemTemplate>
    <table>
       <tr>
		    <td>Days During Month:</td>
			<td>
                <asp:DropDownList ID="DropDownList_DaysDuringMonth" runat="server">
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                    <asp:ListItem Text="13" Value="13"></asp:ListItem>
                    <asp:ListItem Text="14" Value="14"></asp:ListItem>
                    <asp:ListItem Text="15" Value="15"></asp:ListItem>
                    <asp:ListItem Text="16" Value="16"></asp:ListItem>
                    <asp:ListItem Text="17" Value="17"></asp:ListItem>
                    <asp:ListItem Text="18" Value="18"></asp:ListItem>
                    <asp:ListItem Text="19" Value="19"></asp:ListItem>
                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                    <asp:ListItem Text="21" Value="21"></asp:ListItem>
                    <asp:ListItem Text="22" Value="22"></asp:ListItem>
                    <asp:ListItem Text="23" Value="23"></asp:ListItem>
                    <asp:ListItem Text="24" Value="24"></asp:ListItem>
                    <asp:ListItem Text="25" Value="25"></asp:ListItem>
                    <asp:ListItem Text="26" Value="26"></asp:ListItem>
                    <asp:ListItem Text="27" Value="27"></asp:ListItem>
                    <asp:ListItem Text="28" Value="28"></asp:ListItem>
                    <asp:ListItem Text="29" Value="29"></asp:ListItem>
                    <asp:ListItem Text="30" Value="30"></asp:ListItem>
                    <asp:ListItem Text="31" Value="31"></asp:ListItem>
                </asp:DropDownList>
            </td>
		</tr>		
        
        <tr>
		    <td>Taken Leave:</td>
			<td><asp:TextBox ID="TakenLeaveTextBox" runat="server" 
            Text='<%# Bind("TakenLeave") %>' Width="160px" /></td>
		</tr>        
        
        <tr>
		    <td>Working Days:</td>
			<td><asp:TextBox ID="workingDaysTextBox" runat="server" 
            Text='<%# Bind("workingDays") %>' Width="160px" /></td>
		</tr>        
        
        <tr>
		    <td>Inspection From Date:</td>
			<td><asp:TextBox ID="InspectionFromDateTextBox" runat="server" 
            Text='<%# Bind("InspectionFromDate") %>' Width="160px" /></td>
		</tr>        
        
        <tr>
		    <td>Inspection To Date:</td>
			<td><asp:TextBox ID="InspectionToDateTextBox" runat="server" 
            Text='<%# Bind("InspectionToDate") %>' Width="160px" /></td>
		</tr>        
        
        <tr>
		    <td>No Of Office Inspected:</td>
			<td><asp:ListBox ID="ListBox_officename" runat="server" 
            DataSourceID="ods_officesmaster" DataTextField="OfficeName" 
            DataValueField="OfficeId" Width="160px"></asp:ListBox></td>
		</tr>        
        
        <tr>
		    <td>Time Taken During Inspection:</td>
			<td><asp:TextBox ID="NoOfOfficeinspectedTextBox" runat="server" 
            Text='<%# Bind("NoOfOfficeinspected") %>' Width="160px" /></td>
		</tr>        
        
        <tr>
		    <td>No Of Documents:</td>
			<td><asp:TextBox ID="TimetakenduringinspectionTextBox" runat="server" 
            Text='<%# Bind("Timetakenduringinspection") %>' Width="160px" /></td>
		</tr>        
        
        <tr>
		    <td>Remarks:</td>
			<td><asp:TextBox ID="NoOfDocumentsTextBox" runat="server" 
            Text='<%# Bind("NoOfDocuments") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
		</tr>     
        
        <tr><td colspan="2"><asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
            CommandName="Update" Text="Update" />
&nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="False" CommandName="Reset" 
            Text="Reset" />			
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Back" 
            Text="Back" /></td>
		</tr>        
	</table>		
        </EditItemTemplate>
        <InsertItemTemplate>
            <table>
        <tr>
		    <td>Days During Month:</td>
			<td>
                <asp:DropDownList ID="DropDownList_DaysDuringMonth" runat="server">
                    <asp:ListItem Text="1" Value="1"></asp:ListItem>
                    <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    <asp:ListItem Text="3" Value="3"></asp:ListItem>
                    <asp:ListItem Text="4" Value="4"></asp:ListItem>
                    <asp:ListItem Text="5" Value="5"></asp:ListItem>
                    <asp:ListItem Text="6" Value="6"></asp:ListItem>
                    <asp:ListItem Text="7" Value="7"></asp:ListItem>
                    <asp:ListItem Text="8" Value="8"></asp:ListItem>
                    <asp:ListItem Text="9" Value="9"></asp:ListItem>
                    <asp:ListItem Text="10" Value="10"></asp:ListItem>
                    <asp:ListItem Text="11" Value="11"></asp:ListItem>
                    <asp:ListItem Text="12" Value="12"></asp:ListItem>
                    <asp:ListItem Text="13" Value="13"></asp:ListItem>
                    <asp:ListItem Text="14" Value="14"></asp:ListItem>
                    <asp:ListItem Text="15" Value="15"></asp:ListItem>
                    <asp:ListItem Text="16" Value="16"></asp:ListItem>
                    <asp:ListItem Text="17" Value="17"></asp:ListItem>
                    <asp:ListItem Text="18" Value="18"></asp:ListItem>
                    <asp:ListItem Text="19" Value="19"></asp:ListItem>
                    <asp:ListItem Text="20" Value="20"></asp:ListItem>
                    <asp:ListItem Text="21" Value="21"></asp:ListItem>
                    <asp:ListItem Text="22" Value="22"></asp:ListItem>
                    <asp:ListItem Text="23" Value="23"></asp:ListItem>
                    <asp:ListItem Text="24" Value="24"></asp:ListItem>
                    <asp:ListItem Text="25" Value="25"></asp:ListItem>
                    <asp:ListItem Text="26" Value="26"></asp:ListItem>
                    <asp:ListItem Text="27" Value="27"></asp:ListItem>
                    <asp:ListItem Text="28" Value="28"></asp:ListItem>
                    <asp:ListItem Text="29" Value="29"></asp:ListItem>
                    <asp:ListItem Text="30" Value="30"></asp:ListItem>
                    <asp:ListItem Text="31" Value="31"></asp:ListItem>
                </asp:DropDownList>
            </td>
		</tr>		
        
        <tr>
		    <td>Taken Leave:</td>
			<td><asp:TextBox ID="TakenLeaveTextBox" runat="server" 
            Text='<%# Bind("TakenLeave") %>' Width="160px" /></td>
		</tr>        
        
        <tr>
		    <td>Working Days:</td>
			<td><asp:TextBox ID="workingDaysTextBox" runat="server" 
            Text='<%# Bind("workingDays") %>' Width="160px" /></td>
		</tr>        
        
        <tr>
		    <td>Inspection From Date:</td>
			<td><asp:TextBox ID="InspectionFromDateTextBox" runat="server" 
            Text='<%# Bind("InspectionFromDate") %>' Width="160px" /></td>
		</tr>        
        
        <tr>
		    <td>Inspection To Date:</td>
			<td><asp:TextBox ID="InspectionToDateTextBox" runat="server" 
            Text='<%# Bind("InspectionToDate") %>' Width="160px" /></td>
		</tr>        
        
        <tr>
		    <td>No Of Office Inspected:</td>
			<td><asp:ListBox ID="ListBox_officename" runat="server" 
            DataSourceID="ods_officesmaster" DataTextField="OfficeName" 
            DataValueField="OfficeId" Width="160px"></asp:ListBox></td>
		</tr>        
        
        <tr>
		    <td>Time Taken During Inspection:</td>
			<td><asp:TextBox ID="NoOfOfficeinspectedTextBox" runat="server" 
            Text='<%# Bind("NoOfOfficeinspected") %>' Width="160px" /></td>
		</tr>        
        
        <tr>
		    <td>No Of Documents:</td>
			<td><asp:TextBox ID="TimetakenduringinspectionTextBox" runat="server" 
            Text='<%# Bind("Timetakenduringinspection") %>' Width="160px" /></td>
		</tr>        
        
        <tr>
		    <td>Remarks:</td>
			<td><asp:TextBox ID="NoOfDocumentsTextBox" runat="server" 
            Text='<%# Bind("NoOfDocuments") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
		</tr>        
        
        <tr><td colspan="2"><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
            CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="False" CommandName="Reset" 
            Text="Reset" />			
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Back" 
            Text="Back" /></td>
		</tr>        
	</table>		
            
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            Daysduringmonth:
            <asp:Label ID="DaysduringmonthLabel" runat="server" 
                Text='<%# Bind("Daysduringmonth") %>' />
            <br />
            TakenLeave:
            <asp:Label ID="TakenLeaveLabel" runat="server" 
                Text='<%# Bind("TakenLeave") %>' />
            <br />
            workingDays:
            <asp:Label ID="workingDaysLabel" runat="server" 
                Text='<%# Bind("workingDays") %>' />
            <br />
            InspectionFromDate:
            <asp:Label ID="InspectionFromDateLabel" runat="server" 
                Text='<%# Bind("InspectionFromDate") %>' />
            <br />
            InspectionToDate:
            <asp:Label ID="InspectionToDateLabel" runat="server" 
                Text='<%# Bind("InspectionToDate") %>' />
            <br />
            NoOfOfficeinspected:
            <asp:Label ID="NoOfOfficeinspectedLabel" runat="server" 
                Text='<%# Bind("NoOfOfficeinspected") %>' />
            <br />
            Timetakenduringinspection:
            <asp:Label ID="TimetakenduringinspectionLabel" runat="server" 
                Text='<%# Bind("Timetakenduringinspection") %>' />
            <br />
            NoOfDocuments:
            <asp:Label ID="NoOfDocumentsLabel" runat="server" 
                Text='<%# Bind("NoOfDocuments") %>' />
            <br />
            Remarks:
            <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
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
    
    <asp:ObjectDataSource ID="ods_Diary" runat="server" DeleteMethod="Delete" 
        InsertMethod="InsertQuery" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.DiaryTableAdapters.DiaryTableAdapter" 
        UpdateMethod="Update" oninserted="ods_Diary_Inserted" >
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Daysduringmonth" Type="Int32" />
            <asp:Parameter Name="Original_TakenLeave" Type="Int32" />
            <asp:Parameter Name="Original_workingDays" Type="Int32" />
            <asp:Parameter Name="Original_InspectionFromDate" Type="DateTime" />
            <asp:Parameter Name="Original_InspectionToDate" Type="DateTime" />
            <asp:Parameter Name="Original_NoOfOfficeinspected" Type="Int32" />
            <asp:Parameter Name="Original_Timetakenduringinspection" Type="Int32" />
            <asp:Parameter Name="Original_NoOfDocuments" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Daysduringmonth" Type="Int32" />
            <asp:Parameter Name="TakenLeave" Type="Int32" />
            <asp:Parameter Name="workingDays" Type="Int32" />
            <asp:Parameter Name="InspectionFromDate" Type="DateTime" />
            <asp:Parameter Name="InspectionToDate" Type="DateTime" />
            <asp:Parameter Name="NoOfOfficeinspected" Type="Int32" />
            <asp:Parameter Name="Timetakenduringinspection" Type="Int32" />
            <asp:Parameter Name="NoOfDocuments" Type="Int32" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Daysduringmonth" Type="Int32" />
            <asp:Parameter Name="TakenLeave" Type="Int32" />
            <asp:Parameter Name="workingDays" Type="Int32" />
            <asp:Parameter Name="InspectionFromDate" Type="DateTime" />
            <asp:Parameter Name="InspectionToDate" Type="DateTime" />
            <asp:Parameter Name="NoOfOfficeinspected" Type="Int32" />
            <asp:Parameter Name="Timetakenduringinspection" Type="Int32" />
            <asp:Parameter Name="NoOfDocuments" Type="Int32" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Daysduringmonth" Type="Int32" />
            <asp:Parameter Name="Original_TakenLeave" Type="Int32" />
            <asp:Parameter Name="Original_workingDays" Type="Int32" />
            <asp:Parameter Name="Original_InspectionFromDate" Type="DateTime" />
            <asp:Parameter Name="Original_InspectionToDate" Type="DateTime" />
            <asp:Parameter Name="Original_NoOfOfficeinspected" Type="Int32" />
            <asp:Parameter Name="Original_Timetakenduringinspection" Type="Int32" />
            <asp:Parameter Name="Original_NoOfDocuments" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_officesmaster" runat="server" 
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
            <asp:Parameter DbType="Guid" Name="OfficeId" />
            <asp:Parameter Name="OfficeName" Type="String" />
            <asp:Parameter DbType="Guid" Name="Original_OfficeId" />
            <asp:Parameter Name="Original_OfficeName" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_DiaryOfficeDetails" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.DiaryOfficeDetailsTableAdapters.DiaryOfficeDetailsTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_DiaryID" Type="Int32" />
            <asp:Parameter DbType="Guid" Name="Original_OfficeID" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DiaryID" Type="Int32" />
            <asp:Parameter DbType="Guid" Name="OfficeID" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DiaryID" Type="Int32" />
            <asp:Parameter DbType="Guid" Name="OfficeID" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_DiaryID" Type="Int32" />
            <asp:Parameter DbType="Guid" Name="Original_OfficeID" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server">
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView>
</asp:Content>

