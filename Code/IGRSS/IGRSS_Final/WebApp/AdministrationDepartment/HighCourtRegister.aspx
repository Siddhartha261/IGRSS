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
<br />
<br />
<center>
<asp:Panel id="infoDiv" runat="server" Visible="false" CssClass="infoBar" >&nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
<hr /><br />
</center>


<asp:MultiView ID="Multiview_HighCourtReg" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<hr /><br />
<h1>High Court Register</h1>
<table>
          <tr>
                    <td align="right" width="80%" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" >
                        <asp:TextBox Width="160" ID="txtFileNo" runat="server" 
                            meta:resourcekey="txtFileNoResource1" ></asp:TextBox></td>
                        <td align="right">
                        <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_HighCourtReg" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_HighCourtReg" 
                      EnableModelValidation="True" 
                      onrowdeleted="GridView_HighCourtReg_RowDeleted" 
                      onrowdeleting="GridView_HighCourtReg_RowDeleting" 
                      onrowediting="GridView_HighCourtReg_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                              ReadOnly="True" SortExpression="SrNo" InsertVisible="False" />
                          <asp:BoundField DataField="Fileno" HeaderText="Fileno" 
                              SortExpression="Fileno" />
                          <asp:BoundField DataField="SpecialCivilApplNo" 
                              HeaderText="SpecialCivilApplNo" SortExpression="SpecialCivilApplNo" />
                          <asp:BoundField DataField="DistrictOfficeName" HeaderText="DistrictOfficeName" 
                              SortExpression="DistrictOfficeName" />
                          <asp:BoundField DataField="PetitionerName" HeaderText="PetitionerName" 
                              SortExpression="PetitionerName" />
                          <asp:BoundField DataField="PetitionReason" HeaderText="PetitionReason" 
                              SortExpression="PetitionReason" />
                          <asp:CheckBoxField DataField="Parawiseremarks" HeaderText="Parawiseremarks" 
                              SortExpression="Parawiseremarks" />
                          <asp:BoundField DataField="Parawiseremarksdate" 
                              HeaderText="Parawiseremarksdate" SortExpression="Parawiseremarksdate" />
                          <asp:CheckBoxField DataField="Affidavit" HeaderText="Affidavit" 
                              SortExpression="Affidavit" />
                          <asp:BoundField DataField="Affidavitdate" HeaderText="Affidavitdate" 
                              SortExpression="Affidavitdate" />
                          <asp:BoundField DataField="LatestStatus" HeaderText="LatestStatus" 
                              SortExpression="LatestStatus" />
                          <asp:BoundField DataField="PetitionDispoasedYear" 
                              HeaderText="PetitionDispoasedYear" 
                              SortExpression="PetitionDispoasedYear" />
                          <asp:BoundField DataField="DisposalDate" HeaderText="DisposalDate" 
                              SortExpression="DisposalDate" />
                          <asp:BoundField DataField="OrderJudgementSheet" 
                              HeaderText="OrderJudgementSheet" SortExpression="OrderJudgementSheet" />
                          <asp:BoundField DataField="JudgementDetail" HeaderText="JudgementDetail" 
                              SortExpression="JudgementDetail" />
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
<h1>High Court Register</h1>
<asp:FormView ID="FormView_HighCourtReg" runat="server" 
        EnableModelValidation="True" DefaultMode="Insert" 
         oniteminserting="FormView_HighCourtReg_ItemInserting" 
        onitemcommand="FormView_HighCourtReg_ItemCommand" DataKeyNames="SrNo" 
        DataSourceID="ods_HighCourtReg" 
        oniteminserted="FormView_HighCourtReg_ItemInserted" 
        onitemupdated="FormView_HighCourtReg_ItemUpdated">
    <EditItemTemplate>
                    <table>
        <tr>
		    <td>File No:</td>
			<td><asp:TextBox ID="FilenoTextBox" runat="server" Text='<%# Bind("Fileno") %>' 
                    Width="160px" /></td>
			
			<td>Affidavit Sent Or Not:</td>
			<td>
                <asp:RadioButtonList ID="Radio_affidavit" runat="server" 
                    RepeatDirection="Horizontal" Width="160px">
                    <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>		
        
        <tr>
		    <td>Special Civil Application No:</td>
			<td><asp:TextBox ID="SpecialCivilApplNoTextBox" runat="server" 
            Text='<%# Bind("SpecialCivilApplNo") %>' Width="160px" /></td>
			
			<td>Affidavit Date:</td>
			<td><asp:TextBox ID="AffidavitdateTextBox" runat="server" 
            Text='<%# Bind("Affidavitdate") %>' Width="160px" /></td>
		</tr>       
        
        <tr>
		    <td>Name Of District Office:</td>
			<td>
                <asp:DropDownList ID="Drop_officename" runat="server" 
                    DataSourceID="ods_offices" DataTextField="OfficeName" 
                    DataValueField="OfficeName" Width="160px">
                </asp:DropDownList>
            </td>
			
			<td>Latest Status:</td>
			<td><asp:TextBox ID="LatestStatusTextBox" runat="server" 
            Text='<%# Bind("LatestStatus") %>' Width="160px" /></td>
		</tr>       
        
        <tr>
		    <td>Petitioner Name:</td>
			<td><asp:TextBox ID="PetitionerNameTextBox" runat="server" 
            Text='<%# Bind("PetitionerName") %>' Width="160px" /></td>
			
			<td>Petition Disposed Year:</td>
			<td><asp:TextBox ID="PetitionDispoasedYearTextBox" runat="server" 
            Text='<%# Bind("PetitionDispoasedYear") %>' Width="160px" /></td>
		</tr>        
        
        <tr>
		   <td>Reason Of Petition:</td>
		   <td><asp:TextBox ID="PetitionReasonTextBox" runat="server" 
            Text='<%# Bind("PetitionReason") %>' Height="60px" Width="160px" /></td>
		   
		   <td>Disposal Date:</td>
		   <td><asp:TextBox ID="DisposalDateTextBox" runat="server" 
            Text='<%# Bind("DisposalDate") %>' Width="160px" /></td>
		</tr>        
        
        <tr>
		   <td>Parawise Remarks Sent Or Not:</td>
		   <td>
               <asp:RadioButtonList ID="Radio_parawisermrksent" runat="server" 
                   RepeatDirection="Horizontal" Width="160px">
                   <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                   <asp:ListItem Text="No" Value="False"></asp:ListItem>
               </asp:RadioButtonList>
            </td>
		   
		   <td>Order Judgement Sheet:</td>
		   <td><asp:TextBox ID="OrderJudgementSheetTextBox" runat="server" 
            Text='<%# Bind("OrderJudgementSheet") %>' Width="160px" /></td>
		</tr>       
        
        <tr>
		    <td>Parawise Remarks Sent Date:</td>
			<td><asp:TextBox ID="ParawiseremarksdateTextBox" runat="server" 
            Text='<%# Bind("Parawiseremarksdate") %>' Width="160px" /></td>
			
			<td>Judgement Detail:</td>
			<td><asp:TextBox ID="JudgementDetailTextBox" runat="server" 
            Text='<%# Bind("JudgementDetail") %>' Height="60px" Width="160px" /></td>
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
        <tr>
		    <td>File No:</td>
			<td><asp:TextBox ID="FilenoTextBox" runat="server" Text='<%# Bind("Fileno") %>' 
                    Width="160px" /></td>
			
			<td>Affidavit Sent Or Not:</td>
			<td>
                <asp:RadioButtonList ID="Radio_affidavit" runat="server" 
                    RepeatDirection="Horizontal" Width="160px">
                    <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                    <asp:ListItem Text="No" Value="False"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
		</tr>		
        
        <tr>
		    <td>Special Civil Application No:</td>
			<td><asp:TextBox ID="SpecialCivilApplNoTextBox" runat="server" 
            Text='<%# Bind("SpecialCivilApplNo") %>' Width="160px" /></td>
			
			<td>Affidavit Date:</td>
			<td><asp:TextBox ID="AffidavitdateTextBox" runat="server" 
            Text='<%# Bind("Affidavitdate") %>' Width="160px" /></td>
		</tr>       
        
        <tr>
		    <td>Name Of District Office:</td>
			<td>
                <asp:DropDownList ID="Drop_officename" runat="server" 
                    DataSourceID="ods_offices" DataTextField="OfficeName" 
                    DataValueField="OfficeName" Width="160px">
                </asp:DropDownList>
            </td>
			
			<td>Latest Status:</td>
			<td><asp:TextBox ID="LatestStatusTextBox" runat="server" 
            Text='<%# Bind("LatestStatus") %>' Width="160px" /></td>
		</tr>       
        
        <tr>
		    <td>Petitioner Name:</td>
			<td><asp:TextBox ID="PetitionerNameTextBox" runat="server" 
            Text='<%# Bind("PetitionerName") %>' Width="160px" /></td>
			
			<td>Petition Disposed Year:</td>
			<td><asp:TextBox ID="PetitionDispoasedYearTextBox" runat="server" 
            Text='<%# Bind("PetitionDispoasedYear") %>' Width="160px" /></td>
		</tr>        
        
        <tr>
		   <td>Reason Of Petition:</td>
		   <td><asp:TextBox ID="PetitionReasonTextBox" runat="server" 
            Text='<%# Bind("PetitionReason") %>' Height="60px" Width="160px" /></td>
		   
		   <td>Disposal Date:</td>
		   <td><asp:TextBox ID="DisposalDateTextBox" runat="server" 
            Text='<%# Bind("DisposalDate") %>' Width="160px" /></td>
		</tr>        
        
        <tr>
		   <td>Parawise Remarks Sent Or Not:</td>
		   <td>
               <asp:RadioButtonList ID="Radio_parawisermrksent" runat="server" 
                   RepeatDirection="Horizontal" Width="160px">
                   <asp:ListItem Text="Yes" Value="True"></asp:ListItem>
                   <asp:ListItem Text="No" Value="False"></asp:ListItem>
               </asp:RadioButtonList>
            </td>
		   
		   <td>Order Judgement Sheet:</td>
		   <td><asp:TextBox ID="OrderJudgementSheetTextBox" runat="server" 
            Text='<%# Bind("OrderJudgementSheet") %>' Width="160px" /></td>
		</tr>       
        
        <tr>
		    <td>Parawise Remarks Sent Date:</td>
			<td><asp:TextBox ID="ParawiseremarksdateTextBox" runat="server" 
            Text='<%# Bind("Parawiseremarksdate") %>' Width="160px" /></td>
			
			<td>Judgement Detail:</td>
			<td><asp:TextBox ID="JudgementDetailTextBox" runat="server" 
            Text='<%# Bind("JudgementDetail") %>' Height="60px" Width="160px" /></td>
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
        Fileno:
        <asp:Label ID="FilenoLabel" runat="server" Text='<%# Bind("Fileno") %>' />
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
    
    <asp:ObjectDataSource ID="ods_HighCourtReg" runat="server" DeleteMethod="DeleteQuery" 
        InsertMethod="Insert" SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.HighCourtRegTableAdapters.HighcourtRegTableAdapter" 
        UpdateMethod="UpdateQuery" onselecting="ods_HighCourtReg_Selecting" 
        ondeleting="ods_HighCourtReg_Deleting">
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Fileno" Type="Int32" />
            <asp:Parameter Name="SpecialCivilApplNo" Type="Int32" />
            <asp:Parameter Name="DistrictOfficeName" Type="String" />
            <asp:Parameter Name="PetitionerName" Type="String" />
            <asp:Parameter Name="PetitionReason" Type="String" />
            <asp:Parameter Name="Parawiseremarks" Type="Boolean" />
            <asp:Parameter Name="Parawiseremarksdate" Type="DateTime" />
            <asp:Parameter Name="Affidavit" Type="Boolean" />
            <asp:Parameter Name="Affidavitdate" Type="DateTime" />
            <asp:Parameter Name="LatestStatus" Type="String" />
            <asp:Parameter Name="PetitionDispoasedYear" Type="Int32" />
            <asp:Parameter Name="DisposalDate" Type="DateTime" />
            <asp:Parameter Name="OrderJudgementSheet" Type="String" />
            <asp:Parameter Name="JudgementDetail" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Fileno" Type="Int32" />
            <asp:Parameter Name="SpecialCivilApplNo" Type="Int32" />
            <asp:Parameter Name="DistrictOfficeName" Type="String" />
            <asp:Parameter Name="PetitionerName" Type="String" />
            <asp:Parameter Name="PetitionReason" Type="String" />
            <asp:Parameter Name="Parawiseremarks" Type="Boolean" />
            <asp:Parameter Name="Parawiseremarksdate" Type="DateTime" />
            <asp:Parameter Name="Affidavit" Type="Boolean" />
            <asp:Parameter Name="Affidavitdate" Type="DateTime" />
            <asp:Parameter Name="LatestStatus" Type="String" />
            <asp:Parameter Name="PetitionDispoasedYear" Type="Int32" />
            <asp:Parameter Name="DisposalDate" Type="DateTime" />
            <asp:Parameter Name="OrderJudgementSheet" Type="String" />
            <asp:Parameter Name="JudgementDetail" Type="String" />
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

