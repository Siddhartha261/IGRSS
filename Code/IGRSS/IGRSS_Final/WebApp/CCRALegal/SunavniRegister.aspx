<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="SunavniRegister.aspx.cs" Inherits="CCRALegal_SunavniRegister" %>

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
        var datePickers = ["IssueDateOfLetterTextBox", "DateOfHearingTextBox"];
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
                      EnableModelValidation="True" 
                      onrowdeleted="GridView_SunavniRegister_RowDeleted" 
                      onrowdeleting="GridView_SunavniRegister_RowDeleting" 
                      onrowediting="GridView_SunavniRegister_RowEditing">
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
                              SortExpression="Result" />
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
<center>
<h1>Sunavni Register</h1>
<asp:FormView ID="FormView_SunavniRegister" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_SunavniRegister" EnableModelValidation="True" DefaultMode="Insert" 
        Width="50%" oniteminserting="FormView_SunavniRegister_ItemInserting" 
        onitemcommand="FormView_SunavniRegister_ItemCommand" 
        oniteminserted="FormView_SunavniRegister_ItemInserted" 
        onitemupdated="FormView_SunavniRegister_ItemUpdated" 
        onitemupdating="FormView_SunavniRegister_ItemUpdating" >
        <EditItemTemplate>
                           <table>
		    <tr align="left">
			    <td>Appeal No:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="DropDownList_AppealNo" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td>
                    <asp:DropDownList ID="DropDownList_AppealNo" runat="server" 
                        DataSourceID="ods_AppealNo" DataTextField="SrNo" DataValueField="SrNo" 
                        Width="160px">
                    </asp:DropDownList>
                </td>
			</tr>	        
                    
            <tr align="left">
			    <td>File No:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td><asp:TextBox ID="FileNoTextBox" runat="server" numeric="integer" Text='<%# Bind("FileNo") %>' 
                        Width="160px" MaxLength="10" /></td>
			</tr>                   
                    
            <tr align="left">
			    <td>Name Of Petitioner:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="NameOfPetitionerTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td><asp:TextBox ID="NameOfPetitionerTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                        Text='<%# Bind("NameOfPetitioner") %>' Width="160px" MaxLength="30" /></td>
			</tr>                   
                    
            <tr align="left">
			    <td>Versus:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="DropDownList_EmployeeName" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td>
                    <asp:DropDownList ID="DropDownList_EmployeeName" runat="server" 
                        DataSourceID="ods_EmployeeName" DataTextField="FirstName" 
                        DataValueField="FirstName" Width="160px">
                    </asp:DropDownList>
                </td>
			</tr>                  
                    
            <tr align="left">
			    <td>Issue Date Of Letter:</td>
				<td>
                    &nbsp;</td>
				<td><asp:TextBox ID="IssueDateOfLetterTextBox" runat="server" 
                        Text='<%# Bind("IssueDateOfLetter") %>' Width="160px" /></td>
			</tr>                  
                    
            <tr align="left">
			    <td>Date Of Hearing:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="DateOfHearingTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td><asp:TextBox ID="DateOfHearingTextBox" runat="server" 
                        Text='<%# Bind("DateOfHearing") %>' Width="160px" /></td>
			</tr>                  
                    
            <tr align="left">
			    <td>Result:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="ResultTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td><asp:TextBox ID="ResultTextBox" runat="server" onkeypress="return AllowAlphabet(event)" Text='<%# Bind("Result") %>' 
                        Width="160px" MaxLength="20" /></td>
			</tr>                    
                    
            <tr>
			    <td align="center" colspan=3>
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
		    <tr align="left">
			    <td>Appeal No:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="DropDownList_AppealNo" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td>
                    <asp:DropDownList ID="DropDownList_AppealNo" runat="server" 
                        DataSourceID="ods_AppealNo" DataTextField="SrNo" DataValueField="SrNo" 
                        Width="160px">
                    </asp:DropDownList>
                </td>
			</tr>	        
                    
            <tr align="left">
			    <td>File No:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td><asp:TextBox ID="FileNoTextBox" runat="server" numeric="integer" Text='<%# Bind("FileNo") %>' 
                        Width="160px" MaxLength="10" /></td>
			</tr>                   
                    
            <tr align="left">
			    <td>Name Of Petitioner:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="NameOfPetitionerTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td><asp:TextBox ID="NameOfPetitionerTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                        Text='<%# Bind("NameOfPetitioner") %>' Width="160px" MaxLength="30" /></td>
			</tr>                   
                    
            <tr align="left">
			    <td>Versus:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="DropDownList_EmployeeName" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td>
                    <asp:DropDownList ID="DropDownList_EmployeeName" runat="server" 
                        DataSourceID="ods_EmployeeName" DataTextField="FirstName" 
                        DataValueField="FirstName" Width="160px">
                    </asp:DropDownList>
                </td>
			</tr>                  
                    
            <tr align="left">
			    <td>Issue Date Of Letter:</td>
				<td>
                    &nbsp;</td>
				<td><asp:TextBox ID="IssueDateOfLetterTextBox" runat="server" 
                        Text='<%# Bind("IssueDateOfLetter") %>' Width="160px" /></td>
			</tr>                  
                    
            <tr align="left">
			    <td>Date Of Hearing:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="DateOfHearingTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td><asp:TextBox ID="DateOfHearingTextBox" runat="server" 
                        Text='<%# Bind("DateOfHearing") %>' Width="160px" /></td>
			</tr>                  
                    
            <tr align="left">
			    <td>Result:</td>
				<td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="ResultTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
				<td><asp:TextBox ID="ResultTextBox" runat="server" onkeypress="return AllowAlphabet(event)" Text='<%# Bind("Result") %>' 
                        Width="160px" MaxLength="20" /></td>
			</tr>                    
                    
            <tr>
			    <td align="center" colspan=3>
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
    
    <asp:ObjectDataSource ID="ods_SunavniRegister" runat="server" DeleteMethod="DeleteQuery" 
        InsertMethod="Insert" SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.SunavniRegisterTableAdapters.SunavniRegisterTableAdapter" 
        UpdateMethod="UpdateQuery" onselecting="ods_SunavniRegister_Selecting" 
        ondeleting="ods_SunavniRegister_Deleting" >
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
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
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_EmployeeName" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        
        
        TypeName="IGRSS.DataAccessLayer.EmployeeNameTableAdapters.EmployeeMasterTableAdapter" 
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
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
    <asp:ObjectDataSource ID="ods_AppealNo" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        
        TypeName="IGRSS.DataAccessLayer.AppealRegisterTableAdapters.AppealRegisterTableAdapter">
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView>
</asp:Content>

