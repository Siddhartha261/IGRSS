<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="MarriageVolumeRegister.aspx.cs" Inherits="Register_and_marriage_MarriageVolumeRegister" %>

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

        var datePickers = ["DateToDateTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
</script>
<center>
<asp:Panel id="infoDiv" runat="server" Visible="false" CssClass="infoBar" >&nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
<hr /><br /></center>
<asp:MultiView ID="Multiview_Marriage_Volume" runat="server" ActiveViewIndex="0">
<asp:View ID="View1_Gridview_MarriageVolume" runat="server">
<br />
<h1 align="center">Marriage Volume List Register</h1>
<table>
          <tr>
                    <td align="right" style="width:641px;" >
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
                  <asp:GridView ID="GridView_MarriageVolume" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_MarriageVolume" 
                      EnableModelValidation="True" 
                      onrowdeleted="GridView_MarriageVolume_RowDeleted" 
                      onrowdeleting="GridView_MarriageVolume_RowDeleting" 
                      onrowediting="GridView_MarriageVolume_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="DateToDate" HeaderText="Date To Date" 
                              SortExpression="DateToDate" />
                          <asp:BoundField DataField="VolumeNo" HeaderText="Volume No" 
                              SortExpression="VolumeNo" />
                          <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                              SortExpression="Remarks" />
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

<asp:View ID="view2_Formview_MarriageVolume" runat="server">
<center style="width: 640px">
<h1 align="center">Marriage Volume List Register</h1>
    <asp:FormView ID="FormView_MarriageVolume" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_MarriageVolume" DefaultMode="Insert" 
        EnableModelValidation="True" onitemcommand="FormView_Marriage_ItemCommand" 
        oniteminserted="FormView_MarriageVolume_ItemInserted" 
        onitemupdated="FormView_MarriageVolume_ItemUpdated">
        <EditItemTemplate>
                                            <table align="center" cellspacing="5">
			<tr align="left">
			<td>
			Date To Date:
			</td><td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*" ControlToValidate="DateToDateTextBox">*</asp:RequiredFieldValidator>
                </td>
			<td>
			<asp:TextBox ID="DateToDateTextBox" runat="server" 
                Text='<%# Bind("DateToDate") %>' MaxLength="20" Width="160px" />
			</td>
			</tr>
			
            
            <tr align="left"><td>Volume No:</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="*" ControlToValidate="VolumeNoTextBox">*</asp:RequiredFieldValidator>
                </td><td> 
                <asp:TextBox ID="VolumeNoTextBox" runat="server" numeric="integer"
                Text='<%# Bind("VolumeNo") %>' TabIndex="1" MaxLength="10" Width="160px" /></td></tr>
            
           
            <tr align="left"><td>Remarks:</td><td></td><td> 
            <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                    TabIndex="2" Height="60px" TextMode="MultiLine" Width="160px" /></td></tr>
           
             
                     <tr><td align="center" colspan="3">   <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update"  CssClass="standardButton" />
                             &nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="True" 
           CommandName="Reset" Text="Reset" 
           onclientclick="resetTextFields();return false;" CssClass="standardButton"/>
&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Back"
                            Text="Back"   CssClass="standardButton"/>
                            </td>
                            </tr>
			</table>
            
        </EditItemTemplate>
        <InsertItemTemplate>
                                   <table align="center" cellspacing="5">
			<tr align="left">
			<td>
			Date To Date:
			</td><td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*" ControlToValidate="DateToDateTextBox">*</asp:RequiredFieldValidator>
                </td>
			<td>
			<asp:TextBox ID="DateToDateTextBox" runat="server" 
                Text='<%# Bind("DateToDate") %>' MaxLength="20" Width="160px" />
			</td>
			</tr>
			
            
            <tr align="left"><td>Volume No:</td><td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="*" ControlToValidate="VolumeNoTextBox">*</asp:RequiredFieldValidator>
                </td><td> 
                <asp:TextBox ID="VolumeNoTextBox" runat="server" numeric="integer"
                Text='<%# Bind("VolumeNo") %>' TabIndex="1" MaxLength="10" Width="160px" /></td></tr>
            
           
            <tr align="left"><td>Remarks:</td><td></td><td> 
            <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                    TabIndex="2" Height="60px" TextMode="MultiLine" Width="160px" /></td></tr>
           
            <tr><td colspan="3" align="right">
			<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" CssClass="standardButton" Text="Insert" 
                    TabIndex="3" AccessKey="I" />
                            &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" 
                            CausesValidation="False" CommandName="Cancel" CssClass="standardButton" 
                            Text="Reset" TabIndex="4" AccessKey="R" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Back" CssClass="standardButton" 
                            Text="Back" TabIndex="5" AccessKey="B" />
			</td></tr>
            
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            DateToDate:
            <asp:Label ID="DateToDateLabel" runat="server" 
                Text='<%# Bind("DateToDate") %>' />
            <br />
            VolumeNo:
            <asp:Label ID="VolumeNoLabel" runat="server" Text='<%# Bind("VolumeNo") %>' />
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
</center>
    
    <asp:ObjectDataSource ID="ods_MarriageVolume" runat="server" 
        SelectMethod="GetDataBy" 
        
        
        
        TypeName="IGRSS.DataAccessLayer.Marriage_Volume_RegisterTableAdapters.MarriageVolumeListRegisterTableAdapter" 
        InsertMethod="Insert" UpdateMethod="UpdateQuery" 
        onselecting="ods_Marriage_Selecting" DeleteMethod="DeleteQuery" 
        ondeleting="ods_MarriageVolume_Deleting" 
       >
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DateToDate" Type="DateTime" />
            <asp:Parameter Name="VolumeNo" Type="Int32" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="VolumeNo" Type="Int32" />
            <asp:Parameter Name="DateToDate" Type="DateTime" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>

