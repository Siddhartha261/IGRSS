<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="ACB_Case_Register.aspx.cs" Inherits="Establishment_Department_ACB_Case_Register" %>

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
        var datePickers = ["High_Court_Appeal_DateTextBox", "Permission_Date_Of_ProsecutionTextBox", "Supreme_court_appeal_dateTextBox", "Date_Of_SuspensionTextBox", "ReInstate_DateTextBox"];
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
<asp:MultiView ID="Multiview_ACB_Case_Register" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<hr /><br />
<h1>ACB Case Register</h1>
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
                  <asp:GridView ID="GridView_ACB_Case_Register" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo,High_court_Appeal,Supreme_Court_Appeal" DataSourceID="ods_ACB_Case_Register" 
                      EnableModelValidation="True" 
                      onrowdeleted="GridView_ACB_Case_Register_RowDeleted" 
                      onrowdeleting="GridView_ACB_Case_Register_RowDeleting" 
                      onrowediting="GridView_ACB_Case_Register_RowEditing" 
                      onrowdatabound="GridView_ACB_Case_Register_RowDataBound">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="File_No" HeaderText="File No" 
                              SortExpression="File_No" />
                          <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" 
                              SortExpression="Employee_Name" />
                          <asp:BoundField DataField="Designation" HeaderText="Designation" 
                              SortExpression="Designation" />
                          <asp:BoundField DataField="Place_Of_Event_Occured" HeaderText="Place Of Event Occured" 
                              SortExpression="Place_Of_Event_Occured" />
                          <asp:BoundField DataField="Summary_Of_Case" HeaderText="Summary_Of_Case" 
                              SortExpression="Summary_Of_Case" Visible="False" />
                          <asp:BoundField DataField="FIR_No" HeaderText="F.I.R No" 
                              SortExpression="FIR_No" />
                          <asp:BoundField DataField="Courst_Case_No" HeaderText="Court Case No" 
                              SortExpression="Courst_Case_No" />
                          <asp:BoundField DataField="Permission_Date_Of_Prosecution" HeaderText="Permission Date Of Prosecution" 
                              SortExpression="Permission_Date_Of_Prosecution" />
                          <asp:BoundField DataField="Date_Of_Suspension" HeaderText="Date Of Suspension" 
                              SortExpression="Date_Of_Suspension" />
                          <asp:BoundField DataField="ReInstate_Date" 
                              HeaderText="Re-Instate Date" 
                              SortExpression="ReInstate_Date" />
                          <asp:BoundField DataField="Order_Of_Court" 
                              HeaderText="Order_Of_Court" 
                              SortExpression="Order_Of_Court" Visible="False" />
                              <asp:TemplateField HeaderText="High court Appeal" 
                              SortExpression="High_court_Appeal" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblHigh_court_Appeal"  runat="server" Text="No" 
                                        Font-Names="Times New Roman" Font-Bold="false"></asp:Label>
                                </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" />
                              </asp:TemplateField>
                          <asp:BoundField DataField="High_court_Appeal_No" 
                              HeaderText="Appeal No" SortExpression="High_court_Appeal_No" 
                              Visible="False" />
                          <asp:BoundField DataField="High_Court_Appeal_Date" 
                              HeaderText="High Court Appeal Date" 
                              SortExpression="High_Court_Appeal_Date" />
                          <asp:BoundField DataField="High_court_appeal_order" 
                              HeaderText="High_court_appeal_order" 
                              SortExpression="High_court_appeal_order" Visible="False" />
                              <asp:TemplateField HeaderText="Supreme Court Appeal" 
                              SortExpression="Supreme_Court_Appeal" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblSupreme_Court_Appeal"  runat="server" Text="No" 
                                        Font-Names="Times New Roman" Font-Bold="false"></asp:Label>
                                </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" />
                              </asp:TemplateField>
                         
                          <asp:BoundField DataField="Supreme_court_appeal_no" HeaderText="Supreme_court_appeal_no" 
                              SortExpression="Supreme_court_appeal_no" Visible="False" />
                          <asp:BoundField DataField="Supreme_court_appeal_date" HeaderText="Supreme Court Appeal Date" 
                              SortExpression="Supreme_court_appeal_date" />
                          <asp:BoundField DataField="Supreme_court_appeal_order" 
                              HeaderText="Supreme_court_appeal_order" 
                              SortExpression="Supreme_court_appeal_order" Visible="False" />
                          <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
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
<h1>ACB Case Register</h1>
<asp:FormView ID="FormView_ACB_Case_Register" runat="server" DataKeyNames="SrNo,High_court_Appeal,Supreme_Court_Appeal" 
        DataSourceID="ods_ACB_Case_Register" EnableModelValidation="True" 
        DefaultMode="Insert" 
        onitemcommand="FormView_ACB_Case_Register_ItemCommand" 
        oniteminserting="FormView_ACB_Case_Register_ItemInserting" 
        oniteminserted="FormView_ACB_Case_Register_ItemInserted" 
        onitemupdated="FormView_ACB_Case_Register_ItemUpdated" 
        onitemupdating="FormView_ACB_Case_Register_ItemUpdating" 
        ondatabound="FormView_ACB_Case_Register_DataBound" >
        <EditItemTemplate>
                <table>
        <tr align="left">
		    <td>File No:</td>
			<td><asp:TextBox ID="File_NoTextBox" runat="server" numeric="integer" Text='<%# Bind("File_No") %>' 
                    Width="160px" MaxLength="10" /></td>
			
			<td>Order Of Court:</td>
			<td><asp:TextBox ID="Order_Of_CourtTextBox" runat="server" 
                Text='<%# Bind("Order_Of_Court") %>' Width="160px" MaxLength="20" /></td>
		</tr>				
            
        <tr align="left">
		    <td>Employee Name:</td>
			<td>
                <asp:DropDownList ID="DropDownList_EmployeeName" runat="server" 
                    DataSourceID="ods_EmployeeName" DataTextField="Employee_Name" 
                    DataValueField="Employee_Name" Width="160px">
                </asp:DropDownList>
            </td>
			
			<td>Whether Appealed in  High court:</td>
			<td>
                <asp:RadioButtonList ID="RadioButtonList_HighCourt" runat="server" 
                    RepeatDirection="Horizontal" Width="160px">
                    <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>          
            
        <tr align="left">
		    <td>Designation:</td>
			<td>
                <asp:DropDownList ID="DropDownList_Designation" runat="server" 
                    DataSourceID="ods_Designation" DataTextField="Name" DataValueField="Name" 
                    Width="160px">
                </asp:DropDownList>
            </td>
			
			<td>Appeal No:</td>
			<td><asp:TextBox ID="High_court_Appeal_NoTextBox" numeric="integer" runat="server" 
                Text='<%# Bind("High_court_Appeal_No") %>' Width="160px" MaxLength="10" /></td>
		</tr>           
            
        <tr align="left">
		    <td>Place Of Event Occured:</td>
			<td><asp:TextBox ID="Place_Of_Event_OccuredTextBox" runat="server" 
                Text='<%# Bind("Place_Of_Event_Occured") %>' Width="160px" MaxLength="20" /></td>
			
			<td>Appeal Date:</td>
			<td style="margin-left: 40px">
                <asp:TextBox ID="High_Court_Appeal_DateTextBox" runat="server" 
                Text='<%# Bind("High_Court_Appeal_Date") %>' Width="160px" /></td>
		</tr>           
            
        <tr align="left">
		    <td>Summary Of Case:</td>
			<td><asp:TextBox ID="Summary_Of_CaseTextBox" runat="server" 
                Text='<%# Bind("Summary_Of_Case") %>' Height="60px" Width="160px" /></td>
			
			<td>Order Of Appeal:</td>
			<td><asp:TextBox ID="High_court_appeal_orderTextBox" runat="server" 
                Text='<%# Bind("High_court_appeal_order") %>' Width="160px" MaxLength="20" /></td>
		</tr>           
            
        <tr align="left">
		    <td>F.I.R No:</td>
			<td><asp:TextBox ID="FIR_NoTextBox" runat="server" numeric="integer" Text='<%# Bind("FIR_No") %>' 
                    Width="160px" MaxLength="10" /></td>
			
			<td>Whether Appealed in Supreme Court:</td>
			<td>
                <asp:RadioButtonList ID="RadioButtonList_SupremeCourt" runat="server" 
                    RepeatDirection="Horizontal" Width="160px">
                    <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>         
            
        <tr align="left">
		    <td>Court Case No:</td>
			<td><asp:TextBox ID="Courst_Case_NoTextBox" runat="server" numeric="integer"
                Text='<%# Bind("Courst_Case_No") %>' Width="160px" MaxLength="10" /></td>
			
			<td>Appeal No:</td>
			<td><asp:TextBox ID="Supreme_court_appeal_noTextBox" runat="server" numeric="integer"
                Text='<%# Bind("Supreme_court_appeal_no") %>' Width="160px" MaxLength="10" /></td>
		</tr>          
            
        <tr align="left">
		    <td>Permission Date Of Prosecution:</td>
			<td><asp:TextBox ID="Permission_Date_Of_ProsecutionTextBox" runat="server" 
                Text='<%# Bind("Permission_Date_Of_Prosecution") %>' Width="160px" /></td>
			
			<td>Appeal Date:</td>
			<td><asp:TextBox ID="Supreme_court_appeal_dateTextBox" runat="server" 
                Text='<%# Bind("Supreme_court_appeal_date") %>' Width="160px" /></td>
		</tr>           
            
        <tr align="left">
		    <td>Date Of Suspension:</td>
			<td><asp:TextBox ID="Date_Of_SuspensionTextBox" runat="server" 
                Text='<%# Bind("Date_Of_Suspension") %>' Width="160px" /></td>
			
			<td>Order Of Appeal:</td>
			<td><asp:TextBox ID="Supreme_court_appeal_orderTextBox" runat="server" 
                Text='<%# Bind("Supreme_court_appeal_order") %>' Width="160px" 
                    MaxLength="20" /></td>
		</tr>          
            
        <tr align="left">
		    <td>Re-Instate Date:</td>
			<td><asp:TextBox ID="ReInstate_DateTextBox" runat="server" 
                Text='<%# Bind("ReInstate_Date") %>' Width="160px" /></td>
			
			<td>Remarks:</td>
			<td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                    Height="60px" Width="160px" /></td>
		</tr>
		
        <tr><td align="center" colspan=4>
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" CssClass="standardButton" />
			&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="Reset" Text="Reset" 
                CssClass="standardButton" onclientclick="resetTextFields();return false;" />	
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                CssClass="standardButton" /></td>
		</tr>            
    </table>

        </EditItemTemplate>
        <InsertItemTemplate>
                <table>
        <tr align="left">
		    <td>File No:</td>
			<td><asp:TextBox ID="File_NoTextBox" runat="server" numeric="integer" Text='<%# Bind("File_No") %>' 
                    Width="160px" MaxLength="10" /></td>
			
			<td>Order Of Court:</td>
			<td><asp:TextBox ID="Order_Of_CourtTextBox" runat="server" 
                Text='<%# Bind("Order_Of_Court") %>' Width="160px" MaxLength="20" /></td>
		</tr>				
            
        <tr align="left">
		    <td>Employee Name:</td>
			<td>
                <asp:DropDownList ID="DropDownList_EmployeeName" runat="server" 
                    DataSourceID="ods_EmployeeName" DataTextField="Employee_Name" 
                    DataValueField="Employee_Name" Width="160px">
                </asp:DropDownList>
            </td>
			
			<td>Whether Appealed in  High court:</td>
			<td>
                <asp:RadioButtonList ID="RadioButtonList_HighCourt" runat="server" 
                    RepeatDirection="Horizontal" Width="160px">
                    <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>          
            
        <tr align="left">
		    <td>Designation:</td>
			<td>
                <asp:DropDownList ID="DropDownList_Designation" runat="server" 
                    DataSourceID="ods_Designation" DataTextField="Name" DataValueField="Name" 
                    Width="160px">
                </asp:DropDownList>
            </td>
			
			<td>Appeal No:</td>
			<td><asp:TextBox ID="High_court_Appeal_NoTextBox" runat="server" numeric="integer"
                Text='<%# Bind("High_court_Appeal_No") %>' Width="160px" MaxLength="10" /></td>
		</tr>           
            
        <tr align="left">
		    <td>Place Of Event Occured:</td>
			<td><asp:TextBox ID="Place_Of_Event_OccuredTextBox" runat="server" 
                Text='<%# Bind("Place_Of_Event_Occured") %>' Width="160px" MaxLength="20" /></td>
			
			<td>Appeal Date:</td>
			<td style="margin-left: 40px">
                <asp:TextBox ID="High_Court_Appeal_DateTextBox" runat="server" 
                Text='<%# Bind("High_Court_Appeal_Date") %>' Width="160px" /></td>
		</tr>           
            
        <tr align="left">
		    <td>Summary Of Case:</td>
			<td><asp:TextBox ID="Summary_Of_CaseTextBox" runat="server" 
                Text='<%# Bind("Summary_Of_Case") %>' Height="60px" Width="160px" /></td>
			
			<td>Order Of Appeal:</td>
			<td><asp:TextBox ID="High_court_appeal_orderTextBox" runat="server" 
                Text='<%# Bind("High_court_appeal_order") %>' Width="160px" MaxLength="20" /></td>
		</tr>           
            
        <tr align="left">
		    <td>F.I.R No:</td>
			<td><asp:TextBox ID="FIR_NoTextBox" runat="server" numeric="integer" Text='<%# Bind("FIR_No") %>' 
                    Width="160px" MaxLength="10" /></td>
			
			<td>Whether Appealed in Supreme Court:</td>
			<td>
                <asp:RadioButtonList ID="RadioButtonList_SupremeCourt" runat="server" 
                    RepeatDirection="Horizontal" Width="160px">
                    <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>         
            
        <tr align="left">
		    <td>Court Case No:</td>
			<td><asp:TextBox ID="Courst_Case_NoTextBox" runat="server" numeric="integer"
                Text='<%# Bind("Courst_Case_No") %>' Width="160px" MaxLength="10" /></td>
			
			<td>Appeal No:</td>
			<td><asp:TextBox ID="Supreme_court_appeal_noTextBox" runat="server" numeric="integer"
                Text='<%# Bind("Supreme_court_appeal_no") %>' Width="160px" MaxLength="10" /></td>
		</tr>          
            
        <tr align="left">
		    <td>Permission Date Of Prosecution:</td>
			<td><asp:TextBox ID="Permission_Date_Of_ProsecutionTextBox" runat="server" 
                Text='<%# Bind("Permission_Date_Of_Prosecution") %>' Width="160px" /></td>
			
			<td>Appeal Date:</td>
			<td><asp:TextBox ID="Supreme_court_appeal_dateTextBox" runat="server" 
                Text='<%# Bind("Supreme_court_appeal_date") %>' Width="160px" /></td>
		</tr>           
            
        <tr align="left">
		    <td>Date Of Suspension:</td>
			<td><asp:TextBox ID="Date_Of_SuspensionTextBox" runat="server" 
                Text='<%# Bind("Date_Of_Suspension") %>' Width="160px" /></td>
			
			<td>Order Of Appeal:</td>
			<td><asp:TextBox ID="Supreme_court_appeal_orderTextBox" runat="server" 
                Text='<%# Bind("Supreme_court_appeal_order") %>' Width="160px" 
                    MaxLength="20" /></td>
		</tr>          
            
        <tr align="left">
		    <td>Re-Instate Date:</td>
			<td><asp:TextBox ID="ReInstate_DateTextBox" runat="server" 
                Text='<%# Bind("ReInstate_Date") %>' Width="160px" /></td>
			
			<td>Remarks:</td>
			<td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                    Height="60px" Width="160px" /></td>
		</tr>
		
        <tr><td align="center" colspan=4>
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" CssClass="standardButton" />
			&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="Reset" Text="Reset" 
                CssClass="standardButton" onclientclick="resetTextFields();return false;" />	
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                CssClass="standardButton" /></td>
		</tr>            
    </table>
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            File_No:
            <asp:Label ID="File_NoLabel" runat="server" 
                Text='<%# Bind("File_No") %>' />
            <br />
            Employee_Name:
            <asp:Label ID="Employee_NameLabel" runat="server" 
                Text='<%# Bind("Employee_Name") %>' />
            <br />
            Designation:
            <asp:Label ID="DesignationLabel" runat="server" 
                Text='<%# Bind("Designation") %>' />
            <br />
            Place_Of_Event_Occured:
            <asp:Label ID="Place_Of_Event_OccuredLabel" runat="server" 
                Text='<%# Bind("Place_Of_Event_Occured") %>' />
            <br />
            Summary_Of_Case:
            <asp:Label ID="Summary_Of_CaseLabel" runat="server" 
                Text='<%# Bind("Summary_Of_Case") %>' />
            <br />
            FIR_No:
            <asp:Label ID="FIR_NoLabel" runat="server" 
                Text='<%# Bind("FIR_No") %>' />
            <br />
            Courst_Case_No:
            <asp:Label ID="Courst_Case_NoLabel" runat="server" 
                Text='<%# Bind("Courst_Case_No") %>' />
            <br />
            Permission_Date_Of_Prosecution:
            <asp:Label ID="Permission_Date_Of_ProsecutionLabel" runat="server" 
                Text='<%# Bind("Permission_Date_Of_Prosecution") %>' />
            <br />
            Date_Of_Suspension:
            <asp:Label ID="Date_Of_SuspensionLabel" runat="server" 
                Text='<%# Bind("Date_Of_Suspension") %>' />
            <br />
            ReInstate_Date:
            <asp:Label ID="ReInstate_DateLabel" runat="server" 
                Text='<%# Bind("ReInstate_Date") %>' />
            <br />
            Order_Of_Court:
            <asp:Label ID="Order_Of_CourtLabel" runat="server" 
                Text='<%# Bind("Order_Of_Court") %>' />
            <br />
            High_court_Appeal:
            <asp:CheckBox ID="High_court_AppealCheckBox" runat="server" 
                Checked='<%# Bind("High_court_Appeal") %>' Enabled="false" />
            <br />
            High_court_Appeal_No:
            <asp:Label ID="High_court_Appeal_NoLabel" runat="server" 
                Text='<%# Bind("High_court_Appeal_No") %>' />
            <br />
            High_Court_Appeal_Date:
            <asp:Label ID="High_Court_Appeal_DateLabel" runat="server" 
                Text='<%# Bind("High_Court_Appeal_Date") %>' />
            <br />
            High_court_appeal_order:
            <asp:Label ID="High_court_appeal_orderLabel" runat="server" 
                Text='<%# Bind("High_court_appeal_order") %>' />
            <br />
            Supreme_Court_Appeal:
            <asp:CheckBox ID="Supreme_Court_AppealCheckBox" runat="server" 
                Checked='<%# Bind("Supreme_Court_Appeal") %>' Enabled="false" />
            <br />
            Supreme_court_appeal_no:
            <asp:Label ID="Supreme_court_appeal_noLabel" runat="server" 
                Text='<%# Bind("Supreme_court_appeal_no") %>' />
            <br />
            Supreme_court_appeal_date:
            <asp:Label ID="Supreme_court_appeal_dateLabel" runat="server" 
                Text='<%# Bind("Supreme_court_appeal_date") %>' />
            <br />
            Supreme_court_appeal_order:
            <asp:Label ID="Supreme_court_appeal_orderLabel" runat="server" 
                Text='<%# Bind("Supreme_court_appeal_order") %>' />
            <br />
            Remarks:
            <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
&nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ods_EmployeeName" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        
        TypeName="IGRSS.DataAccessLayer.HistoryCardTableAdapters.HistroryCardTableAdapter">
    </asp:ObjectDataSource>
</center>
    
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
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter DbType="Guid" Name="Original_DesignationID" />
            <asp:Parameter Name="Original_Name" Type="String" />
            <asp:Parameter Name="Original_Description" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
    <asp:ObjectDataSource ID="ods_ACB_Case_Register" runat="server" DeleteMethod="DeleteQuery" 
        InsertMethod="Insert" 
        SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.ACB_Case_RegisterTableAdapters.ACB_CaseRegisterTableAdapter" 
        UpdateMethod="UpdateQuery" onselecting="ods_ACB_Case_Register_Selecting" 
        ondeleting="ods_ACB_Case_Register_Deleting" >
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="File_No" Type="Int32" />
            <asp:Parameter Name="Employee_Name" Type="String" />
            <asp:Parameter Name="Designation" Type="String" />
            <asp:Parameter Name="Place_Of_Event_Occured" Type="String" />
            <asp:Parameter Name="Summary_Of_Case" Type="String" />
            <asp:Parameter Name="FIR_No" Type="Int32" />
            <asp:Parameter Name="Courst_Case_No" Type="Int32" />
            <asp:Parameter Name="Permission_Date_Of_Prosecution" Type="DateTime" />
            <asp:Parameter Name="Date_Of_Suspension" Type="DateTime" />
            <asp:Parameter Name="ReInstate_Date" Type="DateTime" />
            <asp:Parameter Name="Order_Of_Court" Type="String" />
            <asp:Parameter Name="High_court_Appeal" Type="Boolean" />
            <asp:Parameter Name="High_court_Appeal_No" Type="Int32" />
            <asp:Parameter Name="High_Court_Appeal_Date" Type="DateTime" />
            <asp:Parameter Name="High_court_appeal_order" Type="String" />
            <asp:Parameter Name="Supreme_Court_Appeal" Type="Boolean" />
            <asp:Parameter Name="Supreme_court_appeal_no" Type="Int32" />
            <asp:Parameter Name="Supreme_court_appeal_date" Type="DateTime" />
            <asp:Parameter Name="Supreme_court_appeal_order" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="File_No" Type="Int32" />
            <asp:Parameter Name="Employee_Name" Type="String" />
            <asp:Parameter Name="Designation" Type="String" />
            <asp:Parameter Name="Place_Of_Event_Occured" Type="String" />
            <asp:Parameter Name="Summary_Of_Case" Type="String" />
            <asp:Parameter Name="FIR_No" Type="Int32" />
            <asp:Parameter Name="Courst_Case_No" Type="Int32" />
            <asp:Parameter Name="Permission_Date_Of_Prosecution" Type="DateTime" />
            <asp:Parameter Name="Date_Of_Suspension" Type="DateTime" />
            <asp:Parameter Name="ReInstate_Date" Type="DateTime" />
            <asp:Parameter Name="Order_Of_Court" Type="String" />
            <asp:Parameter Name="High_court_Appeal" Type="Boolean" />
            <asp:Parameter Name="High_court_Appeal_No" Type="Int32" />
            <asp:Parameter Name="High_Court_Appeal_Date" Type="DateTime" />
            <asp:Parameter Name="High_court_appeal_order" Type="String" />
            <asp:Parameter Name="Supreme_Court_Appeal" Type="Boolean" />
            <asp:Parameter Name="Supreme_court_appeal_no" Type="Int32" />
            <asp:Parameter Name="Supreme_court_appeal_date" Type="DateTime" />
            <asp:Parameter Name="Supreme_court_appeal_order" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView>
</asp:Content>

