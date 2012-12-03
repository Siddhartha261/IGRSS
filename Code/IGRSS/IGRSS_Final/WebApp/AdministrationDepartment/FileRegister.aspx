<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="FileRegister.aspx.cs" Inherits="LatestPages_FileRegister" %>

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

        function StartEndCompare(event) {
            var startdatetextbox = document.getElementById('<%=FormView_FileRegister.FindControl("StartingDateTextBox").ClientID%>')
            var enddatetextbox = document.getElementById('<%=FormView_FileRegister.FindControl("EndingDateTextBox").ClientID%>')
            var startdate = Date.parse(startdatetextbox.value);
            var enddate = Date.parse(enddatetextbox.value);
            if (startdate > enddate) {
                alert("Start Date Should be Less than End Date");
                event.preventDefault();
            }
        }
        //ends code

        $(function () {
            $('input[id*="inwardnotextbox"]').keydown(function (event) {
                // allow: backspace, delete, tab, escape, and enter
                if (event.keycode == 46 || event.keycode == 8 || event.keycode == 9 || event.keycode == 27 || event.keycode == 13 ||
                // allow: ctrl+a
            (event.keycode == 65 && event.ctrlkey === true) ||
                // allow: home, end, left, right
            (event.keycode >= 35 && event.keycode <= 39)) {
                    // let it happen, don't do anything
                    return;
                }
                else {
                    // ensure that it is a number and stop the keypress
                    if (event.shiftkey || (event.keycode < 48 || event.keycode > 57) && (event.keycode < 96 || event.keycode > 105)) {
                        event.preventdefault();
                    }
                }
            });

            $('input[id*="inwardnotextbox"]').blur(function () {
                if (isnan($('input[id*="inwardnotextbox"]').val()) || $('input[id*="inwardnotextbox"]').val().length == 0) { $('input[id*="inwardnotextbox"]').val(''); return; }
                var formattednumber = 'igr\/' + $('input[id*="inwardnotextbox"]').val() + '\/' + new date().getfullyear();
                $('input[id*="inwardnotextbox"]').val(formattednumber.tostring());
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
                      onrowediting="GridView_FileRegister_RowEditing" AllowPaging="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                              ReadOnly="True" SortExpression="SrNo" InsertVisible="False" 
                              Visible="False" />
                          <asp:BoundField DataField="Worksheet_ID" HeaderText="Worksheet No" 
                              SortExpression="Worksheet_ID" />
                          <asp:BoundField DataField="FileName" HeaderText="File Name" 
                              SortExpression="FileName" />
                          <asp:BoundField DataField="FileNo" HeaderText="File No" 
                              SortExpression="FileNo" />
                          <asp:BoundField DataField="StartingDate" HeaderText="Starting Date" 
                              SortExpression="StartingDate" />
                          <asp:BoundField DataField="EndingDate" HeaderText="Ending Date" 
                              SortExpression="EndingDate" />
                          <asp:BoundField DataField="ClassOfFile" HeaderText="Class Of File" 
                              SortExpression="ClassOfFile" />
                          <asp:BoundField DataField="DisposalDateOfFile" HeaderText="Disposal Date Of File" 
                              SortExpression="DisposalDateOfFile" />
                          <asp:BoundField DataField="DisposalDateOn" HeaderText="Disposal Date On" 
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
        onclick="Button_new_Click" CssClass="standardButton" AccessKey="n" />
       
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
<tr align="left"><td>Worksheet No:</td><td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="DropDownListWorksheet" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td><td>
    <asp:DropDownList ID="DropDownListWorksheet" runat="server" 
        DataSourceID="ods_Worksheet" DataTextField="ID" DataValueField="ID" 
        Width="160px">
    </asp:DropDownList>
    </td></tr>
<tr align="left"><td>File Name :</td><td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="FileNameTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td><td>
    <asp:TextBox ID="FileNameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
        Text='<%# Bind("FileName") %>' Width="160px" MaxLength="20" TabIndex="1" /></td></tr>
<tr align="left"><td>File No :</td><td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td><td>
    <asp:TextBox ID="FileNoTextBox" runat="server"  numeric="integer"
        Text='<%# Bind("FileNo") %>' Width="160px" MaxLength="10" TabIndex="2" /></td></tr>
<tr align="left"><td>Starting Date :</td><td></td><td>
    <asp:TextBox ID="StartingDateTextBox" 
        runat="server"  Text='<%# Bind("StartingDate") %>' Width="160px" 
        TabIndex="3" /></td></tr>
<tr align="left"><td>Ending Date :</td><td></td><td>
    <asp:TextBox ID="EndingDateTextBox" runat="server" 
        Text='<%# Bind("EndingDate") %>' Width="160px" TabIndex="4" /></td></tr>
<tr align="left"><td>Class Of File :</td><td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="ClassOfFileTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td><td>
    <asp:TextBox ID="ClassOfFileTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
        Text='<%# Bind("ClassOfFile") %>' Width="160px" MaxLength="10" TabIndex="5" /></td></tr>
<tr align="left"><td>Disposal Date Of File :</td><td></td><td>
    <asp:TextBox ID="DisposalDateOfFileTextBox" 
        runat="server" Text='<%# Bind("DisposalDateOfFile") %>' Width="160px" 
        TabIndex="6" /></td></tr>
<tr align="left"><td>Disposal Date On :</td><td></td><td>
    <asp:TextBox ID="DisposalDateOnTextBox" 
        runat="server" Text='<%# Bind("DisposalDateOn") %>' Width="160px" 
        TabIndex="7" /></td></tr>
<tr>
                    <td align="center" colspan="3">
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" CssClass="standardButton" 
                            TabIndex="8" />
                        &nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="False" 
                            CommandName="Reset" Text="Reset" 
                            onclientclick="resetTextFields();return false;" CssClass="standardButton" 
                            TabIndex="9" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Back" Text="Back" CssClass="standardButton" TabIndex="10" />
                    </td>
                </tr>

</tr>
</table>
            </EditItemTemplate>
            <InsertItemTemplate>
                     <table align="center" cellspacing="5">
<tr align="left"><td>Worksheet No:</td><td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="DropDownListWorksheet" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td><td>
    <asp:DropDownList ID="DropDownListWorksheet" runat="server" 
        DataSourceID="ods_Worksheet" DataTextField="ID" DataValueField="ID" 
        Width="160px">
    </asp:DropDownList>
    </td></tr>
<tr align="left"><td>File Name :</td><td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="FileNameTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td><td>
    <asp:TextBox ID="FileNameTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
        Text='<%# Bind("FileName") %>' Width="160px" MaxLength="20" TabIndex="1" /></td></tr>
<tr align="left"><td>File No :</td><td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td><td>
    <asp:TextBox ID="FileNoTextBox" runat="server"  numeric="integer"
        Text='<%# Bind("FileNo") %>' Width="160px" MaxLength="10" TabIndex="2" /></td></tr>
<tr align="left"><td>Starting Date :</td><td></td><td>
    <asp:TextBox ID="StartingDateTextBox" 
        runat="server" Text='<%# Bind("StartingDate") %>' Width="160px" 
        TabIndex="3" /></td></tr>
<tr align="left"><td>Ending Date :</td><td></td><td>
    <asp:TextBox ID="EndingDateTextBox" runat="server" 
        Text='<%# Bind("EndingDate") %>' Width="160px" TabIndex="4" /></td></tr>
<tr align="left"><td>Class Of File :</td><td>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="ClassOfFileTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td><td>
    <asp:TextBox ID="ClassOfFileTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
        Text='<%# Bind("ClassOfFile") %>' Width="160px" MaxLength="10" TabIndex="5" /></td></tr>
<tr align="left"><td>Disposal Date Of File :</td><td></td><td>
    <asp:TextBox ID="DisposalDateOfFileTextBox" 
        runat="server" Text='<%# Bind("DisposalDateOfFile") %>' Width="160px" 
        TabIndex="6" /></td></tr>
<tr align="left"><td>Disposal Date On :</td><td></td><td>
    <asp:TextBox ID="DisposalDateOnTextBox" 
        runat="server" Text='<%# Bind("DisposalDateOn") %>' Width="160px" 
        TabIndex="7" /></td></tr>
<tr>
                    <td align="center" colspan="3" style="margin-left: 40px">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True"
                            CommandName="Insert" Text="Insert" CssClass="standardButton" OnClientClick="StartEndCompare(event)"
                            TabIndex="8" />
                        &nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="False" 
                            CommandName="Reset" Text="Reset" 
                            onclientclick="resetTextFields();return false;" CssClass="standardButton" 
                            TabIndex="9" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Back" Text="Back" CssClass="standardButton" TabIndex="10" />
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

