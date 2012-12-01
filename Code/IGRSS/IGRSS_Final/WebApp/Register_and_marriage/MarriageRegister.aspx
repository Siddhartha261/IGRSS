<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="MarriageRegister.aspx.cs" Inherits="Register_and_marriage_MarriageRegister" %>

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

        var datePickers = ["ApplicationDateTextBox", "MarriageDateTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
</script>
<br />
<br />
<center>
<asp:Panel id="infoDiv" runat="server" Visible="false" CssClass="infoBar" >&nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
<hr /><br /></center>
<asp:MultiView ID="Multiview_Marriage_Certificate" runat="server" 
        ActiveViewIndex="0">
<asp:View ID="View1_GridView" runat="server">
<br />
<h1 align="center">marriage certificate register</h1>
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
                  <asp:GridView ID="GridView_Marriagecertificate" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_Marriage_certificate" 
                      EnableModelValidation="True" 
                      onrowdeleted="GridView_Marriagecertificate_RowDeleted" 
                      onrowdeleting="GridView_Marriagecertificate_RowDeleting" 
                      onrowediting="GridView_Marriagecertificate_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                              ReadOnly="True" SortExpression="SrNo" InsertVisible="False" 
                              Visible="False" />
                          <asp:BoundField DataField="Bridegroom_name" HeaderText="Bridegroom_name" 
                              SortExpression="Bridegroom_name" />
                          <asp:BoundField DataField="Bridegroom_father_name" HeaderText="Bridegroom_father_name" 
                              SortExpression="Bridegroom_father_name" Visible="False" />
                          <asp:BoundField DataField="Bride_name" HeaderText="Bride_name" 
                              SortExpression="Bride_name" />
                          <asp:BoundField DataField="Bride_father_name" HeaderText="Bride_father_name" 
                              SortExpression="Bride_father_name" Visible="False" />
                          <asp:BoundField DataField="MarriageDate" HeaderText="MarriageDate" 
                              SortExpression="MarriageDate" />
                          <asp:BoundField DataField="MarriagePlace" HeaderText="MarriagePlace" 
                              SortExpression="MarriagePlace" Visible="False" />
                          <asp:BoundField DataField="Village_church_name" 
                              HeaderText="Village_church_name" SortExpression="Village_church_name" 
                              Visible="False" />
                          <asp:BoundField DataField="Talk" HeaderText="Talk" SortExpression="Talk" 
                              Visible="False" />
                          <asp:BoundField DataField="District" HeaderText="District" 
                              SortExpression="District" Visible="False" />
                          <asp:BoundField DataField="ApplicationNo" HeaderText="ApplicationNo" 
                              SortExpression="ApplicationNo" Visible="False" />
                          <asp:BoundField DataField="ApplicationDate" HeaderText="ApplicationDate" 
                              SortExpression="ApplicationDate" Visible="False" />
                          <asp:BoundField DataField="NoOfCopies" HeaderText="NoOfCopies" 
                              SortExpression="NoOfCopies" Visible="False" />
                          <asp:BoundField DataField="ReceiptNo" HeaderText="ReceiptNo" 
                              SortExpression="ReceiptNo" Visible="False" />
                          <asp:BoundField DataField="Fees" HeaderText="Fees" SortExpression="Fees" 
                              Visible="False" />
                          <asp:BoundField DataField="CopiesFurnished" HeaderText="CopiesFurnished" 
                              SortExpression="CopiesFurnished" Visible="False" />
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
        onclick="Button_new_Click" CssClass="standardButton" AccessKey="N" />
</asp:View>

<asp:View ID="view2_Formview" runat="server">
<center>
<h1 align="center">Marriage certificate register</h1>
    <asp:FormView ID="FormView_Marriagecertificate" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_Marriage_certificate" DefaultMode="Insert" 
        EnableModelValidation="True" 
        onitemcommand="FormView_Marriage_certificate_ItemCommand" 
        oniteminserted="FormView_Marriagecertificate_ItemInserted" 
        onitemupdated="FormView_Marriagecertificate_ItemUpdated" 
        oniteminserting="FormView_Marriagecertificate_ItemInserting" 
        onitemupdating="FormView_Marriagecertificate_ItemUpdating" >
        <EditItemTemplate>
                     
			            
			      
			
			<table align="center" cellspacing="5">
			<tr align="left"><td>Bridegroom Name :
			</td><td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="Bridegroom_nameTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td>
           <td> 
               <asp:TextBox ID="Bridegroom_nameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Bridegroom_name") %>' MaxLength="30" Width="160px" /></td>
				<td>Place Of Marriage :</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="MarriagePlaceTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td> 
                <asp:TextBox ID="MarriagePlaceTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("MarriagePlace") %>' MaxLength="30" TabIndex="5" 
                    Width="160px" /></td>
			</tr>
			<tr align="left"><td>Father Name Of Bridegroom:</td><td></td><td>
                <asp:TextBox ID="Bridegroom_father_nameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Bridegroom_father_name") %>' MaxLength="30" TabIndex="1" 
                    Width="160px" /></td>
				<td>Village / Church Name :</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="Village_church_nameTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td> 
                <asp:TextBox ID="Village_church_nameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Village_church_name") %>' MaxLength="30" TabIndex="6" 
                    Width="160px" /></td>
			</tr>
			<tr align="left">
			<td>Bride Name :</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="Bride_nameTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td> 
                <asp:TextBox ID="Bride_nameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Bride_name") %>' MaxLength="30" TabIndex="2" Width="160px" /></td>
				<td>Taluka:</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="DropDownList_Taluka" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td> 
                    <asp:DropDownList ID="DropDownList_Taluka" runat="server" 
                        DataSourceID="ods_TalukaMaster" DataTextField="Taluka_Name" 
                        DataValueField="Taluka_Name">
                    </asp:DropDownList>
                </td>
			</tr>	
			<tr align="left"><td> Father Name Of Bride:</td><td></td><td> 
                <asp:TextBox ID="Bride_father_nameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Bride_father_name") %>' MaxLength="30" TabIndex="3" 
                    Width="160px" /></td>
				<td>District :</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="DropDownList_District" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td> 
                    <asp:DropDownList ID="DropDownList_District" runat="server" 
                        DataSourceID="ods_DistrictMaster" DataTextField="District_Name" 
                        DataValueField="District_Name">
                    </asp:DropDownList>
                </td>
			</tr>
			<tr align="left">
			<td>Date Of Marriage :</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="MarriageDateTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td> 
                <asp:TextBox ID="MarriageDateTextBox" runat="server" 
                Text='<%# Bind("MarriageDate") %>' MaxLength="20" TabIndex="4" Width="160px" /></td>
				<td>
				</td>
				<td>
				</td>
				</tr>
			<tr align="left">
			 <td colspan="2"> <h4> For Office Use Only</h4></td><td></td>
			<td>
				</td>
				<td>
				</td>
			<tr align="left"><td>Application No:</td><td></td><td> 
                <asp:TextBox ID="ApplicationNoTextBox" runat="server" numeric="integer"
                Text='<%# Bind("ApplicationNo") %>' MaxLength="10" TabIndex="9" 
                    Width="160px" /></td>
				
            
           
            <td> Date Of Application:</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="ApplicationDateTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td> <td>
                <asp:TextBox ID="ApplicationDateTextBox" runat="server" 
                Text='<%# Bind("ApplicationDate") %>' MaxLength="20" TabIndex="12" 
                    Width="160px" /></td>
			</tr>
			<tr align="left"><td>No Of Copies :</td><td></td><td> 
                <asp:TextBox ID="NoOfCopiesTextBox" 
                    runat="server" numeric="integer"
                Text='<%# Bind("NoOfCopies") %>' MaxLength="5" TabIndex="10" /></td>
            
           
            <td>Receipt No :</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="ReceiptNoTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td> 
                <asp:TextBox ID="ReceiptNoTextBox" runat="server" numeric="integer"
                Text='<%# Bind("ReceiptNo") %>' MaxLength="10" TabIndex="13" Width="160px" /></td>
			</tr>
			<tr align="left"><td>Fees :</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="FeesTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td>  <asp:TextBox ID="FeesTextBox" runat="server"  
                    numeric="integer" Text='<%# Bind("Fees") %>' MaxLength="5" TabIndex="11" 
                    Width="160px" /></td>
            
          
            <td>Copies Furnished:</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="CopiesFurnishedTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td><asp:TextBox ID="CopiesFurnishedTextBox" 
                    runat="server" numeric="integer"
                Text='<%# Bind("CopiesFurnished") %>' MaxLength="5" TabIndex="14" 
                    Width="160px" /></td>
			</tr>
			    <tr>
                    <td align="center" colspan="6">
                        <asp:LinkButton ID="UpdateButton" runat="server" AccessKey="U" 
                            CausesValidation="True" CommandName="Update" CssClass="standardButton" 
                            Text="Update" />
                        &nbsp;<asp:LinkButton ID="ResetButton" runat="server" AccessKey="R" 
                            CausesValidation="False" CommandName="reset" CssClass="standardButton" 
                            onclientclick="resetTextFields();return false;" Text="Reset" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" AccessKey="B" 
                            CausesValidation="False" CommandName="Back" CssClass="standardButton" 
                            Text="Back" />
                    </td>
                </tr>
			</tr>
        </EditItemTemplate>
        <InsertItemTemplate>
                        
			 <table align="center" cellspacing="5">
			<tr align="left"><td>Bridegroom Name :
			</td><td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="Bridegroom_nameTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td>
           <td> 
               <asp:TextBox ID="Bridegroom_nameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Bridegroom_name") %>' MaxLength="30" Width="160px" /></td>
				<td>Place Of Marriage :</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="MarriagePlaceTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td> 
                <asp:TextBox ID="MarriagePlaceTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("MarriagePlace") %>' MaxLength="30" TabIndex="5" 
                    Width="160px" /></td>
			</tr>
			<tr align="left"><td>Father Name Of Bridegroom:</td><td></td><td>
                <asp:TextBox ID="Bridegroom_father_nameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Bridegroom_father_name") %>' MaxLength="30" TabIndex="1" 
                    Width="160px" /></td>
				<td>Village / Church Name :</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="Village_church_nameTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td> 
                <asp:TextBox ID="Village_church_nameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Village_church_name") %>' MaxLength="30" TabIndex="6" 
                    Width="160px" /></td>
			</tr>
			<tr align="left">
			<td>Bride Name :</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="Bride_nameTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td> 
                <asp:TextBox ID="Bride_nameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Bride_name") %>' MaxLength="30" TabIndex="2" Width="160px" /></td>
				<td>Taluka:</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="DropDownList_Taluka" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td> 
                    <asp:DropDownList ID="DropDownList_Taluka" runat="server" 
                        DataSourceID="ods_TalukaMaster" DataTextField="Taluka_Name" 
                        DataValueField="Taluka_Name">
                    </asp:DropDownList>
                </td>
			</tr>	
			<tr align="left"><td> Father Name Of Bride:</td><td></td><td> 
                <asp:TextBox ID="Bride_father_nameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Bride_father_name") %>' MaxLength="30" TabIndex="3" 
                    Width="160px" /></td>
				<td>District :</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="DropDownList_District" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td> 
                    <asp:DropDownList ID="DropDownList_District" runat="server" 
                        DataSourceID="ods_DistrictMaster" DataTextField="District_Name" 
                        DataValueField="District_Name">
                    </asp:DropDownList>
                </td>
			</tr>
			<tr align="left">
			<td>Date Of Marriage :</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="MarriageDateTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td> 
                <asp:TextBox ID="MarriageDateTextBox" runat="server" 
                Text='<%# Bind("MarriageDate") %>' MaxLength="20" TabIndex="4" Width="160px" /></td>
				<td>
				</td>
				<td>
				</td>
				</tr>
			<tr align="left">
			 <td colspan="2"> <h4> For Office Use Only</h4></td><td></td>
			<td>
				</td>
				<td>
				</td>
			<tr align="left"><td>Application No:</td><td></td><td> 
                <asp:TextBox ID="ApplicationNoTextBox" runat="server" numeric="integer"
                Text='<%# Bind("ApplicationNo") %>' MaxLength="10" TabIndex="9" 
                    Width="160px" /></td>
				
            
           
            <td> Date Of Application:</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="ApplicationDateTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td> <td>
                <asp:TextBox ID="ApplicationDateTextBox" runat="server" 
                Text='<%# Bind("ApplicationDate") %>' MaxLength="20" TabIndex="12" 
                    Width="160px" /></td>
			</tr>
			<tr align="left"><td>No Of Copies :</td><td></td><td> 
                <asp:TextBox ID="NoOfCopiesTextBox" 
                    runat="server" numeric="integer"
                Text='<%# Bind("NoOfCopies") %>' MaxLength="5" TabIndex="10" /></td>
            
           
            <td>Receipt No :</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="ReceiptNoTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td> 
                <asp:TextBox ID="ReceiptNoTextBox" runat="server" numeric="integer"
                Text='<%# Bind("ReceiptNo") %>' MaxLength="10" TabIndex="13" Width="160px" /></td>
			</tr>
			<tr align="left"><td>Fees :</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="FeesTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td>  <asp:TextBox ID="FeesTextBox" runat="server"  
                    numeric="integer" Text='<%# Bind("Fees") %>' MaxLength="5" TabIndex="11" 
                    Width="160px" /></td>
            
          
            <td>Copies Furnished:</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="CopiesFurnishedTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                </td><td><asp:TextBox ID="CopiesFurnishedTextBox" 
                    runat="server" numeric="integer"
                Text='<%# Bind("CopiesFurnished") %>' MaxLength="5" TabIndex="14" 
                    Width="160px" /></td>
			</tr>
			<tr>
			<td align="center" colspan="6"> 
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" CssClass="standardButton" AccessKey="I" 
                    TabIndex="15" />
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" 
                    AccessKey="R" TabIndex="16" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" AccessKey="B" TabIndex="17" /></td>
			</tr>
			</table>
			
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            Bridegroom_name:
            <asp:Label ID="Bridegroom_nameLabel" runat="server" 
                Text='<%# Bind("Bridegroom_name") %>' />
            <br />
            Bridegroom_father_name:
            <asp:Label ID="Bridegroom_father_nameLabel" runat="server" 
                Text='<%# Bind("Bridegroom_father_name") %>' />
            <br />
            Bride_name:
            <asp:Label ID="Bride_nameLabel" runat="server" 
                Text='<%# Bind("Bride_name") %>' />
            <br />
            Bride_father_name:
            <asp:Label ID="Bride_father_nameLabel" runat="server" 
                Text='<%# Bind("Bride_father_name") %>' />
            <br />
            MarriageDate:
            <asp:Label ID="MarriageDateLabel" runat="server" 
                Text='<%# Bind("MarriageDate") %>' />
            <br />
            MarriagePlace:
            <asp:Label ID="MarriagePlaceLabel" runat="server" 
                Text='<%# Bind("MarriagePlace") %>' />
            <br />
            Village_church_name:
            <asp:Label ID="Village_church_nameLabel" runat="server" 
                Text='<%# Bind("Village_church_name") %>' />
            <br />
            Talk:
            <asp:Label ID="TalkLabel" runat="server" Text='<%# Bind("Talk") %>' />
            <br />
            District:
            <asp:Label ID="DistrictLabel" runat="server" Text='<%# Bind("District") %>' />
            <br />
            ApplicationNo:
            <asp:Label ID="ApplicationNoLabel" runat="server" 
                Text='<%# Bind("ApplicationNo") %>' />
            <br />
            ApplicationDate:
            <asp:Label ID="ApplicationDateLabel" runat="server" 
                Text='<%# Bind("ApplicationDate") %>' />
            <br />
            NoOfCopies:
            <asp:Label ID="NoOfCopiesLabel" runat="server" 
                Text='<%# Bind("NoOfCopies") %>' />
            <br />
            ReceiptNo:
            <asp:Label ID="ReceiptNoLabel" runat="server" Text='<%# Bind("ReceiptNo") %>' />
            <br />
            Fees:
            <asp:Label ID="FeesLabel" runat="server" Text='<%# Bind("Fees") %>' />
            <br />
            CopiesFurnished:
            <asp:Label ID="CopiesFurnishedLabel" runat="server" 
                Text='<%# Bind("CopiesFurnished") %>' />
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
    
    <asp:ObjectDataSource ID="ods_Marriage_certificate" runat="server"  
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.MarriageCertificateTableAdapters.MarriageCertificateTableAdapter" 
        DeleteMethod="DeleteQuery" InsertMethod="Insert" UpdateMethod="UpdateQuery" 
        onselecting="ods_Marriage_certificate_Selecting" 
        ondeleting="ods_Marriage_certificate_Deleting" 
        OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Bridegroom_name" Type="String" />
            <asp:Parameter Name="Bridegroom_father_name" Type="String" />
            <asp:Parameter Name="Bride_name" Type="String" />
            <asp:Parameter Name="Bride_father_name" Type="String" />
            <asp:Parameter Name="MarriageDate" Type="DateTime" />
            <asp:Parameter Name="MarriagePlace" Type="String" />
            <asp:Parameter Name="Village_church_name" Type="String" />
            <asp:Parameter Name="Talk" Type="String" />
            <asp:Parameter Name="District" Type="String" />
            <asp:Parameter Name="ApplicationNo" Type="Int32" />
            <asp:Parameter Name="ApplicationDate" Type="DateTime" />
            <asp:Parameter Name="NoOfCopies" Type="Int32" />
            <asp:Parameter Name="ReceiptNo" Type="Int32" />
            <asp:Parameter Name="Fees" Type="Int32" />
            <asp:Parameter Name="CopiesFurnished" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Bridegroom_name" Type="String" />
            <asp:Parameter Name="Bridegroom_father_name" Type="String" />
            <asp:Parameter Name="Bride_name" Type="String" />
            <asp:Parameter Name="Bride_father_name" Type="String" />
            <asp:Parameter Name="MarriageDate" Type="String" />
            <asp:Parameter Name="MarriagePlace" Type="String" />
            <asp:Parameter Name="Village_church_name" Type="String" />
            <asp:Parameter Name="Talk" Type="String" />
            <asp:Parameter Name="District" Type="String" />
            <asp:Parameter Name="ApplicationNo" Type="Int32" />
            <asp:Parameter Name="ApplicationDate" Type="String" />
            <asp:Parameter Name="NoOfCopies" Type="Int32" />
            <asp:Parameter Name="ReceiptNo" Type="Int32" />
            <asp:Parameter Name="Fees" Type="Int32" />
            <asp:Parameter Name="CopiesFurnished" Type="Int32" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="ods_DistrictMaster" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.ResidenceDistrictTableAdapters.DistrictMasterTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_District_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="District_Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="District_Name" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_District_Name" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
    <br />
    <asp:ObjectDataSource ID="ods_TalukaMaster" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.TalukaMasterTableAdapters.TalukaMasterTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Taluka_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Taluka_Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Taluka_Name" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Taluka_Name" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>

