<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="MarriageRegister.aspx.cs" Inherits="Register_and_marriage_MarriageRegister" %>

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
<h1>marriage certificate register</h1>
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
                          <asp:BoundField DataField="Bridegroom_name" HeaderText="Bridegroom Name" 
                              SortExpression="Bridegroom_name" />
                          <asp:BoundField DataField="Bridegroom_father_name" HeaderText="Bridegroom's  Father's Name" 
                              SortExpression="Bridegroom_father_name" />
                          <asp:BoundField DataField="Bride_name" HeaderText="Bride Name" 
                              SortExpression="Bride_name" />
                          <asp:BoundField DataField="Bride_father_name" HeaderText="Bride's Father's Name" 
                              SortExpression="Bride_father_name" />
                          <asp:BoundField DataField="MarriageDate" HeaderText="Marriage Date" 
                              SortExpression="MarriageDate" />
                          <asp:BoundField DataField="MarriagePlace" HeaderText="Marriage Place" 
                              SortExpression="MarriagePlace" />
                          <asp:BoundField DataField="Village_church_name" 
                              HeaderText="Village/Church Name" SortExpression="Village_church_name" />
                          <asp:BoundField DataField="Talk" HeaderText="Talk" SortExpression="Talk" 
                              Visible="False" />
                          <asp:BoundField DataField="District" HeaderText="District" 
                              SortExpression="District" Visible="False" />
                          <asp:BoundField DataField="ApplicationNo" HeaderText="Application No" 
                              SortExpression="ApplicationNo" />
                          <asp:BoundField DataField="ApplicationDate" HeaderText="Application Date" 
                              SortExpression="ApplicationDate" />
                          <asp:BoundField DataField="NoOfCopies" HeaderText="No Of Copies" 
                              SortExpression="NoOfCopies" Visible="False" />
                          <asp:BoundField DataField="ReceiptNo" HeaderText="Receipt No" 
                              SortExpression="ReceiptNo" />
                          <asp:BoundField DataField="Fees" HeaderText="Fees" SortExpression="Fees" />
                          <asp:BoundField DataField="CopiesFurnished" HeaderText="Copies Furnished" 
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
        onclick="Button_new_Click" CssClass="standardButton" />
</asp:View>

