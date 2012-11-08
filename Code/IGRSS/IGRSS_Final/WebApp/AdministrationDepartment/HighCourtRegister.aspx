<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="HighCourtRegister.aspx.cs" Inherits="LatestPages_HighCourtRegister" %>

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
        var datePickers = ["ParawiseremarksdateTextBox", "AffidavitdateTextBox", "DisposalDateTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
     });
 
    
</script>


<asp:MultiView ID="Multiview_HighCourtReg" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<hr /><br />
<h1>High Court Register</h1>
<table>
          <tr>
                    <td align="right" style="width:641px;" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" >
                        <asp:TextBox Width="160" ID="txtFileNo" runat="server" 
                            meta:resourcekey="txtFileNoResource1" ontextchanged="txtFileNo_TextChanged"></asp:TextBox></td>
                        <td align="right">
                        <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_HighCourtReg" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_HighCourtReg" 
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="Fileno" HeaderText="File No" 
                              SortExpression="Fileno" />
                          <asp:BoundField DataField="SpecialCivilApplNo" 
                              HeaderText="Special Civil Application No" SortExpression="SpecialCivilApplNo" />
                          <asp:BoundField DataField="DistrictOfficeName" HeaderText="DistrictOfficeName" 
                              SortExpression="DistrictOfficeName" Visible="False" />
                          <asp:BoundField DataField="PetitionerName" HeaderText="Petitioner Name" 
                              SortExpression="PetitionerName" />
                          <asp:BoundField DataField="PetitionReason" HeaderText="PetitionReason" 
                              SortExpression="PetitionReason" Visible="False" />
                          <asp:CheckBoxField DataField="Parawiseremarks" HeaderText="Parawiseremarks" 
                              SortExpression="Parawiseremarks" Visible="False" />
                          <asp:BoundField DataField="Parawiseremarksdate" 
                              HeaderText="Parawise Remarks Sent Date" SortExpression="Parawiseremarksdate" />
                          <asp:CheckBoxField DataField="Affidavit" HeaderText="Affidavit" 
                              SortExpression="Affidavit" Visible="False" />
                          <asp:BoundField DataField="Affidavitdate" HeaderText="Affidavit Date" 
                              SortExpression="Affidavitdate" />
                          <asp:BoundField DataField="LatestStatus" HeaderText="Latest Status" 
                              SortExpression="LatestStatus" />
                          <asp:BoundField DataField="PetitionDispoasedYear" 
                              HeaderText="Petition Disposed Year" SortExpression="PetitionDispoasedYear" />
                          <asp:BoundField DataField="DisposalDate" HeaderText="Disposal Date" 
                              SortExpression="DisposalDate" Visible="False" />
                          <asp:BoundField DataField="OrderJudgementSheet" 
                              HeaderText="OrderJudgementSheet" SortExpression="OrderJudgementSheet" 
                              Visible="False" />
                          <asp:BoundField DataField="JudgementDetail" HeaderText="JudgementDetail" 
                              SortExpression="JudgementDetail" Visible="False" />
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
<h1>High Court Register</h1>
<asp:FormView ID="FormView_HighCourtReg" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_HighCourtReg" EnableModelValidation="True" DefaultMode="Insert" 
         oniteminserting="FormView_HighCourtReg_ItemInserting" 
        onitemcommand="FormView_HighCourtReg_ItemCommand">
        <EditItemTemplate>
                    <table>
		   <%-- <tr><td>SrNo:</td>
			    <td><asp:TextBox ID="SrNoTextBox" runat="server" Text='<%# Bind("SrNo") %>' /></td>
				
				<td></td>				
				
				<td></td>
				<td></td>
			</tr>	   --%>
               
            <tr><td>File No:</td>
			    <td><asp:TextBox ID="FilenoTextBox" runat="server" Text='<%# Bind("Fileno") %>' 
                        Width="160px" /></td>
				
				<td></td>
				
				<td>Parawise Remarks Sent Or Not:</td>
				<td>
                    <asp:RadioButtonList ID="Radio_parawisermrksent" runat="server" 
                        RepeatDirection="Horizontal" Width="160px">
                        <asp:ListItem Text="Sent" Value="True"></asp:ListItem>
                        <asp:ListItem Text="Not Sent" Value="False"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
			</tr>             
               
            <tr><td>Special Civil Application No:</td>
			    <td><asp:TextBox ID="SpecialCivilApplNoTextBox" runat="server" 
                   Text='<%# Bind("SpecialCivilApplNo") %>' Width="160px" /></td>
				
				<td></td>   
				
				<td>If Yes Parawise Remarks Sent date:</td>
				<td><asp:TextBox ID="ParawiseremarksdateTextBox" runat="server" 
                   Text='<%# Bind("Parawiseremarksdate") %>' Width="160px" /></td>
			</tr>            
               
            <tr><td>Name Of District Office:</td>
			    <td>
                    <asp:DropDownList ID="Drop_officename" runat="server" 
                        DataSourceID="ods_offices" DataTextField="OfficeName" 
                        DataValueField="OfficeName" Width="160px">
                    </asp:DropDownList>
                </td>
				
				<td></td>
				
				<td>Affidavit Sent Or Not:</td>
				<td>
                    <asp:RadioButtonList ID="Radio_affidavit" runat="server" 
                        RepeatDirection="Horizontal" Width="160px">
                        <asp:ListItem Text="Sent" Value="True"></asp:ListItem>
                        <asp:ListItem Text="Not Sent" Value="False"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
			</tr>             
               
            <tr><td>Petitioner Name:</td>
			    <td><asp:TextBox ID="PetitionerNameTextBox" runat="server" 
                   Text='<%# Bind("PetitionerName") %>' Width="160px" /></td>
				
				<td></td>
				
				<td>Affidavit Date:</td>
				<td><asp:TextBox ID="AffidavitdateTextBox" runat="server" 
                   Text='<%# Bind("Affidavitdate") %>' Width="160px" /></td>
			</tr>             
               
            <tr><td>Reason Of Petition:</td>
			    <td><asp:TextBox ID="PetitionReasonTextBox" runat="server" 
                   Text='<%# Bind("PetitionReason") %>' Height="60px" TextMode="MultiLine" 
                        Width="160px" /></td>
				
				<td></td>
				
				<td>Latest Status:</td>
				<td><asp:TextBox ID="LatestStatusTextBox" runat="server" 
                   Text='<%# Bind("LatestStatus") %>' Width="160px" /></td>
			</tr>            
               
            <tr><td></td>
			    <td></td>
				
				<td></td>
				
				<td> Petition Disposed Year:</td>
				<td><asp:TextBox ID="PetitionDispoasedYearTextBox" runat="server" 
                   Text='<%# Bind("PetitionDispoasedYear") %>' Width="160px" /></td>
			</tr>
               
            <tr><td></td>
			    <td></td>
				
				<td></td>
				
				<td>Disposal Date:</td>
				<td><asp:TextBox ID="DisposalDateTextBox" runat="server" 
                   Text='<%# Bind("DisposalDate") %>' Width="160px" /></td>
			</tr>
			
            <tr><td></td>
			    <td></td>
				
				<td></td>
				
				<td>Order Judgement Sheet:</td>
				<td><asp:TextBox ID="OrderJudgementSheetTextBox" runat="server" 
                   Text='<%# Bind("OrderJudgementSheet") %>' Width="160px" /></td>
			</tr>
              
            <tr><td></td>
			    <td></td>
				
				<td></td>
				
				<td>Judgement Detail:</td>
				<td><asp:TextBox ID="JudgementDetailTextBox" runat="server" 
                   Text='<%# Bind("JudgementDetail") %>' Height="60px" TextMode="MultiLine" 
                        Width="160px" /></td>
			</tr>              
                      
            <tr><td colspan=5 align="center">
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
                       <table>
		  <%--  <tr><td>SrNo:</td>
			    <td><asp:TextBox ID="SrNoTextBox" runat="server" Text='<%# Bind("SrNo") %>' /></td>
				
				<td></td>				
				
				<td></td>
				<td></td>
			</tr>	   --%>
               
            <tr><td>File No:</td>
			    <td><asp:TextBox ID="FilenoTextBox" runat="server" Text='<%# Bind("Fileno") %>' 
                        Width="160px" /></td>
				
				<td></td>
				
				<td>Parawise Remarks:</td>
				<td>
                    <asp:RadioButtonList ID="Radio_parawisermrksent" runat="server" 
                        RepeatDirection="Horizontal" Width="160px">
                        <asp:ListItem Text="Sent" Value="True"></asp:ListItem>
                        <asp:ListItem Text="Not Sent" Value="False"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
			</tr>             
               
            <tr><td>Special Civil Application No:</td>
			    <td><asp:TextBox ID="SpecialCivilApplNoTextBox" runat="server" 
                   Text='<%# Bind("SpecialCivilApplNo") %>' Width="160px" /></td>
				
				<td></td>   
				
				<td>If Yes Parawise Remarks Sent date:</td>
				<td><asp:TextBox ID="ParawiseremarksdateTextBox" runat="server" 
                   Text='<%# Bind("Parawiseremarksdate") %>' Width="160px" /></td>
			</tr>            
               
            <tr><td>Name Of District Office:</td>
			    <td>
                    <asp:DropDownList ID="Drop_officename" runat="server" 
                        DataSourceID="ods_offices" DataTextField="OfficeName" 
                        DataValueField="OfficeName" Width="160px">
                    </asp:DropDownList>
                </td>
				
				<td></td>
				
				<td>Affidavit Sent Or Not:</td>
				<td>
                    <asp:RadioButtonList ID="Radio_affidavit" runat="server" 
                        RepeatDirection="Horizontal" Width="160px">
                     <asp:ListItem Text="Sent" Value="True"></asp:ListItem>
                        <asp:ListItem Text="Not Sent" Value="False"></asp:ListItem>
                    </asp:RadioButtonList>
                </td>
			</tr>             
               
            <tr><td>Petitioner Name:</td>
			    <td><asp:TextBox ID="PetitionerNameTextBox" runat="server" 
                   Text='<%# Bind("PetitionerName") %>' Width="160px" /></td>
				
				<td></td>
				
				<td>Affidavit Date:</td>
				<td><asp:TextBox ID="AffidavitdateTextBox" runat="server" 
                   Text='<%# Bind("Affidavitdate") %>' Width="160px" /></td>
			</tr>             
               
            <tr><td>Reason Of Petition:</td>
			    <td><asp:TextBox ID="PetitionReasonTextBox" runat="server" 
                   Text='<%# Bind("PetitionReason") %>' Height="60px" TextMode="MultiLine" 
                        Width="160px" /></td>
				
				<td></td>
				
				<td>Latest Status:</td>
				<td><asp:TextBox ID="LatestStatusTextBox" runat="server" 
                   Text='<%# Bind("LatestStatus") %>' Width="160px" /></td>
			</tr>            
               
            <tr><td></td>
			    <td></td>
				
				<td></td>
				
				<td> Petition Disposed Year:</td>
				<td><asp:TextBox ID="PetitionDispoasedYearTextBox" runat="server" 
                   Text='<%# Bind("PetitionDispoasedYear") %>' Width="160px" /></td>
			</tr>
               
            <tr><td></td>
			    <td></td>
				
				<td></td>
				
				<td>Disposal Date:</td>
				<td><asp:TextBox ID="DisposalDateTextBox" runat="server" 
                   Text='<%# Bind("DisposalDate") %>' Width="160px" /></td>
			</tr>
			
            <tr><td></td>
			    <td></td>
				
				<td></td>
				
				<td>Order Judgement Sheet:</td>
				<td><asp:TextBox ID="OrderJudgementSheetTextBox" runat="server" 
                   Text='<%# Bind("OrderJudgementSheet") %>' Width="160px" /></td>
			</tr>
              
            <tr><td></td>
			    <td></td>
				
				<td></td>
				
				<td>Judgement Detail:</td>
				<td><asp:TextBox ID="JudgementDetailTextBox" runat="server" 
                   Text='<%# Bind("JudgementDetail") %>' Height="60px" TextMode="MultiLine" 
                        Width="160px" /></td>
			</tr>              
                      
            <tr><td colspan=5 align="center">
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                   CommandName="Insert" Text="Insert" CssClass="standardButton" />
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
               
               
               
      			
            
											
                
            
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            Fileno:
            <asp:Label ID="FilenoLabel" runat="server" 
                Text='<%# Bind("Fileno") %>' />
            <br />
            SpecialCivilApplNo:
            <asp:Label ID="SpecialCivilApplNoLabel" runat="server" 
                Text='<%# Bind("SpecialCivilApplNo") %>' />
            <br />
            DistrictOfficeName:
            <asp:Label ID="DistrictOfficeNameLabel" runat="server" 
                Text='<%# Bind("DistrictOfficeName") %>' />
            <br />
            PetitionerName:
            <asp:Label ID="PetitionerNameLabel" runat="server" 
                Text='<%# Bind("PetitionerName") %>' />
            <br />
            PetitionReason:
            <asp:Label ID="PetitionReasonLabel" runat="server" 
                Text='<%# Bind("PetitionReason") %>' />
            <br />
            Parawiseremarks:
            <asp:CheckBox ID="ParawiseremarksCheckBox" runat="server" 
                Checked='<%# Bind("Parawiseremarks") %>' Enabled="false" />
            <br />
            Parawiseremarksdate:
            <asp:Label ID="ParawiseremarksdateLabel" runat="server" 
                Text='<%# Bind("Parawiseremarksdate") %>' />
            <br />
            Affidavit:
            <asp:CheckBox ID="AffidavitCheckBox" runat="server" 
                Checked='<%# Bind("Affidavit") %>' Enabled="false" />
            <br />
            Affidavitdate:
            <asp:Label ID="AffidavitdateLabel" runat="server" 
                Text='<%# Bind("Affidavitdate") %>' />
            <br />
            LatestStatus:
            <asp:Label ID="LatestStatusLabel" runat="server" 
                Text='<%# Bind("LatestStatus") %>' />
            <br />
            PetitionDispoasedYear:
            <asp:Label ID="PetitionDispoasedYearLabel" runat="server" 
                Text='<%# Bind("PetitionDispoasedYear") %>' />
            <br />
            DisposalDate:
            <asp:Label ID="DisposalDateLabel" runat="server" 
                Text='<%# Bind("DisposalDate") %>' />
            <br />
            OrderJudgementSheet:
            <asp:Label ID="OrderJudgementSheetLabel" runat="server" 
                Text='<%# Bind("OrderJudgementSheet") %>' />
            <br />
            JudgementDetail:
            <asp:Label ID="JudgementDetailLabel" runat="server" 
                Text='<%# Bind("JudgementDetail") %>' />
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
    
    <asp:ObjectDataSource ID="ods_HighCourtReg" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.HighCourtRegTableAdapters.HighcourtRegTableAdapter" 
        UpdateMethod="Update" onselecting="ods_HighCourtReg_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Original_OrderJudgementSheet" Type="String" />
            <asp:Parameter Name="Original_DisposalDate" Type="DateTime" />
            <asp:Parameter Name="Original_PetitionDispoasedYear" Type="Int32" />
            <asp:Parameter Name="Original_LatestStatus" Type="String" />
            <asp:Parameter Name="Original_Affidavitdate" Type="DateTime" />
            <asp:Parameter Name="Original_Affidavit" Type="Boolean" />
            <asp:Parameter Name="Original_Parawiseremarksdate" Type="DateTime" />
            <asp:Parameter Name="Original_Parawiseremarks" Type="Boolean" />
            <asp:Parameter Name="Original_PetitionerName" Type="String" />
            <asp:Parameter Name="Original_DistrictOfficeName" Type="String" />
            <asp:Parameter Name="Original_SpecialCivilApplNo" Type="Int32" />
            <asp:Parameter Name="Original_Fileno" Type="Int32" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="JudgementDetail" Type="String" />
            <asp:Parameter Name="OrderJudgementSheet" Type="String" />
            <asp:Parameter Name="DisposalDate" Type="DateTime" />
            <asp:Parameter Name="PetitionDispoasedYear" Type="Int32" />
            <asp:Parameter Name="LatestStatus" Type="String" />
            <asp:Parameter Name="Affidavitdate" Type="DateTime" />
            <asp:Parameter Name="Affidavit" Type="Boolean" />
            <asp:Parameter Name="Parawiseremarksdate" Type="DateTime" />
            <asp:Parameter Name="Parawiseremarks" Type="Boolean" />
            <asp:Parameter Name="PetitionReason" Type="String" />
            <asp:Parameter Name="PetitionerName" Type="String" />
            <asp:Parameter Name="DistrictOfficeName" Type="String" />
            <asp:Parameter Name="SpecialCivilApplNo" Type="Int32" />
            <asp:Parameter Name="Fileno" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="JudgementDetail" Type="String" />
            <asp:Parameter Name="OrderJudgementSheet" Type="String" />
            <asp:Parameter Name="DisposalDate" Type="DateTime" />
            <asp:Parameter Name="PetitionDispoasedYear" Type="Int32" />
            <asp:Parameter Name="LatestStatus" Type="String" />
            <asp:Parameter Name="Affidavitdate" Type="DateTime" />
            <asp:Parameter Name="Affidavit" Type="Boolean" />
            <asp:Parameter Name="Parawiseremarksdate" Type="DateTime" />
            <asp:Parameter Name="Parawiseremarks" Type="Boolean" />
            <asp:Parameter Name="PetitionReason" Type="String" />
            <asp:Parameter Name="PetitionerName" Type="String" />
            <asp:Parameter Name="DistrictOfficeName" Type="String" />
            <asp:Parameter Name="SpecialCivilApplNo" Type="Int32" />
            <asp:Parameter Name="Fileno" Type="Int32" />
            <asp:Parameter Name="Original_OrderJudgementSheet" Type="String" />
            <asp:Parameter Name="Original_DisposalDate" Type="DateTime" />
            <asp:Parameter Name="Original_PetitionDispoasedYear" Type="Int32" />
            <asp:Parameter Name="Original_LatestStatus" Type="String" />
            <asp:Parameter Name="Original_Affidavitdate" Type="DateTime" />
            <asp:Parameter Name="Original_Affidavit" Type="Boolean" />
            <asp:Parameter Name="Original_Parawiseremarksdate" Type="DateTime" />
            <asp:Parameter Name="Original_Parawiseremarks" Type="Boolean" />
            <asp:Parameter Name="Original_PetitionerName" Type="String" />
            <asp:Parameter Name="Original_DistrictOfficeName" Type="String" />
            <asp:Parameter Name="Original_SpecialCivilApplNo" Type="Int32" />
            <asp:Parameter Name="Original_Fileno" Type="Int32" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_offices" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.officenameTableAdapters.OfficesTableAdapter" 
        UpdateMethod="Update">
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

