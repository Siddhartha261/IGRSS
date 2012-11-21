<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="FileRegister.aspx.cs" Inherits="LatestPages_FileRegister" %>

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

            var datePickers = ["StartingDateTextBox", "EndingDateTextBox", "DisposalDateOfFileTextBox", "DisposalDateOnTextBox"];
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
<asp:MultiView ID="Multiview_FileRegister" runat="server" ActiveViewIndex="0">
<asp:View ID="view1_GridView" runat="server">
    <br />

<h1 style="text-align: center">FILE REGISTER</h1>
<table>
          <tr>
                    <td align="right" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label>
                    
                       &nbsp<asp:TextBox Width="160" ID="txtFileNo" runat="server" 
                            meta:resourcekey="txtFileNoResource1" 
                           ></asp:TextBox>
                        
                        &nbsp<asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />
                    </td>
          </tr>
          <tr>
              <td colspan="3">
                  <asp:GridView ID="GridView_FileRegister" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_FileRegister" 
                      EnableModelValidation="True" 
                      onrowdeleted="GridView_FileRegister_RowDeleted" 
                      onrowdeleting="GridView_FileRegister_RowDeleting" 
                      onrowediting="GridView_FileRegister_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                              ReadOnly="True" SortExpression="SrNo" InsertVisible="False" />
                          <asp:BoundField DataField="Worksheet_ID" HeaderText="Worksheet_ID" 
                              SortExpression="Worksheet_ID" />
                          <asp:BoundField DataField="FileName" HeaderText="FileName" 
                              SortExpression="FileName" />
                          <asp:BoundField DataField="FileNo" HeaderText="FileNo" 
                              SortExpression="FileNo" />
                          <asp:BoundField DataField="StartingDate" HeaderText="StartingDate" 
                              SortExpression="StartingDate" />
                          <asp:BoundField DataField="EndingDate" HeaderText="EndingDate" 
                              SortExpression="EndingDate" />
                          <asp:BoundField DataField="ClassOfFile" HeaderText="ClassOfFile" 
                              SortExpression="ClassOfFile" />
                          <asp:BoundField DataField="DisposalDateOfFile" HeaderText="DisposalDateOfFile" 
                              SortExpression="DisposalDateOfFile" />
                          <asp:BoundField DataField="DisposalDateOn" HeaderText="DisposalDateOn" 
                              SortExpression="DisposalDateOn" />
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
    <h1 style="text-align: center">
        FILE REGISTER</h1>
    <center>
        <asp:FormView ID="FormView_FileRegister" runat="server" DataKeyNames="SrNo" 
            DataSourceID="ods_FileRegister" DefaultMode="Insert" 
            EnableModelValidation="True" onitemcommand="FormView_FileRegister_ItemCommand" 
            oniteminserted="FormView_FileRegister_ItemInserted" 
            onitemupdated="FormView_FileRegister_ItemUpdated" 
            oniteminserting="FormView_FileRegister_ItemInserting" 
            onitemupdating="FormView_FileRegister_ItemUpdating">
            <EditItemTemplate>
                      <table align="center" cellspacing="5">
<tr><td>Worksheet ID:</td><td >
    <asp:DropDownList ID="DropDownListWorksheet" runat="server" 
        DataSourceID="ods_Worksheet" DataTextField="ID" DataValueField="ID" 
        Width="160px">
    </asp:DropDownList>
    </td></tr>
<tr><td>File Name:</td><td><asp:TextBox ID="FileNameTextBox" runat="server" 
        Text='<%# Bind("FileName") %>' Width="160px" /></td></tr>
<tr><td>File No:</td><td><asp:TextBox ID="FileNoTextBox" runat="server" 
        Text='<%# Bind("FileNo") %>' Width="160px" /></td></tr>
<tr><td>Starting Date:</td><td ><asp:TextBox ID="StartingDateTextBox" 
        runat="server" Text='<%# Bind("StartingDate") %>' Width="140px" /></td></tr>