<asp:View ID="view2_Formview" runat="server">
<center>
<h1>Marriage certificate register</h1>
    <asp:FormView ID="FormView_Marriagecertificate" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_Marriage_certificate" DefaultMode="Insert" 
        EnableModelValidation="True" 
        onitemcommand="FormView_Marriage_certificate_ItemCommand" 
        oniteminserted="FormView_Marriagecertificate_ItemInserted" 
        onitemupdated="FormView_Marriagecertificate_ItemUpdated">
        <EditItemTemplate>
                     
			            
			<table align="center" cellspacing="5">
			<tr>
			<td>
			<table>
			<tr>
			<td>Bridegroom Name :
			</td>
			<td>
            <asp:TextBox ID="Bridegroom_nameTextBox" runat="server" 
                Text='<%# Bind("Bridegroom_name") %>' Width="160px" />
			</td>
			    <td style="width: 4px">
                    Place Of Marriage :</td>
                <td>
                    <asp:TextBox ID="MarriagePlaceTextBox" runat="server" 
                        Text='<%# Bind("MarriagePlace") %>' Width="160px" />
                </td>
			</tr>
			
            <tr><td>Father Name Of Bridegroom:</td><td>
                <asp:TextBox ID="Bridegroom_father_nameTextBox" runat="server" 
                Text='<%# Bind("Bridegroom_father_name") %>' Width="160px" /></td>
                <td style="width: 4px">
                    Village / Church Name :</td>
                <td>
                    <asp:TextBox ID="Village_church_nameTextBox" runat="server" 
                        Text='<%# Bind("Village_church_name") %>' Width="160px" />
                </td>
                </tr>
            
            
            <tr><td>Bride Name :</td><td> 
                <asp:TextBox ID="Bride_nameTextBox" runat="server" 
                Text='<%# Bind("Bride_name") %>' Width="160px" /></td>
                <td style="width: 4px">
                    Talk:</td>
                <td>
                    <asp:TextBox ID="TalkTextBox" runat="server" Text='<%# Bind("Talk") %>' 
                        Width="160px" />
                </td>
                </tr>
            
           
            <tr><td> Father Name Of Bride:</td><td> 
                <asp:TextBox ID="Bride_father_nameTextBox" runat="server" 
                Text='<%# Bind("Bride_father_name") %>' Width="160px" /></td>
                <td style="width: 4px">
                    District :</td>
                <td>
                    <asp:TextBox ID="DistrictTextBox" runat="server" Text='<%# Bind("District") %>' 
                        Width="160px" />
                </td>
                </tr>
           
           
            <tr><td>Date Of Marriage :</td><td> 
                <asp:TextBox ID="MarriageDateTextBox" runat="server" 
                Text='<%# Bind("MarriageDate") %>' Width="140px" /></td></tr>
				
				<tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <h4>For Office Use Only</h4></td>
                </tr>
                <tr>
                    <td>
                        Application No:</td>
                    <td>
                        <asp:TextBox ID="ApplicationNoTextBox" runat="server" 
                            Text='<%# Bind("ApplicationNo") %>' Width="160px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Date Of Application:</td>
                    <td>
                        <asp:TextBox ID="ApplicationDateTextBox" runat="server" 
                            Text='<%# Bind("ApplicationDate") %>' Width="140px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        No Of Copies:</td>
                    <td>
                        <asp:TextBox ID="NoOfCopiesTextBox" runat="server" 
                            Text='<%# Bind("NoOfCopies") %>' Width="160px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Receipt No:</td>
                    <td>
                        <asp:TextBox ID="ReceiptNoTextBox" runat="server" 
                            Text='<%# Bind("ReceiptNo") %>' Width="160px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Fees :</td>
                    <td>
                        <asp:TextBox ID="FeesTextBox" runat="server" Text='<%# Bind("Fees") %>' 
                            Width="160px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Copies Furnished</td>
                    <td>
                        <asp:TextBox ID="CopiesFurnishedTextBox" runat="server" 
                            Text='<%# Bind("CopiesFurnished") %>' Width="160px" />
                    </td>
                </tr>
				
				</table>
				</td>
             
			 </tr>
            
            
            <tr>
			 <td align="center"> 
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" CssClass="standardButton" />
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" /></td>
			</tr>
        </EditItemTemplate>
        <InsertItemTemplate>
                        
			               
			            
			            
			<table align="center" cellspacing="5">
			<tr>
			<td>
			<table>
			<tr>
			<td>Bridegroom Name :
			</td>
			<td style="width: 160px">
            <asp:TextBox ID="Bridegroom_nameTextBox" runat="server" 
                Text='<%# Bind("Bridegroom_name") %>' Width="160px" />
			</td>
			    <td style="width: 160px">
                    Place Of Marriage :</td>
                <td style="width: 160px">
                    <asp:TextBox ID="MarriagePlaceTextBox" runat="server" 
                        Text='<%# Bind("MarriagePlace") %>' Width="160px" />
                </td>
			</tr>
			
            <tr><td>Father Name Of Bridegroom:</td><td style="width: 160px">
                <asp:TextBox ID="Bridegroom_father_nameTextBox" runat="server" 
                Text='<%# Bind("Bridegroom_father_name") %>' Width="160px" /></td>
                <td style="width: 160px">
                    Village / Church Name :</td>
                <td style="width: 160px">
                    <asp:TextBox ID="Village_church_nameTextBox" runat="server" 
                        Text='<%# Bind("Village_church_name") %>' Width="160px" />
                </td>
                </tr>
            
            
            <tr><td>Bride Name :</td><td style="width: 160px"> 
                <asp:TextBox ID="Bride_nameTextBox" runat="server" 
                Text='<%# Bind("Bride_name") %>' Width="160px" /></td>
                <td style="width: 160px">
                    Talk:</td>
                <td style="width: 160px">
                    <asp:TextBox ID="TalkTextBox" runat="server" Text='<%# Bind("Talk") %>' 
                        Width="160px" />
                </td>
                </tr>
            
           
            <tr><td> Father Name Of Bride:</td><td style="width: 160px"> 
                <asp:TextBox ID="Bride_father_nameTextBox" runat="server" 
                Text='<%# Bind("Bride_father_name") %>' Width="160px" /></td>
                <td style="width: 160px">
                    District :</td>
                <td style="width: 160px">
                    <asp:TextBox ID="DistrictTextBox" runat="server" Text='<%# Bind("District") %>' 
                        Width="160px" />
                </td>
                </tr>
           
           
            <tr><td>Date Of Marriage :</td><td style="width: 160px"> 
                <asp:TextBox ID="MarriageDateTextBox" runat="server" 
                Text='<%# Bind("MarriageDate") %>' Width="140px" /></td>
                <td style="width: 160px">
                    &nbsp;</td>
                <td style="width: 160px">
                    &nbsp;</td>
                </tr>
				
				<tr>
                    <td>
                        &nbsp;</td>
                    <td style="width: 160px">
                        &nbsp;</td>
                    <td style="width: 160px">
                        &nbsp;</td>
                    <td style="width: 160px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td style="width: 160px">
                        &nbsp;</td>
                    <td style="width: 160px">
                        &nbsp;</td>
                    <td style="width: 160px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td style="width: 160px">
                        &nbsp;</td>
                    <td style="width: 160px">
                        &nbsp;</td>
                    <td style="width: 160px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        <h4>For Office Use Only</h4></td>
                    <td style="text-align: center">
                        &nbsp;</td>
                    <td style="text-align: center">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Application No:</td>
                    <td style="width: 160px">
                        <asp:TextBox ID="ApplicationNoTextBox" runat="server" 
                            Text='<%# Bind("ApplicationNo") %>' Width="160px" />
                    </td>
                    <td style="width: 160px">
                        &nbsp;</td>
                    <td style="width: 160px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Date Of Application:</td>
                    <td style="width: 160px">
                        <asp:TextBox ID="ApplicationDateTextBox" runat="server" 
                            Text='<%# Bind("ApplicationDate") %>' Width="140px" />
                    </td>
                    <td style="width: 160px">
                        &nbsp;</td>
                    <td style="width: 160px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        No Of Copies :</td>
                    <td style="width: 160px">
                        <asp:TextBox ID="NoOfCopiesTextBox" runat="server" 
                            Text='<%# Bind("NoOfCopies") %>' Width="160px" />
                    </td>
                    <td style="width: 160px">
                        &nbsp;</td>
                    <td style="width: 160px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Receipt No :</td>
                    <td style="width: 160px">
                        <asp:TextBox ID="ReceiptNoTextBox" runat="server" 
                            Text='<%# Bind("ReceiptNo") %>' Width="160px" />
                    </td>
                    <td style="width: 160px">
                        &nbsp;</td>
                    <td style="width: 160px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Fees :</td>
                    <td style="width: 160px">
                        <asp:TextBox ID="FeesTextBox" runat="server" Text='<%# Bind("Fees") %>' 
                            Width="160px" />
                    </td>
                    <td style="width: 160px">
                        &nbsp;</td>
                    <td style="width: 160px">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Copies Furnished:</td>
                    <td style="width: 160px">
                        <asp:TextBox ID="CopiesFurnishedTextBox" runat="server" 
                            Text='<%# Bind("CopiesFurnished") %>' Width="160px" />
                    </td>
                    <td style="width: 160px">
                        &nbsp;</td>
                    <td style="width: 160px">
                        &nbsp;</td>
                </tr>
				
				</table>
				</td>
             
			 </tr>
            
            
            <tr>
			 <td align="center"> 
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" CssClass="standardButton" />
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" /></td>
			</tr>
            
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
        ondeleting="ods_Marriage_certificate_Deleting">
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
    
</asp:View>    
</asp:MultiView>
</asp:Content>

