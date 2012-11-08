<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="VigilanceRegister.aspx.cs" Inherits="LatestPages_VigilanceRegister" %>

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
          $('input[id*="InwardNoTextBox"]').keydown(function (event) {
              // Allow: backspace, delete, tab, escape, and enter
              if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 ||
              // Allow: Ctrl+A
            (event.keyCode == 65 && event.ctrlKey === true) ||
              // Allow: home, end, left, right
            (event.keyCode >= 35 && event.keyCode <= 39)) {
                  // let it happen, don't do anything
                  return;
              }
              else {
                  // Ensure that it is a number and stop the keypress
                  if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                      event.preventDefault();
                  }
              }
          });

          $('input[id*="InwardNoTextBox"]').blur(function () {
              if (isNaN($('input[id*="InwardNoTextBox"]').val()) || $('input[id*="InwardNoTextBox"]').val().length == 0) { $('input[id*="InwardNoTextBox"]').val(''); return; }
              var formattedNumber = 'IGR\/' + $('input[id*="InwardNoTextBox"]').val() + '\/' + new Date().getFullYear();
              $('input[id*="InwardNoTextBox"]').val(formattedNumber.toString());
          });

          var datePickers = ["deptdateTextBox", "letterdateTextBox", "reportdateTextBox","closedateTextBox"];
          for (var index = 0; index < datePickers.length; index++) {
              generateDatePicker(datePickers[index]);
          }
      });
</script>
<asp:MultiView ID="Multiview_Vigilance" runat="server" ActiveViewIndex="0">
<asp:View ID="view1_GridView" runat="server">
<hr /><br />
<h1>vigilance register</h1>
<table>
          <tr>
          <td align="right">
          <table>
                    <tr>
                        <td align="right" style="width:641px;">
                            <asp:Label ID="lbllls" runat="server" meta:resourcekey="lblllsResource1" 
                                Text="Enter File Number :"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtFileNo" runat="server" 
                                meta:resourcekey="txtFileNoResource1" Width="160"></asp:TextBox>
                        </td>
                        <td align="right">
                            <asp:LinkButton ID="btnSearchAppNo" runat="server" CssClass="standardButton" 
                                meta:resourcekey="btnSearchAppNoResource1" Text="Search" />
                        </td>
                    </tr>
                    </table>
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_SOFile" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_Vigilance" 
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" />
                          <asp:BoundField DataField="Letterno" HeaderText="Letterno" 
                              SortExpression="Letterno" />
                          <asp:BoundField DataField="deptdate" HeaderText="deptdate" 
                              SortExpression="deptdate" />
                          <asp:BoundField DataField="letterdate" HeaderText="letterdate" 
                              SortExpression="letterdate" />
                          <asp:BoundField DataField="applname" HeaderText="applname" 
                              SortExpression="applname" />
                          <asp:BoundField DataField="empname" HeaderText="empname" 
                              SortExpression="empname" />
                          <asp:BoundField DataField="emp_desig" HeaderText="emp_desig" 
                              SortExpression="emp_desig" />
                          <asp:BoundField DataField="applsummary" HeaderText="applsummary" 
                              SortExpression="applsummary" />
                          <asp:BoundField DataField="reportdate" HeaderText="reportdate" 
                              SortExpression="reportdate" />
                          <asp:BoundField DataField="Status" HeaderText="Status" 
                              SortExpression="Status" />
                          <asp:BoundField DataField="closedate" HeaderText="closedate" 
                              SortExpression="closedate" />
                          <asp:BoundField DataField="remarks" HeaderText="remarks" 
                              SortExpression="remarks" />
                      </Columns>
                  </asp:GridView>
              </td>
          </tr>
 </table>
 <asp:LinkButton ID="Button_new" runat="server" Text="New" 
        onclick="Button_new_Click" CssClass="standardButton" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</asp:View>

