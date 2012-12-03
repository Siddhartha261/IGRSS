<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="MLAandMinisterRegister.aspx.cs" Inherits="LatestPages_MLAandMinisterRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <script language="javascript">
    f function generateDatePicker(id) {
        $('input[id*="' + id + '"]').datepicker({
            showOn: "both",
            buttonImage: "/WebApp/Styles/css/sunny/images/calendar.gif",
            buttonImageOnly: true,
            changeMonth: true,
            changeYear: true,
            yearRange: '1940:2025',
            dateFormat: "dd/mm/yy",
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

   

        var datePickers = ["LetterDateTextBox"];
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
<asp:MultiView ID="Multiview_MLA" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<hr /><br />
<h1>MLA and Minister&#39;s Register</h1>
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
                  <asp:GridView ID="GridView_MLA" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_MLA" EnableModelValidation="True" 
                      onrowdeleted="GridView_MLA_RowDeleted" onrowdeleting="GridView_MLA_RowDeleting" 
                      onrowediting="GridView_MLA_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="InwardNo" HeaderText="Inward No" 
                              SortExpression="InwardNo" />
                          <asp:BoundField DataField="FileNo" HeaderText="File No" 
                              SortExpression="FileNo" />
                          <asp:BoundField DataField="MLAname" HeaderText="MLA/MP Name" 
                              SortExpression="MLAname" />
                          <asp:BoundField DataField="Subject" HeaderText="Subject" 
                              SortExpression="Subject" />
                          <asp:BoundField DataField="LetterNo" HeaderText="Letter No" 
                              SortExpression="LetterNo" />
                          <asp:BoundField DataField="LetterDate" HeaderText="Letter Date" 
                              SortExpression="LetterDate" />
                          <asp:BoundField DataField="DepartmentName" HeaderText="Department Name" 
                              SortExpression="DepartmentName" />
                          <asp:BoundField DataField="FileNumber" HeaderText="File Number" 
                              SortExpression="FileNumber" />
                          <asp:BoundField DataField="DetailsofOutput" HeaderText="DetailsofOutput" 
                              SortExpression="DetailsofOutput" Visible="False" />
                          <asp:BoundField DataField="DetailsofFilePreservation" 
                              HeaderText="DetailsofFilePreservation" 
                              SortExpression="DetailsofFilePreservation" Visible="False" />
                          <asp:BoundField DataField="DetailsOfRecord" HeaderText="DetailsOfRecord" 
                              SortExpression="DetailsOfRecord" Visible="False" />
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
        onclick="Button_new_Click" CssClass="standardButton" AccessKey="n" />
</asp:View>

<asp:View ID="Formview" runat="server">
<center>
<h1>MLA and Minister's Register</h1>
<asp:FormView ID="FormView_MLA" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_MLA" EnableModelValidation="True" DefaultMode="Insert" 
        Width="50%" oniteminserting="FormView_MLA_ItemInserting" 
        onitemcommand="FormView_MLA_ItemCommand" 
        oniteminserted="FormView_MLA_ItemInserted" 
        onitemupdated="FormView_MLA_ItemUpdated" 
        onitemupdating="FormView_MLA_ItemUpdating" >
        <EditItemTemplate>
                <table>
        <tr align="left"><td>Inward No:</td>
		    <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="InwardNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td><asp:TextBox ID="InwardNoTextBox" runat="server" 
                Text='<%# Bind("InwardNo") %>' Width="160px" MaxLength="10" /></td>
		</tr>					
            
        <tr align="left"><td>File No:</td>
		    <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td><asp:TextBox ID="FileNoTextBox" runat="server" numeric="integer" Text='<%# Bind("FileNo") %>' 
                    Width="160px" MaxLength="10" /></td>
		</tr>	          
         
        <tr align="left"><td>MLA/MP/Minister's Name:</td>
		    <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="MLAnameTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td><asp:TextBox ID="MLAnameTextBox" runat="server" onkeypress="return AllowAlphabet(event)" Text='<%# Bind("MLAname") %>' 
                    Width="160px" MaxLength="30" /></td>
		</tr>	           
            
        <tr align="left"><td>Subject:</td>
		    <td>
                &nbsp;</td>
		    <td><asp:TextBox ID="SubjectTextBox" runat="server" onkeypress="return AllowAlphabet(event)" Text='<%# Bind("Subject") %>' 
                    Width="160px" MaxLength="20" /></td>
		</tr>	            
            
        <tr align="left"><td>Letter No:</td>
		    <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="LetterNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td><asp:TextBox ID="LetterNoTextBox" runat="server" numeric="integer"
                Text='<%# Bind("LetterNo") %>' Width="160px" MaxLength="10" /></td>
		</tr>	            
            
        <tr align="left"><td>Letter Date:</td>
		    <td>
                &nbsp;</td>
		    <td><asp:TextBox ID="LetterDateTextBox" runat="server" 
                Text='<%# Bind("LetterDate") %>' Width="160px" /></td>
		</tr>	           
            
        <tr align="left"><td>Department Name:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="Drop_departmentname" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td>
                <asp:DropDownList ID="Drop_departmentname" runat="server" 
                    DataSourceID="ods_departmentname" DataTextField="Name" DataValueField="Name">
                </asp:DropDownList>
            </td>
		</tr>	           
            
        <tr align="left"><td>File Number:</td>
		    <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="FileNumberTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td><asp:TextBox ID="FileNumberTextBox" runat="server" numeric="integer"
                Text='<%# Bind("FileNumber") %>' Width="160px" MaxLength="10" /></td>
		</tr>	           
            
        <tr align="left"><td>Details Of Output:</td>
		    <td>
                &nbsp;</td>
		    <td><asp:TextBox ID="DetailsofOutputTextBox" runat="server" 
                Text='<%# Bind("DetailsofOutput") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
		</tr>	            
            
        <tr align="left"><td>Details Of File Preservation:</td>
		    <td>
                &nbsp;</td>
		    <td><asp:TextBox ID="DetailsofFilePreservationTextBox" runat="server" 
                Text='<%# Bind("DetailsofFilePreservation") %>' Height="60px" 
                    TextMode="MultiLine" Width="160px" /></td>
		</tr>	          
            
        <tr align="left"><td>Details Of Record:</td>
		    <td>
                &nbsp;</td>
		    <td><asp:TextBox ID="DetailsOfRecordTextBox" runat="server" 
                Text='<%# Bind("DetailsOfRecord") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
		</tr>	           
            
        <tr align="left"><td>Remarks:</td>
		    <td>
                &nbsp;</td>
		    <td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                    Height="60px" TextMode="MultiLine" Width="160px" /></td>
		</tr>	            
            
        <tr><td colspan=3 align="center">
            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" CssClass="standardButton" />
			&nbsp;<asp:Button ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="Reset" Text="Reset" 
                onclientclick="resetTextFields();return false;" 
                CssClass="standardButton" />	
            &nbsp;<asp:Button ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                CssClass="standardButton" />
			</td>
		</tr>
    </table>		
            
        </EditItemTemplate>
        <InsertItemTemplate>
                <table>
        <tr align="left"><td>Inward No:</td>
		    <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="InwardNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td><asp:TextBox ID="InwardNoTextBox" runat="server" 
                Text='<%# Bind("InwardNo") %>' Width="160px" MaxLength="10" /></td>
		</tr>					
            
        <tr align="left"><td>File No:</td>
		    <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td><asp:TextBox ID="FileNoTextBox" runat="server" numeric="integer" Text='<%# Bind("FileNo") %>' 
                    Width="160px" MaxLength="10" /></td>
		</tr>	          
         
        <tr align="left"><td>MLA/MP/Minister's Name:</td>
		    <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="MLAnameTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td><asp:TextBox ID="MLAnameTextBox" runat="server" onkeypress="return AllowAlphabet(event)" Text='<%# Bind("MLAname") %>' 
                    Width="160px" MaxLength="30" /></td>
		</tr>	           
            
        <tr align="left"><td>Subject:</td>
		    <td>
                &nbsp;</td>
		    <td><asp:TextBox ID="SubjectTextBox" runat="server" onkeypress="return AllowAlphabet(event)" Text='<%# Bind("Subject") %>' 
                    Width="160px" MaxLength="20" /></td>
		</tr>	            
            
        <tr align="left"><td>Letter No:</td>
		    <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="LetterNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td><asp:TextBox ID="LetterNoTextBox" runat="server" numeric="integer"
                Text='<%# Bind("LetterNo") %>' Width="160px" MaxLength="10" /></td>
		</tr>	            
            
        <tr align="left"><td>Letter Date:</td>
		    <td>
                &nbsp;</td>
		    <td><asp:TextBox ID="LetterDateTextBox" runat="server" 
                Text='<%# Bind("LetterDate") %>' Width="160px" /></td>
		</tr>	           
            
        <tr align="left"><td>Department Name:</td>
			<td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="Drop_departmentname" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
			<td>
                <asp:DropDownList ID="Drop_departmentname" runat="server" 
                    DataSourceID="ods_departmentname" DataTextField="Name" DataValueField="Name">
                </asp:DropDownList>
            </td>
		</tr>	           
            
        <tr align="left"><td>File Number:</td>
		    <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="FileNumberTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </td>
		    <td><asp:TextBox ID="FileNumberTextBox" runat="server" numeric="integer"
                Text='<%# Bind("FileNumber") %>' Width="160px" MaxLength="10" /></td>
		</tr>	           
            
        <tr align="left"><td>Details Of Output:</td>
		    <td>
                &nbsp;</td>
		    <td><asp:TextBox ID="DetailsofOutputTextBox" runat="server" 
                Text='<%# Bind("DetailsofOutput") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
		</tr>	            
            
        <tr align="left"><td>Details Of File Preservation:</td>
		    <td>
                &nbsp;</td>
		    <td><asp:TextBox ID="DetailsofFilePreservationTextBox" runat="server" 
                Text='<%# Bind("DetailsofFilePreservation") %>' Height="60px" 
                    TextMode="MultiLine" Width="160px" /></td>
		</tr>	          
            
        <tr align="left"><td>Details Of Record:</td>
		    <td>
                &nbsp;</td>
		    <td><asp:TextBox ID="DetailsOfRecordTextBox" runat="server" 
                Text='<%# Bind("DetailsOfRecord") %>' Height="60px" TextMode="MultiLine" 
                    Width="160px" /></td>
		</tr>	           
            
        <tr align="left"><td>Remarks:</td>
		    <td>
                &nbsp;</td>
		    <td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                    Height="60px" TextMode="MultiLine" Width="160px" /></td>
		</tr>	            
            
        <tr><td colspan=3 align="center">
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
            InwardNo:
            <asp:Label ID="InwardNoLabel" runat="server" Text='<%# Bind("InwardNo") %>' />
            <br />
            FileNo:
            <asp:Label ID="FileNoLabel" runat="server" Text='<%# Bind("FileNo") %>' />
            <br />
            MLAname:
            <asp:Label ID="MLAnameLabel" runat="server" Text='<%# Bind("MLAname") %>' />
            <br />
            Subject:
            <asp:Label ID="SubjectLabel" runat="server" Text='<%# Bind("Subject") %>' />
            <br />
            LetterNo:
            <asp:Label ID="LetterNoLabel" runat="server" Text='<%# Bind("LetterNo") %>' />
            <br />
            LetterDate:
            <asp:Label ID="LetterDateLabel" runat="server" 
                Text='<%# Bind("LetterDate") %>' />
            <br />
            DepartmentName:
            <asp:Label ID="DepartmentNameLabel" runat="server" 
                Text='<%# Bind("DepartmentName") %>' />
            <br />
            FileNumber:
            <asp:Label ID="FileNumberLabel" runat="server" 
                Text='<%# Bind("FileNumber") %>' />
            <br />
            DetailsofOutput:
            <asp:Label ID="DetailsofOutputLabel" runat="server" 
                Text='<%# Bind("DetailsofOutput") %>' />
            <br />
            DetailsofFilePreservation:
            <asp:Label ID="DetailsofFilePreservationLabel" runat="server" 
                Text='<%# Bind("DetailsofFilePreservation") %>' />
            <br />
            DetailsOfRecord:
            <asp:Label ID="DetailsOfRecordLabel" runat="server" 
                Text='<%# Bind("DetailsOfRecord") %>' />
            <br />
            Remarks:
            <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" CssClass="standardButton"/>
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" CssClass="standardButton"/>
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" CssClass="standardButton"/>
        </ItemTemplate>
    </asp:FormView>
</center>
    
    <asp:ObjectDataSource ID="ods_MLA" runat="server" DeleteMethod="DeleteQuery" 
        InsertMethod="Insert" 
        SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.MLATableAdapters.MLATableAdapter" 
        UpdateMethod="UpdateQuery" onselecting="ods_MLA_Selecting" 
        ondeleting="ods_MLA_Deleting" >
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="InwardNo" Type="String" />
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="MLAname" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="LetterNo" Type="Int32" />
            <asp:Parameter Name="LetterDate" Type="DateTime" />
            <asp:Parameter Name="DepartmentName" Type="String" />
            <asp:Parameter Name="FileNumber" Type="Int32" />
            <asp:Parameter Name="DetailsofOutput" Type="String" />
            <asp:Parameter Name="DetailsofFilePreservation" Type="String" />
            <asp:Parameter Name="DetailsOfRecord" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="InwardNo" Type="String" />
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="MLAname" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="LetterNo" Type="Int32" />
            <asp:Parameter Name="LetterDate" Type="DateTime" />
            <asp:Parameter Name="DepartmentName" Type="String" />
            <asp:Parameter Name="FileNumber" Type="Int32" />
            <asp:Parameter Name="DetailsofOutput" Type="String" />
            <asp:Parameter Name="DetailsofFilePreservation" Type="String" />
            <asp:Parameter Name="DetailsOfRecord" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_departmentname" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.DepartmentMasterTableAdapters.DepartmentMasterTableAdapter">
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView> 
</asp:Content>

