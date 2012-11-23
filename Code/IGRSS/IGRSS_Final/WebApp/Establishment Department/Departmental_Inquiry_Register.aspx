<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="Departmental_Inquiry_Register.aspx.cs" Inherits="Establishment_Department_Departmental_Inquiry_Register" %>

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
 <asp:LinkButton ID="Button_new" runat="server" Text="New" 
        onclick="Button_new_Click" CssClass="standardButton" />
</asp:View>

<asp:View ID="Formview" runat="server">
<center>
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
                        <table>
            <tr align="left">
			   <td>File No:</td>
			   <td><asp:TextBox ID="FileNoTextBox" runat="server" numeric="integer" Text='<%# Bind("FileNo") %>' 
                       Width="160px" MaxLength="10" /></td>
			</tr>
			
            <tr align="left">
			    <td>Grade:</td>
				<td>
                    <asp:DropDownList ID="DropDownList_Grade" runat="server" 
                        DataSourceID="ods_Grade" DataTextField="Grade_Name" DataValueField="Grade_Name" 
                        Width="160px">
                    </asp:DropDownList>
                </td>
			</tr>             
                
            <tr align="left">
			    <td>Subject:</td>
				<td><asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' 
                        Width="160px" MaxLength="20" /></td>
			</tr>             
                
            <tr align="left">
			    <td>Date Of Charge Sheet:</td>
				<td><asp:TextBox ID="Date_Of_Charge_SheetTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Charge_Sheet") %>' Width="160px" /></td>
			</tr>             
                
            <tr align="left">
			    <td>Name Of Employee:</td>
				<td><asp:TextBox ID="Name_Of_EmployeeTextBox" runat="server" 
                    Text='<%# Bind("Name_Of_Employee") %>' Width="160px" MaxLength="30" /></td>
			</tr>              
                
            <tr align="left">
			    <td>Whether Case In Pending In Government/Department:</td>
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
				<td><asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' 
                        Width="160px" /></td>
			</tr>              
                
            <tr align="left">
			    <td>Name Of Inquiry Officer:</td>
				<td>
                    <asp:DropDownList ID="DropDownList_InquiryOfficer" runat="server" 
                        DataSourceID="ods_InquiryOfficer" DataTextField="Inquiry_OfficerName" 
                        DataValueField="Inquiry_OfficerName" Width="160px">
                    </asp:DropDownList>
                </td>
			</tr>              
                
            <tr align="left">
			    <td>Date Of Inquiry Submission:</td>
				<td><asp:TextBox ID="Date_Of_Inquiry_SubmissionTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Inquiry_Submission") %>' Width="160px" /></td>
			</tr>              
                
            <tr align="left">
			    <td>Date Of Receiving Inquiry Report:</td>
				<td><asp:TextBox ID="Date_Of_Receiving_Inquiry_ReportTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Receiving_Inquiry_Report") %>' Width="160px" 
                        ReadOnly="True" /></td>
			</tr>               
                
            <tr align="left">
			    <td>Remarks:</td>
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
                        <table>
            <tr align="left">
			   <td>File No:</td>
			   <td><asp:TextBox ID="FileNoTextBox" runat="server" numeric="integer" Text='<%# Bind("FileNo") %>' 
                       Width="160px" MaxLength="10" /></td>
			</tr>
			
            <tr align="left">
			    <td>Grade:</td>
				<td>
                    <asp:DropDownList ID="DropDownList_Grade" runat="server" 
                        DataSourceID="ods_Grade" DataTextField="Grade_Name" DataValueField="Grade_Name" 
                        Width="160px">
                    </asp:DropDownList>
                </td>
			</tr>             
                
            <tr align="left">
			    <td>Subject:</td>
				<td><asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' 
                        Width="160px" MaxLength="20" /></td>
			</tr>             
                
            <tr align="left">
			    <td>Date Of Charge Sheet:</td>
				<td><asp:TextBox ID="Date_Of_Charge_SheetTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Charge_Sheet") %>' Width="160px" /></td>
			</tr>             
                
            <tr align="left">
			    <td>Name Of Employee:</td>
				<td><asp:TextBox ID="Name_Of_EmployeeTextBox" runat="server" 
                    Text='<%# Bind("Name_Of_Employee") %>' Width="160px" MaxLength="20" /></td>
			</tr>              
                
            <tr align="left">
			    <td>Whether Case In Pending In Government/Department:</td>
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
				<td><asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' 
                        Width="160px" /></td>
			</tr>              
                
            <tr align="left">
			    <td>Name Of Inquiry Officer:</td>
				<td>
                    <asp:DropDownList ID="DropDownList_InquiryOfficer" runat="server" 
                        DataSourceID="ods_InquiryOfficer" DataTextField="Inquiry_OfficerName" 
                        DataValueField="Inquiry_OfficerName" Width="160px">
                    </asp:DropDownList>
                </td>
			</tr>              
                
            <tr align="left">
			    <td>Date Of Inquiry Submission:</td>
				<td><asp:TextBox ID="Date_Of_Inquiry_SubmissionTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Inquiry_Submission") %>' Width="160px" /></td>
			</tr>              
                
            <tr align="left">
			    <td>Date Of Receiving Inquiry Report:</td>
				<td><asp:TextBox ID="Date_Of_Receiving_Inquiry_ReportTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Receiving_Inquiry_Report") %>' Width="160px" /></td>
			</tr>               
                
            <tr align="left">
			    <td>Remarks:</td>
				<td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                        Height="60px" Width="160px" /></td>
			</tr>               
                
            <tr><td align="center" colspan=5>
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
</asp:View>    
</asp:MultiView>
</asp:Content>

