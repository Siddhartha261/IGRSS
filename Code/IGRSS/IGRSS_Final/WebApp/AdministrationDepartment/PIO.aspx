<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="PIO.aspx.cs" Inherits="LatestPages_PIO" %>

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
                //dateFormat: "dd/mm/yy",
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
        var datePickers = ["ApplicationDateTextBox", "Last_Date_ReplyTextBox", "Application_Received_Actual_DateTextBox", "Recvd_DateTextBox", "Reject_DateTextBox", "FileClosureDateTextBox", "Letteer_Recvd_Date_commissionerTextBox", "AppealDateFirstAppealTextBox", "FileClosureDateFirstAppealTextBox", "AppealDateSecondAppealTextBox", "Remarks_Send_DateTextBox", "FileClosureDateSecondAppealTextBox"];
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
<asp:MultiView ID="Multiview_PIO" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<hr /><br />
<h1>PIO & APIO Register</h1>
<table>
          <tr>
                    <td align="right" style="width:641px; height: 30px;" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" style="height: 30px" >
                        <asp:TextBox Width="160" ID="txtFileNo" runat="server" 
                            meta:resourcekey="txtFileNoResource1"></asp:TextBox></td>
                        <td align="right" style="height: 30px">
                        <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_PIO" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo,Appl_BPL,Info_Send" DataSourceID="ods_PIO" 
                      EnableModelValidation="True" onrowdeleted="GridView_PIO_RowDeleted" 
                      onrowdeleting="GridView_PIO_RowDeleting" 
                      onrowediting="GridView_PIO_RowEditing" 
                      onrowdatabound="GridView_PIO_RowDataBound">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                              ReadOnly="True" SortExpression="SrNo" InsertVisible="False" 
                              Visible="False" />
                          <asp:BoundField DataField="FileNo" HeaderText="File No" 
                              SortExpression="FileNo" />
                          <asp:BoundField DataField="ApplicantName" HeaderText="Applicant Name" 
                              SortExpression="ApplicantName" />
                          <asp:BoundField DataField="ApplicationDate" HeaderText="Application Date" 
                              SortExpression="ApplicationDate" />
                          <asp:BoundField DataField="ApplicantAddress" HeaderText="ApplicantAddress" 
                              SortExpression="ApplicantAddress" Visible="False" />
                          <asp:BoundField DataField="Application_Received_Actual_Date" 
                              HeaderText="Application Received Actual Date" 
                              SortExpression="Application_Received_Actual_Date" />
                              <asp:TemplateField HeaderText="Application Is BPL" SortExpression="Appl_BPL" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblAppl_BPL"  runat="server" Text="No" 
                                        Font-Names="Times New Roman" Font-Bold="false"></asp:Label>
                                </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" />
                              </asp:TemplateField>                          
                          <asp:BoundField DataField="Sub_Info_Asked" HeaderText="Subject Of Information Asked" 
                              SortExpression="Sub_Info_Asked" />
                          <asp:BoundField DataField="Recvd_Sata_Mandal" HeaderText="Recvd_Sata_Mandal" 
                              SortExpression="Recvd_Sata_Mandal" Visible="False" />
                          <asp:BoundField DataField="Recvd_Date" HeaderText="Received Date" 
                              SortExpression="Recvd_Date" />
                          <asp:BoundField DataField="Information" HeaderText="Information" 
                              SortExpression="Information" Visible="False" />
                          <asp:BoundField DataField="Recvd_Fees" HeaderText="Received Fees" 
                              SortExpression="Recvd_Fees" />
                          <asp:BoundField DataField="Recvd_Fees_Mode" HeaderText="Received Fees Mode" 
                              SortExpression="Recvd_Fees_Mode" />
                          <asp:BoundField DataField="Last_Date_Reply" HeaderText="Last Date Of Reply" 
                              SortExpression="Last_Date_Reply" />
                              <asp:TemplateField HeaderText="Information Send" SortExpression="Info_Send" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="lblInfo_Send"  runat="server" Text="Partial" 
                                        Font-Names="Times New Roman" Font-Bold="false"></asp:Label>
                                </ItemTemplate>
                                  <ItemStyle HorizontalAlign="Center" />
                              </asp:TemplateField>
                         <%-- <asp:CheckBoxField DataField="Info_Send" HeaderText="Information Send" 
                              SortExpression="Info_Send" />--%>
                          <asp:BoundField DataField="Info_Pages" HeaderText="Info_Pages" 
                              SortExpression="Info_Pages" Visible="False" />
                          <asp:BoundField DataField="Page_Amt" HeaderText="Page_Amt" 
                              SortExpression="Page_Amt" Visible="False" />
                          <asp:BoundField DataField="Total_Amt" HeaderText="Total_Amt" 
                              SortExpression="Total_Amt" Visible="False" />
                          <asp:BoundField DataField="Reject_Date" HeaderText="Rejection Date" 
                              SortExpression="Reject_Date" />
                          <asp:BoundField DataField="Section" HeaderText="Section" 
                              SortExpression="Section" />
                          <asp:BoundField DataField="Reasons" HeaderText="Reasons" 
                              SortExpression="Reasons" Visible="False" />
                          <asp:BoundField DataField="FileClosureDate" HeaderText="FileClosureDate" 
                              SortExpression="FileClosureDate" Visible="False" />
                          <asp:BoundField DataField="Authority" HeaderText="Authority" 
                              SortExpression="Authority" Visible="False" />
                          <asp:BoundField DataField="AppealNoFirstAppeal" 
                              HeaderText="AppealNoFirstAppeal" SortExpression="AppealNoFirstAppeal" 
                              Visible="False" />
                          <asp:BoundField DataField="AppealDateFirstAppeal" 
                              HeaderText="AppealDateFirstAppeal" 
                              SortExpression="AppealDateFirstAppeal" Visible="False" />
                          <asp:BoundField DataField="Order_Authority" HeaderText="Order Number From Authority" 
                              SortExpression="Order_Authority" />
                          <asp:BoundField DataField="FileClosureDateFirstAppeal" 
                              HeaderText="FileClosureDateFirstAppeal" 
                              SortExpression="FileClosureDateFirstAppeal" Visible="False" />
                          <asp:BoundField DataField="Letteer_Recvd_Date_commissioner" 
                              HeaderText="Letter Recvd Date From Commissioner" 
                              SortExpression="Letteer_Recvd_Date_commissioner" />
                          <asp:BoundField DataField="AppealNoSecondAppeal" 
                              HeaderText="AppealNoSecondAppeal" SortExpression="AppealNoSecondAppeal" 
                              Visible="False" />
                          <asp:BoundField DataField="ApplicationNameSecondAppeal" 
                              HeaderText="Application Name" 
                              SortExpression="ApplicationNameSecondAppeal" />
                          <asp:BoundField DataField="AddressSecondAppeal" 
                              HeaderText="AddressSecondAppeal" SortExpression="AddressSecondAppeal" 
                              Visible="False" />
                          <asp:BoundField DataField="AppealDateSecondAppeal" 
                              HeaderText="AppealDateSecondAppeal" 
                              SortExpression="AppealDateSecondAppeal" Visible="False" />
                          <asp:BoundField DataField="Remarks_SentTo_Commission" 
                              HeaderText="Remarks_SentTo_Commission" 
                              SortExpression="Remarks_SentTo_Commission" Visible="False" />
                          <asp:BoundField DataField="Remarks_Send_Date" HeaderText="Remarks Send Date" 
                              SortExpression="Remarks_Send_Date" />
                          <asp:BoundField DataField="FileClosureDateSecondAppeal" 
                              HeaderText="FileClosureDateSecondAppeal" 
                              SortExpression="FileClosureDateSecondAppeal" Visible="False" />
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
<h1>PIO & APIO Register</h1>

    
    <asp:FormView ID="FormView_PIO" runat="server" DataKeyNames="SrNo,Appl_BPL,Info_Send" 
        DataSourceID="ods_PIO" DefaultMode="Insert" EnableModelValidation="True" 
        oniteminserting="FormView_PIO_ItemInserting" 
        oniteminserted="FormView_PIO_ItemInserted" 
        onitemupdated="FormView_PIO_ItemUpdated" 
        onitemupdating="FormView_PIO_ItemUpdating" 
        ondatabound="FormView_PIO_DataBound">
        <EditItemTemplate>
                  <table cellpadding="5" cellspacing="5" width="100%">
        <tr align="left">
		    <td>File No:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td style="width: 170px"><asp:TextBox ID="FileNoTextBox" runat="server" numeric="integer" Text='<%# Bind("FileNo") %>' 
                    Width="160px" MaxLength="10" /></td>
			
			<td>Information:</td>
			<td>
                &nbsp;</td>
			<td>
                <asp:RadioButtonList ID="Radio_information" runat="server" 
                    RepeatDirection="Horizontal" Width="160px" TabIndex="9">
                    <asp:ListItem Text="Partial" Value="Partial"></asp:ListItem>
                    <asp:ListItem Text="Complete" Value="Complete"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>	
            
        <tr align="left">
		    <td>Applicant's Name:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="ApplicantNameTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td style="width: 170px"><asp:TextBox ID="ApplicantNameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("ApplicantName") %>' Width="160px" MaxLength="30" 
                    TabIndex="1" /></td>
			
			<td>Received Fees:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="Recvd_FeesTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="Recvd_FeesTextBox" runat="server" numeric="integer"
                Text='<%# Bind("Recvd_Fees") %>' Width="160px" MaxLength="10" TabIndex="10" /></td>
		</tr>
            				
        <tr align="left">
		    <td>Date Of Application:</td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"><asp:TextBox ID="ApplicationDateTextBox" runat="server" 
                Text='<%# Bind("ApplicationDate") %>' Width="160px" TabIndex="2" /></td>
			
			<td>Received Fees Mode:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="Drop_recvdfessmode" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td>
                <asp:DropDownList ID="Drop_recvdfessmode" runat="server" 
                    DataSourceID="ods_FeeMaster" DataTextField="Name" DataValueField="Name" 
                    Width="160px" TabIndex="11">
                </asp:DropDownList>
            </td>
		</tr>
                    
		<tr align="left">
		    <td>Address Of Applicant:</td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"><asp:TextBox ID="ApplicantAddressTextBox" runat="server" 
                Text='<%# Bind("ApplicantAddress") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" TabIndex="3" /></td>
			
			<td>Last Date Of Reply/Rejection:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="Last_Date_ReplyTextBox" runat="server" 
                Text='<%# Bind("Last_Date_Reply") %>' Width="160px" TabIndex="12" /></td>		
		</tr>     
            			
        <tr align="left">
		    <td>Actual Received Date Of Application:</td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"><asp:TextBox ID="Application_Received_Actual_DateTextBox" runat="server" 
                Text='<%# Bind("Application_Received_Actual_Date") %>' Width="160px" 
                    TabIndex="4" /></td>
			
			<td>Information Send:</td>
			<td>
                &nbsp;</td>
			<td>
                <asp:RadioButtonList ID="Radio_informationsend" runat="server" 
                    RepeatDirection="Horizontal" Width="160px" TabIndex="13">
                    <asp:ListItem Text="Partial" Value="True"></asp:ListItem>
                    <asp:ListItem Text="Complete" Value="False"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>     
            		
        <tr align="left">
		    <td>Application Is BPL:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="Radio_applbpl" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td style="width: 170px">
                <asp:RadioButtonList ID="Radio_applbpl" runat="server" 
                    RepeatDirection="Horizontal" Width="160px" TabIndex="5">
                    <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
			
			<td>Information Pages:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="Info_PagesTextBox" runat="server" numeric="integer"
                Text='<%# Bind("Info_Pages") %>' Width="160px" TabIndex="14" /></td>
		</tr> 	            
            				
        <tr align="left">
		    <td>Subject Of Information Asked:</td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"><asp:TextBox ID="Sub_Info_AskedTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Sub_Info_Asked") %>' Width="160px" MaxLength="20" 
                    TabIndex="6" /></td>
			
			<td>Amount Per Page:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="Page_AmtTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="Page_AmtTextBox" runat="server" numeric="integer"
                Text='<%# Bind("Page_Amt") %>' Width="160px" TabIndex="15" /></td>
		</tr> 	           
            				
        <tr align="left">
		    <td>Received From Other Sata-Mandal:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="Recvd_Sata_MandalTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td style="width: 170px"><asp:TextBox ID="Recvd_Sata_MandalTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Recvd_Sata_Mandal") %>' Width="160px" MaxLength="20" 
                    TabIndex="7" /></td>
			
			<td>Total Amount:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="Total_AmtTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="Total_AmtTextBox" runat="server" numeric="integer" 
                Text='<%# Bind("Total_Amt") %>' Width="160px" TabIndex="16" /></td>
		</tr> 	            
            				
        <tr align="left">
		    <td>Received Date:</td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"><asp:TextBox ID="Recvd_DateTextBox" runat="server" 
                Text='<%# Bind("Recvd_Date") %>' Width="160px" TabIndex="8" /></td>
			
			<td>Rejection Date:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="Reject_DateTextBox" runat="server" 
                Text='<%# Bind("Reject_Date") %>' Width="160px" TabIndex="17" /></td>
		</tr>       
            				
        <tr align="left">
		    <td></td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"></td>
			
			<td>Under Which Section:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="SectionTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="SectionTextBox" runat="server" onkeypress="return AllowAlphabet(event)" Text='<%# Bind("Section") %>' 
                    Width="160px" TabIndex="18" /></td>			
		</tr> 	          
            				
        <tr align="left">
		    <td></td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"></td>
			
			<td>Reasons:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="ReasonsTextBox" runat="server" Text='<%# Bind("Reasons") %>' 
                    Height="60px" TextMode="MultiLine" Width="160px" TabIndex="19" /></td>
		</tr>         
            				
        <tr align="left">
		    <td></td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"></td>
			
			<td>File Closure Date:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="FileClosureDateTextBox" runat="server" 
                Text='<%# Bind("FileClosureDate") %>' Width="160px" TabIndex="20" /></td>
		</tr> 	         
            				
                    <tr>
                        <td colspan="3" style="text-align: center"><h2>FIRST APPEAL</h2>
                            &nbsp;</td>
                        <td colspan="3" style="text-align: center"><h2>SECOND APPEAL</h2>
                            &nbsp;</td>
                    </tr>
            				
        <tr align="left">
		    <td>Whether Appealed to Appellate/Authority:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="AuthorityTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td style="width: 170px"><asp:TextBox ID="AuthorityTextBox" runat="server" 
                Text='<%# Bind("Authority") %>' Width="160px" TabIndex="21" /></td>
			
			<td>Letter Received Date from Commissioner:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="Letteer_Recvd_Date_commissionerTextBox" runat="server" 
                Text='<%# Bind("Letteer_Recvd_Date_commissioner") %>' Width="160px" 
                    TabIndex="26" /></td>
		</tr> 	         
            				
        <tr align="left">
		   <td>Appeal No:</td>
		    <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="AppealNoFirstAppealTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		   <td style="width: 170px"><asp:TextBox ID="AppealNoFirstAppealTextBox" runat="server" numeric="integer"
                Text='<%# Bind("AppealNoFirstAppeal") %>' Width="160px" TabIndex="22" /></td>
		   
		   <td>Appeal No:</td>
		    <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                    ControlToValidate="AppealNoSecondAppealTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		   <td><asp:TextBox ID="AppealNoSecondAppealTextBox" runat="server" numeric="integer" 
                Text='<%# Bind("AppealNoSecondAppeal") %>' Width="160px" TabIndex="27" /></td>
		</tr>          
            				
        <tr align="left">
		    <td>Appeal Date:</td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"><asp:TextBox ID="AppealDateFirstAppealTextBox" runat="server" 
                Text='<%# Bind("AppealDateFirstAppeal") %>' Width="160px" TabIndex="23" /></td>
			
			<td>Application Name:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                    ControlToValidate="ApplicationNameSecondAppealTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="ApplicationNameSecondAppealTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("ApplicationNameSecondAppeal") %>' Width="160px" 
                    TabIndex="28" /></td>			
		</tr>         
            				
        <tr align="left">
		    <td>Order Number Passed By Appellate/Authority:</td>
		    <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ControlToValidate="Order_AuthorityTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td style="width: 170px"><asp:TextBox ID="Order_AuthorityTextBox" runat="server" numeric="integer"
                Text='<%# Bind("Order_Authority") %>' Width="160px" TabIndex="24" /></td>
			
			<td>Address:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="AddressSecondAppealTextBox" runat="server" 
                Text='<%# Bind("AddressSecondAppeal") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" TabIndex="29" /></td>
		</tr>          
            			
        <tr align="left">
		    <td>File Closure Date:</td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"><asp:TextBox ID="FileClosureDateFirstAppealTextBox" runat="server" 
                Text='<%# Bind("FileClosureDateFirstAppeal") %>' Width="160px" TabIndex="25" /></td>
				
			<td>Appeal Date:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="AppealDateSecondAppealTextBox" runat="server" 
                Text='<%# Bind("AppealDateSecondAppeal") %>' Width="160px" TabIndex="30" /></td>
		</tr>         
            				
        <tr align="left">
		    <td></td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"></td>
			
			<td>Remarks Sent To Commission:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="Remarks_SentTo_CommissionTextBox" runat="server" 
                Text='<%# Bind("Remarks_SentTo_Commission") %>' Height="60px" 
                    TextMode="MultiLine" Width="160px" TabIndex="31" /></td>
		</tr>         
           				
        <tr align="left">
		    <td></td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"></td>
			
			<td>Remarks Send Date:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="Remarks_Send_DateTextBox" runat="server" 
                Text='<%# Bind("Remarks_Send_Date") %>' Width="160px" TabIndex="32" /></td>
		</tr>        
			
        <tr align="left">
		    <td></td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"></td>
			
			<td>File Closure Date:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="FileClosureDateSecondAppealTextBox" runat="server" 
                Text='<%# Bind("FileClosureDateSecondAppeal") %>' Width="160px" 
                    TabIndex="33" /></td>
		</tr> 	
		
        <tr>
		    <td align="center" colspan="6">
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" CssClass="standardButton" TabIndex="34" />
			&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="Reset" Text="Reset" 
                    CssClass="standardButton" 
                    onclientclick="resetTextFields();return false;" TabIndex="35" />	
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" TabIndex="36" /></td>			
		</tr>           
	</table>

        </EditItemTemplate>
        <InsertItemTemplate>
                <table cellpadding="5" cellspacing="5" width="1000px">
        <tr align="left">
		    <td>File No:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td style="width: 170px"><asp:TextBox ID="FileNoTextBox" runat="server" numeric="integer" Text='<%# Bind("FileNo") %>' 
                    Width="160px" MaxLength="10" /></td>
			
			<td>Information:</td>
			<td>
                &nbsp;</td>
			<td>
                <asp:RadioButtonList ID="Radio_information" runat="server" 
                    RepeatDirection="Horizontal" Width="160px" TabIndex="9">
                    <asp:ListItem Text="Partial" Value="Partial"></asp:ListItem>
                    <asp:ListItem Text="Complete" Value="Complete"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>	
            
        <tr align="left">
		    <td>Applicant's Name:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="ApplicantNameTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td style="width: 170px"><asp:TextBox ID="ApplicantNameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("ApplicantName") %>' Width="160px" MaxLength="30" 
                    TabIndex="1" /></td>
			
			<td>Received Fees:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="Recvd_FeesTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="Recvd_FeesTextBox" runat="server" numeric="integer"
                Text='<%# Bind("Recvd_Fees") %>' Width="160px" MaxLength="10" TabIndex="10" /></td>
		</tr>
            				
        <tr align="left">
		    <td>Date Of Application:</td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"><asp:TextBox ID="ApplicationDateTextBox" runat="server" 
                Text='<%# Bind("ApplicationDate") %>' Width="160px" TabIndex="2" /></td>
			
			<td>Received Fees Mode:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="Drop_recvdfessmode" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td>
                <asp:DropDownList ID="Drop_recvdfessmode" runat="server" 
                    DataSourceID="ods_FeeMaster" DataTextField="Name" DataValueField="Name" 
                    Width="160px" TabIndex="11">
                </asp:DropDownList>
            </td>
		</tr>
                    
		<tr align="left">
		    <td>Address Of Applicant:</td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"><asp:TextBox ID="ApplicantAddressTextBox" runat="server" 
                Text='<%# Bind("ApplicantAddress") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" TabIndex="3" /></td>
			
			<td>Last Date Of Reply/Rejection:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="Last_Date_ReplyTextBox" runat="server" 
                Text='<%# Bind("Last_Date_Reply") %>' Width="160px" TabIndex="12" /></td>		
		</tr>     
            			
        <tr align="left">
		    <td>Actual Received Date Of Application:</td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"><asp:TextBox ID="Application_Received_Actual_DateTextBox" runat="server" 
                Text='<%# Bind("Application_Received_Actual_Date") %>' Width="160px" 
                    TabIndex="4" /></td>
			
			<td>Information Send:</td>
			<td>
                &nbsp;</td>
			<td>
                <asp:RadioButtonList ID="Radio_informationsend" runat="server" 
                    RepeatDirection="Horizontal" Width="160px" TabIndex="13">
                    <asp:ListItem Text="Partial" Value="True"></asp:ListItem>
                    <asp:ListItem Text="Complete" Value="False"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>     
            		
        <tr align="left">
		    <td>Application Is BPL:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="Radio_applbpl" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td style="width: 170px">
                <asp:RadioButtonList ID="Radio_applbpl" runat="server" 
                    RepeatDirection="Horizontal" Width="160px" TabIndex="5">
                    <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
			
			<td>Information Pages:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="Info_PagesTextBox" runat="server" numeric="integer"
                Text='<%# Bind("Info_Pages") %>' Width="160px" TabIndex="14" MaxLength="5" /></td>
		</tr> 	            
            				
        <tr align="left">
		    <td>Subject Of Information Asked:</td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"><asp:TextBox ID="Sub_Info_AskedTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Sub_Info_Asked") %>' Width="160px" MaxLength="20" 
                    TabIndex="6" /></td>
			
			<td>Amount Per Page:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="Page_AmtTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="Page_AmtTextBox" runat="server" numeric="integer"
                Text='<%# Bind("Page_Amt") %>' Width="160px" TabIndex="15" MaxLength="10" /></td>
		</tr> 	           
            				
        <tr align="left">
		    <td>Received From Other Sata-Mandal:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="Recvd_Sata_MandalTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td style="width: 170px"><asp:TextBox ID="Recvd_Sata_MandalTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Recvd_Sata_Mandal") %>' Width="160px" MaxLength="20" 
                    TabIndex="7" /></td>
			
			<td>Total Amount:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="Total_AmtTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="Total_AmtTextBox" runat="server" numeric="integer" 
                Text='<%# Bind("Total_Amt") %>' Width="160px" TabIndex="16" MaxLength="10" /></td>
		</tr> 	            
            				
        <tr align="left">
		    <td>Received Date:</td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"><asp:TextBox ID="Recvd_DateTextBox" runat="server" 
                Text='<%# Bind("Recvd_Date") %>' Width="160px" TabIndex="8" /></td>
			
			<td>Rejection Date:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="Reject_DateTextBox" runat="server" 
                Text='<%# Bind("Reject_Date") %>' Width="160px" TabIndex="17" /></td>
		</tr>       
            				
        <tr align="left">
		    <td></td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"></td>
			
			<td>Under Which Section:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="SectionTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="SectionTextBox" runat="server" 
                    onkeypress="return AllowAlphabet(event)" Text='<%# Bind("Section") %>' 
                    Width="160px" TabIndex="18" MaxLength="30" /></td>			
		</tr> 	          
            				
        <tr align="left">
		    <td></td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"></td>
			
			<td>Reasons:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="ReasonsTextBox" runat="server" Text='<%# Bind("Reasons") %>' 
                    Height="60px" TextMode="MultiLine" Width="160px" TabIndex="19" /></td>
		</tr>         
            				
        <tr align="left">
		    <td></td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"></td>
			
			<td>File Closure Date:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="FileClosureDateTextBox" runat="server" 
                Text='<%# Bind("FileClosureDate") %>' Width="160px" TabIndex="20" /></td>
		</tr> 	         
            				
                    <tr>
                        <td colspan="3" style="text-align: center"><h2>FIRST APPEAL</h2>
                            &nbsp;</td>
                        <td colspan="3" style="text-align: center"><h2>SECOND APPEAL</h2>
                            &nbsp;</td>
                    </tr>
            				
        <tr align="left">
		    <td>Whether Appealed to Appellate/Authority:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="AuthorityTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td style="width: 170px">
                <asp:TextBox ID="AuthorityTextBox" runat="server" 
                Text='<%# Bind("Authority") %>' Width="160px" TabIndex="21" MaxLength="30" /></td>
			
			<td>Letter Received Date from Commissioner:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="Letteer_Recvd_Date_commissionerTextBox" runat="server" 
                Text='<%# Bind("Letteer_Recvd_Date_commissioner") %>' Width="160px" 
                    TabIndex="26" /></td>
		</tr> 	         
            				
        <tr align="left">
		   <td>Appeal No:</td>
		    <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="AppealNoFirstAppealTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		   <td style="width: 170px"><asp:TextBox ID="AppealNoFirstAppealTextBox" 
                   runat="server" numeric="integer"
                Text='<%# Bind("AppealNoFirstAppeal") %>' Width="160px" TabIndex="22" 
                   MaxLength="10" /></td>
		   
		   <td>Appeal No:</td>
		    <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                    ControlToValidate="AppealNoSecondAppealTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		   <td><asp:TextBox ID="AppealNoSecondAppealTextBox" runat="server" numeric="integer" 
                Text='<%# Bind("AppealNoSecondAppeal") %>' Width="160px" TabIndex="27" 
                   MaxLength="10" /></td>
		</tr>          
            				
        <tr align="left">
		    <td>Appeal Date:</td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"><asp:TextBox ID="AppealDateFirstAppealTextBox" runat="server" 
                Text='<%# Bind("AppealDateFirstAppeal") %>' Width="160px" TabIndex="23" /></td>
			
			<td>Application Name:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                    ControlToValidate="ApplicationNameSecondAppealTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td><asp:TextBox ID="ApplicationNameSecondAppealTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("ApplicationNameSecondAppeal") %>' Width="160px" 
                    TabIndex="28" MaxLength="30" /></td>			
		</tr>         
            				
        <tr align="left">
		    <td>Order Number Passed By Appellate/Authority:</td>
		    <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ControlToValidate="Order_AuthorityTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td style="width: 170px"><asp:TextBox ID="Order_AuthorityTextBox" runat="server" numeric="integer"
                Text='<%# Bind("Order_Authority") %>' Width="160px" TabIndex="24" 
                    MaxLength="10" /></td>
			
			<td>Address:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="AddressSecondAppealTextBox" runat="server" 
                Text='<%# Bind("AddressSecondAppeal") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" TabIndex="29" /></td>
		</tr>          
            			
        <tr align="left">
		    <td>File Closure Date:</td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"><asp:TextBox ID="FileClosureDateFirstAppealTextBox" runat="server" 
                Text='<%# Bind("FileClosureDateFirstAppeal") %>' Width="160px" TabIndex="25" /></td>
				
			<td>Appeal Date:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="AppealDateSecondAppealTextBox" runat="server" 
                Text='<%# Bind("AppealDateSecondAppeal") %>' Width="160px" TabIndex="30" /></td>
		</tr>         
            				
        <tr align="left">
		    <td></td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"></td>
			
			<td>Remarks Sent To Commission:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="Remarks_SentTo_CommissionTextBox" runat="server" 
                Text='<%# Bind("Remarks_SentTo_Commission") %>' Height="60px" 
                    TextMode="MultiLine" Width="160px" TabIndex="31" /></td>
		</tr>         
           				
        <tr align="left">
		    <td></td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"></td>
			
			<td>Remarks Send Date:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="Remarks_Send_DateTextBox" runat="server" 
                Text='<%# Bind("Remarks_Send_Date") %>' Width="160px" TabIndex="32" /></td>
		</tr>        
			
        <tr align="left">
		    <td></td>
			<td>
                &nbsp;</td>
			<td style="width: 170px"></td>
			
			<td>File Closure Date:</td>
			<td>
                &nbsp;</td>
			<td><asp:TextBox ID="FileClosureDateSecondAppealTextBox" runat="server" 
                Text='<%# Bind("FileClosureDateSecondAppeal") %>' Width="160px" 
                    TabIndex="33" /></td>
		</tr> 	
		
        <tr >
		    <td align="center" colspan="6">
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" CssClass="standardButton" TabIndex="34" />
			&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="Reset" Text="Reset" 
                    CssClass="standardButton" 
                    onclientclick="resetTextFields();return false;" TabIndex="35" />	
             &nbsp;<asp:LinkButton ID="CancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back"  CssClass="standardButton" 
                        AccessKey="B"/></td>			
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
            ApplicantName:
            <asp:Label ID="ApplicantNameLabel" runat="server" 
                Text='<%# Bind("ApplicantName") %>' />
            <br />
            ApplicationDate:
            <asp:Label ID="ApplicationDateLabel" runat="server" 
                Text='<%# Bind("ApplicationDate") %>' />
            <br />
            ApplicantAddress:
            <asp:Label ID="ApplicantAddressLabel" runat="server" 
                Text='<%# Bind("ApplicantAddress") %>' />
            <br />
            Application_Received_Actual_Date:
            <asp:Label ID="Application_Received_Actual_DateLabel" runat="server" 
                Text='<%# Bind("Application_Received_Actual_Date") %>' />
            <br />
            Appl_BPL:
            <asp:CheckBox ID="Appl_BPLCheckBox" runat="server" 
                Checked='<%# Bind("Appl_BPL") %>' Enabled="false" />
            <br />
            Sub_Info_Asked:
            <asp:Label ID="Sub_Info_AskedLabel" runat="server" 
                Text='<%# Bind("Sub_Info_Asked") %>' />
            <br />
            Recvd_Sata_Mandal:
            <asp:Label ID="Recvd_Sata_MandalLabel" runat="server" 
                Text='<%# Bind("Recvd_Sata_Mandal") %>' />
            <br />
            Recvd_Date:
            <asp:Label ID="Recvd_DateLabel" runat="server" 
                Text='<%# Bind("Recvd_Date") %>' />
            <br />
            Information:
            <asp:Label ID="InformationLabel" runat="server" 
                Text='<%# Bind("Information") %>' />
            <br />
            Recvd_Fees:
            <asp:Label ID="Recvd_FeesLabel" runat="server" 
                Text='<%# Bind("Recvd_Fees") %>' />
            <br />
            Recvd_Fees_Mode:
            <asp:Label ID="Recvd_Fees_ModeLabel" runat="server" 
                Text='<%# Bind("Recvd_Fees_Mode") %>' />
            <br />
            Last_Date_Reply:
            <asp:Label ID="Last_Date_ReplyLabel" runat="server" 
                Text='<%# Bind("Last_Date_Reply") %>' />
            <br />
            Info_Send:
            <asp:CheckBox ID="Info_SendCheckBox" runat="server" 
                Checked='<%# Bind("Info_Send") %>' Enabled="false" />
            <br />
            Info_Pages:
            <asp:Label ID="Info_PagesLabel" runat="server" 
                Text='<%# Bind("Info_Pages") %>' />
            <br />
            Page_Amt:
            <asp:Label ID="Page_AmtLabel" runat="server" Text='<%# Bind("Page_Amt") %>' />
            <br />
            Total_Amt:
            <asp:Label ID="Total_AmtLabel" runat="server" Text='<%# Bind("Total_Amt") %>' />
            <br />
            Reject_Date:
            <asp:Label ID="Reject_DateLabel" runat="server" 
                Text='<%# Bind("Reject_Date") %>' />
            <br />
            Section:
            <asp:Label ID="SectionLabel" runat="server" Text='<%# Bind("Section") %>' />
            <br />
            Reasons:
            <asp:Label ID="ReasonsLabel" runat="server" Text='<%# Bind("Reasons") %>' />
            <br />
            FileClosureDate:
            <asp:Label ID="FileClosureDateLabel" runat="server" 
                Text='<%# Bind("FileClosureDate") %>' />
            <br />
            Authority:
            <asp:Label ID="AuthorityLabel" runat="server" Text='<%# Bind("Authority") %>' />
            <br />
            AppealNoFirstAppeal:
            <asp:Label ID="AppealNoFirstAppealLabel" runat="server" 
                Text='<%# Bind("AppealNoFirstAppeal") %>' />
            <br />
            AppealDateFirstAppeal:
            <asp:Label ID="AppealDateFirstAppealLabel" runat="server" 
                Text='<%# Bind("AppealDateFirstAppeal") %>' />
            <br />
            Order_Authority:
            <asp:Label ID="Order_AuthorityLabel" runat="server" 
                Text='<%# Bind("Order_Authority") %>' />
            <br />
            FileClosureDateFirstAppeal:
            <asp:Label ID="FileClosureDateFirstAppealLabel" runat="server" 
                Text='<%# Bind("FileClosureDateFirstAppeal") %>' />
            <br />
            Letteer_Recvd_Date_commissioner:
            <asp:Label ID="Letteer_Recvd_Date_commissionerLabel" runat="server" 
                Text='<%# Bind("Letteer_Recvd_Date_commissioner") %>' />
            <br />
            AppealNoSecondAppeal:
            <asp:Label ID="AppealNoSecondAppealLabel" runat="server" 
                Text='<%# Bind("AppealNoSecondAppeal") %>' />
            <br />
            ApplicationNameSecondAppeal:
            <asp:Label ID="ApplicationNameSecondAppealLabel" runat="server" 
                Text='<%# Bind("ApplicationNameSecondAppeal") %>' />
            <br />
            AddressSecondAppeal:
            <asp:Label ID="AddressSecondAppealLabel" runat="server" 
                Text='<%# Bind("AddressSecondAppeal") %>' />
            <br />
            AppealDateSecondAppeal:
            <asp:Label ID="AppealDateSecondAppealLabel" runat="server" 
                Text='<%# Bind("AppealDateSecondAppeal") %>' />
            <br />
            Remarks_SentTo_Commission:
            <asp:Label ID="Remarks_SentTo_CommissionLabel" runat="server" 
                Text='<%# Bind("Remarks_SentTo_Commission") %>' />
            <br />
            Remarks_Send_Date:
            <asp:Label ID="Remarks_Send_DateLabel" runat="server" 
                Text='<%# Bind("Remarks_Send_Date") %>' />
            <br />
            FileClosureDateSecondAppeal:
            <asp:Label ID="FileClosureDateSecondAppealLabel" runat="server" 
                Text='<%# Bind("FileClosureDateSecondAppeal") %>' />
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
    
    <asp:ObjectDataSource ID="ods_PIO" runat="server" DeleteMethod="DeleteQuery" 
        InsertMethod="Insert" 
        SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.PIOTableAdapters.PIOTableAdapter" 
        UpdateMethod="UpdateQuery" onselecting="ods_PIO_Selecting" 
        ondeleting="ods_PIO_Deleting">
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="ApplicantName" Type="String" />
            <asp:Parameter Name="ApplicationDate" Type="DateTime" />
            <asp:Parameter Name="ApplicantAddress" Type="String" />
            <asp:Parameter Name="Application_Received_Actual_Date" Type="DateTime" />
            <asp:Parameter Name="Appl_BPL" Type="Boolean" />
            <asp:Parameter Name="Sub_Info_Asked" Type="String" />
            <asp:Parameter Name="Recvd_Sata_Mandal" Type="String" />
            <asp:Parameter Name="Recvd_Date" Type="DateTime" />
            <asp:Parameter Name="Information" Type="String" />
            <asp:Parameter Name="Recvd_Fees" Type="Decimal" />
            <asp:Parameter Name="Recvd_Fees_Mode" Type="String" />
            <asp:Parameter Name="Last_Date_Reply" Type="DateTime" />
            <asp:Parameter Name="Info_Send" Type="Boolean" />
            <asp:Parameter Name="Info_Pages" Type="Int32" />
            <asp:Parameter Name="Page_Amt" Type="Decimal" />
            <asp:Parameter Name="Total_Amt" Type="Decimal" />
            <asp:Parameter Name="Reject_Date" Type="DateTime" />
            <asp:Parameter Name="Section" Type="String" />
            <asp:Parameter Name="Reasons" Type="String" />
            <asp:Parameter Name="FileClosureDate" Type="DateTime" />
            <asp:Parameter Name="Authority" Type="String" />
            <asp:Parameter Name="AppealNoFirstAppeal" Type="Int32" />
            <asp:Parameter Name="AppealDateFirstAppeal" Type="DateTime" />
            <asp:Parameter Name="Order_Authority" Type="Int32" />
            <asp:Parameter Name="FileClosureDateFirstAppeal" Type="DateTime" />
            <asp:Parameter Name="Letteer_Recvd_Date_commissioner" Type="DateTime" />
            <asp:Parameter Name="AppealNoSecondAppeal" Type="Int32" />
            <asp:Parameter Name="ApplicationNameSecondAppeal" Type="String" />
            <asp:Parameter Name="AddressSecondAppeal" Type="String" />
            <asp:Parameter Name="AppealDateSecondAppeal" Type="DateTime" />
            <asp:Parameter Name="Remarks_SentTo_Commission" Type="String" />
            <asp:Parameter Name="Remarks_Send_Date" Type="DateTime" />
            <asp:Parameter Name="FileClosureDateSecondAppeal" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="ApplicantName" Type="String" />
            <asp:Parameter Name="ApplicationDate" Type="DateTime" />
            <asp:Parameter Name="ApplicantAddress" Type="String" />
            <asp:Parameter Name="Application_Received_Actual_Date" Type="DateTime" />
            <asp:Parameter Name="Appl_BPL" Type="Boolean" />
            <asp:Parameter Name="Sub_Info_Asked" Type="String" />
            <asp:Parameter Name="Recvd_Sata_Mandal" Type="String" />
            <asp:Parameter Name="Recvd_Date" Type="DateTime" />
            <asp:Parameter Name="Information" Type="String" />
            <asp:Parameter Name="Recvd_Fees" Type="Decimal" />
            <asp:Parameter Name="Recvd_Fees_Mode" Type="String" />
            <asp:Parameter Name="Last_Date_Reply" Type="DateTime" />
            <asp:Parameter Name="Info_Send" Type="Boolean" />
            <asp:Parameter Name="Info_Pages" Type="Int32" />
            <asp:Parameter Name="Page_Amt" Type="Decimal" />
            <asp:Parameter Name="Total_Amt" Type="Decimal" />
            <asp:Parameter Name="Reject_Date" Type="DateTime" />
            <asp:Parameter Name="Section" Type="String" />
            <asp:Parameter Name="Reasons" Type="String" />
            <asp:Parameter Name="FileClosureDate" Type="DateTime" />
            <asp:Parameter Name="Authority" Type="String" />
            <asp:Parameter Name="AppealNoFirstAppeal" Type="Int32" />
            <asp:Parameter Name="AppealDateFirstAppeal" Type="DateTime" />
            <asp:Parameter Name="Order_Authority" Type="Int32" />
            <asp:Parameter Name="FileClosureDateFirstAppeal" Type="DateTime" />
            <asp:Parameter Name="Letteer_Recvd_Date_commissioner" Type="DateTime" />
            <asp:Parameter Name="AppealNoSecondAppeal" Type="Int32" />
            <asp:Parameter Name="ApplicationNameSecondAppeal" Type="String" />
            <asp:Parameter Name="AddressSecondAppeal" Type="String" />
            <asp:Parameter Name="AppealDateSecondAppeal" Type="DateTime" />
            <asp:Parameter Name="Remarks_SentTo_Commission" Type="String" />
            <asp:Parameter Name="Remarks_Send_Date" Type="DateTime" />
            <asp:Parameter Name="FileClosureDateSecondAppeal" Type="DateTime" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_FeeMaster" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.FeeMasterTableAdapters.FeeMasterTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter DbType="Guid" Name="Original_FeeId" />
            <asp:Parameter Name="Original_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Guid" Name="FeeId" />
            <asp:Parameter Name="Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter DbType="Guid" Name="Original_FeeId" />
            <asp:Parameter Name="Original_Name" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView>
</asp:Content>

