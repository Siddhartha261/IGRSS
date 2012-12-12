<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="History.aspx.cs" Inherits="LatestPages_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <script language="javascript">
    function generateDatePicker(id) {
        $('input[id*="' + id + '"]').datepicker({
            showOn: "both",
            buttonImage: "/WebApp/Styles/css/sunny/images/calendar.gif",
            buttonImageOnly: true,
            changeMonth: true,
            changeYear: true,
            yearRange: '1950:2020',
            onClose: function () {
                var textboxid = id;
                var dateSelected = $('input[id*="' + id + '"]').datepicker('getDate');
                var dateNow = new Date();
                if (dateSelected > dateNow) {
                    alert("Selected Date is greater than current date");
                    $('input[id*="' + id + '"]').val("");
                    $('input[id*="' + id + '"]').focus();
                }
            }
        });
        }

        function AllowAlphabet(e) {
            isIE = document.all ? 1 : 0
            keyEntry = !isIE ? e.which : event.keyCode;
            if (((keyEntry >= '65') && (keyEntry <= '90')) || ((keyEntry >= '97') && (keyEntry <= '122')) || (keyEntry == '46') || (keyEntry == '32') || keyEntry == '45')
                return true;
            else {
                alert('Please Enter Only Character values.');
                return false;
            }
        }

    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return true;
        return false;
    }
   
    

    function removeInlineStyles() {
        $("input[type='text']").each(function (index, element) { $(element).removeAttr("style"); });
        $("table[id*='FvGovtDoc']").removeAttr("style")
    }
    $(function () {

        // removeInlineStyles();
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

        var datePickers = ["Promtion_DateTextBox", "Actual_Date_of_Joining_DeptTextBox", "Preservice_training_Passing_DateTextBox","Retire_DateTextBox", "Sub_Register_Exam_Pass_DateTextBox", "First_Hier_Grade_DateTextBox", "Date_To_DateTextBox", "Transfer_DateTextBox", "Sec_Hier_Grade_DateTextBox", "Upgrade_Promotion_DateTextBox", "Clerk_Dept_Exam_Pass_DateTextBox", "Joining_DateTextBox", "Birth_DateTextBox"];
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
    <asp:MultiView ID="Multiview_history_card" runat="server" 
    ActiveViewIndex="0">
        <asp:View ID="view1_gridview" runat="server">
       
<h1 style="text-align: center" align="center">HISTORY Card REGISTER</h1>
    <table width="100%">
        <tr>    
            
                <td align="right">
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label>
               
                &nbsp<asp:TextBox ID="txtSearch" runat="server" 
                    meta:resourcekey="txtFileNoResource1" Width="160px"></asp:TextBox>
           
          
                 &nbsp<asp:LinkButton ID="ButtonSearch" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1"  
                     OnClientClick="return isNumberKey(evt)" CssClass="standardButton"/>
            </td>
            
        </tr>
        <tr>
            <td colspan="6">             
                <asp:GridView ID="GridView_History" runat="server" 
                    AutoGenerateColumns="False" DataKeyNames="SrNo" 
                    DataSourceID="ObjectDataSource_history_card" EnableModelValidation="True" 
                    Width="100%" onrowdeleted="GridView_History_RowDeleted" 
                    onrowdeleting="GridView_History_RowDeleting" 
                    onrowediting="GridView_History_RowEditing">
                    <Columns>
                        <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                            ReadOnly="True" SortExpression="Sr No" Visible="False" />
                        <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" 
                            SortExpression="Employee_Name" />
                        <asp:BoundField DataField="Birth_Date" HeaderText="Date Of Birth" 
                            SortExpression="Birth_Date" />
                        <asp:BoundField DataField="Prmnt_Addr" HeaderText="Permanent Address" 
                            SortExpression="Prmnt_Addr" Visible="False" />
                        <asp:BoundField DataField="Educn_Qualfn" HeaderText="Educational  Qualification" 
                            SortExpression="Educn_Qualfn" Visible="False" />
                        <asp:BoundField DataField="Join_as_Design" HeaderText="Joined As Designation" 
                            SortExpression="Join_as_Design" Visible="False" />
                        <asp:BoundField DataField="Joining_Date" HeaderText="Joining Date" 
                            SortExpression="Joining_Date" Visible="False" />
                        <asp:BoundField DataField="Promtion_Date" HeaderText="Date Of Promotion" 
                            SortExpression="Promtion_Date" Visible="False" />
                        <asp:BoundField DataField="Promotion_Design" HeaderText="Promotion Designation" 
                            SortExpression="Promotion_Design" Visible="False" />
                        <asp:BoundField DataField="Actual_Date_of_Joining_Dept" 
                            HeaderText="Actual Date Of Joining Department" 
                            SortExpression="Actual_Date_of_Joining_Dept" Visible="False" />
                        <asp:BoundField DataField="Religion" HeaderText="Religion" 
                            SortExpression="Religion" Visible="False" />
                        <asp:BoundField DataField="Caste" HeaderText="Caste" SortExpression="Caste" 
                            Visible="False" />
                        <asp:BoundField DataField="Current_desig" HeaderText="Current Desifnation" 
                            SortExpression="Current_desig" />
                        <asp:BoundField DataField="Preservice_training_Passing_Date" 
                            HeaderText="Preservice  Training Passing Date" 
                            SortExpression="Preservice_training_Passing_Date" Visible="False" />
                        <asp:BoundField DataField="Clerk_Dept_Exam_Pass_Date" 
                            HeaderText="Clerk Dept Exam Pass Date" 
                            SortExpression="Clerk_Dept_Exam_Pass_Date" Visible="False" />
                        <asp:BoundField DataField="Sub_Register_Exam_Pass_Date" 
                            HeaderText="Sub Register Exam Passing Date" 
                            SortExpression="Sub_Register_Exam_Pass_Date" Visible="False" />
                        <asp:BoundField DataField="Upgrade_Promotion_Date" 
                            HeaderText="Upgrade Promotion Date" 
                            SortExpression="Upgrade_Promotion_Date" />
                        <asp:BoundField DataField="First_Hier_Grade_Date" 
                            HeaderText="First Hier Grade Date" SortExpression="First_Hier_Grade_Date" 
                            Visible="False" />
                        <asp:BoundField DataField="Sec_Hier_Grade_Date" 
                            HeaderText="Second Hier Grade Date" SortExpression="Sec_Hier_Grade_Date" 
                            Visible="False" />
                        <asp:BoundField DataField="Extra_Currclar_Activities" 
                            HeaderText="Extra Curricular Activities" 
                            SortExpression="Extra_Currclar_Activities" Visible="False" />
                        <asp:BoundField DataField="Extra_Qualities" HeaderText="Extra Qualities" 
                            SortExpression="Extra_Qualities" Visible="False" />
                        <asp:BoundField DataField="Retire_Date" HeaderText="Retire Date" 
                            SortExpression="Retire_Date" />
                        <asp:BoundField DataField="Other_Details" HeaderText="Other Details" 
                            SortExpression="Other_Details" Visible="False" />
                        <asp:BoundField DataField="Date_To_Date" HeaderText="Date To Date" 
                            SortExpression="Date_To_Date" Visible="False" />
                        <asp:BoundField DataField="Curr_Desig_with_office" 
                            HeaderText="Current Designation With Office" 
                            SortExpression="Curr_Desig_with_office" />
                        <asp:BoundField DataField="Transfer_Date" HeaderText="Transfer Date" 
                            SortExpression="Transfer_Date" Visible="False" />
                        <asp:BoundField DataField="Servc_Break_Leave" HeaderText="Service Break Leave" 
                            SortExpression="Servc_Break_Leave" />
                            <asp:TemplateField HeaderText="Actions"><ItemTemplate><table><tr><td><asp:ImageButton ID="ImageButton1" CommandName="Edit" runat="server" 
                                                ImageUrl="~/Styles/css/sunny/images/edit.png" /></td><td><asp:ImageButton ID="ImageButton2" CommandName="Delete" runat="server" 
                                                ImageUrl="~/Styles/css/sunny/images/deletecross.png" /></td></tr></table></ItemTemplate></asp:TemplateField>
                    </Columns>
                </asp:GridView>
                
            </td>
        </tr>
    </table>
         <asp:LinkButton ID="Button_new" runat="server" OnClick="Button_new_Click" 
                    Text="New" CssClass="standardButton" Height="19px" AccessKey="N" />   
        </asp:View>
        <asp:View ID="view2_Fv" runat="server">
            <center>
            <h1 align="center">HISTORY Card&nbsp; REGISTER</h1>
             </center>
             <asp:FormView ID="Formview_History_Card" runat="server" DataKeyNames="SrNo" DataSourceID="ObjectDataSource_history_card"
                    EnableModelValidation="True" DefaultMode="Insert" 
                onitemcommand="Fv_History_Card_ItemCommand" 
                oniteminserting="Formview_History_Card_ItemInserting" 
                oniteminserted="Formview_History_Card_ItemInserted" 
                onitemupdated="Formview_History_Card_ItemUpdated" 
                onitemupdating="Formview_History_Card_ItemUpdating">
                    <EditItemTemplate>
                        <table align="center" cellspacing="5" width="1200px">
						<tr align="left"><td>Name Of Employee :</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="*" ControlToValidate="Employee_NameTextBox"></asp:RequiredFieldValidator>
                            </td><td> 
                            <asp:TextBox ID="Employee_NameTextBox" runat="server"  onkeypress="return AllowAlphabet(event)" 
                            Text='<%# Bind("Employee_Name") %>' Width="160px" MaxLength="30" /></td><td>Date Of Birth:</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                ErrorMessage="*" ControlToValidate="Birth_DateTextBox"></asp:RequiredFieldValidator>
                            </td><td>
                            <asp:TextBox ID="Birth_DateTextBox" runat="server"  
                            Text='<%# Bind("Birth_Date") %>' Width="160px" /></td></tr>
                        <tr align="left"><td>Permanent Address :</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="*" ControlToValidate="DropDownListDistrict"></asp:RequiredFieldValidator>
                            </td><td>
                            <asp:DropDownList ID="DropDownListDistrict" runat="server" 
                                DataSourceID="ods_District" DataTextField="District_Name" 
                                DataValueField="District_Name" Width="160px">
                            </asp:DropDownList>
                            </td><td>Educational Qualification :</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                ErrorMessage="*" ControlToValidate="DropDownListEduQualfn"></asp:RequiredFieldValidator>
                            </td><td> 
                            <asp:DropDownList ID="DropDownListEduQualfn" runat="server" 
                                DataSourceID="ods_EducationalQualfn" DataTextField="Details" 
                                DataValueField="Details" Width="160px">
                            </asp:DropDownList>
                            </td></tr>
                            <tr align="left"><td>Joined As :</td><td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ErrorMessage="*" ControlToValidate="DropDownListDesignation1"></asp:RequiredFieldValidator>
                                </td><td>
                            <asp:DropDownList ID="DropDownListDesignation1" runat="server" 
                                DataSourceID="ods_Designation" DataTextField="Name" DataValueField="Name" 
                                    Width="160px">
                            </asp:DropDownList>
                            </td><td>Date Of Joining:</td><td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                                    ErrorMessage="*" ControlToValidate="Joining_DateTextBox"></asp:RequiredFieldValidator>
                                </td><td>
                                <asp:TextBox ID="Joining_DateTextBox" runat="server" 
                            Text='<%# Bind("Joining_Date") %>' Width="160px" /></td></tr>
                            <tr align="left"><td>Date Of Promotion:</td><td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ErrorMessage="*" ControlToValidate="Promtion_DateTextBox"></asp:RequiredFieldValidator>
                                </td><td>  
                                <asp:TextBox ID="Promtion_DateTextBox" runat="server" 
                            Text='<%# Bind("Promtion_Date") %>' Width="160px" /></td><td>Designation Of Promotion:</td><td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                    ErrorMessage="*" ControlToValidate="Promotion_DesignTextBox"></asp:RequiredFieldValidator>
                                </td><td>
                                <asp:TextBox ID="Promotion_DesignTextBox" runat="server" 
                            Text='<%# Bind("Promotion_Design") %>' Width="160px" /></td></tr>
                            <tr align="left"><td>  Actual Date Of Joining Department:</td><td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ErrorMessage="*" ControlToValidate="Actual_Date_of_Joining_DeptTextBox"></asp:RequiredFieldValidator>
                                </td><td>
                                <asp:TextBox ID="Actual_Date_of_Joining_DeptTextBox" runat="server" 
                            Text='<%# Bind("Actual_Date_of_Joining_Dept") %>' Width="160px" /></td><td>Religion :</td><td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                    ErrorMessage="*" ControlToValidate="DropDownListReligionMaster"></asp:RequiredFieldValidator>
                                </td><td>
                                <asp:DropDownList ID="DropDownListReligionMaster" runat="server" 
                                    DataSourceID="ods_Religion1" DataTextField="Religion_Name" 
                                    DataValueField="Religion_Name" Width="160px">
                                </asp:DropDownList>
                                </td></tr>
                            <tr align="left"><td>Caste:</td><td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ErrorMessage="*" Enabled="False" ControlToValidate="DropDownListCaste"></asp:RequiredFieldValidator>
                                </td><td> 
                            <asp:DropDownList ID="DropDownListCaste" runat="server" Width="160px"
                                DataSourceID="ods_Caste" DataTextField="Cast_Name" DataValueField="Cast_Name">
                            </asp:DropDownList>
                            </td><td> Current Designation:</td><td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                    ErrorMessage="*" ControlToValidate="DropDownListCurrentDesign"></asp:RequiredFieldValidator>
                                </td><td>
                            <asp:DropDownList ID="DropDownListCurrentDesign" runat="server" 
                                DataSourceID="ods_Designation" DataTextField="Name" DataValueField="Name" 
                                    Width="160px">
                            </asp:DropDownList>
                            </td></tr>

                        
                        
                       
                        <tr align="left"><td>Preservice Training Passing Date :</td><td>
                            &nbsp;</td> <td>
                            <asp:TextBox ID="Preservice_training_Passing_DateTextBox" runat="server" 
                            Text='<%# Bind("Preservice_training_Passing_Date") %>' Width="160px" /></td><td>Clerk Department Passing Date </td><td></td><td> 
                            <asp:TextBox ID="Clerk_Dept_Exam_Pass_DateTextBox" runat="server" 
                            Text='<%# Bind("Clerk_Dept_Exam_Pass_Date") %>' Width="160px" /></td></tr>
                       
                        <tr align="left"><td> Sub Register Exam Pass Date:</td><td></td><td>
                            <asp:TextBox ID="Sub_Register_Exam_Pass_DateTextBox" runat="server" 
                            Text='<%# Bind("Sub_Register_Exam_Pass_Date") %>' Width="160px" /></td><td> Upgradation Of Designation Promotion Date:</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                ErrorMessage="*" ControlToValidate="Upgrade_Promotion_DateTextBox"></asp:RequiredFieldValidator>
                            </td><td>   
                            <asp:TextBox ID="Upgrade_Promotion_DateTextBox" runat="server" 
                            Text='<%# Bind("Upgrade_Promotion_Date") %>' Width="160px" /></td></tr>
                        <tr align="left"><td>First Hier Grade Date :</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                ErrorMessage="*" ControlToValidate="First_Hier_Grade_DateTextBox"></asp:RequiredFieldValidator>
                            </td><td>
                            <asp:TextBox ID="First_Hier_Grade_DateTextBox" runat="server" 
                            Text='<%# Bind("First_Hier_Grade_Date") %>' Width="160px" /></td><td>Second Hier Grade Date :</td><td></td><td>
                            <asp:TextBox ID="Sec_Hier_Grade_DateTextBox" runat="server" 
                            Text='<%# Bind("Sec_Hier_Grade_Date") %>' Width="160px" /></td></tr>
                        
                        <tr align="left"><td> Date To Date:</td><td></td><td> 
                            <asp:TextBox ID="Date_To_DateTextBox" runat="server" 
                            Text='<%# Bind("Date_To_Date") %>' Width="160px" /></td><td>Current Designation With Office :</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                ErrorMessage="*" ControlToValidate="DropDownListCurrDesigwithOffice"></asp:RequiredFieldValidator>
                            </td><td> 
                            <asp:DropDownList ID="DropDownListCurrDesigwithOffice" runat="server" 
                                DataSourceID="ods_Designation" DataTextField="Name" DataValueField="Name" 
                                Width="160px">
                            </asp:DropDownList>
                            </td></tr>
                        <tr align="left"><td> Date Of Transfer:</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ErrorMessage="*" ControlToValidate="Date_To_DateTextBox"></asp:RequiredFieldValidator>
                            </td><td> 
                            <asp:TextBox ID="Transfer_DateTextBox" runat="server" 
                            Text='<%# Bind("Transfer_Date") %>' Width="160px" /></td><td>Service Break Leave :</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                ErrorMessage="*" ControlToValidate="Servc_Break_LeaveTextBox"></asp:RequiredFieldValidator>
                            </td><td> 
                            <asp:TextBox ID="Servc_Break_LeaveTextBox" runat="server" 
                            Text='<%# Bind("Servc_Break_Leave") %>' Width="160px" /></td></tr>
                            <tr align="left"><td>Extra Curricular Activities :</td><td></td><td>
                            <asp:TextBox ID="Extra_Currclar_ActivitiesTextBox" runat="server" 
                            Text='<%# Bind("Extra_Currclar_Activities") %>' Width="160px" Height="60px" 
                                TextMode="MultiLine" /></td><td> Extra Qualities:</td><td></td><td>
                            <asp:TextBox ID="Extra_QualitiesTextBox" runat="server"  onkeypress="return AllowAlphabet(event)"
                            Text='<%# Bind("Extra_Qualities") %>' Width="160px" Height="60px" 
                                TextMode="MultiLine" /></td></tr>
                        <tr align="left"><td>Date Of Retirement:</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ErrorMessage="*" ControlToValidate="Retire_DateTextBox"></asp:RequiredFieldValidator>
                            </td><td> 
                            <asp:TextBox ID="Retire_DateTextBox" runat="server" 
                            Text='<%# Bind("Retire_Date") %>' Width="160px" /></td><td> Other Details :</td><td></td><td> 
                            <asp:TextBox ID="Other_DetailsTextBox" runat="server"  onkeypress="return AllowAlphabet(event)"
                            Text='<%# Bind("Other_Details") %>' Width="160px" Height="60px" 
                                TextMode="MultiLine" /></td></tr>
                       
                        <tr>
                      
			 <td align="center" colspan="6"> 
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" CssClass="standardButton" AccessKey="U" />
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" 
                     AccessKey="R" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" AccessKey="B" /></td>
                   
                 
			</tr></table>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                    <table align="center" cellspacing="5" width="1000px">
						<tr align="left"><td>Name Of Employee :</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ErrorMessage="*" ControlToValidate="Employee_NameTextBox"></asp:RequiredFieldValidator>
                            </td><td> 
                            <asp:TextBox ID="Employee_NameTextBox" runat="server"  onkeypress="return AllowAlphabet(event)" 
                            Text='<%# Bind("Employee_Name") %>' Width="160px" MaxLength="30" /></td><td>Date Of Birth:</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                ErrorMessage="*" ControlToValidate="Birth_DateTextBox"></asp:RequiredFieldValidator>
                            </td><td>
                            <asp:TextBox ID="Birth_DateTextBox" runat="server"  
                            Text='<%# Bind("Birth_Date") %>' Width="160px" /></td></tr>
                        <tr align="left"><td>Permanent Address :</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="*" ControlToValidate="DropDownListDistrict"></asp:RequiredFieldValidator>
                            </td><td>
                            <asp:DropDownList ID="DropDownListDistrict" runat="server" 
                                DataSourceID="ods_District" DataTextField="District_Name" 
                                DataValueField="District_Name" Width="160px">
                            </asp:DropDownList>
                            </td><td>Educational Qualification :</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                ErrorMessage="*" ControlToValidate="DropDownListEduQualfn"></asp:RequiredFieldValidator>
                            </td><td> 
                            <asp:DropDownList ID="DropDownListEduQualfn" runat="server" 
                                DataSourceID="ods_EducationalQualfn" DataTextField="Details" 
                                DataValueField="Details" Width="160px">
                            </asp:DropDownList>
                            </td></tr>
                            <tr align="left"><td>Joined As :</td><td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ErrorMessage="*" ControlToValidate="DropDownListDesignation1"></asp:RequiredFieldValidator>
                                </td><td>
                            <asp:DropDownList ID="DropDownListDesignation1" runat="server" 
                                DataSourceID="ods_Designation" DataTextField="Name" DataValueField="Name" 
                                    Width="160px">
                            </asp:DropDownList>
                            </td><td>Date Of Joining:</td><td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                                    ErrorMessage="*" ControlToValidate="Joining_DateTextBox"></asp:RequiredFieldValidator>
                                </td><td>
                                <asp:TextBox ID="Joining_DateTextBox" runat="server" 
                            Text='<%# Bind("Joining_Date") %>' Width="160px" /></td></tr>
                            <tr align="left"><td>Date Of Promotion:</td><td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ErrorMessage="*" ControlToValidate="Promtion_DateTextBox"></asp:RequiredFieldValidator>
                                </td><td>  
                                <asp:TextBox ID="Promtion_DateTextBox" runat="server" 
                            Text='<%# Bind("Promtion_Date") %>' Width="160px" /></td><td>Designation Of Promotion:</td><td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                    ErrorMessage="*" ControlToValidate="Promotion_DesignTextBox"></asp:RequiredFieldValidator>
                                </td><td>
                                <asp:TextBox ID="Promotion_DesignTextBox" runat="server" 
                            Text='<%# Bind("Promotion_Design") %>' Width="160px" /></td></tr>
                            <tr align="left"><td>  Actual Date Of Joining Department:</td><td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ErrorMessage="*" ControlToValidate="Actual_Date_of_Joining_DeptTextBox"></asp:RequiredFieldValidator>
                                </td><td>
                                <asp:TextBox ID="Actual_Date_of_Joining_DeptTextBox" runat="server" 
                            Text='<%# Bind("Actual_Date_of_Joining_Dept") %>' Width="160px" /></td><td>Religion :</td><td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                    ErrorMessage="*" ControlToValidate="DropDownListReligionMaster"></asp:RequiredFieldValidator>
                                </td><td>
                                <asp:DropDownList ID="DropDownListReligionMaster" runat="server" 
                                    DataSourceID="ods_Religion1" DataTextField="Religion_Name" 
                                    DataValueField="Religion_Name" Width="160px">
                                </asp:DropDownList>
                                </td></tr>
                            <tr align="left"><td>Caste:</td><td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ErrorMessage="*" Enabled="False" ControlToValidate="DropDownListCaste"></asp:RequiredFieldValidator>
                                </td><td> 
                            <asp:DropDownList ID="DropDownListCaste" runat="server" Width="160px"
                                DataSourceID="ods_Caste" DataTextField="Cast_Name" DataValueField="Cast_Name">
                            </asp:DropDownList>
                            </td><td> Current Designation:</td><td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                    ErrorMessage="*" ControlToValidate="DropDownListCurrentDesign"></asp:RequiredFieldValidator>
                                </td><td>
                            <asp:DropDownList ID="DropDownListCurrentDesign" runat="server" 
                                DataSourceID="ods_Designation" DataTextField="Name" DataValueField="Name" 
                                    Width="160px">
                            </asp:DropDownList>
                            </td></tr>
                            <tr align="left"><td>Preservice Training Passing Date :</td><td>
                            </td> <td>
                            <asp:TextBox ID="Preservice_training_Passing_DateTextBox" runat="server" 
                            Text='<%# Bind("Preservice_training_Passing_Date") %>' Width="160px" /></td><td>Clerk Department Passing Date </td><td></td><td> 
                            <asp:TextBox ID="Clerk_Dept_Exam_Pass_DateTextBox" runat="server" 
                            Text='<%# Bind("Clerk_Dept_Exam_Pass_Date") %>' Width="160px" /></td></tr>
                       
                        <tr align="left"><td> Sub Register Exam Pass Date:</td><td></td><td>
                            <asp:TextBox ID="Sub_Register_Exam_Pass_DateTextBox" runat="server" 
                            Text='<%# Bind("Sub_Register_Exam_Pass_Date") %>' Width="160px" /></td><td> Upgradation Of Designation Promotion Date:</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                ErrorMessage="*" ControlToValidate="Upgrade_Promotion_DateTextBox"></asp:RequiredFieldValidator>
                            </td><td>   
                            <asp:TextBox ID="Upgrade_Promotion_DateTextBox" runat="server" 
                            Text='<%# Bind("Upgrade_Promotion_Date") %>' Width="160px" /></td></tr>
                        <tr align="left"><td>First Hier Grade Date :</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                ErrorMessage="*" ControlToValidate="First_Hier_Grade_DateTextBox"></asp:RequiredFieldValidator>
                            </td><td>
                            <asp:TextBox ID="First_Hier_Grade_DateTextBox" runat="server" 
                            Text='<%# Bind("First_Hier_Grade_Date") %>' Width="160px" /></td><td>Second Hier Grade Date :</td><td></td><td>
                            <asp:TextBox ID="Sec_Hier_Grade_DateTextBox" runat="server" 
                            Text='<%# Bind("Sec_Hier_Grade_Date") %>' Width="160px" /></td></tr>
                        
                        <tr align="left"><td> Date To Date:</td><td></td><td> 
                            <asp:TextBox ID="Date_To_DateTextBox" runat="server" 
                            Text='<%# Bind("Date_To_Date") %>' Width="160px" /></td><td>Current Designation With Office :</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                ErrorMessage="*" ControlToValidate="DropDownListCurrDesigwithOffice"></asp:RequiredFieldValidator>
                            </td><td> 
                            <asp:DropDownList ID="DropDownListCurrDesigwithOffice" runat="server" 
                                DataSourceID="ods_Designation" DataTextField="Name" DataValueField="Name" 
                                Width="160px">
                            </asp:DropDownList>
                            </td></tr>
                        <tr align="left"><td> Date Of Transfer:</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                ErrorMessage="*" ControlToValidate="Date_To_DateTextBox"></asp:RequiredFieldValidator>
                            </td><td> 
                            <asp:TextBox ID="Transfer_DateTextBox" runat="server" 
                            Text='<%# Bind("Transfer_Date") %>' Width="160px" /></td><td>Service Break Leave :</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                ErrorMessage="*" ControlToValidate="Servc_Break_LeaveTextBox"></asp:RequiredFieldValidator>
                            </td><td> 
                            <asp:TextBox ID="Servc_Break_LeaveTextBox" runat="server" 
                            Text='<%# Bind("Servc_Break_Leave") %>' Width="160px" /></td></tr>
                            <tr align="left"><td>Extra Curricular Activities :</td><td></td><td>
                            <asp:TextBox ID="Extra_Currclar_ActivitiesTextBox" runat="server" 
                            Text='<%# Bind("Extra_Currclar_Activities") %>' Width="160px" Height="60px" 
                                TextMode="MultiLine" /></td><td> Extra Qualities:</td><td></td><td>
                            <asp:TextBox ID="Extra_QualitiesTextBox" runat="server"  onkeypress="return AllowAlphabet(event)"
                            Text='<%# Bind("Extra_Qualities") %>' Width="160px" Height="60px" 
                                TextMode="MultiLine" /></td></tr>
                        <tr align="left"><td>Date Of Retirement:</td><td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                ErrorMessage="*" ControlToValidate="Retire_DateTextBox"></asp:RequiredFieldValidator>
                            </td><td> 
                            <asp:TextBox ID="Retire_DateTextBox" runat="server" 
                            Text='<%# Bind("Retire_Date") %>' Width="160px" /></td><td> Other Details :</td><td></td><td> 
                            <asp:TextBox ID="Other_DetailsTextBox" runat="server"  onkeypress="return AllowAlphabet(event)"
                            Text='<%# Bind("Other_Details") %>' Width="160px" Height="60px" 
                                TextMode="MultiLine" /></td></tr>
                       
                        <tr>
                         
			 <td align="center" colspan="6"> 
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" CssClass="standardButton" AccessKey="I"  />
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" 
                     AccessKey="R" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" AccessKey="B" /></td>
                   
                     
                      
			</tr></table>
							
                    </InsertItemTemplate>
                    <ItemTemplate>
                        SrNo:
                        <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
                        <br />
                        Employee_Name:
                        <asp:Label ID="Employee_NameLabel" runat="server" 
                            Text='<%# Bind("Employee_Name") %>' />
                        <br />
                        Birth_Date:
                        <asp:Label ID="Birth_DateLabel" runat="server" 
                            Text='<%# Bind("Birth_Date") %>' />
                        <br />
                        Prmnt_Addr:
                        <asp:Label ID="Prmnt_AddrLabel" runat="server" 
                            Text='<%# Bind("Prmnt_Addr") %>' />
                        <br />
                        Educn_Qualfn:
                        <asp:Label ID="Educn_QualfnLabel" runat="server" 
                            Text='<%# Bind("Educn_Qualfn") %>' />
                        <br />
                        Join_as_Design:
                        <asp:Label ID="Join_as_DesignLabel" runat="server" 
                            Text='<%# Bind("Join_as_Design") %>' />
                        <br />
                        Joining_Date:
                        <asp:Label ID="Joining_DateLabel" runat="server" 
                            Text='<%# Bind("Joining_Date") %>' />
                        <br />
                        Promtion_Date:
                        <asp:Label ID="Promtion_DateLabel" runat="server" 
                            Text='<%# Bind("Promtion_Date") %>' />
                        <br />
                        Promotion_Design:
                        <asp:Label ID="Promotion_DesignLabel" runat="server" 
                            Text='<%# Bind("Promotion_Design") %>' />
                        <br />
                        Actual_Date_of_Joining_Dept:
                        <asp:Label ID="Actual_Date_of_Joining_DeptLabel" runat="server" 
                            Text='<%# Bind("Actual_Date_of_Joining_Dept") %>' />
                        <br />
                        Religion:
                        <asp:Label ID="ReligionLabel" runat="server" Text='<%# Bind("Religion") %>' />
                        <br />
                        Caste:
                        <asp:Label ID="CasteLabel" runat="server" Text='<%# Bind("Caste") %>' />
                        <br />
                        Current_desig:
                        <asp:Label ID="Current_desigLabel" runat="server" 
                            Text='<%# Bind("Current_desig") %>' />
                        <br />
                        Preservice_training_Passing_Date:
                        <asp:Label ID="Preservice_training_Passing_DateLabel" runat="server" 
                            Text='<%# Bind("Preservice_training_Passing_Date") %>' />
                        <br />
                        Clerk_Dept_Exam_Pass_Date:
                        <asp:Label ID="Clerk_Dept_Exam_Pass_DateLabel" runat="server" 
                            Text='<%# Bind("Clerk_Dept_Exam_Pass_Date") %>' />
                        <br />
                        Sub_Register_Exam_Pass_Date:
                        <asp:Label ID="Sub_Register_Exam_Pass_DateLabel" runat="server" 
                            Text='<%# Bind("Sub_Register_Exam_Pass_Date") %>' />
                        <br />
                        Upgrade_Promotion_Date:
                        <asp:Label ID="Upgrade_Promotion_DateLabel" runat="server" 
                            Text='<%# Bind("Upgrade_Promotion_Date") %>' />
                        <br />
                        First_Hier_Grade_Date:
                        <asp:Label ID="First_Hier_Grade_DateLabel" runat="server" 
                            Text='<%# Bind("First_Hier_Grade_Date") %>' />
                        <br />
                        Sec_Hier_Grade_Date:
                        <asp:Label ID="Sec_Hier_Grade_DateLabel" runat="server" 
                            Text='<%# Bind("Sec_Hier_Grade_Date") %>' />
                        <br />
                        Extra_Currclar_Activities:
                        <asp:Label ID="Extra_Currclar_ActivitiesLabel" runat="server" 
                            Text='<%# Bind("Extra_Currclar_Activities") %>' />
                        <br />
                        Extra_Qualities:
                        <asp:Label ID="Extra_QualitiesLabel" runat="server" 
                            Text='<%# Bind("Extra_Qualities") %>' />
                        <br />
                        Retire_Date:
                        <asp:Label ID="Retire_DateLabel" runat="server" 
                            Text='<%# Bind("Retire_Date") %>' />
                        <br />
                        Other_Details:
                        <asp:Label ID="Other_DetailsLabel" runat="server" 
                            Text='<%# Bind("Other_Details") %>' />
                        <br />
                        Date_To_Date:
                        <asp:Label ID="Date_To_DateLabel" runat="server" 
                            Text='<%# Bind("Date_To_Date") %>' />
                        <br />
                        Curr_Desig_with_office:
                        <asp:Label ID="Curr_Desig_with_officeLabel" runat="server" 
                            Text='<%# Bind("Curr_Desig_with_office") %>' />
                        <br />
                        Transfer_Date:
                        <asp:Label ID="Transfer_DateLabel" runat="server" 
                            Text='<%# Bind("Transfer_Date") %>' />
                        <br />
                        Servc_Break_Leave:
                        <asp:Label ID="Servc_Break_LeaveLabel" runat="server" 
                            Text='<%# Bind("Servc_Break_Leave") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                            CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
            <asp:ObjectDataSource ID="ods_EducationalQualfn" runat="server" 
                DeleteMethod="Delete" InsertMethod="Insert" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="IGRSS.DataAccessLayer.EducationalQualfnTableAdapters.EmployeeQualificationsTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter DbType="Guid" Name="Original_EmployeeQualiID" />
                    <asp:Parameter DbType="Guid" Name="Original_EmployeeID" />
                    <asp:Parameter DbType="Guid" Name="Original_QualificationID" />
                    <asp:Parameter Name="Original_Details" Type="String" />
                    <asp:Parameter Name="Original_CreatedBy" Type="String" />
                    <asp:Parameter Name="Original_CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_ModifiedBy" Type="String" />
                    <asp:Parameter Name="Original_ModifiedAt" Type="DateTime" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Guid" Name="EmployeeQualiID" />
                    <asp:Parameter DbType="Guid" Name="EmployeeID" />
                    <asp:Parameter DbType="Guid" Name="QualificationID" />
                    <asp:Parameter Name="Details" Type="String" />
                    <asp:Parameter Name="CreatedBy" Type="String" />
                    <asp:Parameter Name="CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="ModifiedBy" Type="String" />
                    <asp:Parameter Name="ModifiedAt" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter DbType="Guid" Name="EmployeeID" />
                    <asp:Parameter DbType="Guid" Name="QualificationID" />
                    <asp:Parameter Name="Details" Type="String" />
                    <asp:Parameter Name="CreatedBy" Type="String" />
                    <asp:Parameter Name="CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="ModifiedBy" Type="String" />
                    <asp:Parameter Name="ModifiedAt" Type="DateTime" />
                    <asp:Parameter DbType="Guid" Name="Original_EmployeeQualiID" />
                    <asp:Parameter DbType="Guid" Name="Original_EmployeeID" />
                    <asp:Parameter DbType="Guid" Name="Original_QualificationID" />
                    <asp:Parameter Name="Original_Details" Type="String" />
                    <asp:Parameter Name="Original_CreatedBy" Type="String" />
                    <asp:Parameter Name="Original_CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_ModifiedBy" Type="String" />
                    <asp:Parameter Name="Original_ModifiedAt" Type="DateTime" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ods_Caste" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetData" 
                TypeName="IGRSS.DataAccessLayer.CastMasterTableAdapters.Cast_MasterTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_Cast_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Cast_ID" Type="Int32" />
                    <asp:Parameter Name="Cast_Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Cast_ID" Type="Int32" />
                    <asp:Parameter Name="Cast_Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_Cast_ID" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ods_Religion1" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetData" 
                TypeName="IGRSS.DataAccessLayer.ReligionMasterTableAdapters.Religion_MasterTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_Religion_Name" Type="String" />
                    <asp:Parameter Name="Original_Religion_No" Type="Int32" />
                    <asp:Parameter Name="Original_Religion_Details" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Religion_Name" Type="String" />
                    <asp:Parameter Name="Religion_No" Type="Int32" />
                    <asp:Parameter Name="Religion_Details" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Religion_Name" Type="String" />
                    <asp:Parameter Name="Religion_No" Type="Int32" />
                    <asp:Parameter Name="Religion_Details" Type="String" />
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_Religion_Name" Type="String" />
                    <asp:Parameter Name="Original_Religion_No" Type="Int32" />
                    <asp:Parameter Name="Original_Religion_Details" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            &nbsp;<asp:ObjectDataSource ID="ods_Designation" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" 
                TypeName="IGRSS.DataAccessLayer.DesignationMasterTableAdapters.DesignationMasterTableAdapter" 
                DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter DbType="Guid" Name="Original_DesignationID" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                    <asp:Parameter Name="Original_Description" Type="String" />
                    <asp:Parameter Name="Original_CreatedBy" Type="String" />
                    <asp:Parameter Name="Original_CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_ModifiedBy" Type="String" />
                    <asp:Parameter Name="Original_ModifiedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_IsDeleted" Type="Boolean" />
                    <asp:Parameter Name="Original_DeletedBy" Type="String" />
                    <asp:Parameter Name="Original_DeletedAt" Type="DateTime" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Guid" Name="DesignationID" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="CreatedBy" Type="String" />
                    <asp:Parameter Name="CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="ModifiedBy" Type="String" />
                    <asp:Parameter Name="ModifiedAt" Type="DateTime" />
                    <asp:Parameter Name="IsDeleted" Type="Boolean" />
                    <asp:Parameter Name="DeletedBy" Type="String" />
                    <asp:Parameter Name="DeletedAt" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="CreatedBy" Type="String" />
                    <asp:Parameter Name="CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="ModifiedBy" Type="String" />
                    <asp:Parameter Name="ModifiedAt" Type="DateTime" />
                    <asp:Parameter Name="IsDeleted" Type="Boolean" />
                    <asp:Parameter Name="DeletedBy" Type="String" />
                    <asp:Parameter Name="DeletedAt" Type="DateTime" />
                    <asp:Parameter DbType="Guid" Name="Original_DesignationID" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                    <asp:Parameter Name="Original_Description" Type="String" />
                    <asp:Parameter Name="Original_CreatedBy" Type="String" />
                    <asp:Parameter Name="Original_CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_ModifiedBy" Type="String" />
                    <asp:Parameter Name="Original_ModifiedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_IsDeleted" Type="Boolean" />
                    <asp:Parameter Name="Original_DeletedBy" Type="String" />
                    <asp:Parameter Name="Original_DeletedAt" Type="DateTime" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ods_District" runat="server" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetData" 
                
                TypeName="IGRSS.DataAccessLayer.District_MasterTableAdapters.District_MasterTableAdapter">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource_history_card" runat="server" DeleteMethod="DeleteQuery"
                InsertMethod="Insert"  OnSelecting="ObjectDataSource_history_card_Selecting"
                SelectMethod="GetDataBy" TypeName="IGRSS.DataAccessLayer.HistoryCardTableAdapters.HistroryCardTableAdapter"
                UpdateMethod="UpdateQuery" 
                ondeleting="ObjectDataSource_history_card_Deleting" 
               >
                <DeleteParameters>
                    <asp:Parameter Name="SrNo" Type="Int32" />
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
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearch" Name="searchKeyWord" 
                        PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Employee_Name" Type="String" />
                    <asp:Parameter Name="Birth_Date" Type="String" />
                    <asp:Parameter Name="Prmnt_Addr" Type="String" />
                    <asp:Parameter Name="Educn_Qualfn" Type="String" />
                    <asp:Parameter Name="Joining_Date" Type="String" />
                    <asp:Parameter Name="Join_as_Design" Type="String" />
                    <asp:Parameter Name="Promtion_Date" Type="String" />
                    <asp:Parameter Name="Promotion_Design" Type="String" />
                    <asp:Parameter Name="Actual_Date_of_Joining_Dept" Type="String" />
                    <asp:Parameter Name="Religion" Type="String" />
                    <asp:Parameter Name="Caste" Type="String" />
                    <asp:Parameter Name="Current_desig" Type="String" />
                    <asp:Parameter Name="Preservice_training_Passing_Date" Type="String" />
                    <asp:Parameter Name="Clerk_Dept_Exam_Pass_Date" Type="String" />
                    <asp:Parameter Name="Sub_Register_Exam_Pass_Date" Type="String" />
                    <asp:Parameter Name="Upgrade_Promotion_Date" Type="String" />
                    <asp:Parameter Name="First_Hier_Grade_Date" Type="String" />
                    <asp:Parameter Name="Sec_Hier_Grade_Date" Type="String" />
                    <asp:Parameter Name="Extra_Currclar_Activities" Type="String" />
                    <asp:Parameter Name="Extra_Qualities" Type="String" />
                    <asp:Parameter Name="Retire_Date" Type="String" />
                    <asp:Parameter Name="Other_Details" Type="String" />
                    <asp:Parameter Name="Curr_Desig_with_office" Type="String" />
                    <asp:Parameter Name="Date_To_Date" Type="String" />
                    <asp:Parameter Name="Transfer_Date" Type="String" />
                    <asp:Parameter Name="Servc_Break_Leave" Type="String" />
                    <asp:Parameter Name="SrNo" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>

