<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="Departmental_Inquiry_Register.aspx.cs" Inherits="Establishment_Department_Departmental_Inquiry_Register" %>

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
        var datePickers = ["Date_Of_Charge_SheetTextBox", "DateTextBox", "Date_Of_Inquiry_SubmissionTextBox", "Date_Of_Receiving_Inquiry_ReportTextBox"];
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

<asp:MultiView ID="Multiview_Departmental_Inquiry_Register" runat="server" 
        ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<hr /><br />
<h1>Departmental Inquiry Register</h1>
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
                  <asp:GridView ID="GridView_Departmental_Inquiry_Register" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_Departmental_Inquiry_Register" 
                      EnableModelValidation="True" 
                      onrowdeleted="GridView_Departmental_Inquiry_Register_RowDeleted" 
                      onrowdeleting="GridView_Departmental_Inquiry_Register_RowDeleting" 
                      onrowediting="GridView_Departmental_Inquiry_Register_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="FileNo" HeaderText="File No" 
                              SortExpression="FileNo" />
                          <asp:BoundField DataField="Grade" HeaderText="Grade" 
                              SortExpression="Grade" />
                          <asp:BoundField DataField="Subject" HeaderText="Subject" 
                              SortExpression="Subject" />
                          <asp:BoundField DataField="Date_Of_Charge_Sheet" HeaderText="Date Of Charge Sheet" 
                              SortExpression="Date_Of_Charge_Sheet" />
                          <asp:BoundField DataField="Name_Of_Employee" HeaderText="Name Of Employee" 
                              SortExpression="Name_Of_Employee" />
                          <asp:BoundField DataField="Government_Department" HeaderText="Government Department" 
                              SortExpression="Government_Department" Visible="False" />
                          <asp:BoundField DataField="Date" HeaderText="Date" 
                              SortExpression="Date" Visible="False" />
                          <asp:BoundField DataField="Name_Of_Inquiry_Officer" HeaderText="Name Of Inquiry Officer" 
                              SortExpression="Name_Of_Inquiry_Officer" />
                          <asp:BoundField DataField="Date_Of_Inquiry_Submission" HeaderText="Date Of Inquiry Submission" 
                              SortExpression="Date_Of_Inquiry_Submission" />
                          <asp:BoundField DataField="Date_Of_Receiving_Inquiry_Report" 
                              HeaderText="Date Of Receiving Inquiry Report" 
                              SortExpression="Date_Of_Receiving_Inquiry_Report" />
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
 <asp:LinkButton ID="Button_new" runat="server" Text="New" AccessKey="n" 
        onclick="Button_new_Click" CssClass="standardButton" />
</asp:View>
<asp:View ID="Formview" runat="server">

