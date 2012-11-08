<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="SunavniRegister.aspx.cs" Inherits="CCRALegal_SunavniRegister" %>

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
        var datePickers = ["IssueDateOfLetterTextBox", "DateOfHearingTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
 
    
</script>
<asp:MultiView ID="Multiview_SunavniRegister" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<hr /><br />
<h1>Sunavni Register</h1>
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
                  <asp:GridView ID="GridView_SunavniRegister" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_SunavniRegister" 
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="AppealNo" HeaderText="Appeal No" 
                              SortExpression="AppealNo" />
                          <asp:BoundField DataField="FileNo" HeaderText="File No" 
                              SortExpression="FileNo" />
                          <asp:BoundField DataField="NameOfPetitioner" HeaderText="Name Of Petitioner" 
                              SortExpression="NameOfPetitioner" />
                          <asp:BoundField DataField="Versus" HeaderText="Versus" 
                              SortExpression="Versus" />
                          <asp:BoundField DataField="IssueDateOfLetter" HeaderText="Issue Date Of Letter" 
                              SortExpression="IssueDateOfLetter" />
                          <asp:BoundField DataField="DateOfHearing" HeaderText="Date Of Hearing" 
                              SortExpression="DateOfHearing" />
                          <asp:BoundField DataField="Result" HeaderText="Result" 
                              SortExpression="Result" Visible="False" />
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
<h1>Sunavni Register</h1>
<asp:FormView ID="FormView_SunavniRegister" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_SunavniRegister" EnableModelValidation="True" DefaultMode="Insert" 
        Width="50%" oniteminserting="FormView_SunavniRegister_ItemInserting" 
        onitemcommand="FormView_SunavniRegister_ItemCommand" >
        <EditItemTemplate>
                           <table>
		    <tr>
			    <td>Appeal No:</td>
				<td>
                    <asp:DropDownList ID="DropDownList_AppealNo" runat="server" 
                        DataSourceID="ods_AppealNo" DataTextField="SrNo" DataValueField="SrNo" 
                        Width="160px">
                    </asp:DropDownList>
                </td>
			</tr>	        
                    
            <tr>
			    <td>File No:</td>
				<td><asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                        Width="160px" /></td>
			</tr>                   
                    
            <tr>
			    <td>Name Of Petitioner:</td>
				<td><asp:TextBox ID="NameOfPetitionerTextBox" runat="server" 
                        Text='<%# Bind("NameOfPetitioner") %>' Width="160px" /></td>
			</tr>                   
                    
            <tr>
			    <td>Versus:</td>
				<td>
                    <asp:DropDownList ID="DropDownList_EmployeeName" runat="server" 
                        DataSourceID="ods_EmployeeName" DataTextField="NameOfEmployee" 
                        DataValueField="NameOfEmployee" Width="160px">
                    </asp:DropDownList>
                </td>
			</tr>                  
                    
            <tr>
			    <td>Issue Date Of Letter:</td>
				<td><asp:TextBox ID="IssueDateOfLetterTextBox" runat="server" 
                        Text='<%# Bind("IssueDateOfLetter") %>' Width="160px" /></td>
			</tr>                  
                    
            <tr>
			    <td>Date Of Hearing:</td>
				<td><asp:TextBox ID="DateOfHearingTextBox" runat="server" 
                        Text='<%# Bind("DateOfHearing") %>' Width="160px" /></td>
			</tr>                  
                    
            <tr>
			    <td>Result:</td>
				<td><asp:TextBox ID="ResultTextBox" runat="server" Text='<%# Bind("Result") %>' 
                        Width="160px" /></td>
			</tr>                    
                    
            <tr>
			    <td align="center" colspan=2>
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" CssClass="standardButton" />
					&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                        CausesValidation="False" CommandName="Reset" Text="Reset" 
                        CssClass="standardButton" onclientclick="resetTextFields();return false;" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Back" Text="Back" 
                        CssClass="standardButton" />
				</td>
			</tr>                    
		</table>				
            
        </EditItemTemplate>
        <InsertItemTemplate>
                           <table>
		    <tr>
			    <td>Appeal No:</td>
				<td>
                    <asp:DropDownList ID="DropDownList_AppealNo" runat="server" 
                        DataSourceID="ods_AppealNo" DataTextField="SrNo" DataValueField="SrNo" 
                        Width="160px">
                    </asp:DropDownList>
                </td>
			</tr>	        
                    
            <tr>
			    <td>File No:</td>
				<td><asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                        Width="160px" /></td>
			</tr>                   
                    
            <tr>
			    <td>Name Of Petitioner:</td>
				<td><asp:TextBox ID="NameOfPetitionerTextBox" runat="server" 
                        Text='<%# Bind("NameOfPetitioner") %>' Width="160px" /></td>
			</tr>                   
                    
            <tr>
			    <td>Versus:</td>
				<td>
                    <asp:DropDownList ID="DropDownList_EmployeeName" runat="server" 
                        DataSourceID="ods_EmployeeName" DataTextField="NameOfEmployee" 
                        DataValueField="NameOfEmployee" Width="160px">
                    </asp:DropDownList>
                </td>
			</tr>                  
                    
            <tr>
			    <td>Issue Date Of Letter:</td>
				<td><asp:TextBox ID="IssueDateOfLetterTextBox" runat="server" 
                        Text='<%# Bind("IssueDateOfLetter") %>' Width="160px" /></td>
			</tr>                  
                    
            <tr>
			    <td>Date Of Hearing:</td>
				<td><asp:TextBox ID="DateOfHearingTextBox" runat="server" 
                        Text='<%# Bind("DateOfHearing") %>' Width="160px" /></td>
			</tr>                  
                    
            <tr>
			    <td>Result:</td>
				<td><asp:TextBox ID="ResultTextBox" runat="server" Text='<%# Bind("Result") %>' 
                        Width="160px" /></td>
			</tr>                    
                    
            <tr>
			    <td align="center" colspan=2>
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insert" CssClass="standardButton" />
					&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                        CausesValidation="False" CommandName="Reset" Text="Reset" 
                        CssClass="standardButton" onclientclick="resetTextFields();return false;" />
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
            AppealNo:
            <asp:Label ID="AppealNoLabel" runat="server" Text='<%# Bind("AppealNo") %>' />
            <br />
            FileNo:
            <asp:Label ID="FileNoLabel" runat="server" 
                Text='<%# Bind("FileNo") %>' />
            <br />
            NameOfPetitioner:
            <asp:Label ID="NameOfPetitionerLabel" runat="server" 
                Text='<%# Bind("NameOfPetitioner") %>' />
            <br />
            Versus:
            <asp:Label ID="VersusLabel" runat="server" Text='<%# Bind("Versus") %>' />
            <br />
            IssueDateOfLetter:
            <asp:Label ID="IssueDateOfLetterLabel" runat="server" 
                Text='<%# Bind("IssueDateOfLetter") %>' />
            <br />
            DateOfHearing:
            <asp:Label ID="DateOfHearingLabel" runat="server" 
                Text='<%# Bind("DateOfHearing") %>' />
            <br />
            Result:
            <asp:Label ID="ResultLabel" runat="server" 
                Text='<%# Bind("Result") %>' />
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
    
    <asp:ObjectDataSource ID="ods_SunavniRegister" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.SunavniRegisterTableAdapters.SunavniRegisterTableAdapter" 
        UpdateMethod="Update" onselecting="ods_SunavniRegister_Selecting" >
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_AppealNo" Type="Int32" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_NameOfPetitioner" Type="String" />
            <asp:Parameter Name="Original_Versus" Type="String" />
            <asp:Parameter Name="Original_IssueDateOfLetter" Type="DateTime" />
            <asp:Parameter Name="Original_DateOfHearing" Type="DateTime" />
            <asp:Parameter Name="Original_Result" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="AppealNo" Type="Int32" />
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="NameOfPetitioner" Type="String" />
            <asp:Parameter Name="Versus" Type="String" />
            <asp:Parameter Name="IssueDateOfLetter" Type="DateTime" />
            <asp:Parameter Name="DateOfHearing" Type="DateTime" />
            <asp:Parameter Name="Result" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="AppealNo" Type="Int32" />
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="NameOfPetitioner" Type="String" />
            <asp:Parameter Name="Versus" Type="String" />
            <asp:Parameter Name="IssueDateOfLetter" Type="DateTime" />
            <asp:Parameter Name="DateOfHearing" Type="DateTime" />
            <asp:Parameter Name="Result" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_AppealNo" Type="Int32" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_NameOfPetitioner" Type="String" />
            <asp:Parameter Name="Original_Versus" Type="String" />
            <asp:Parameter Name="Original_IssueDateOfLetter" Type="DateTime" />
            <asp:Parameter Name="Original_DateOfHearing" Type="DateTime" />
            <asp:Parameter Name="Original_Result" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_EmployeeName" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetEmployeeMaster" 
        
        
        TypeName="IGRSS.DataAccessLayer.EmployeeTableAdapters.EmployeeMasterTableAdapter" 
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
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
            <asp:Parameter DbType="Guid" Name="Original_OfficeId" />
            <asp:Parameter Name="Original_DepartmentID" DbType="Guid" />
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
            <asp:Parameter DbType="Guid" Name="OfficeId" />
            <asp:Parameter Name="DepartmentID" DbType="Guid" />
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
            <asp:Parameter Name="EmployeeID" DbType="Guid" />
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
            <asp:Parameter DbType="Guid" Name="Original_OfficeId" />
            <asp:Parameter Name="Original_DepartmentID" DbType="Guid" />
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
    <asp:ObjectDataSource ID="ods_AppealNo" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        
        TypeName="IGRSS.DataAccessLayer.AppealRegisterTableAdapters.AppealRegisterTableAdapter">
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView>
</asp:Content>

