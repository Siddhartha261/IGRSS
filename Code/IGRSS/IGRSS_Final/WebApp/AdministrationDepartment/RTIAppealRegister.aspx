<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="RTIAppealRegister.aspx.cs" Inherits="LatestPages_RTIAppealRegister" %>

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
        $('input[id*="Inward_NoTextBox"]').keydown(function (event) {
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

        $('input[id*="Inward_NoTextBox"]').blur(function () {
            if (isNaN($('input[id*="Inward_NoTextBox"]').val()) || $('input[id*="Inward_NoTextBox"]').val().length == 0) { $('input[id*="Inward_NoTextBox"]').val(''); return; }
            var formattedNumber = 'IGR\/' + $('input[id*="Inward_NoTextBox"]').val() + '\/' + new Date().getFullYear();
            $('input[id*="Inward_NoTextBox"]').val(formattedNumber.toString());
        });

        var datePickers = ["Appl_DateTextBox","PIO_dateTextBox","Last_DateTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
</script>
<br />
<br />
<center>
    <asp:Panel id="infoDiv" runat="server" Visible="false" CssClass="infoBar" >
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </asp:Panel>
<hr /><br />
</center>
<asp:MultiView ID="MultiView_RTI" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<br />
<h1>RTI Appeal Register</h1>
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
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" 
                                 />
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_RTI" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="Sr_No" DataSourceID="ods_RTI" 
                      EnableModelValidation="True" onrowdeleted="GridView_RTI_RowDeleted" 
                      onrowdeleting="GridView_RTI_RowDeleting" 
                      onrowediting="GridView_RTI_RowEditing" AllowPaging="True" 
                      >
                      <Columns>
                          <asp:BoundField DataField="Sr_No" HeaderText="Sr_No" 
                              ReadOnly="True" SortExpression="Sr_No" InsertVisible="False" 
                              Visible="False" />
                          <asp:BoundField DataField="Appl_name" HeaderText="Applicant Name" 
                              SortExpression="Appl_name" />
                          <asp:BoundField DataField="Appl_surname" HeaderText="Applicant Surname" 
                              SortExpression="Appl_surname" />
                          <asp:BoundField DataField="Appl_Date" HeaderText="Application Date" 
                              SortExpression="Appl_Date" />
                          <asp:BoundField DataField="PIO_desig" HeaderText="PIO Designation" 
                              SortExpression="PIO_desig" />
                          <asp:BoundField DataField="PIO_date" HeaderText="PIO Date" 
                              SortExpression="PIO_date" />
                          <asp:BoundField DataField="Last_Date" HeaderText="Last Date " 
                              SortExpression="Last_Date" />
                           

                          <asp:BoundField DataField="Decision_Taken" HeaderText="Decision" 
                              SortExpression="Decision_Taken" />
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
<h1>RTI Appeal Register</h1></center>
<center><asp:FormView ID="FormView_RTI" runat="server" DataKeyNames="Sr_No" 
        DataSourceID="ods_RTI" EnableModelValidation="True" DefaultMode="Insert" oniteminserting="FormView_RTI_ItemInserting" 
        onitemcommand="FormView_RTI_ItemCommand" 
        oniteminserted="FormView_RTI_ItemInserted" 
        onitemupdated="FormView_RTI_ItemUpdated" 
        onitemupdating="FormView_RTI_ItemUpdating" >
        <EditItemTemplate>
            <table align="center">
		<%--<tr><td>Sr_No:</td>
		    <td><asp:TextBox ID="Sr_NoTextBox" runat="server" Text='<%# Bind("Sr_No") %>' /></td>
		</tr>    	--%>
            
        <tr><td class="gridItems">Name Of Applicant:</td>
		    <td class="gridItems">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="Appl_nameTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td class="gridItems">
                <asp:TextBox ID="Appl_nameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Appl_name") %>' Width="160px" MaxLength="30" /></td>
		</tr>	         
            
        <tr><td class="gridItems">SurName Of Applicant:</td>
		    <td class="gridItems">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="Appl_surnameTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td class="gridItems">
                <asp:TextBox ID="Appl_surnameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Appl_surname") %>' Width="160px" MaxLength="20" /></td>
		</tr>          
            
        <tr><td class="gridItems">Date Of Application:</td>
		    <td class="gridItems">
                &nbsp;</td>
		    <td class="gridItems">
                <asp:TextBox ID="Appl_DateTextBox" runat="server" 
                Text='<%# Bind("Appl_Date") %>' Width="160px" /></td>
		</tr>	          
            
        <tr><td class="gridItems">PIO's Designation:</td>
		    <td class="gridItems">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="PIO_desigTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td class="gridItems">
                <asp:TextBox ID="PIO_desigTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("PIO_desig") %>' Width="160px" MaxLength="20" /></td>
		</tr>        
            
        <tr><td class="gridItems">PIO Date:</td>
		    <td class="gridItems">
                &nbsp;</td>
		    <td class="gridItems">
                <asp:TextBox ID="PIO_dateTextBox" runat="server" 
                Text='<%# Bind("PIO_date") %>' Width="160px" /></td>
		</tr>        
            
        <tr><td class="gridItems">Last Date According To 30 Days:</td>
		    <td class="gridItems">
                &nbsp;</td>
		    <td class="gridItems">
                <asp:TextBox ID="Last_DateTextBox" runat="server" 
                Text='<%# Bind("Last_Date") %>' Width="160px" /></td>
		</tr>	
            
            
        <tr><td class="gridItems">Decision Taken By:</td>
		    <td class="gridItems">
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="Radio_decisiontaken" ErrorMessage="*"></asp:RequiredFieldValidator>
                &nbsp;</td>
		    <td class="gridItems">
                <asp:RadioButtonList ID="Radio_decisiontaken" runat="server" 
                    RepeatDirection="Horizontal" Width="160px">
                    <asp:ListItem Text="Appellate" Value="Appellate"></asp:ListItem>
                    <asp:ListItem Text="Committee" Value="Committee"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>	          
            
        <tr><td colspan=3 align="center">
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
               <table align="center">
		<%--<tr><td>Sr_No:</td>
		    <td><asp:TextBox ID="Sr_NoTextBox" runat="server" Text='<%# Bind("Sr_No") %>' /></td>
		</tr>    	--%>
            
        <tr><td class="gridItems">Name Of Applicant:</td>
		    <td class="gridItems">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="Appl_nameTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td class="gridItems">
                <asp:TextBox ID="Appl_nameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Appl_name") %>' Width="160px" MaxLength="30" /></td>
		</tr>	         
            
        <tr><td class="gridItems">SurName Of Applicant:</td>
		    <td class="gridItems">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="Appl_surnameTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td class="gridItems">
                <asp:TextBox ID="Appl_surnameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Appl_surname") %>' Width="160px" MaxLength="20" /></td>
		</tr>          
            
        <tr><td class="gridItems">Date Of Application:</td>
		    <td class="gridItems">
                &nbsp;</td>
		    <td class="gridItems">
                <asp:TextBox ID="Appl_DateTextBox" runat="server" 
                Text='<%# Bind("Appl_Date") %>' Width="160px" /></td>
		</tr>	          
            
        <tr><td class="gridItems">PIO's Designation:</td>
		    <td class="gridItems">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="PIO_desigTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td class="gridItems">
                <asp:TextBox ID="PIO_desigTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("PIO_desig") %>' Width="160px" MaxLength="20" /></td>
		</tr>        
            
        <tr><td class="gridItems">PIO Date:</td>
		    <td class="gridItems">
                &nbsp;</td>
		    <td class="gridItems">
                <asp:TextBox ID="PIO_dateTextBox" runat="server" 
                Text='<%# Bind("PIO_date") %>' Width="160px" /></td>
		</tr>        
            
        <tr><td class="gridItems">Last Date According To 30 Days:</td>
		    <td class="gridItems">
                &nbsp;</td>
		    <td class="gridItems">
                <asp:TextBox ID="Last_DateTextBox" runat="server" 
                Text='<%# Bind("Last_Date") %>' Width="160px" /></td>
		</tr>	
            
            
        <tr><td class="gridItems">Decision Taken By:</td>
		  <td class="gridItems">
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="Radio_decisiontaken" ErrorMessage="*"></asp:RequiredFieldValidator>
                &nbsp;</td>
		    <td class="gridItems">
                <asp:RadioButtonList ID="Radio_decisiontaken" runat="server" 
                    RepeatDirection="Horizontal" Width="160px">
                    <asp:ListItem Text="Appellate" Value="Appellate"></asp:ListItem>
                    <asp:ListItem Text="Committee" Value="Committee"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>		          
            
        <tr><td colspan=3 align="center">
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" CssClass="standardButton" 
                TabIndex="1" />
		 	    &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="Reset" Text="Reset" 
                onclientclick="resetTextFields();return false;" 
                CssClass="standardButton" TabIndex="2" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                CssClass="standardButton" TabIndex="3" />
			</td>
		</tr>
	</table>
        </InsertItemTemplate>
        <ItemTemplate>
            Sr_No:
            <asp:Label ID="Sr_NoLabel" runat="server" Text='<%# Eval("Sr_No") %>' />
            <br />
            Appl_name:
            <asp:Label ID="Appl_nameLabel" runat="server" 
                Text='<%# Bind("Appl_name") %>' />
            <br />
            Appl_surname:
            <asp:Label ID="Appl_surnameLabel" runat="server" 
                Text='<%# Bind("Appl_surname") %>' />
            <br />
            Appl_Date:
            <asp:Label ID="Appl_DateLabel" runat="server" 
                Text='<%# Bind("Appl_Date") %>' />
            <br />
            PIO_desig:
            <asp:Label ID="PIO_desigLabel" runat="server" 
                Text='<%# Bind("PIO_desig") %>' />
            <br />
            PIO_date:
            <asp:Label ID="PIO_dateLabel" runat="server" 
                Text='<%# Bind("PIO_date") %>' />
            <br />
            Last_Date:
            <asp:Label ID="Last_DateLabel" runat="server" Text='<%# Bind("Last_Date") %>' />
            <br />
            Decision_Taken:
            <asp:Label ID="Decision_TakenLabel" runat="server" 
                Text='<%# Bind("Decision_Taken") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView></center>


    
    <asp:ObjectDataSource ID="ods_RTI" runat="server" DeleteMethod="DeleteQuery" 
        InsertMethod="Insert" SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.RTITableAdapters.RTITableAdapter" 
        UpdateMethod="UpdateQuery" onselecting="ods_RTI_Selecting" 
        ondeleting="ods_RTI_Deleting">
        <DeleteParameters>
            <asp:Parameter Name="Sr_No" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Appl_name" Type="String" />
            <asp:Parameter Name="Appl_surname" Type="String" />
            <asp:Parameter Name="Appl_Date" Type="DateTime" />
            <asp:Parameter Name="PIO_desig" Type="String" />
            <asp:Parameter Name="PIO_date" Type="DateTime" />
            <asp:Parameter Name="Last_Date" Type="DateTime" />
            <asp:Parameter Name="Decision_Taken" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Appl_name" Type="String" />
            <asp:Parameter Name="Appl_surname" Type="String" />
            <asp:Parameter Name="Appl_Date" Type="DateTime" />
            <asp:Parameter Name="PIO_desig" Type="String" />
            <asp:Parameter Name="PIO_date" Type="DateTime" />
            <asp:Parameter Name="Last_Date" Type="DateTime" />
            <asp:Parameter Name="Decision_Taken" Type="String" />
            <asp:Parameter Name="Sr_No" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView>
</asp:Content>

