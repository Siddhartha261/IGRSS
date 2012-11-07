<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="PrimaryInvestigation-InquiryRegister.aspx.cs" Inherits="LatestPages_PrimaryInvestigation_InquiryRegister" %>

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
        var datePickers = ["Date_Of_ComplaintTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
 
    
</script>
<asp:MultiView ID="Multiview_Inquiry" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<hr /><br />
<h1>Primary Investigation/Inquiry Register</h1>
<table>
          <tr>
                    <td align="right" style="width:641px;" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" >
                        <asp:TextBox Width="160" ID="txtFileNo" runat="server" 
                            meta:resourcekey="txtFileNoResource1" ontextchanged="txtFileNo_TextChanged"></asp:TextBox></td>
                        <td align="right">
                        <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_Inquiry" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_Inquiry" 
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="FileNo" HeaderText="File No" 
                              SortExpression="FileNo" />
                          <asp:BoundField DataField="Name_Of_Employee" HeaderText="Name Of Employee" 
                              SortExpression="Name_Of_Employee" />
                          <asp:BoundField DataField="Designation_Of_Employee" HeaderText="Designation Of Employee" 
                              SortExpression="Designation_Of_Employee" />
                          <asp:BoundField DataField="Date_Of_Complaint" HeaderText="Date Of Complaint" 
                              SortExpression="Date_Of_Complaint" />
                          <asp:BoundField DataField="Details_To_Vigilance_Commissioner" HeaderText="Details_To_Vigilance_Commissioner" 
                              SortExpression="Details_To_Vigilance_Commissioner" Visible="False" />
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
<h1>Primary Investigation/Inquiry Register</h1>
<asp:FormView ID="FormView_Inquiry" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_Inquiry" EnableModelValidation="True" DefaultMode="Insert" 
        Width="60%" oniteminserting="FormView_Inquiry_ItemInserting" 
        onitemcommand="FormView_Inquiry_ItemCommand">
        <EditItemTemplate>
                            <table>
		    <tr><td>File No:</td>
			    <td><asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                        Width="160px" /></td>
			</tr>        			
                    
            <tr><td>Name Of Employee:</td>
			    <td>
                    <asp:DropDownList ID="Name_Of_EmployeeDropDown" runat="server" 
                        DataSourceID="ObjectDataSourceEmployee" DataTextField="NameOfEmployee" 
                        DataValueField="NameOfEmployee">
                    </asp:DropDownList>
                </td>
			</tr>	                 
                    
            <tr><td>Designation Of Employee:</td>
			    <td>
                    <asp:DropDownList ID="Drop_employeedesignation" runat="server" 
                        DataSourceID="ods_Designation" DataTextField="Name" DataValueField="Name">
                    </asp:DropDownList>
                </td>
			</tr>	                 
                    
            <tr><td>Date Of Complaint:</td>
			    <td><asp:TextBox ID="Date_Of_ComplaintTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Complaint") %>' Width="160px" /></td>
			</tr>	                 
                    
            <tr><td>Details To Vigilance Commissioner:</td>
			    <td><asp:TextBox ID="Details_To_Vigilance_CommissionerTextBox" runat="server" 
                    Text='<%# Bind("Details_To_Vigilance_Commissioner") %>' Height="60px" 
                        Width="160px" /></td>
			</tr>	                 
                    
            <tr><td colspan=2 align="center">
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" CssClass="standardButton" />
					&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                      CausesValidation="False" CommandName="Reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" 
                    CssClass="standardButton" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" />
				</td>
			</tr>                  
		</table>				
                            
        </EditItemTemplate>
        <InsertItemTemplate>
                            <table>
		    <tr><td>File No:</td>
			    <td><asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                        Width="160px" /></td>
			</tr>        			
                    
            <tr><td>Name Of Employee:</td>
			    <td><asp:DropDownList ID="Name_Of_EmployeeDropDown" runat="server" 
                        DataSourceID="ObjectDataSourceEmployee" DataTextField="NameOfEmployee" 
                        DataValueField="NameOfEmployee"></asp:DropDownList>
                <%--<asp:TextBox ID="Name_Of_EmployeeTextBox" runat="server" 
                    Text='<%# Bind("Name_Of_Employee") %>' Width="160px" />--%></td>
			</tr>	                 
                    
            <tr><td>Designation Of Employee:</td>
			    <td>
                    <asp:DropDownList ID="Drop_employeedesignation" runat="server" 
                        DataSourceID="ods_Designation" DataTextField="Name" DataValueField="Name">
                    </asp:DropDownList>
                </td>
			</tr>	                 
                    
            <tr><td>Date Of Complaint:</td>
			    <td><asp:TextBox ID="Date_Of_ComplaintTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Complaint") %>' Width="160px" /></td>
			</tr>	                 
                    
            <tr><td>Details To Vigilance Commissioner:</td>
			    <td><asp:TextBox ID="Details_To_Vigilance_CommissionerTextBox" runat="server" 
                    Text='<%# Bind("Details_To_Vigilance_Commissioner") %>' Height="60px" 
                        Width="160px" /></td>
			</tr>	                 
                    
            <tr><td colspan=2 align="center">
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insert" CssClass="standardButton" />
					&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                      CausesValidation="False" CommandName="Reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" 
                    CssClass="standardButton" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" />
				</td>
			</tr>                  
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
            Name_Of_Employee:
            <asp:Label ID="Name_Of_EmployeeLabel" runat="server" 
                Text='<%# Bind("Name_Of_Employee") %>' />
            <br />
            Designation_Of_Employee:
            <asp:Label ID="Designation_Of_EmployeeLabel" runat="server" 
                Text='<%# Bind("Designation_Of_Employee") %>' />
            <br />
            Date_Of_Complaint:
            <asp:Label ID="Date_Of_ComplaintLabel" runat="server" 
                Text='<%# Bind("Date_Of_Complaint") %>' />
            <br />
            Details_To_Vigilance_Commissioner:
            <asp:Label ID="Details_To_Vigilance_CommissionerLabel" runat="server" 
                Text='<%# Bind("Details_To_Vigilance_Commissioner") %>' />
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
    
    <asp:ObjectDataSource ID="ods_Inquiry" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.InquiryRegisterTableAdapters.InquiryRegisterTableAdapter" 
        UpdateMethod="Update" onselecting="ods_Inquiry_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_Name_Of_Employee" Type="String" />
            <asp:Parameter Name="Original_Designation_Of_Employee" Type="String" />
            <asp:Parameter Name="Original_Date_Of_Complaint" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="Name_Of_Employee" Type="String" />
            <asp:Parameter Name="Designation_Of_Employee" Type="String" />
            <asp:Parameter Name="Date_Of_Complaint" Type="DateTime" />
            <asp:Parameter Name="Details_To_Vigilance_Commissioner" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="Name_Of_Employee" Type="String" />
            <asp:Parameter Name="Designation_Of_Employee" Type="String" />
            <asp:Parameter Name="Date_Of_Complaint" Type="DateTime" />
            <asp:Parameter Name="Details_To_Vigilance_Commissioner" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_Name_Of_Employee" Type="String" />
            <asp:Parameter Name="Original_Designation_Of_Employee" Type="String" />
            <asp:Parameter Name="Original_Date_Of_Complaint" Type="DateTime" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceEmployee" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetEmployeeMaster" 
        TypeName="IGRSS.DataAccessLayer.EmployeeTableAdapters.EmployeeMasterTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter DbType="Guid" Name="Original_EmployeeID" />
            <asp:Parameter Name="Original_EmployeeNo" Type="String" />
            <asp:Parameter Name="Original_FirstName" Type="String" />
            <asp:Parameter Name="Original_MiddleName" Type="String" />
            <asp:Parameter Name="Original_LastName" Type="String" />
            <asp:Parameter Name="Original_PostalAddress" Type="String" />
            <asp:Parameter Name="Original_PermanentAddress" Type="String" />
            <asp:Parameter Name="Original_DateOfBirth" Type="DateTime" />
            <asp:Parameter Name="Original_FatherName" Type="String" />
            <asp:Parameter Name="Original_Height" Type="Decimal" />
            <asp:Parameter Name="Original_VisibleMarks" Type="String" />
            <asp:Parameter DbType="Guid" Name="Original_OfficeID" />
            <asp:Parameter DbType="Guid" Name="Original_DepartmentID" />
            <asp:Parameter DbType="Guid" Name="Original_DesignationID" />
            <asp:Parameter Name="Original_Salary" Type="Decimal" />
            <asp:Parameter Name="Original_Allowances" Type="Decimal" />
            <asp:Parameter Name="Original_StartDate" Type="DateTime" />
            <asp:Parameter Name="Original_EndDate" Type="DateTime" />
            <asp:Parameter Name="Original_CreatedBy" Type="String" />
            <asp:Parameter Name="Original_CreatedAt" Type="DateTime" />
            <asp:Parameter Name="Original_ModifiedBy" Type="String" />
            <asp:Parameter Name="Original_ModifiedAt" Type="DateTime" />
            <asp:Parameter Name="Original_IsDeleted" Type="Boolean" />
            <asp:Parameter Name="Original_DeletedBy" Type="String" />
            <asp:Parameter Name="Original_DeletedAt" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Guid" Name="EmployeeID" />
            <asp:Parameter Name="EmployeeNo" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="MiddleName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="PostalAddress" Type="String" />
            <asp:Parameter Name="PermanentAddress" Type="String" />
            <asp:Parameter Name="DateOfBirth" Type="DateTime" />
            <asp:Parameter Name="FatherName" Type="String" />
            <asp:Parameter Name="Height" Type="Decimal" />
            <asp:Parameter Name="VisibleMarks" Type="String" />
            <asp:Parameter DbType="Guid" Name="OfficeID" />
            <asp:Parameter DbType="Guid" Name="DepartmentID" />
            <asp:Parameter DbType="Guid" Name="DesignationID" />
            <asp:Parameter Name="Salary" Type="Decimal" />
            <asp:Parameter Name="Allowances" Type="Decimal" />
            <asp:Parameter Name="StartDate" Type="DateTime" />
            <asp:Parameter Name="EndDate" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedAt" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="ModifiedAt" Type="DateTime" />
            <asp:Parameter Name="IsDeleted" Type="Boolean" />
            <asp:Parameter Name="DeletedBy" Type="String" />
            <asp:Parameter Name="DeletedAt" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmployeeNo" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="MiddleName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="PostalAddress" Type="String" />
            <asp:Parameter Name="PermanentAddress" Type="String" />
            <asp:Parameter Name="DateOfBirth" Type="DateTime" />
            <asp:Parameter Name="FatherName" Type="String" />
            <asp:Parameter Name="Height" Type="Decimal" />
            <asp:Parameter Name="VisibleMarks" Type="String" />
            <asp:Parameter DbType="Guid" Name="OfficeID" />
            <asp:Parameter DbType="Guid" Name="DepartmentID" />
            <asp:Parameter DbType="Guid" Name="DesignationID" />
            <asp:Parameter Name="Salary" Type="Decimal" />
            <asp:Parameter Name="Allowances" Type="Decimal" />
            <asp:Parameter Name="StartDate" Type="DateTime" />
            <asp:Parameter Name="EndDate" Type="DateTime" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedAt" Type="DateTime" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="ModifiedAt" Type="DateTime" />
            <asp:Parameter Name="IsDeleted" Type="Boolean" />
            <asp:Parameter Name="DeletedBy" Type="String" />
            <asp:Parameter Name="DeletedAt" Type="DateTime" />
            <asp:Parameter DbType="Guid" Name="Original_EmployeeID" />
            <asp:Parameter Name="Original_EmployeeNo" Type="String" />
            <asp:Parameter Name="Original_FirstName" Type="String" />
            <asp:Parameter Name="Original_MiddleName" Type="String" />
            <asp:Parameter Name="Original_LastName" Type="String" />
            <asp:Parameter Name="Original_PostalAddress" Type="String" />
            <asp:Parameter Name="Original_PermanentAddress" Type="String" />
            <asp:Parameter Name="Original_DateOfBirth" Type="DateTime" />
            <asp:Parameter Name="Original_FatherName" Type="String" />
            <asp:Parameter Name="Original_Height" Type="Decimal" />
            <asp:Parameter Name="Original_VisibleMarks" Type="String" />
            <asp:Parameter DbType="Guid" Name="Original_OfficeID" />
            <asp:Parameter DbType="Guid" Name="Original_DepartmentID" />
            <asp:Parameter DbType="Guid" Name="Original_DesignationID" />
            <asp:Parameter Name="Original_Salary" Type="Decimal" />
            <asp:Parameter Name="Original_Allowances" Type="Decimal" />
            <asp:Parameter Name="Original_StartDate" Type="DateTime" />
            <asp:Parameter Name="Original_EndDate" Type="DateTime" />
            <asp:Parameter Name="Original_CreatedBy" Type="String" />
            <asp:Parameter Name="Original_CreatedAt" Type="DateTime" />
            <asp:Parameter Name="Original_ModifiedBy" Type="String" />
            <asp:Parameter Name="Original_ModifiedAt" Type="DateTime" />
            <asp:Parameter Name="Original_IsDeleted" Type="Boolean" />
            <asp:Parameter Name="Original_DeletedBy" Type="String" />
            <asp:Parameter Name="Original_DeletedAt" Type="DateTime" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_Designation" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.DesignationMasterTableAdapters.DesignationMasterTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter DbType="Guid" Name="Original_DesignationID" />
            <asp:Parameter Name="Original_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Guid" Name="DesignationID" />
            <asp:Parameter Name="Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter DbType="Guid" Name="Original_DesignationID" />
            <asp:Parameter Name="Original_Name" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView>
</asp:Content>

