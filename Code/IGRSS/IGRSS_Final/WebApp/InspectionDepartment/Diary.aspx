<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="Diary.aspx.cs" Inherits="InspectionDepartment_Diary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<script language="javascript">

    function generateDatePicker(id) {
        $('input[id*="' + id + '"]').datepicker({
            showOn: "both",
            buttonImage: "/WebApp/Styles/css/sunny/images/calendar.gif",
            buttonImageOnly: true
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
                          <asp:ButtonField CommandName="Update" Text="Update" />
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
                           SrNo:
                           <asp:Label ID="SrNoLabel1" runat="server" Text='<%# Eval("SrNo") %>' />
                           <br />
                           Daysduringmonth:
                           <asp:TextBox ID="DaysduringmonthTextBox" runat="server" 
                               Text='<%# Bind("Daysduringmonth") %>' />
                           <br />
                           TakenLeave:
                           <asp:TextBox ID="TakenLeaveTextBox" runat="server" 
                               Text='<%# Bind("TakenLeave") %>' />
                           <br />
                           workingDays:
                           <asp:TextBox ID="workingDaysTextBox" runat="server" 
                               Text='<%# Bind("workingDays") %>' />
                           <br />
                           InspectionFromDate:
                           <asp:TextBox ID="InspectionFromDateTextBox" runat="server" 
                               Text='<%# Bind("InspectionFromDate") %>' />
                           <br />
                           InspectionToDate:
                           <asp:TextBox ID="InspectionToDateTextBox" runat="server" 
                               Text='<%# Bind("InspectionToDate") %>' />
                           <br />
                           NoOfOfficeinspected:
                           <asp:ListBox ID="ListBox_officename" runat="server" 
                               DataSourceID="ods_officesmaster" DataTextField="OfficeName" 
                               DataValueField="OfficeId"></asp:ListBox>
                           <br />
                           Timetakenduringinspection:
                           <asp:TextBox ID="TimetakenduringinspectionTextBox" runat="server" 
                               Text='<%# Bind("Timetakenduringinspection") %>' />
                           <br />
                           NoOfDocuments:
                           <asp:TextBox ID="NoOfDocumentsTextBox" runat="server" 
                               Text='<%# Bind("NoOfDocuments") %>' />
                           <br />
                           Remarks:
                           <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
                           <br />
                           <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                               CommandName="Update" Text="Update" />
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" 
                               Text="Cancel" />
            
        </EditItemTemplate>
        <InsertItemTemplate>
                           Daysduringmonth:
                           <asp:TextBox ID="DaysduringmonthTextBox" runat="server" 
                               Text='<%# Bind("Daysduringmonth") %>' />
                           <br />
                           TakenLeave:
                           <asp:TextBox ID="TakenLeaveTextBox" runat="server" 
                               Text='<%# Bind("TakenLeave") %>' />
                           <br />
                           workingDays:
                           <asp:TextBox ID="workingDaysTextBox" runat="server" 
                               Text='<%# Bind("workingDays") %>' />
                           <br />
                           InspectionFromDate:
                           <asp:TextBox ID="InspectionFromDateTextBox" runat="server" 
                               Text='<%# Bind("InspectionFromDate") %>' />
                           <br />
                           InspectionToDate:
                           <asp:TextBox ID="InspectionToDateTextBox" runat="server" 
                               Text='<%# Bind("InspectionToDate") %>' />
                           <br />
                           NoOfOfficeinspected:
                           <asp:ListBox ID="ListBox_officename" runat="server" 
                               DataSourceID="ods_officesmaster" DataTextField="OfficeName" 
                               DataValueField="OfficeId"></asp:ListBox>
                           <br />
                           Timetakenduringinspection:
                           <asp:TextBox ID="NoOfOfficeinspectedTextBox" runat="server" 
                               Text='<%# Bind("NoOfOfficeinspected") %>' />
                           <br />
                           NoOfDocuments:
                           <asp:TextBox ID="TimetakenduringinspectionTextBox" runat="server" 
                               Text='<%# Bind("Timetakenduringinspection") %>' />
                           <br />
                           Remarks:
                           <asp:TextBox ID="NoOfDocumentsTextBox" runat="server" 
                               Text='<%# Bind("NoOfDocuments") %>' />
                           <br />
                           <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                               CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" 
                               Text="Cancel" />
            
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