<tr><td>Ending Date:</td><td><asp:TextBox ID="EndingDateTextBox" runat="server" 
        Text='<%# Bind("EndingDate") %>' Width="140px" /></td></tr>
<tr><td>Class Of File :</td><td><asp:TextBox ID="ClassOfFileTextBox" runat="server" 
        Text='<%# Bind("ClassOfFile") %>' Width="160px" /></td></tr>
<tr><td>Disposal Date Of File :</td><td><asp:TextBox ID="DisposalDateOfFileTextBox" 
        runat="server" Text='<%# Bind("DisposalDateOfFile") %>' Width="140px" /></td></tr>
<tr><td>Disposal Date On :</td><td><asp:TextBox ID="DisposalDateOnTextBox" 
        runat="server" Text='<%# Bind("DisposalDateOn") %>' Width="140px" /></td></tr>
<tr>
                    <td align="center" colspan="2">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" CssClass="standardButton" />
                        &nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="False" 
                            CommandName="Reset" Text="Reset" 
                            onclientclick="resetTextFields();return false;" CssClass="standardButton" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Back" Text="Back" CssClass="standardButton" />
                    </td>
                </tr>

</tr>
</table>
            </EditItemTemplate>
            <InsertItemTemplate>
                     <table align="center" cellspacing="5">
<tr><td>Worksheet ID:</td><td>
    <asp:DropDownList ID="DropDownListWorksheet" runat="server" 
        DataSourceID="ods_Worksheet" DataTextField="ID" DataValueField="ID" 
        Width="160px">
    </asp:DropDownList>
    </td></tr>
<tr><td>File Name :</td><td><asp:TextBox ID="FileNameTextBox" runat="server" 
        Text='<%# Bind("FileName") %>' Width="160px" /></td></tr>
<tr><td>File No :</td><td><asp:TextBox ID="FileNoTextBox" runat="server" 
        Text='<%# Bind("FileNo") %>' Width="160px" /></td></tr>
<tr><td>Starting Date :</td><td><asp:TextBox ID="StartingDateTextBox" 
        runat="server" Text='<%# Bind("StartingDate") %>' Width="140px" /></td></tr>
<tr><td>Ending Date :</td><td><asp:TextBox ID="EndingDateTextBox" runat="server" 
        Text='<%# Bind("EndingDate") %>' Width="140px" /></td></tr>
<tr><td>Class Of File :</td><td><asp:TextBox ID="ClassOfFileTextBox" runat="server" 
        Text='<%# Bind("ClassOfFile") %>' Width="160px" /></td></tr>
<tr><td>Disposal Date Of File :</td><td><asp:TextBox ID="DisposalDateOfFileTextBox" 
        runat="server" Text='<%# Bind("DisposalDateOfFile") %>' Width="140px" /></td></tr>
<tr><td>Disposal Date On :</td><td><asp:TextBox ID="DisposalDateOnTextBox" 
        runat="server" Text='<%# Bind("DisposalDateOn") %>' Width="140px" /></td></tr>
<tr>
                    <td align="center" colspan="2">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" CssClass="standardButton" />
                        &nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="False" 
                            CommandName="Reset" Text="Reset" 
                            onclientclick="resetTextFields();return false;" CssClass="standardButton" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Back" Text="Back" CssClass="standardButton" />
                    </td>
                </tr>

