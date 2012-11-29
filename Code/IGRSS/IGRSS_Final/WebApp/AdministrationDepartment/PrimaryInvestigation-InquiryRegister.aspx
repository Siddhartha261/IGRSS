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
<br />
<br />
<center>
<asp:Panel id="infoDiv" runat="server" Visible="false" CssClass="infoBar" >&nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
<hr /><br />
</center>
<asp:MultiView ID="Multiview_Inquiry" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<hr /><br />
<h1 align="center">Primary Investigation/Inquiry Register</h1>
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
                  <asp:GridView ID="GridView_Inquiry" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_Inquiry" 
                      EnableModelValidation="True" onrowdeleted="GridView_Inquiry_RowDeleted" 
                      onrowdeleting="GridView_Inquiry_RowDeleting" 
                      onrowediting="GridView_Inquiry_RowEditing">
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
                          <asp:BoundField DataField="Details_To_Vigilance_Commissioner" HeaderText="Details To Vigilance Commissioner" 
                              SortExpression="Details_To_Vigilance_Commissioner" Visible="False" />
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
        onclick="Button_new_Click" CssClass="standardButton" AccessKey="n" />
</asp:View>

<asp:View ID="Formview" runat="server">
<center>
<h1>Primary Investigation/Inquiry Register</h1>
<asp:FormView ID="FormView_Inquiry" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_Inquiry" EnableModelValidation="True" DefaultMode="Insert" 
        Width="60%" oniteminserting="FormView_Inquiry_ItemInserting" 
        onitemcommand="FormView_Inquiry_ItemCommand" 
        oniteminserted="FormView_Inquiry_ItemInserted" 
        onitemupdated="FormView_Inquiry_ItemUpdated" 
        onitemupdating="FormView_Inquiry_ItemUpdating">
        <EditItemTemplate>
                            		<table>
		    <tr align="left"><td>File No:</td>
			    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
			    <td><asp:TextBox ID="FileNoTextBox" runat="server" numeric="integer" Text='<%# Bind("FileNo") %>' 
                        Width="160px" MaxLength="10" /></td>
			</tr>        			
                    
            <tr align="left"><td>Name Of Employee:</td>
			    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="Name_Of_EmployeeDropDown" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
			    <td><asp:DropDownList ID="Name_Of_EmployeeDropDown" runat="server" 
                        DataSourceID="ObjectDataSourceEmployee" DataTextField="FirstName" 
                        DataValueField="FirstName" TabIndex="1"></asp:DropDownList>
                </td>
			</tr>	                 
                    
            <tr align="left"><td>Designation Of Employee:</td>
			    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="Drop_employeedesignation" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
			    <td>
                    <asp:DropDownList ID="Drop_employeedesignation" runat="server" 
                        DataSourceID="ods_Designation" DataTextField="Name" DataValueField="Name" 
                        TabIndex="2">
                    </asp:DropDownList>
                </td>
			</tr>	                 
                    
            <tr align="left"><td>Date Of Complaint:</td>
			    <td>
                    &nbsp;</td>
			    <td><asp:TextBox ID="Date_Of_ComplaintTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Complaint") %>' Width="160px" TabIndex="3" /></td>
			</tr>	                 
                    
            <tr align="left"><td>Details To Vigilance Commissioner:</td>
			    <td>
                    &nbsp;</td>
			    <td><asp:TextBox ID="Details_To_Vigilance_CommissionerTextBox" runat="server" 
                    Text='<%# Bind("Details_To_Vigilance_Commissioner") %>' Height="60px" 
                        Width="160px" TabIndex="4" TextMode="MultiLine" /></td>
			</tr>	                 
                    
            <tr><td colspan=3 align="center">
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" CssClass="standardButton" 
                    TabIndex="5" />
					&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                      CausesValidation="False" CommandName="Reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" 
                    CssClass="standardButton" TabIndex="6" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" TabIndex="7" />
				</td>
			</tr>                  
		</table>				 
                            
        </EditItemTemplate>
        <InsertItemTemplate>
                            		<table>
		    <tr align="left"><td>File No:</td>
			    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
			    <td><asp:TextBox ID="FileNoTextBox" runat="server" numeric="integer" Text='<%# Bind("FileNo") %>' 
                        Width="160px" MaxLength="10" /></td>
			</tr>        			
                    
            <tr align="left"><td>Name Of Employee:</td>
			    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="Name_Of_EmployeeDropDown" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
			    <td><asp:DropDownList ID="Name_Of_EmployeeDropDown" runat="server" 
                        DataSourceID="ObjectDataSourceEmployee" DataTextField="FirstName" 
                        DataValueField="FirstName" TabIndex="1"></asp:DropDownList>
                </td>
			</tr>	                 
                    
            <tr align="left"><td>Designation Of Employee:</td>
			    <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="Drop_employeedesignation" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
			    <td>
                    <asp:DropDownList ID="Drop_employeedesignation" runat="server" 
                        DataSourceID="ods_Designation" DataTextField="Name" DataValueField="Name" 
                        TabIndex="2">
                    </asp:DropDownList>
                </td>
			</tr>	                 
                    
            <tr align="left"><td>Date Of Complaint:</td>
			    <td>
                    &nbsp;</td>
			    <td><asp:TextBox ID="Date_Of_ComplaintTextBox" runat="server" 
                    Text='<%# Bind("Date_Of_Complaint") %>' Width="160px" TabIndex="3" /></td>
			</tr>	                 
                    
            <tr align="left"><td>Details To Vigilance Commissioner:</td>
			    <td>
                    &nbsp;</td>
			    <td><asp:TextBox ID="Details_To_Vigilance_CommissionerTextBox" runat="server" 
                    Text='<%# Bind("Details_To_Vigilance_Commissioner") %>' Height="60px" 
                        Width="160px" TabIndex="4" TextMode="MultiLine" /></td>
			</tr>	                 
                    
            <tr><td colspan=3 align="center">
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insert" CssClass="standardButton" 
                    TabIndex="5" />
					&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                      CausesValidation="False" CommandName="Reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" 
                    CssClass="standardButton" TabIndex="6" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" TabIndex="7" />
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
    
    <asp:ObjectDataSource ID="ods_Inquiry" runat="server" DeleteMethod="DeleteQuery" 
        InsertMethod="Insert" SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.InquiryRegisterTableAdapters.InquiryRegisterTableAdapter" 
        UpdateMethod="UpdateQuery" onselecting="ods_Inquiry_Selecting" 
        ondeleting="ods_Inquiry_Deleting">
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
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
            <asp:Parameter Name="Date_Of_Complaint" Type="String" />
            <asp:Parameter Name="Details_To_Vigilance_Commissioner" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSourceEmployee" runat="server" 
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
            <asp:Parameter Name="EmployeeID" DbType="Guid" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter DbType="Guid" Name="Original_EmployeeID" />
            <asp:Parameter Name="Original_FirstName" Type="String" />
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
            <asp:Parameter Name="Original_Description" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Guid" Name="DesignationID" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Guid" Name="DesignationID" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter DbType="Guid" Name="Original_DesignationID" />
            <asp:Parameter Name="Original_Name" Type="String" />
            <asp:Parameter Name="Original_Description" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView>
</asp:Content>

