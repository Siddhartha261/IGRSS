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
<asp:MultiView ID="Multiview_FileRegister" runat="server" ActiveViewIndex="0">
<asp:View ID="view1_GridView" runat="server">
<hr /><br />
<h1>File register</h1>
<table>
          <tr>
                    <td align="right" style="width:641px;" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" >
                        <asp:TextBox Width="160" ID="txtFileNo" runat="server" 
                            meta:resourcekey="txtFileNoResource1" 
                            ontextchanged="txtFileNo_TextChanged"></asp:TextBox></td>
                        <td align="right">
                        <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_FileRegister" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_FileRegister" 
                      EnableModelValidation="True">
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
                      </Columns>
                  </asp:GridView>
              </td>
          </tr>
 </table>
 <asp:LinkButton ID="Button_new" runat="server" Text="New" 
        onclick="Button_new_Click" CssClass="standardButton" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</asp:View>

<asp:View ID="view2_Formview" runat="server">
<center>
<h1>file register</h1>
    <asp:FormView ID="FormView_FileRegister" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_FileRegister" DefaultMode="Insert" EnableModelValidation="True" 
        Width="50%" onitemcommand="FormView_FileRegister_ItemCommand">

        <EditItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel1" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            Worksheet_ID:
            <asp:TextBox ID="Worksheet_IDTextBox" runat="server" 
                Text='<%# Bind("Worksheet_ID") %>' />
            <br />
            FileName:
            <asp:TextBox ID="FileNameTextBox" runat="server" 
                Text='<%# Bind("FileName") %>' />
            <br />
            FileNo:
            <asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' />
            <br />
            StartingDate:
            <asp:TextBox ID="StartingDateTextBox" runat="server" 
                Text='<%# Bind("StartingDate") %>' />
            <br />
            EndingDate:
            <asp:TextBox ID="EndingDateTextBox" runat="server" 
                Text='<%# Bind("EndingDate") %>' />
            <br />
            ClassOfFile:
            <asp:TextBox ID="ClassOfFileTextBox" runat="server" 
                Text='<%# Bind("ClassOfFile") %>' />
            <br />
            DisposalDateOfFile:
            <asp:TextBox ID="DisposalDateOfFileTextBox" runat="server" 
                Text='<%# Bind("DisposalDateOfFile") %>' />
            <br />
            DisposalDateOn:
            <asp:TextBox ID="DisposalDateOnTextBox" runat="server" 
                Text='<%# Bind("DisposalDateOn") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <table align="center" cellspacing="5">
<tr><td align="right">Worksheet ID:</td><td align="left" style="width:50%"><asp:TextBox ID="Worksheet_IDTextBox" runat="server" Text='<%# Bind("Worksheet_ID") %>' /></td></tr>
<tr><td align="right">File Name:</td><td align="left" style="width:50%"><asp:TextBox ID="FileNameTextBox" runat="server" Text='<%# Bind("FileName") %>' /></td></tr>
<tr><td align="right">File No:</td><td align="left" style="width:50%"><asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' /></td></tr>
<tr><td align="right">Starting Date:</td><td align="left" style="width:50%"><asp:TextBox ID="StartingDateTextBox" runat="server" Text='<%# Bind("StartingDate") %>' /></td></tr>
<tr><td align="right">Ending Date:</td><td align="left" style="width:50%"><asp:TextBox ID="EndingDateTextBox" runat="server" Text='<%# Bind("EndingDate") %>' /></td></tr>
<tr><td align="right">Class Of File: </td><td align="left" style="width:50%"><asp:TextBox ID="ClassOfFileTextBox" runat="server" Text='<%# Bind("ClassOfFile") %>' /></td></tr>
<tr><td align="right">Disposal Date Of File :</td><td align="left" style="width:50%"><asp:TextBox ID="DisposalDateOfFileTextBox" runat="server" Text='<%# Bind("DisposalDateOfFile") %>' /></td></tr>
<tr><td align="right">Disposal Date On:</td><td align="left" style="width:50%"><asp:TextBox ID="DisposalDateOnTextBox" runat="server" Text='<%# Bind("DisposalDateOn") %>' /></td></tr>
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
            <asp:Label ID="FileNameLabel" runat="server" 
                Text='<%# Bind("FileName") %>' />
            <br />
            FileNo:
            <asp:Label ID="FileNoLabel" runat="server" 
                Text='<%# Bind("FileNo") %>' />
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
</center>
    
    <asp:ObjectDataSource ID="ods_FileRegister" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.FileRegisterNewTableAdapters.FileRegisterTableAdapter" 
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" 
        onselecting="ods_FileRegister_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Worksheet_ID" Type="Int32" />
            <asp:Parameter Name="Original_FileName" Type="String" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_StartingDate" Type="DateTime" />
            <asp:Parameter Name="Original_EndingDate" Type="DateTime" />
            <asp:Parameter Name="Original_ClassOfFile" Type="String" />
            <asp:Parameter Name="Original_DisposalDateOfFile" Type="DateTime" />
            <asp:Parameter Name="Original_DisposalDateOn" Type="DateTime" />
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
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Worksheet_ID" Type="Int32" />
            <asp:Parameter Name="Original_FileName" Type="String" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_StartingDate" Type="DateTime" />
            <asp:Parameter Name="Original_EndingDate" Type="DateTime" />
            <asp:Parameter Name="Original_ClassOfFile" Type="String" />
            <asp:Parameter Name="Original_DisposalDateOfFile" Type="DateTime" />
            <asp:Parameter Name="Original_DisposalDateOn" Type="DateTime" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>