<asp:View ID="view2_Formview" runat="server">
<center>
<h1>vigilance register</h1>
    <asp:FormView ID="FormView_Vigilance" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_Vigilance" DefaultMode="Insert" 
        EnableModelValidation="True" 
        onitemcommand="FormView_Vigilance_ItemCommand">

        <EditItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel1" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            Letterno:
            <asp:TextBox ID="LetternoTextBox" runat="server" 
                Text='<%# Bind("Letterno") %>' />
            <br />
            deptdate:
            <asp:TextBox ID="deptdateTextBox" runat="server" 
                Text='<%# Bind("deptdate") %>' />
            <br />
            letterdate:
            <asp:TextBox ID="letterdateTextBox" runat="server" 
                Text='<%# Bind("letterdate") %>' />
            <br />
            applname:
            <asp:TextBox ID="applnameTextBox" runat="server" 
                Text='<%# Bind("applname") %>' />
            <br />
            empname:
            <asp:TextBox ID="empnameTextBox" runat="server" Text='<%# Bind("empname") %>' />
            <br />
            emp_desig:
            <asp:TextBox ID="emp_desigTextBox" runat="server" 
                Text='<%# Bind("emp_desig") %>' />
            <br />
            applsummary:
            <asp:TextBox ID="applsummaryTextBox" runat="server" 
                Text='<%# Bind("applsummary") %>' />
            <br />
            reportdate:
            <asp:TextBox ID="reportdateTextBox" runat="server" 
                Text='<%# Bind("reportdate") %>' />
            <br />
            Status:
            <asp:TextBox ID="StatusTextBox" runat="server" Text='<%# Bind("Status") %>' />
            <br />
            closedate:
            <asp:TextBox ID="closedateTextBox" runat="server" 
                Text='<%# Bind("closedate") %>' />
            <br />
            remarks:
            <asp:TextBox ID="remarksTextBox" runat="server" Text='<%# Bind("remarks") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
                 <table align="center" cellspacing="5">
    <tr><td>Letter No:</td>
        <td><asp:TextBox ID="LetternoTextBox" runat="server" 
                Text='<%# Bind("Letterno") %>' Width="160px" /></td>
	</tr>
            
            
            <tr><td>Department Date:</td>
			<td> 
                <asp:TextBox ID="deptdateTextBox" runat="server" 
                Text='<%# Bind("deptdate") %>' Width="160px" /></td></tr>
            
           
            <tr><td>Date OF Letter Received:</td><td>
                <asp:TextBox ID="letterdateTextBox" runat="server" 
                Text='<%# Bind("letterdate") %>' Width="160px" /></td></tr>
            
            
            <tr><td>Name Of Applicant:</td><td>
                <asp:TextBox ID="applnameTextBox" runat="server" 
                Text='<%# Bind("applname") %>' Width="160px" /></td></tr>
            
            <tr><td> Name Of Employee:</td><td><asp:TextBox ID="empnameTextBox" runat="server" 
                    Text='<%# Bind("empname") %>' Width="160px" /></td></tr>
           
            
            <tr><td> Designation Of Employee:</td><td> 
                <asp:TextBox ID="emp_desigTextBox" runat="server" 
                Text='<%# Bind("emp_desig") %>' Width="160px" /></td></tr>
           
           
            <tr><td>Application Summary:</td><td> 
                <asp:TextBox ID="applsummaryTextBox" runat="server" 
                Text='<%# Bind("applsummary") %>' Height="60px" Width="160px" /></td></tr>
            
           
            <tr><td>Date of Sending Report:</td><td> 
                <asp:TextBox ID="reportdateTextBox" runat="server" 
                Text='<%# Bind("reportdate") %>' Width="160px" /></td></tr>
            
           
            <tr><td>Latest Status:</td><td> <asp:TextBox ID="StatusTextBox" runat="server" 
                    Text='<%# Bind("Status") %>' Width="160px" /></td></tr>
            
           
            <tr><td>File Closing Date:</td><td> 
                <asp:TextBox ID="closedateTextBox" runat="server" 
                Text='<%# Bind("closedate") %>' Width="160px" /></td></tr>
            
           
            <tr><td>Remarks:</td><td><asp:TextBox ID="remarksTextBox" runat="server" 
                    Text='<%# Bind("remarks") %>' Height="60px" Width="160px" /></td></tr>
            
            
            <tr>
            <td align="center" colspan="2"> 
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" CssClass="standardButton" />
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" />
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
            Letterno:
            <asp:Label ID="LetternoLabel" runat="server" Text='<%# Bind("Letterno") %>' />
            <br />
            deptdate:
            <asp:Label ID="deptdateLabel" runat="server" Text='<%# Bind("deptdate") %>' />
            <br />
            letterdate:
            <asp:Label ID="letterdateLabel" runat="server" 
                Text='<%# Bind("letterdate") %>' />
            <br />
            applname:
            <asp:Label ID="applnameLabel" runat="server" Text='<%# Bind("applname") %>' />
            <br />
            empname:
            <asp:Label ID="empnameLabel" runat="server" Text='<%# Bind("empname") %>' />
            <br />
            emp_desig:
            <asp:Label ID="emp_desigLabel" runat="server" Text='<%# Bind("emp_desig") %>' />
            <br />
            applsummary:
            <asp:Label ID="applsummaryLabel" runat="server" 
                Text='<%# Bind("applsummary") %>' />
            <br />
            reportdate:
            <asp:Label ID="reportdateLabel" runat="server" 
                Text='<%# Bind("reportdate") %>' />
            <br />
            Status:
            <asp:Label ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' />
            <br />
            closedate:
            <asp:Label ID="closedateLabel" runat="server" Text='<%# Bind("closedate") %>' />
            <br />
            remarks:
            <asp:Label ID="remarksLabel" runat="server" Text='<%# Bind("remarks") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.DataSetDepartmentTableAdapters.DepartmentMasterTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter DbType="Guid" Name="Original_DepartmentID" />
            <asp:Parameter Name="Original_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Guid" Name="DepartmentID" />
            <asp:Parameter Name="Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter DbType="Guid" Name="Original_DepartmentID" />
            <asp:Parameter Name="Original_Name" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</center>
    
    <asp:ObjectDataSource ID="ods_Vigilance" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.VilliganceRegisterTableAdapters.VigilanceTableAdapter" 
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" 
        onselecting=ods_Vigilance_Selecting>
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Letterno" Type="Int32" />
            <asp:Parameter Name="Original_deptdate" Type="DateTime" />
            <asp:Parameter Name="Original_letterdate" Type="DateTime" />
            <asp:Parameter Name="Original_applname" Type="String" />
            <asp:Parameter Name="Original_empname" Type="String" />
            <asp:Parameter Name="Original_emp_desig" Type="String" />
            <asp:Parameter Name="Original_reportdate" Type="DateTime" />
            <asp:Parameter Name="Original_Status" Type="String" />
            <asp:Parameter Name="Original_closedate" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Letterno" Type="Int32" />
            <asp:Parameter Name="deptdate" Type="DateTime" />
            <asp:Parameter Name="letterdate" Type="DateTime" />
            <asp:Parameter Name="applname" Type="String" />
            <asp:Parameter Name="empname" Type="String" />
            <asp:Parameter Name="emp_desig" Type="String" />
            <asp:Parameter Name="applsummary" Type="String" />
            <asp:Parameter Name="reportdate" Type="DateTime" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="closedate" Type="DateTime" />
            <asp:Parameter Name="remarks" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Letterno" Type="Int32" />
            <asp:Parameter Name="deptdate" Type="DateTime" />
            <asp:Parameter Name="letterdate" Type="DateTime" />
            <asp:Parameter Name="applname" Type="String" />
            <asp:Parameter Name="empname" Type="String" />
            <asp:Parameter Name="emp_desig" Type="String" />
            <asp:Parameter Name="applsummary" Type="String" />
            <asp:Parameter Name="reportdate" Type="DateTime" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="closedate" Type="DateTime" />
            <asp:Parameter Name="remarks" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Letterno" Type="Int32" />
            <asp:Parameter Name="Original_deptdate" Type="DateTime" />
            <asp:Parameter Name="Original_letterdate" Type="DateTime" />
            <asp:Parameter Name="Original_applname" Type="String" />
            <asp:Parameter Name="Original_empname" Type="String" />
            <asp:Parameter Name="Original_emp_desig" Type="String" />
            <asp:Parameter Name="Original_reportdate" Type="DateTime" />
            <asp:Parameter Name="Original_Status" Type="String" />
            <asp:Parameter Name="Original_closedate" Type="DateTime" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>

