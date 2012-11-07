<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="PIO.aspx.cs" Inherits="LatestPages_PIO" %>

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
        var datePickers = ["ApplicationDateTextBox", "Last_Date_ReplyTextBox", "Application_Received_Actual_DateTextBox", "Recvd_DateTextBox", "Reject_DateTextBox", "FileClosureDateTextBox", "Letteer_Recvd_Date_commissionerTextBox", "AppealDateFirstAppealTextBox", "FileClosureDateFirstAppealTextBox", "AppealDateSecondAppealTextBox", "Remarks_Send_DateTextBox", "FileClosureDateSecondAppealTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
 
    
</script>
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
                            meta:resourcekey="txtFileNoResource1" ontextchanged="txtFileNo_TextChanged"></asp:TextBox></td>
                        <td align="right" style="height: 30px">
                        <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_PIO" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_PIO" 
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                              ReadOnly="True" SortExpression="SrNo" InsertVisible="False" />
                          <asp:BoundField DataField="FileNo" HeaderText="FileNo" 
                              SortExpression="FileNo" />
                          <asp:BoundField DataField="ApplicantName" HeaderText="ApplicantName" 
                              SortExpression="ApplicantName" />
                          <asp:BoundField DataField="ApplicationDate" HeaderText="ApplicationDate" 
                              SortExpression="ApplicationDate" />
                          <asp:BoundField DataField="ApplicantAddress" HeaderText="ApplicantAddress" 
                              SortExpression="ApplicantAddress" />
                          <asp:BoundField DataField="Application_Received_Actual_Date" 
                              HeaderText="Application_Received_Actual_Date" 
                              SortExpression="Application_Received_Actual_Date" />
                          <asp:CheckBoxField DataField="Appl_BPL" HeaderText="Appl_BPL" 
                              SortExpression="Appl_BPL" />
                          <asp:BoundField DataField="Sub_Info_Asked" HeaderText="Sub_Info_Asked" 
                              SortExpression="Sub_Info_Asked" />
                          <asp:BoundField DataField="Recvd_Sata_Mandal" HeaderText="Recvd_Sata_Mandal" 
                              SortExpression="Recvd_Sata_Mandal" />
                          <asp:BoundField DataField="Recvd_Date" HeaderText="Recvd_Date" 
                              SortExpression="Recvd_Date" />
                          <asp:BoundField DataField="Information" HeaderText="Information" 
                              SortExpression="Information" />
                          <asp:BoundField DataField="Recvd_Fees" HeaderText="Recvd_Fees" 
                              SortExpression="Recvd_Fees" />
                          <asp:BoundField DataField="Recvd_Fees_Mode" HeaderText="Recvd_Fees_Mode" 
                              SortExpression="Recvd_Fees_Mode" />
                          <asp:BoundField DataField="Last_Date_Reply" HeaderText="Last_Date_Reply" 
                              SortExpression="Last_Date_Reply" />
                          <asp:CheckBoxField DataField="Info_Send" HeaderText="Info_Send" 
                              SortExpression="Info_Send" />
                          <asp:BoundField DataField="Info_Pages" HeaderText="Info_Pages" 
                              SortExpression="Info_Pages" />
                          <asp:BoundField DataField="Page_Amt" HeaderText="Page_Amt" 
                              SortExpression="Page_Amt" />
                          <asp:BoundField DataField="Total_Amt" HeaderText="Total_Amt" 
                              SortExpression="Total_Amt" />
                          <asp:BoundField DataField="Reject_Date" HeaderText="Reject_Date" 
                              SortExpression="Reject_Date" />
                          <asp:BoundField DataField="Section" HeaderText="Section" 
                              SortExpression="Section" />
                          <asp:BoundField DataField="Reasons" HeaderText="Reasons" 
                              SortExpression="Reasons" />
                          <asp:BoundField DataField="FileClosureDate" HeaderText="FileClosureDate" 
                              SortExpression="FileClosureDate" />
                          <asp:BoundField DataField="Authority" HeaderText="Authority" 
                              SortExpression="Authority" />
                          <asp:BoundField DataField="AppealNoFirstAppeal" 
                              HeaderText="AppealNoFirstAppeal" SortExpression="AppealNoFirstAppeal" />
                          <asp:BoundField DataField="AppealDateFirstAppeal" 
                              HeaderText="AppealDateFirstAppeal" 
                              SortExpression="AppealDateFirstAppeal" />
                          <asp:BoundField DataField="Order_Authority" HeaderText="Order_Authority" 
                              SortExpression="Order_Authority" />
                          <asp:BoundField DataField="FileClosureDateFirstAppeal" 
                              HeaderText="FileClosureDateFirstAppeal" 
                              SortExpression="FileClosureDateFirstAppeal" />
                          <asp:BoundField DataField="Letteer_Recvd_Date_commissioner" 
                              HeaderText="Letteer_Recvd_Date_commissioner" 
                              SortExpression="Letteer_Recvd_Date_commissioner" />
                          <asp:BoundField DataField="AppealNoSecondAppeal" 
                              HeaderText="AppealNoSecondAppeal" SortExpression="AppealNoSecondAppeal" />
                          <asp:BoundField DataField="ApplicationNameSecondAppeal" 
                              HeaderText="ApplicationNameSecondAppeal" 
                              SortExpression="ApplicationNameSecondAppeal" />
                          <asp:BoundField DataField="AddressSecondAppeal" 
                              HeaderText="AddressSecondAppeal" SortExpression="AddressSecondAppeal" />
                          <asp:BoundField DataField="AppealDateSecondAppeal" 
                              HeaderText="AppealDateSecondAppeal" SortExpression="AppealDateSecondAppeal" />
                          <asp:BoundField DataField="Remarks_SentTo_Commission" 
                              HeaderText="Remarks_SentTo_Commission" 
                              SortExpression="Remarks_SentTo_Commission" />
                          <asp:BoundField DataField="Remarks_Send_Date" HeaderText="Remarks_Send_Date" 
                              SortExpression="Remarks_Send_Date" />
                          <asp:BoundField DataField="FileClosureDateSecondAppeal" 
                              HeaderText="FileClosureDateSecondAppeal" 
                              SortExpression="FileClosureDateSecondAppeal" />
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
<h1>PIO & APIO Register</h1>

    
    <asp:FormView ID="FormView_PIO" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_PIO" DefaultMode="Insert" EnableModelValidation="True" 
        oniteminserting="FormView_PIO_ItemInserting">
        <EditItemTemplate>
                  <table cellpadding="5" cellspacing="5">
        <tr>
		    <td>File No:</td>
			<td><asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                    Width="160px" /></td>
			
			<td>Information:</td>
			<td>
                <asp:RadioButtonList ID="Radio_information" runat="server" 
                    RepeatDirection="Horizontal" Width="160px">
                    <asp:ListItem Text="Partial" Value="Partial"></asp:ListItem>
                    <asp:ListItem Text="Complete" Value="Complete"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>	
            
        <tr>
		    <td>Applicant's Name:</td>
			<td><asp:TextBox ID="ApplicantNameTextBox" runat="server" 
                Text='<%# Bind("ApplicantName") %>' Width="160px" /></td>
			
			<td>Received Fees:</td>
			<td><asp:TextBox ID="Recvd_FeesTextBox" runat="server" 
                Text='<%# Bind("Recvd_Fees") %>' Width="160px" /></td>
		</tr>
            				
        <tr>
		    <td>Date Of Application:</td>
			<td><asp:TextBox ID="ApplicationDateTextBox" runat="server" 
                Text='<%# Bind("ApplicationDate") %>' Width="160px" /></td>
			
			<td>Received Fees Mode:</td>
			<td>
                <asp:DropDownList ID="Drop_recvdfessmode" runat="server" 
                    DataSourceID="ods_FeeMaster" DataTextField="Name" DataValueField="Name" 
                    Width="160px">
                </asp:DropDownList>
            </td>
		</tr>
                    
		<tr>
		    <td>Address Of Applicant:</td>
			<td><asp:TextBox ID="ApplicantAddressTextBox" runat="server" 
                Text='<%# Bind("ApplicantAddress") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
			
			<td>Last Date Of Reply/Rejection:</td>
			<td><asp:TextBox ID="Last_Date_ReplyTextBox" runat="server" 
                Text='<%# Bind("Last_Date_Reply") %>' Width="160px" /></td>		
		</tr>     
            			
        <tr>
		    <td>Actual Received Date Of Application:</td>
			<td><asp:TextBox ID="Application_Received_Actual_DateTextBox" runat="server" 
                Text='<%# Bind("Application_Received_Actual_Date") %>' Width="160px" /></td>
			
			<td>Information Send:</td>
			<td>
                <asp:RadioButtonList ID="Radio_informationsend" runat="server" 
                    RepeatDirection="Horizontal" Width="160px">
                    <asp:ListItem Text="Partial" Value="True"></asp:ListItem>
                    <asp:ListItem Text="Complete" Value="False"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>     
            		
        <tr>
		    <td>Application Is BPL:</td>
			<td>
                <asp:RadioButtonList ID="Radio_applbpl" runat="server" 
                    RepeatDirection="Horizontal" Width="160px">
                    <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
			
			<td>Information Pages:</td>
			<td><asp:TextBox ID="Info_PagesTextBox" runat="server" 
                Text='<%# Bind("Info_Pages") %>' Width="160px" /></td>
		</tr> 	            
            				
        <tr>
		    <td>Subject Of Information Asked:</td>
			<td><asp:TextBox ID="Sub_Info_AskedTextBox" runat="server" 
                Text='<%# Bind("Sub_Info_Asked") %>' Width="160px" /></td>
			
			<td>Amount Per Page:</td>
			<td><asp:TextBox ID="Page_AmtTextBox" runat="server" 
                Text='<%# Bind("Page_Amt") %>' Width="160px" /></td>
		</tr> 	           
            				
        <tr>
		    <td>Received From Other Sata-Mandal:</td>
			<td><asp:TextBox ID="Recvd_Sata_MandalTextBox" runat="server" 
                Text='<%# Bind("Recvd_Sata_Mandal") %>' Width="160px" /></td>
			
			<td>Total Amount:</td>
			<td><asp:TextBox ID="Total_AmtTextBox" runat="server" 
                Text='<%# Bind("Total_Amt") %>' Width="160px" /></td>
		</tr> 	            
            				
        <tr>
		    <td>Received Date:</td>
			<td><asp:TextBox ID="Recvd_DateTextBox" runat="server" 
                Text='<%# Bind("Recvd_Date") %>' Width="160px" /></td>
			
			<td>Rejection Date:</td>
			<td><asp:TextBox ID="Reject_DateTextBox" runat="server" 
                Text='<%# Bind("Reject_Date") %>' Width="160px" /></td>
		</tr>       
            				
        <tr>
		    <td></td>
			<td></td>
			
			<td>Under Which Section:</td>
			<td><asp:TextBox ID="SectionTextBox" runat="server" Text='<%# Bind("Section") %>' 
                    Width="160px" /></td>			
		</tr> 	          
            				
        <tr>
		    <td></td>
			<td></td>
			
			<td>Reasons:</td>
			<td><asp:TextBox ID="ReasonsTextBox" runat="server" Text='<%# Bind("Reasons") %>' 
                    Height="60px" TextMode="MultiLine" Width="160px" /></td>
		</tr>         
            				
        <tr>
		    <td></td>
			<td></td>
			
			<td>File Closure Date:</td>
			<td><asp:TextBox ID="FileClosureDateTextBox" runat="server" 
                Text='<%# Bind("FileClosureDate") %>' Width="160px" /></td>
		</tr> 	         
            				
                    <tr>
                        <td colspan="2" style="text-align: center"><h2>FIRST APPEAL</h2>
                            &nbsp;</td>
                        <td colspan="2" style="text-align: center"><h2>SECOND APPEAL</h2>
                            &nbsp;</td>
                    </tr>
            				
        <tr>
		    <td>Whether Appealed to Appellate/Authority:</td>
			<td><asp:TextBox ID="AuthorityTextBox" runat="server" 
                Text='<%# Bind("Authority") %>' Width="160px" /></td>
			
			<td>Letter Received Date from Commissioner:</td>
			<td><asp:TextBox ID="Letteer_Recvd_Date_commissionerTextBox" runat="server" 
                Text='<%# Bind("Letteer_Recvd_Date_commissioner") %>' Width="160px" /></td>
		</tr> 	         
            				
        <tr>
		   <td>Appeal No:</td>
		   <td><asp:TextBox ID="AppealNoFirstAppealTextBox" runat="server" 
                Text='<%# Bind("AppealNoFirstAppeal") %>' Width="160px" /></td>
		   
		   <td>Appeal No:</td>
		   <td><asp:TextBox ID="AppealNoSecondAppealTextBox" runat="server" 
                Text='<%# Bind("AppealNoSecondAppeal") %>' Width="160px" /></td>
		</tr>          
            				
        <tr>
		    <td>Appeal Date:</td>
			<td><asp:TextBox ID="AppealDateFirstAppealTextBox" runat="server" 
                Text='<%# Bind("AppealDateFirstAppeal") %>' Width="160px" /></td>
			
			<td>Application Name:</td>
			<td><asp:TextBox ID="ApplicationNameSecondAppealTextBox" runat="server" 
                Text='<%# Bind("ApplicationNameSecondAppeal") %>' Width="160px" /></td>			
		</tr>         
            				
        <tr>
		    <td>Order Number Passed By Appellate/Authority:</td>
		    <td><asp:TextBox ID="Order_AuthorityTextBox" runat="server" 
                Text='<%# Bind("Order_Authority") %>' Width="160px" /></td>
			
			<td>Address:</td>
			<td><asp:TextBox ID="AddressSecondAppealTextBox" runat="server" 
                Text='<%# Bind("AddressSecondAppeal") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
		</tr>          
            			
        <tr>
		    <td>File Closure Date:</td>
			<td><asp:TextBox ID="FileClosureDateFirstAppealTextBox" runat="server" 
                Text='<%# Bind("FileClosureDateFirstAppeal") %>' Width="160px" /></td>
				
			<td>Appeal Date:</td>
			<td><asp:TextBox ID="AppealDateSecondAppealTextBox" runat="server" 
                Text='<%# Bind("AppealDateSecondAppeal") %>' Width="160px" /></td>
		</tr>         
            				
        <tr>
		    <td></td>
			<td></td>
			
			<td>Remarks Sent To Commission:</td>
			<td><asp:TextBox ID="Remarks_SentTo_CommissionTextBox" runat="server" 
                Text='<%# Bind("Remarks_SentTo_Commission") %>' Height="60px" 
                    TextMode="MultiLine" Width="160px" /></td>
		</tr>         
           				
        <tr>
		    <td></td>
			<td></td>
			
			<td>Remarks Send Date:</td>
			<td><asp:TextBox ID="Remarks_Send_DateTextBox" runat="server" 
                Text='<%# Bind("Remarks_Send_Date") %>' Width="160px" /></td>
		</tr>        
			
        <tr>
		    <td></td>
			<td></td>
			
			<td>File Closure Date:</td>
			<td><asp:TextBox ID="FileClosureDateSecondAppealTextBox" runat="server" 
                Text='<%# Bind("FileClosureDateSecondAppeal") %>' Width="160px" /></td>
		</tr> 	
		
        <tr>
		    <td align="center" colspan=5>
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" CssClass="standardButton" />
			&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="Reset" Text="Reset" 
                    CssClass="standardButton" />	
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" /></td>			
		</tr>           
	</table>			
        </EditItemTemplate>
        <InsertItemTemplate>
                <table cellpadding="5" cellspacing="5" width="100%">
        <tr>
		    <td>File No:</td>
			<td><asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' 
                    Width="160px" /></td>
			
			<td>Information:</td>
			<td>
                <asp:RadioButtonList ID="Radio_information" runat="server" 
                    RepeatDirection="Horizontal" Width="160px">
                    <asp:ListItem Text="Partial" Value="Partial"></asp:ListItem>
                    <asp:ListItem Text="Complete" Value="Complete"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>	
            
        <tr>
		    <td>Applicant's Name:</td>
			<td><asp:TextBox ID="ApplicantNameTextBox" runat="server" 
                Text='<%# Bind("ApplicantName") %>' Width="160px" /></td>
			
			<td>Received Fees:</td>
			<td><asp:TextBox ID="Recvd_FeesTextBox" runat="server" 
                Text='<%# Bind("Recvd_Fees") %>' Width="160px" /></td>
		</tr>
            				
        <tr>
		    <td>Date Of Application:</td>
			<td><asp:TextBox ID="ApplicationDateTextBox" runat="server" 
                Text='<%# Bind("ApplicationDate") %>' Width="160px" /></td>
			
			<td>Received Fees Mode:</td>
			<td>
                <asp:DropDownList ID="Drop_recvdfessmode" runat="server" 
                    DataSourceID="ods_FeeMaster" DataTextField="Name" DataValueField="Name" 
                    Width="160px">
                </asp:DropDownList>
            </td>
		</tr>
                    
		<tr>
		    <td>Address Of Applicant:</td>
			<td><asp:TextBox ID="ApplicantAddressTextBox" runat="server" 
                Text='<%# Bind("ApplicantAddress") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
			
			<td>Last Date Of Reply/Rejection:</td>
			<td><asp:TextBox ID="Last_Date_ReplyTextBox" runat="server" 
                Text='<%# Bind("Last_Date_Reply") %>' Width="160px" /></td>		
		</tr>     
            			
        <tr>
		    <td>Actual Received Date Of Application:</td>
			<td><asp:TextBox ID="Application_Received_Actual_DateTextBox" runat="server" 
                Text='<%# Bind("Application_Received_Actual_Date") %>' Width="160px" /></td>
			
			<td>Information Send:</td>
			<td>
                <asp:RadioButtonList ID="Radio_informationsend" runat="server" 
                    RepeatDirection="Horizontal" Width="160px">
                    <asp:ListItem Text="Partial" Value="True"></asp:ListItem>
                    <asp:ListItem Text="Complete" Value="False"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>     
            		
        <tr>
		    <td>Application Is BPL:</td>
			<td>
                <asp:RadioButtonList ID="Radio_applbpl" runat="server" 
                    RepeatDirection="Horizontal" Width="160px">
                    <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
			
			<td>Information Pages:</td>
			<td><asp:TextBox ID="Info_PagesTextBox" runat="server" 
                Text='<%# Bind("Info_Pages") %>' Width="160px" /></td>
		</tr> 	            
            				
        <tr>
		    <td>Subject Of Information Asked:</td>
			<td><asp:TextBox ID="Sub_Info_AskedTextBox" runat="server" 
                Text='<%# Bind("Sub_Info_Asked") %>' Width="160px" /></td>
			
			<td>Amount Per Page:</td>
			<td><asp:TextBox ID="Page_AmtTextBox" runat="server" 
                Text='<%# Bind("Page_Amt") %>' Width="160px" /></td>
		</tr> 	           
            				
        <tr>
		    <td>Received From Other Sata-Mandal:</td>
			<td><asp:TextBox ID="Recvd_Sata_MandalTextBox" runat="server" 
                Text='<%# Bind("Recvd_Sata_Mandal") %>' Width="160px" /></td>
			
			<td>Total Amount:</td>
			<td><asp:TextBox ID="Total_AmtTextBox" runat="server" 
                Text='<%# Bind("Total_Amt") %>' Width="160px" /></td>
		</tr> 	            
            				
        <tr>
		    <td>Received Date:</td>
			<td><asp:TextBox ID="Recvd_DateTextBox" runat="server" 
                Text='<%# Bind("Recvd_Date") %>' Width="160px" /></td>
			
			<td>Rejection Date:</td>
			<td><asp:TextBox ID="Reject_DateTextBox" runat="server" 
                Text='<%# Bind("Reject_Date") %>' Width="160px" /></td>
		</tr>       
            				
        <tr>
		    <td></td>
			<td></td>
			
			<td>Under Which Section:</td>
			<td><asp:TextBox ID="SectionTextBox" runat="server" Text='<%# Bind("Section") %>' 
                    Width="160px" /></td>			
		</tr> 	          
            				
        <tr>
		    <td></td>
			<td></td>
			
			<td>Reasons:</td>
			<td><asp:TextBox ID="ReasonsTextBox" runat="server" Text='<%# Bind("Reasons") %>' 
                    Height="60px" TextMode="MultiLine" Width="160px" /></td>
		</tr>         
            				
        <tr>
		    <td></td>
			<td></td>
			
			<td>File Closure Date:</td>
			<td><asp:TextBox ID="FileClosureDateTextBox" runat="server" 
                Text='<%# Bind("FileClosureDate") %>' Width="160px" /></td>
		</tr> 	         
            				
                    <tr>
                        <td colspan="2" style="text-align: center"><h2>FIRST APPEAL</h2>
                            &nbsp;</td>
                        <td colspan="2" style="text-align: center"><h2>SECOND APPEAL</h2>
                            &nbsp;</td>
                    </tr>
            				
        <tr>
		    <td>Whether Appealed to Appellate/Authority:</td>
			<td><asp:TextBox ID="AuthorityTextBox" runat="server" 
                Text='<%# Bind("Authority") %>' Width="160px" /></td>
			
			<td>Letter Received Date from Commissioner:</td>
			<td><asp:TextBox ID="Letteer_Recvd_Date_commissionerTextBox" runat="server" 
                Text='<%# Bind("Letteer_Recvd_Date_commissioner") %>' Width="160px" /></td>
		</tr> 	         
            				
        <tr>
		   <td>Appeal No:</td>
		   <td><asp:TextBox ID="AppealNoFirstAppealTextBox" runat="server" 
                Text='<%# Bind("AppealNoFirstAppeal") %>' Width="160px" /></td>
		   
		   <td>Appeal No:</td>
		   <td><asp:TextBox ID="AppealNoSecondAppealTextBox" runat="server" 
                Text='<%# Bind("AppealNoSecondAppeal") %>' Width="160px" /></td>
		</tr>          
            				
        <tr>
		    <td>Appeal Date:</td>
			<td><asp:TextBox ID="AppealDateFirstAppealTextBox" runat="server" 
                Text='<%# Bind("AppealDateFirstAppeal") %>' Width="160px" /></td>
			
			<td>Application Name:</td>
			<td><asp:TextBox ID="ApplicationNameSecondAppealTextBox" runat="server" 
                Text='<%# Bind("ApplicationNameSecondAppeal") %>' Width="160px" /></td>			
		</tr>         
            				
        <tr>
		    <td>Order Number Passed By Appellate/Authority:</td>
		    <td><asp:TextBox ID="Order_AuthorityTextBox" runat="server" 
                Text='<%# Bind("Order_Authority") %>' Width="160px" /></td>
			
			<td>Address:</td>
			<td><asp:TextBox ID="AddressSecondAppealTextBox" runat="server" 
                Text='<%# Bind("AddressSecondAppeal") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
		</tr>          
            			
        <tr>
		    <td>File Closure Date:</td>
			<td><asp:TextBox ID="FileClosureDateFirstAppealTextBox" runat="server" 
                Text='<%# Bind("FileClosureDateFirstAppeal") %>' Width="160px" /></td>
				
			<td>Appeal Date:</td>
			<td><asp:TextBox ID="AppealDateSecondAppealTextBox" runat="server" 
                Text='<%# Bind("AppealDateSecondAppeal") %>' Width="160px" /></td>
		</tr>         
            				
        <tr>
		    <td></td>
			<td></td>
			
			<td>Remarks Sent To Commission:</td>
			<td><asp:TextBox ID="Remarks_SentTo_CommissionTextBox" runat="server" 
                Text='<%# Bind("Remarks_SentTo_Commission") %>' Height="60px" 
                    TextMode="MultiLine" Width="160px" /></td>
		</tr>         
           				
        <tr>
		    <td></td>
			<td></td>
			
			<td>Remarks Send Date:</td>
			<td><asp:TextBox ID="Remarks_Send_DateTextBox" runat="server" 
                Text='<%# Bind("Remarks_Send_Date") %>' Width="160px" /></td>
		</tr>        
			
        <tr>
		    <td></td>
			<td></td>
			
			<td>File Closure Date:</td>
			<td><asp:TextBox ID="FileClosureDateSecondAppealTextBox" runat="server" 
                Text='<%# Bind("FileClosureDateSecondAppeal") %>' Width="160px" /></td>
		</tr> 	
		
        <tr >
		    <td align="center" colspan="4">
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" CssClass="standardButton" />
			&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="Reset" Text="Reset" 
                    CssClass="standardButton" />	
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
    
    <asp:ObjectDataSource ID="ods_PIO" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.PIOTableAdapters.PIO1TableAdapter" 
        UpdateMethod="Update" onselecting="ods_PIO_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_ApplicantName" Type="String" />
            <asp:Parameter Name="Original_ApplicationDate" Type="DateTime" />
            <asp:Parameter Name="Original_Application_Received_Actual_Date" 
                Type="DateTime" />
            <asp:Parameter Name="Original_Appl_BPL" Type="Boolean" />
            <asp:Parameter Name="Original_Sub_Info_Asked" Type="String" />
            <asp:Parameter Name="Original_Recvd_Sata_Mandal" Type="String" />
            <asp:Parameter Name="Original_Recvd_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Information" Type="String" />
            <asp:Parameter Name="Original_Recvd_Fees" Type="Decimal" />
            <asp:Parameter Name="Original_Recvd_Fees_Mode" Type="String" />
            <asp:Parameter Name="Original_Last_Date_Reply" Type="DateTime" />
            <asp:Parameter Name="Original_Info_Send" Type="Boolean" />
            <asp:Parameter Name="Original_Info_Pages" Type="Int32" />
            <asp:Parameter Name="Original_Page_Amt" Type="Decimal" />
            <asp:Parameter Name="Original_Total_Amt" Type="Decimal" />
            <asp:Parameter Name="Original_Reject_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Section" Type="String" />
            <asp:Parameter Name="Original_FileClosureDate" Type="DateTime" />
            <asp:Parameter Name="Original_Authority" Type="String" />
            <asp:Parameter Name="Original_AppealNoFirstAppeal" Type="Int32" />
            <asp:Parameter Name="Original_AppealDateFirstAppeal" Type="DateTime" />
            <asp:Parameter Name="Original_Order_Authority" Type="Int32" />
            <asp:Parameter Name="Original_FileClosureDateFirstAppeal" Type="DateTime" />
            <asp:Parameter Name="Original_Letteer_Recvd_Date_commissioner" 
                Type="DateTime" />
            <asp:Parameter Name="Original_AppealNoSecondAppeal" Type="Int32" />
            <asp:Parameter Name="Original_ApplicationNameSecondAppeal" Type="String" />
            <asp:Parameter Name="Original_AppealDateSecondAppeal" Type="DateTime" />
            <asp:Parameter Name="Original_Remarks_SentTo_Commission" Type="String" />
            <asp:Parameter Name="Original_Remarks_Send_Date" Type="DateTime" />
            <asp:Parameter Name="Original_FileClosureDateSecondAppeal" Type="DateTime" />
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
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_ApplicantName" Type="String" />
            <asp:Parameter Name="Original_ApplicationDate" Type="DateTime" />
            <asp:Parameter Name="Original_Application_Received_Actual_Date" 
                Type="DateTime" />
            <asp:Parameter Name="Original_Appl_BPL" Type="Boolean" />
            <asp:Parameter Name="Original_Sub_Info_Asked" Type="String" />
            <asp:Parameter Name="Original_Recvd_Sata_Mandal" Type="String" />
            <asp:Parameter Name="Original_Recvd_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Information" Type="String" />
            <asp:Parameter Name="Original_Recvd_Fees" Type="Decimal" />
            <asp:Parameter Name="Original_Recvd_Fees_Mode" Type="String" />
            <asp:Parameter Name="Original_Last_Date_Reply" Type="DateTime" />
            <asp:Parameter Name="Original_Info_Send" Type="Boolean" />
            <asp:Parameter Name="Original_Info_Pages" Type="Int32" />
            <asp:Parameter Name="Original_Page_Amt" Type="Decimal" />
            <asp:Parameter Name="Original_Total_Amt" Type="Decimal" />
            <asp:Parameter Name="Original_Reject_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Section" Type="String" />
            <asp:Parameter Name="Original_FileClosureDate" Type="DateTime" />
            <asp:Parameter Name="Original_Authority" Type="String" />
            <asp:Parameter Name="Original_AppealNoFirstAppeal" Type="Int32" />
            <asp:Parameter Name="Original_AppealDateFirstAppeal" Type="DateTime" />
            <asp:Parameter Name="Original_Order_Authority" Type="Int32" />
            <asp:Parameter Name="Original_FileClosureDateFirstAppeal" Type="DateTime" />
            <asp:Parameter Name="Original_Letteer_Recvd_Date_commissioner" 
                Type="DateTime" />
            <asp:Parameter Name="Original_AppealNoSecondAppeal" Type="Int32" />
            <asp:Parameter Name="Original_ApplicationNameSecondAppeal" Type="String" />
            <asp:Parameter Name="Original_AppealDateSecondAppeal" Type="DateTime" />
            <asp:Parameter Name="Original_Remarks_SentTo_Commission" Type="String" />
            <asp:Parameter Name="Original_Remarks_Send_Date" Type="DateTime" />
            <asp:Parameter Name="Original_FileClosureDateSecondAppeal" Type="DateTime" />
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

