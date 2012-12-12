<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="AppealRegister.aspx.cs" Inherits="CCRALegal_AppealRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<script>


    $(function () {

        function generateDatePicker(id) {
            $('input[id*="' + id + '"]').datepicker({
                showOn: "both",
                buttonImage: "/WebApp/Styles/css/sunny/images/calendar.gif",
                buttonImageOnly: true,
                changeMonth: true,
                changeYear: true,
                yearRange: '1940:2025',
                //                dateFormat: "dd/mm/yy",
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

        var datePickers = ["DateTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }

        $('input[id*="OutwardNoTextBox"]').keydown(function (event) {
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

        $('input[id*="OutwardNoTextBox"]').blur(function () {

            if (isNaN($('input[id*="OutwardNoTextBox"]').val()) || $('input[id*="OutwardNoTextBox"]').val().length == 0) { $('input[id*="OutwardNoTextBox"]').val(''); return; }
            var formattedNumber = 'IGR\/' + $('input[id*="OutwardNoTextBox"]').val() + '\/' + new Date().getFullYear();
            $('input[id*="OutwardNoTextBox"]').val(formattedNumber.toString());
        });
    });
</script>
<br />
<br />
<center>
<asp:Panel id="infoDiv" runat="server" Visible="false" CssClass="infoBar" >&nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
<hr /><br />
</center>
<asp:MultiView ID="Multiview_AppealRegister" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<hr /><br />
<h1>Appeal Register</h1>
<table>
          <tr align="right">
                    <td  style="width:641px;" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label>
                        &nbsp<asp:TextBox Width="160" ID="txtFileNo" runat="server" 
                            meta:resourcekey="txtFileNoResource1"></asp:TextBox>&nbsp
                    <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_AppealRegister" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo,Continue_remand" DataSourceID="ods_AppealRegister" 
                      EnableModelValidation="True" 
                      onrowdeleted="GridView_AppealRegister_RowDeleted" 
                      onrowdeleting="GridView_AppealRegister_RowDeleting" 
                      onrowediting="GridView_AppealRegister_RowEditing" 
                      onrowdatabound="GridView_AppealRegister_RowDataBound">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="FileNo" HeaderText="File No" 
                              SortExpression="FileNo" />
                          <asp:BoundField DataField="KacheriOffice" HeaderText="Kacheri/Office" 
                              SortExpression="KacheriOffice" />
                          <asp:BoundField DataField="DocumentNo" HeaderText="Document No" 
                              SortExpression="DocumentNo" />
                          <asp:BoundField DataField="Year" HeaderText="Year" 
                              SortExpression="Year" />
                          <asp:BoundField DataField="NameOfApplicant" HeaderText="Name Of Applicant" 
                              SortExpression="NameOfApplicant" />
                          <asp:BoundField DataField="Versus" HeaderText="Versus" 
                              SortExpression="Versus" />
                          <asp:BoundField DataField="DeficitStampDuty" HeaderText="Deficit Stamp Duty" 
                              SortExpression="DeficitStampDuty" Visible="False" />
                          <asp:BoundField DataField="TotalStampDuty" HeaderText="Total Stamp Duty" 
                              SortExpression="TotalStampDuty" Visible="False" />
                              <asp:TemplateField HeaderText="Continue/Remand" 
                              SortExpression="Continue_remand" ItemStyle-HorizontalAlign="Center" 
                              Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="lblContinue_remand"  runat="server" Text="No" 
                                        Font-Names="Times New Roman" Font-Bold="false"></asp:Label>
                                </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" />
                              </asp:TemplateField>
                      
                          <asp:BoundField DataField="Result" HeaderText="Result" 
                              SortExpression="Result" Visible="False" />
                          <asp:BoundField DataField="OutwardNo" 
                              HeaderText="Outward No" 
                              SortExpression="OutwardNo" />
                          <asp:BoundField DataField="Date" HeaderText="Date" 
                              SortExpression="Date" />
                          <asp:BoundField DataField="AGYear" HeaderText="AG Year" 
                              SortExpression="AGYear" />
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
<h1>Appeal Register</h1>
<asp:FormView ID="FormView_AppealRegister" runat="server" DataKeyNames="SrNo,Continue_remand" 
        DataSourceID="ods_AppealRegister" EnableModelValidation="True" 
        DefaultMode="Insert" oniteminserting="FormView_AppealRegister_ItemInserting" 
        onitemcommand="FormView_AppealRegister_ItemCommand" 
        oniteminserted="FormView_AppealRegister_ItemInserted" 
        onitemupdated="FormView_AppealRegister_ItemUpdated" 
        ondatabound="FormView_AppealRegister_DataBound" 
        onitemupdating="FormView_AppealRegister_ItemUpdating" >
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
			
			<td>Deficit Stamp Duty:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="DeficitStampDutyTextBox" runat="server" 
                    Text='<%# Bind("DeficitStampDuty") %>' Width="160px" MaxLength="10" 
                    TabIndex="6" /></td>
		</tr>	            
		               
        <tr align="left">
		    <td>Kacheri/Office:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td>
                <asp:DropDownList ID="DropDownList_office" runat="server" 
                    DataSourceID="ods_OfficesMaster" DataTextField="OfficeName" 
                    DataValueField="OfficeName" Width="160px" TabIndex="1">
                </asp:DropDownList>
            </td>
			
			<td>Total Stamp Duty:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="TotalStampDutyTextBox" runat="server" 
                    Text='<%# Bind("TotalStampDuty") %>' Width="160px" MaxLength="10" 
                    TabIndex="7" /></td>
		</tr>
		           
        <tr align="left">
		    <td>Document No:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="DocumentNoTextBox" runat="server" numeric="integer"
                    Text='<%# Bind("DocumentNo") %>' Width="160px" MaxLength="10" 
                    TabIndex="2" /></td>
			
			<td>Continue Or Remand:</td>
			<td>
                &nbsp;</td>
			<td>
                <asp:RadioButtonList ID="RadioButtonList_continue" runat="server" 
                    RepeatDirection="Horizontal" TabIndex="8">
                    <asp:ListItem Text="Continue" Value="True"></asp:ListItem>
                    <asp:ListItem Text="Remand" Value="False"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>
		      
        <tr align="left">
		    <td>Year:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="YearTextBox" runat="server" numeric="integer" Text='<%# Bind("Year") %>' 
                    Width="160px" MaxLength="4" TabIndex="3" /></td>
			
			<td>Result:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="ResultTextBox" runat="server" Text='<%# Bind("Result") %>' 
                    Width="160px" MaxLength="20" TabIndex="9" /></td>
		</tr>
		                       
        <tr align="left">
		    <td>Name Of Applicant:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="NameOfApplicantTextBox" runat="server" 
                    Text='<%# Bind("NameOfApplicant") %>' Width="160px" MaxLength="30" 
                    TabIndex="4" /></td>
			
			<td>Outward No:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="OutwardNoTextBox" runat="server" 
                    Text='<%# Bind("OutwardNo") %>' Width="160px" MaxLength="10" 
                    TabIndex="10" /></td>
		</tr>
		                   
        <tr align="left">
		    <td>Versus:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td>
                <asp:DropDownList ID="DropdownList_Versus" runat="server" 
                    DataSourceID="ods_OfficesMaster" DataTextField="OfficeName" 
                    DataValueField="OfficeName" TabIndex="5">
                </asp:DropDownList>
            </td>
			
			<td>Date:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' 
                    Width="160px" TabIndex="11" /></td>
		</tr>
		                 
        <tr align="left">
		    <td></td>
			<td>
                &nbsp;</td>
			<td></td>
			
			<td>AG Year:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="AGYearTextBox" runat="server" numeric="integer" Text='<%# Bind("AGYear") %>' 
                    Width="160px" MaxLength="4" TabIndex="12" /></td>
		</tr>
		               
        <tr>
		    <td align="center" colspan=6>
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" CssClass="standardButton" 
                    TabIndex="13" />
				&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                    CausesValidation="False" CommandName="Reset" Text="Reset" 
                    CssClass="standardButton" 
                    onclientclick="resetTextFields();return false;" TabIndex="14" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" TabIndex="15" /></td>
		</tr>	
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
			
			<td>Deficit Stamp Duty:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="DeficitStampDutyTextBox" runat="server" 
                    Text='<%# Bind("DeficitStampDuty") %>' Width="160px" MaxLength="10" 
                    TabIndex="6" /></td>
		</tr>	            
		               
        <tr align="left">
		    <td>Kacheri/Office:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td>
                <asp:DropDownList ID="DropDownList_office" runat="server" 
                    DataSourceID="ods_OfficesMaster" DataTextField="OfficeName" 
                    DataValueField="OfficeName" Width="160px" TabIndex="1">
                </asp:DropDownList>
            </td>
			
			<td>Total Stamp Duty:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="TotalStampDutyTextBox" runat="server" 
                    Text='<%# Bind("TotalStampDuty") %>' Width="160px" MaxLength="10" 
                    TabIndex="7" /></td>
		</tr>
		           
        <tr align="left">
		    <td>Document No:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="DocumentNoTextBox" runat="server" numeric="integer"
                    Text='<%# Bind("DocumentNo") %>' Width="160px" MaxLength="10" 
                    TabIndex="2" /></td>
			
			<td>Continue Or Remand:</td>
			<td>
                &nbsp;</td>
			<td>
                <asp:RadioButtonList ID="RadioButtonList_continue" runat="server" 
                    RepeatDirection="Horizontal" TabIndex="8">
                    <asp:ListItem Text="Continue" Value="True"></asp:ListItem>
                    <asp:ListItem Text="Remand" Value="False"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>
		      
        <tr align="left">
		    <td>Year:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="YearTextBox" runat="server" numeric="integer" Text='<%# Bind("Year") %>' 
                    Width="160px" MaxLength="4" TabIndex="3" /></td>
			
			<td>Result:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="ResultTextBox" runat="server" Text='<%# Bind("Result") %>' 
                    Width="160px" MaxLength="20" TabIndex="9" /></td>
		</tr>
		                       
        <tr align="left">
		    <td>Name Of Applicant:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="NameOfApplicantTextBox" runat="server" 
                    Text='<%# Bind("NameOfApplicant") %>' Width="160px" MaxLength="30" 
                    TabIndex="4" /></td>
			
			<td>Outward No:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="OutwardNoTextBox" runat="server" 
                    Text='<%# Bind("OutwardNo") %>' Width="160px" MaxLength="10" 
                    TabIndex="10" /></td>
		</tr>
		                   
        <tr align="left">
		    <td>Versus:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td>
                <asp:DropDownList ID="DropdownList_Versus" runat="server" 
                    DataSourceID="ods_OfficesMaster" DataTextField="OfficeName" 
                    DataValueField="OfficeName" TabIndex="5">
                </asp:DropDownList>
            </td>
			
			<td>Date:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' 
                    Width="160px" TabIndex="11" /></td>
		</tr>
		                 
        <tr align="left">
		    <td></td>
			<td>
                &nbsp;</td>
			<td></td>
			
			<td>AG Year:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="AGYearTextBox" runat="server" numeric="integer" Text='<%# Bind("AGYear") %>' 
                    Width="160px" MaxLength="4" TabIndex="12" /></td>
		</tr>
		               
        <tr>
		    <td align="center" colspan=6>
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" CssClass="standardButton" 
                    TabIndex="13" />
				&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                    CausesValidation="False" CommandName="Reset" Text="Reset" 
                    CssClass="standardButton" 
                    onclientclick="resetTextFields();return false;" TabIndex="14" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" TabIndex="15" /></td>
		</tr>	
    </table>
            
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            FileNo:
            <asp:Label ID="FileNoLabel" runat="server" Text='<%# Bind("FileNo") %>' />
            <br />
            KacheriOffice:
            <asp:Label ID="KacheriOfficeLabel" runat="server" 
                Text='<%# Bind("KacheriOffice") %>' />
            <br />
            DocumentNo:
            <asp:Label ID="DocumentNoLabel" runat="server" 
                Text='<%# Bind("DocumentNo") %>' />
            <br />
            Year:
            <asp:Label ID="YearLabel" runat="server" Text='<%# Bind("Year") %>' />
            <br />
            NameOfApplicant:
            <asp:Label ID="NameOfApplicantLabel" runat="server" 
                Text='<%# Bind("NameOfApplicant") %>' />
            <br />
            Versus:
            <asp:Label ID="VersusLabel" runat="server" 
                Text='<%# Bind("Versus") %>' />
            <br />
            DeficitStampDuty:
            <asp:Label ID="DeficitStampDutyLabel" runat="server" 
                Text='<%# Bind("DeficitStampDuty") %>' />
            <br />
            TotalStampDuty:
            <asp:Label ID="TotalStampDutyLabel" runat="server" 
                Text='<%# Bind("TotalStampDuty") %>' />
            <br />
            Continue_remand:
            <asp:CheckBox ID="Continue_remandCheckBox" runat="server" 
                Checked='<%# Bind("Continue_remand") %>' Enabled="false" />
            <br />
            Result:
            <asp:Label ID="ResultLabel" runat="server" 
                Text='<%# Bind("Result") %>' />
            <br />
            OutwardNo:
            <asp:Label ID="OutwardNoLabel" runat="server" 
                Text='<%# Bind("OutwardNo") %>' />
            <br />
            Date:
            <asp:Label ID="DateLabel" runat="server" 
                Text='<%# Bind("Date") %>' />
            <br />
            AGYear:
            <asp:Label ID="AGYearLabel" runat="server" Text='<%# Bind("AGYear") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit"/>
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete"/>
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New"/>
        </ItemTemplate>
    </asp:FormView>
</center>
    
    <asp:ObjectDataSource ID="ods_AppealRegister" runat="server" DeleteMethod="DeleteQuery" 
        InsertMethod="Insert" SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.AppealRegisterTableAdapters.AppealRegisterTableAdapter" 
        UpdateMethod="UpdateQuery" onselecting="ods_AppealRegister_Selecting" 
        ondeleting="ods_AppealRegister_Deleting" 
        OldValuesParameterFormatString="original_{0}" >
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="KacheriOffice" Type="String" />
            <asp:Parameter Name="DocumentNo" Type="Int32" />
            <asp:Parameter Name="Year" Type="Int32" />
            <asp:Parameter Name="NameOfApplicant" Type="String" />
            <asp:Parameter Name="Versus" Type="String" />
            <asp:Parameter Name="DeficitStampDuty" Type="Decimal" />
            <asp:Parameter Name="TotalStampDuty" Type="Decimal" />
            <asp:Parameter Name="Continue_remand" Type="Boolean" />
            <asp:Parameter Name="Result" Type="String" />
            <asp:Parameter Name="OutwardNo" Type="String" />
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="AGYear" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="KacheriOffice" Type="String" />
            <asp:Parameter Name="DocumentNo" Type="Int32" />
            <asp:Parameter Name="Year" Type="Int32" />
            <asp:Parameter Name="NameOfApplicant" Type="String" />
            <asp:Parameter Name="Versus" Type="String" />
            <asp:Parameter Name="DeficitStampDuty" Type="Decimal" />
            <asp:Parameter Name="TotalStampDuty" Type="Decimal" />
            <asp:Parameter Name="Continue_remand" Type="Boolean" />
            <asp:Parameter Name="Result" Type="String" />
            <asp:Parameter Name="OutwardNo" Type="String" />
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="AGYear" Type="Int32" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_OfficesMaster" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        
        
        TypeName="IGRSS.DataAccessLayer.officenameTableAdapters.OfficesTableAdapter" 
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
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
</asp:View>    
</asp:MultiView>
</asp:Content>