<h1>Departmental Inquiry Register</h1>
<asp:FormView ID="FormView_Departmental_Inquiry_Register" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_Departmental_Inquiry_Register" EnableModelValidation="True" 
        DefaultMode="Insert" 
        onitemcommand="FormView_Departmental_Inquiry_Register_ItemCommand" 
        oniteminserting="FormView_Departmental_Inquiry_Register_ItemInserting" 
        oniteminserted="FormView_Departmental_Inquiry_Register_ItemInserted" 
        onitemupdated="FormView_Departmental_Inquiry_Register_ItemUpdated" 
        onitemupdating="FormView_Departmental_Inquiry_Register_ItemUpdating" >
        <EditItemTemplate>
                        <table align="center">
            <tr align="left">
			   <td>File No:</td>
			    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
			   <td><asp:TextBox ID="FileNoTextBox" runat="server" numeric="integer" Text='<%# Bind("FileNo") %>' 
                       Width="160px" MaxLength="10" /></td>
			</tr>
			
            <tr align="left">
			    <td>Grade:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="DropDownList_Grade" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td>
                    <asp:DropDownList ID="DropDownList_Grade" runat="server" 
                        DataSourceID="ods_Grade" DataTextField="Grade_Name" DataValueField="Grade_Name" 
                        Width="160px">
                    </asp:DropDownList>
                </td>
			</tr>             
                
            <tr align="left">
			    <td>Subject:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="SubjectTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td><asp:TextBox ID="SubjectTextBox" runat="server" onkeypress="return AllowAlphabet(event)" Text='<%# Bind("Subject") %>' 
                        Width="160px" MaxLength="20" /></td>
			</tr>             
                
            <tr align="left">
			    <td>Date Of Charge Sheet:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="Date_Of_Charge_SheetTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td><asp:TextBox ID="Date_Of_Charge_SheetTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Charge_Sheet") %>' Width="160px" /></td>
			</tr>             
                
            <tr align="left">
			    <td>Name Of Employee:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="DropDownList_employeename" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td>
                    <asp:DropDownList ID="DropDownList_employeename" runat="server" 
                        DataSourceID="ods_employeename" DataTextField="Employee_Name" 
                        DataValueField="Employee_Name">
                    </asp:DropDownList>
                </td>
			</tr>              
                
            <tr align="left">
			    <td>Whether Case Is Pending In Government/Department:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="RadioButtonList_Govt_Dept" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td>
                    <asp:RadioButtonList ID="RadioButtonList_Govt_Dept" runat="server" 
                        RepeatDirection="Horizontal" Width="60px">
                        <asp:ListItem>Government</asp:ListItem>
                        <asp:ListItem>Department</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
			</tr>               
                
            <tr align="left">
			    <td>Date:</td>
				<td>
                    &nbsp;</td>
				<td><asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' 
                        Width="160px" /></td>
			</tr>              
                
            <tr align="left">
			    <td>Name Of Inquiry Officer:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="DropDownList_InquiryOfficer" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td>
                    <asp:DropDownList ID="DropDownList_InquiryOfficer" runat="server" 
                        DataSourceID="ods_InquiryOfficer" DataTextField="Inquiry_OfficerName" 
                        DataValueField="Inquiry_OfficerName" Width="160px">
                    </asp:DropDownList>
                </td>
			</tr>              
                
            <tr align="left">
			    <td>Date Of Inquiry Submission:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="Date_Of_Inquiry_SubmissionTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td><asp:TextBox ID="Date_Of_Inquiry_SubmissionTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Inquiry_Submission") %>' Width="160px" /></td>
			</tr>              
                
            <tr align="left">
			    <td>Date Of Receiving Inquiry Report:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="Date_Of_Receiving_Inquiry_ReportTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td><asp:TextBox ID="Date_Of_Receiving_Inquiry_ReportTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Receiving_Inquiry_Report") %>' Width="160px" /></td>
			</tr>               
                
            <tr align="left">
			    <td>Remarks:</td>
				<td>
                    &nbsp;</td>
				<td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                        Height="60px" Width="160px" /></td>
			</tr>               
                
            <tr><td align="center" colspan=2>
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
                        <table align="center">
            <tr align="left">
			   <td>File No:</td>
			    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
			   <td><asp:TextBox ID="FileNoTextBox" runat="server" numeric="integer" Text='<%# Bind("FileNo") %>' 
                       Width="160px" MaxLength="10" /></td>
			</tr>
			
            <tr align="left">
			    <td>Grade:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="DropDownList_Grade" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td>
                    <asp:DropDownList ID="DropDownList_Grade" runat="server" 
                        DataSourceID="ods_Grade" DataTextField="Grade_Name" DataValueField="Grade_Name" 
                        Width="160px">
                    </asp:DropDownList>
                </td>
			</tr>             
                
            <tr align="left">
			    <td>Subject:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="SubjectTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td><asp:TextBox ID="SubjectTextBox" runat="server" onkeypress="return AllowAlphabet(event)" Text='<%# Bind("Subject") %>' 
                        Width="160px" MaxLength="20" /></td>
			</tr>             
                
            <tr align="left">
			    <td>Date Of Charge Sheet:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="Date_Of_Charge_SheetTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td><asp:TextBox ID="Date_Of_Charge_SheetTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Charge_Sheet") %>' Width="160px" /></td>
			</tr>             
                
            <tr align="left">
			    <td>Name Of Employee:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="DropDownList_employeename" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td>
                    <asp:DropDownList ID="DropDownList_employeename" runat="server" 
                        DataSourceID="ods_employeename" DataTextField="Employee_Name" 
                        DataValueField="Employee_Name">
                    </asp:DropDownList>
                </td>
			</tr>              
                
            <tr align="left">
			    <td>Whether Case Is Pending In Government/Department:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="RadioButtonList_Govt_Dept" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td>
                    <asp:RadioButtonList ID="RadioButtonList_Govt_Dept" runat="server" 
                        RepeatDirection="Horizontal" Width="60px">
                        <asp:ListItem>Government</asp:ListItem>
                        <asp:ListItem>Department</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
			</tr>               
                
            <tr align="left">
			    <td>Date:</td>
				<td>
                    &nbsp;</td>
				<td><asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' 
                        Width="160px" /></td>
			</tr>              
                
            <tr align="left">
			    <td>Name Of Inquiry Officer:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="DropDownList_InquiryOfficer" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td>
                    <asp:DropDownList ID="DropDownList_InquiryOfficer" runat="server"
                        DataSourceID="ods_InquiryOfficer" DataTextField="Inquiry_OfficerName" 
                        DataValueField="Inquiry_OfficerName" Width="160px">
                    </asp:DropDownList>
                </td>
			</tr>              
                
            <tr align="left">
			    <td>Date Of Inquiry Submission:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="Date_Of_Inquiry_SubmissionTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td><asp:TextBox ID="Date_Of_Inquiry_SubmissionTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Inquiry_Submission") %>' Width="160px" /></td>
			</tr>              
                
            <tr align="left">
			    <td>Date Of Receiving Inquiry Report:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="Date_Of_Receiving_Inquiry_ReportTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td><asp:TextBox ID="Date_Of_Receiving_Inquiry_ReportTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Receiving_Inquiry_Report") %>' Width="160px" /></td>
			</tr>               
                
            <tr align="left">
			    <td>Remarks:</td>
				<td>
                    &nbsp;</td>
				<td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                        Height="60px" Width="160px" /></td>
			</tr>               
                
            <tr><td align="center" colspan=3>
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
            FileNo:
            <asp:Label ID="FileNoLabel" runat="server" 
                Text='<%# Bind("FileNo") %>' />
            <br />
            Grade:
            <asp:Label ID="GradeLabel" runat="server" 
                Text='<%# Bind("Grade") %>' />
            <br />
            Subject:
            <asp:Label ID="SubjectLabel" runat="server" 
                Text='<%# Bind("Subject") %>' />
            <br />
            Date_Of_Charge_Sheet:
            <asp:Label ID="Date_Of_Charge_SheetLabel" runat="server" 
                Text='<%# Bind("Date_Of_Charge_Sheet") %>' />
            <br />
            Name_Of_Employee:
            <asp:Label ID="Name_Of_EmployeeLabel" runat="server" 
                Text='<%# Bind("Name_Of_Employee") %>' />
            <br />
            Government_Department:
            <asp:Label ID="Government_DepartmentLabel" runat="server" 
                Text='<%# Bind("Government_Department") %>' />
            <br />
            Date:
            <asp:Label ID="DateLabel" runat="server" 
                Text='<%# Bind("Date") %>' />
            <br />
            Name_Of_Inquiry_Officer:
            <asp:Label ID="Name_Of_Inquiry_OfficerLabel" runat="server" 
                Text='<%# Bind("Name_Of_Inquiry_Officer") %>' />
            <br />
            Date_Of_Inquiry_Submission:
            <asp:Label ID="Date_Of_Inquiry_SubmissionLabel" runat="server" 
                Text='<%# Bind("Date_Of_Inquiry_Submission") %>' />
            <br />
            Date_Of_Receiving_Inquiry_Report:
            <asp:Label ID="Date_Of_Receiving_Inquiry_ReportLabel" runat="server" 
                Text='<%# Bind("Date_Of_Receiving_Inquiry_Report") %>' />
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
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
</center>
    
    <asp:ObjectDataSource ID="ods_Departmental_Inquiry_Register" runat="server" DeleteMethod="DeleteQuery" 
        InsertMethod="Insert" 
        SelectMethod="GetDataBy1" 
        TypeName="IGRSS.DataAccessLayer.Departmental_Inquiry_RegisterTableAdapters.Departmental_Inquiry_RegisterTableAdapter" 
        UpdateMethod="UpdateQuery" 
        onselecting="ods_Departmental_Inquiry_Register_Selecting" 
        ondeleting="ods_Departmental_Inquiry_Register_Deleting" >
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="Grade" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Date_Of_Charge_Sheet" Type="DateTime" />
            <asp:Parameter Name="Name_Of_Employee" Type="String" />
            <asp:Parameter Name="Government_Department" Type="String" />
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="Name_Of_Inquiry_Officer" Type="String" />
            <asp:Parameter Name="Date_Of_Inquiry_Submission" Type="DateTime" />
            <asp:Parameter Name="Date_Of_Receiving_Inquiry_Report" Type="DateTime" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="Grade" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Date_Of_Charge_Sheet" Type="DateTime" />
            <asp:Parameter Name="Name_Of_Employee" Type="String" />
            <asp:Parameter Name="Government_Department" Type="String" />
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="Name_Of_Inquiry_Officer" Type="String" />
            <asp:Parameter Name="Date_Of_Inquiry_Submission" Type="DateTime" />
            <asp:Parameter Name="Date_Of_Receiving_Inquiry_Report" Type="DateTime" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_employeename" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        
        TypeName="IGRSS.DataAccessLayer.HistoryCardTableAdapters.HistroryCardTableAdapter" 
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Employee_Name" Type="String" />
            <asp:Parameter Name="Original_Birth_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Joining_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Join_as_Design" Type="String" />
            <asp:Parameter Name="Original_Promtion_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Promotion_Design" Type="String" />
            <asp:Parameter Name="Original_Actual_Date_of_Joining_Dept" Type="DateTime" />
            <asp:Parameter Name="Original_Religion" Type="String" />
            <asp:Parameter Name="Original_Caste" Type="String" />
            <asp:Parameter Name="Original_Current_desig" Type="String" />
            <asp:Parameter Name="Original_Preservice_training_Passing_Date" 
                Type="DateTime" />
            <asp:Parameter Name="Original_Clerk_Dept_Exam_Pass_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Sub_Register_Exam_Pass_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Upgrade_Promotion_Date" Type="DateTime" />
            <asp:Parameter Name="Original_First_Hier_Grade_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Sec_Hier_Grade_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Extra_Qualities" Type="String" />
            <asp:Parameter Name="Original_Retire_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Other_Details" Type="String" />
            <asp:Parameter Name="Original_Curr_Desig_with_office" Type="String" />
            <asp:Parameter Name="Original_Date_To_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Transfer_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Servc_Break_Leave" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Employee_Name" Type="String" />
            <asp:Parameter Name="Birth_Date" Type="DateTime" />
            <asp:Parameter Name="Prmnt_Addr" Type="String" />
            <asp:Parameter Name="Educn_Qualfn" Type="String" />
            <asp:Parameter Name="Joining_Date" Type="DateTime" />
            <asp:Parameter Name="Join_as_Design" Type="String" />
            <asp:Parameter Name="Promtion_Date" Type="DateTime" />
            <asp:Parameter Name="Promotion_Design" Type="String" />
            <asp:Parameter Name="Actual_Date_of_Joining_Dept" Type="DateTime" />
            <asp:Parameter Name="Religion" Type="String" />
            <asp:Parameter Name="Caste" Type="String" />
            <asp:Parameter Name="Current_desig" Type="String" />
            <asp:Parameter Name="Preservice_training_Passing_Date" Type="DateTime" />
            <asp:Parameter Name="Clerk_Dept_Exam_Pass_Date" Type="DateTime" />
            <asp:Parameter Name="Sub_Register_Exam_Pass_Date" Type="DateTime" />
            <asp:Parameter Name="Upgrade_Promotion_Date" Type="DateTime" />
            <asp:Parameter Name="First_Hier_Grade_Date" Type="DateTime" />
            <asp:Parameter Name="Sec_Hier_Grade_Date" Type="DateTime" />
            <asp:Parameter Name="Extra_Currclar_Activities" Type="String" />
            <asp:Parameter Name="Extra_Qualities" Type="String" />
            <asp:Parameter Name="Retire_Date" Type="DateTime" />
            <asp:Parameter Name="Other_Details" Type="String" />
            <asp:Parameter Name="Curr_Desig_with_office" Type="String" />
            <asp:Parameter Name="Date_To_Date" Type="DateTime" />
            <asp:Parameter Name="Transfer_Date" Type="DateTime" />
            <asp:Parameter Name="Servc_Break_Leave" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Employee_Name" Type="String" />
            <asp:Parameter Name="Birth_Date" Type="DateTime" />
            <asp:Parameter Name="Prmnt_Addr" Type="String" />
            <asp:Parameter Name="Educn_Qualfn" Type="String" />
            <asp:Parameter Name="Joining_Date" Type="DateTime" />
            <asp:Parameter Name="Join_as_Design" Type="String" />
            <asp:Parameter Name="Promtion_Date" Type="DateTime" />
            <asp:Parameter Name="Promotion_Design" Type="String" />
            <asp:Parameter Name="Actual_Date_of_Joining_Dept" Type="DateTime" />
            <asp:Parameter Name="Religion" Type="String" />
            <asp:Parameter Name="Caste" Type="String" />
            <asp:Parameter Name="Current_desig" Type="String" />
            <asp:Parameter Name="Preservice_training_Passing_Date" Type="DateTime" />
            <asp:Parameter Name="Clerk_Dept_Exam_Pass_Date" Type="DateTime" />
            <asp:Parameter Name="Sub_Register_Exam_Pass_Date" Type="DateTime" />
            <asp:Parameter Name="Upgrade_Promotion_Date" Type="DateTime" />
            <asp:Parameter Name="First_Hier_Grade_Date" Type="DateTime" />
            <asp:Parameter Name="Sec_Hier_Grade_Date" Type="DateTime" />
            <asp:Parameter Name="Extra_Currclar_Activities" Type="String" />
            <asp:Parameter Name="Extra_Qualities" Type="String" />
            <asp:Parameter Name="Retire_Date" Type="DateTime" />
            <asp:Parameter Name="Other_Details" Type="String" />
            <asp:Parameter Name="Curr_Desig_with_office" Type="String" />
            <asp:Parameter Name="Date_To_Date" Type="DateTime" />
            <asp:Parameter Name="Transfer_Date" Type="DateTime" />
            <asp:Parameter Name="Servc_Break_Leave" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Employee_Name" Type="String" />
            <asp:Parameter Name="Original_Birth_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Joining_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Join_as_Design" Type="String" />
            <asp:Parameter Name="Original_Promtion_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Promotion_Design" Type="String" />
            <asp:Parameter Name="Original_Actual_Date_of_Joining_Dept" Type="DateTime" />
            <asp:Parameter Name="Original_Religion" Type="String" />
            <asp:Parameter Name="Original_Caste" Type="String" />
            <asp:Parameter Name="Original_Current_desig" Type="String" />
            <asp:Parameter Name="Original_Preservice_training_Passing_Date" 
                Type="DateTime" />
            <asp:Parameter Name="Original_Clerk_Dept_Exam_Pass_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Sub_Register_Exam_Pass_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Upgrade_Promotion_Date" Type="DateTime" />
            <asp:Parameter Name="Original_First_Hier_Grade_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Sec_Hier_Grade_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Extra_Qualities" Type="String" />
            <asp:Parameter Name="Original_Retire_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Other_Details" Type="String" />
            <asp:Parameter Name="Original_Curr_Desig_with_office" Type="String" />
            <asp:Parameter Name="Original_Date_To_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Transfer_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Servc_Break_Leave" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_Grade" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.GradeTableAdapters.GradeTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Grade_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Grade_Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Grade_Name" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Grade_Name" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_InquiryOfficer" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.InquiryOfficerTableAdapters.InquiryOfficerTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_Inquiry_OfficerID" Type="Int32" />
            <asp:Parameter Name="Original_Inquiry_OfficerName" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Inquiry_OfficerName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Inquiry_OfficerName" Type="String" />
            <asp:Parameter Name="Original_Inquiry_OfficerID" Type="Int32" />
            <asp:Parameter Name="Original_Inquiry_OfficerName" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:View></center>
    
</asp:MultiView>
</asp:Content>