</tr>
</table>
            </InsertItemTemplate>
            <ItemTemplate>
                SrNo:
                <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
                <br />
                Worksheet_ID:
                <asp:Label ID="Worksheet_IDLabel" runat="server" 
                    Text='<%# Bind("Worksheet_ID") %>' />
                <br />
                FileName:
                <asp:Label ID="FileNameLabel" runat="server" Text='<%# Bind("FileName") %>' />
                <br />
                FileNo:
                <asp:Label ID="FileNoLabel" runat="server" Text='<%# Bind("FileNo") %>' />
                <br />
                StartingDate:
                <asp:Label ID="StartingDateLabel" runat="server" 
                    Text='<%# Bind("StartingDate") %>' />
                <br />
                EndingDate:
                <asp:Label ID="EndingDateLabel" runat="server" 
                    Text='<%# Bind("EndingDate") %>' />
                <br />
                ClassOfFile:
                <asp:Label ID="ClassOfFileLabel" runat="server" 
                    Text='<%# Bind("ClassOfFile") %>' />
                <br />
                DisposalDateOfFile:
                <asp:Label ID="DisposalDateOfFileLabel" runat="server" 
                    Text='<%# Bind("DisposalDateOfFile") %>' />
                <br />
                DisposalDateOn:
                <asp:Label ID="DisposalDateOnLabel" runat="server" 
                    Text='<%# Bind("DisposalDateOn") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                    CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:ObjectDataSource ID="ods_Worksheet" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetData" 
            TypeName="IGRSS.DataAccessLayer.WorksheetregisterTableAdapters.WorkSheetRegisterTableAdapter" 
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_ID" Type="Int32" />
                <asp:Parameter Name="Original_WorkSheet_No" Type="Int32" />
                <asp:Parameter Name="Original_Inward_No" Type="String" />
                <asp:Parameter Name="Original_Name_Of_Person" Type="String" />
                <asp:Parameter Name="Original_Letter_Details" Type="String" />
                <asp:Parameter Name="Original_Work_Disposal_Date" Type="DateTime" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="WorkSheet_No" Type="Int32" />
                <asp:Parameter Name="Inward_No" Type="String" />
                <asp:Parameter Name="Name_Of_Person" Type="String" />
                <asp:Parameter Name="Letter_Details" Type="String" />
                <asp:Parameter Name="Work_Disposal_Date" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="WorkSheet_No" Type="Int32" />
                <asp:Parameter Name="Inward_No" Type="String" />
                <asp:Parameter Name="Name_Of_Person" Type="String" />
                <asp:Parameter Name="Letter_Details" Type="String" />
                <asp:Parameter Name="Work_Disposal_Date" Type="DateTime" />
                <asp:Parameter Name="Original_ID" Type="Int32" />
                <asp:Parameter Name="Original_WorkSheet_No" Type="Int32" />
                <asp:Parameter Name="Original_Inward_No" Type="String" />
                <asp:Parameter Name="Original_Name_Of_Person" Type="String" />
                <asp:Parameter Name="Original_Letter_Details" Type="String" />
                <asp:Parameter Name="Original_Work_Disposal_Date" Type="DateTime" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </center>
    
    <asp:ObjectDataSource ID="ods_FileRegister" runat="server" 
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.FileRegisterNewTableAdapters.FileRegisterTableAdapter" 
        DeleteMethod="DeleteQuery" InsertMethod="Insert" UpdateMethod="UpdateQuery" 
        onselecting="ods_FileRegister_Selecting" 
        ondeleting="ods_FileRegister_Deleting"     
        >
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Worksheet_ID" Type="Int32" />
            <asp:Parameter Name="FileName" Type="String" />
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="StartingDate" Type="DateTime" />
            <asp:Parameter Name="EndingDate" Type="DateTime" />
            <asp:Parameter Name="ClassOfFile" Type="String" />
            <asp:Parameter Name="DisposalDateOfFile" Type="DateTime" />
            <asp:Parameter Name="DisposalDateOn" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Worksheet_ID" Type="Int32" />
            <asp:Parameter Name="FileName" Type="String" />
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="StartingDate" Type="DateTime" />
            <asp:Parameter Name="EndingDate" Type="DateTime" />
            <asp:Parameter Name="ClassOfFile" Type="String" />
            <asp:Parameter Name="DisposalDateOfFile" Type="DateTime" />
            <asp:Parameter Name="DisposalDateOn" Type="DateTime" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>

