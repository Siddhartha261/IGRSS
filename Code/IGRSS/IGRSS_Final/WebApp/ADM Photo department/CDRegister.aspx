<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="CDRegister.aspx.cs" Inherits="ADM_Photo_department_CDRegister" %>

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

        var datePickers = ["YearDateTextBox", "SecondCopyDateTextBox"];
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

<asp:MultiView ID="Multiview_CDRegister" runat="server" ActiveViewIndex="0">
<asp:View ID="view1_GridView" runat="server">
    <br />
<h1>cd&nbsp; Register</h1>
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
                  <asp:GridView ID="GridView_CDRegister" runat="server" AutoGenerateColumns="False" 
                      EnableModelValidation="True" DataKeyNames="SrNo" 
                      DataSourceID="ods_CDRegister" 
                      onrowdeleted="GridView_CDRegister_RowDeleted" 
                      onrowdeleting="GridView_CDRegister_RowDeleting" 
                      onrowediting="GridView_CDRegister_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="YearDate" HeaderText="Year Date" 
                              SortExpression="YearDate" />
                          <asp:BoundField DataField="CD_No" HeaderText="CD No" SortExpression="CD_No" />
                          <asp:BoundField DataField="DetailsOfDocument" HeaderText="DetailsOfDocument" 
                              SortExpression="DetailsOfDocument" Visible="False" />
                          <asp:BoundField DataField="StartingNo" HeaderText="Starting No" 
                              SortExpression="StartingNo" />
                          <asp:BoundField DataField="EndingNo" HeaderText="Ending No" 
                              SortExpression="EndingNo" />
                          <asp:BoundField DataField="SecondCopyDate" HeaderText="Second Copy Date" 
                              SortExpression="SecondCopyDate" />
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

<asp:View ID="view2_Formview" runat="server">
<center>
<h1>cd&nbsp; register</h1>
    <asp:FormView ID="FormView_CDRegister" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_CDRegister" DefaultMode="Insert" 
        EnableModelValidation="True" 
        onitemcommand="FormView_CDRegister_ItemCommand" 
        oniteminserted="FormView_CDRegister_ItemInserted" 
        onitemupdated="FormView_CDRegister_ItemUpdated">
        <EditItemTemplate>
                                        <table align="center" cellspacing="5">
			   <tr><td> Year Date:</td><td> <asp:TextBox ID="YearDateTextBox" runat="server" 
                Text='<%# Bind("YearDate") %>' /></td></tr>
           
           
            <tr><td>CD No:</td><td><asp:TextBox ID="CD_NoTextBox" runat="server" Text='<%# Bind("CD_No") %>' /></td></tr>
            
            
            <tr><td>Details Of Document On CD:</td><td><asp:TextBox ID="DetailsOfDocumentTextBox" runat="server" 
                Text='<%# Bind("DetailsOfDocument") %>' /></td></tr>
            
            
            <tr><td>Starting No:</td><td> <asp:TextBox ID="StartingNoTextBox" runat="server" 
                Text='<%# Bind("StartingNo") %>' /></td></tr>
            
           
            <tr><td> Ending No:</td><td><asp:TextBox ID="EndingNoTextBox" runat="server" 
                Text='<%# Bind("EndingNo") %>' /></td></tr>
           
            
            <tr><td>Second Copy Date:</td><td> <asp:TextBox ID="SecondCopyDateTextBox" runat="server" 
                Text='<%# Bind("SecondCopyDate") %>' /></td></tr>
            
           
            <tr><td> Remarks:</td><td> <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' /></td></tr>
           
           
            <tr>
			<td align="center" colspan="2"> 
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" CssClass="standardButton" />
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" /></td></tr>
            
				</table>
        </EditItemTemplate>
        <InsertItemTemplate>
                                                                   <table align="center" cellspacing="5">
			   <tr><td> Year Date:</td><td> <asp:TextBox ID="YearDateTextBox" runat="server" 
                Text='<%# Bind("YearDate") %>' /></td></tr>
           
           
            <tr><td>CD No:</td><td><asp:TextBox ID="CD_NoTextBox" runat="server" Text='<%# Bind("CD_No") %>' /></td></tr>
            
            
            <tr><td>Details Of Document On CD:</td><td><asp:TextBox ID="DetailsOfDocumentTextBox" runat="server" 
                Text='<%# Bind("DetailsOfDocument") %>' /></td></tr>
            
            
            <tr><td>Starting No:</td><td> <asp:TextBox ID="StartingNoTextBox" runat="server" 
                Text='<%# Bind("StartingNo") %>' /></td></tr>
            
           
            <tr><td> Ending No:</td><td><asp:TextBox ID="EndingNoTextBox" runat="server" 
                Text='<%# Bind("EndingNo") %>' /></td></tr>
           
            
            <tr><td>Second Copy Date:</td><td> <asp:TextBox ID="SecondCopyDateTextBox" runat="server" 
                Text='<%# Bind("SecondCopyDate") %>' /></td></tr>
            
           
            <tr><td> Remarks:</td><td> <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' /></td></tr>
           
           
            <tr>
			<td align="center" colspan="2"> 
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" CssClass="standardButton" />
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" /></td></tr>
            
				</table>
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            YearDate:
            <asp:Label ID="YearDateLabel" runat="server" Text='<%# Bind("YearDate") %>' />
            <br />
            CD_No:
            <asp:Label ID="CD_NoLabel" runat="server" Text='<%# Bind("CD_No") %>' />
            <br />
            DetailsOfDocument:
            <asp:Label ID="DetailsOfDocumentLabel" runat="server" 
                Text='<%# Bind("DetailsOfDocument") %>' />
            <br />
            StartingNo:
            <asp:Label ID="StartingNoLabel" runat="server" 
                Text='<%# Bind("StartingNo") %>' />
            <br />
            EndingNo:
            <asp:Label ID="EndingNoLabel" runat="server" Text='<%# Bind("EndingNo") %>' />
            <br />
            SecondCopyDate:
            <asp:Label ID="SecondCopyDateLabel" runat="server" 
                Text='<%# Bind("SecondCopyDate") %>' />
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
    
    <asp:ObjectDataSource ID="ods_CDRegister" runat="server" 
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.CDRegiaterTableAdapters.CD_RegisterTableAdapter" 
        DeleteMethod="DeleteQuery" InsertMethod="Insert" UpdateMethod="UpdateQuery" 
        onselecting="ods_CDRegister_Selecting" 
        ondeleting="ods_CDRegister_Deleting">
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="YearDate" Type="DateTime" />
            <asp:Parameter Name="CD_No" Type="Int32" />
            <asp:Parameter Name="DetailsOfDocument" Type="String" />
            <asp:Parameter Name="StartingNo" Type="Int32" />
            <asp:Parameter Name="EndingNo" Type="Int32" />
            <asp:Parameter Name="SecondCopyDate" Type="DateTime" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="YearDate" Type="String" />
            <asp:Parameter Name="CD_No" Type="Int32" />
            <asp:Parameter Name="DetailsOfDocument" Type="String" />
            <asp:Parameter Name="StartingNo" Type="Int32" />
            <asp:Parameter Name="EndingNo" Type="Int32" />
            <asp:Parameter Name="SecondCopyDate" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>

