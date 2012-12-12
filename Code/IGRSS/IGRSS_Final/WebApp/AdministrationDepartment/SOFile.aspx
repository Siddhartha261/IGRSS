<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="SOFile.aspx.cs" Inherits="LatestPages_SOFile" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <script type="text/javascript" language="javascript">
        function generateDatePicker(id) {
            $('input[id*="' + id + '"]').datepicker({
                showOn: "both",
                buttonImage: "/WebApp/Styles/css/sunny/images/calendar.gif",
                buttonImageOnly: true,
                changeMonth: true,
                changeYear: true,
                yearRange: '1940:2025',
                //                dateFormat: "dd/mm/yy",
                dateFormat: "mm/dd/yy",
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

      function comparedate() {
          var txtbox = document.getElementById('<%=FormView_SOFile.FindControl("DateOfCircularsTextBox").ClientID%>');
               var cir_date=Date.parse(txtbox.value);
               var datenow = new  Date();
               if (cir_date > datenow) {
              alert("Please check for the date entered");
              }
      }


//        function comparedate() {
//          var txtbox = document.getElementById('<%=FormView_SOFile.FindControl("DateOfCircularsTextBox").ClientID%>');
//          var cir_date=Date.parse(txtbox);
//          var datenow = new Date("2012-11-29");
//          if (cir_date <= datenow)) {
//             alert("The dates are valid.");
//           }
//          }

//        function comparedate() {
//            var txtbox = document.getElementById('<%=FormView_SOFile.FindControl("DateOfCircularsTextBox").ClientID%>');
//            var datenow = new Date();
//            if (txtbox > datenow) {
//                alert("Please enter valide date");
//            }
//        }
        //temp code
//        function comparedate() {
//            var txtbox = document.getElementById('<%=FormView_SOFile.FindControl("DateOfCircularsTextBox").ClientID%>');
//            var date1 = new Date(txtbox);
//            var datenow = new Date();
//            datenow = "2012-11-28";
//            var day = datenow.getDate();
//            var month = datenow.getMonth();
//            var year = datenow.getFullYear();
//            var year1=date1
//            if (txtbox >= datenow) {
//                alert("Please enter valide date");
//            }
//        }
        //ends temp code
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return true;
            return false;
        }
        function removeInlineStyles() {
            $("input[type='text']").each(function (index, element) { $(element).removeAttr("style"); });
            $("table[id*='FvGovtDoc']").removeAttr("style")
        }
        $(function () {

            // removeInlineStyles();
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

        var datePickers = ["DateOfCircularsTextBox"];
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
<asp:MultiView ID="Multiview_SOFile" runat="server" ActiveViewIndex="0">
<asp:View ID="GridView" runat="server">
<br />
<h1 style="text-align: center">SO FILE</h1>
<table>
          <tr>
                    <td align="right" style="width:641px;" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" >
                        <asp:TextBox Width="160" ID="txtFileNo" runat="server" 
                            meta:resourcekey="txtFileNoResource1" AccessKey="t"  ></asp:TextBox></td>
                        <td align="right">
                        <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton"/>
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_SOFile" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_SOFile" 
                      EnableModelValidation="True" onrowdeleted="GridView_SOFile_RowDeleted" 
                      onrowdeleting="GridView_SOFile_RowDeleting" 
                      onrowediting="GridView_SOFile_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                              ReadOnly="True" SortExpression="SrNo" InsertVisible="False" 
                              Visible="False" />
                          <asp:BoundField DataField="Circulars" HeaderText="Circulars" 
                              SortExpression="Circulars" />
                          <asp:BoundField DataField="DateOfCirculars" HeaderText="DateOfCirculars" 
                              SortExpression="DateOfCirculars" />
                          <asp:BoundField DataField="Department" HeaderText="Department" 
                              SortExpression="Department" />
                          <asp:BoundField DataField="Subject" HeaderText="Subject" 
                              SortExpression="Subject" />
                          <asp:BoundField DataField="PageNo" HeaderText="PageNo" 
                              SortExpression="PageNo" />
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
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</asp:View>

<asp:View ID="Formview" runat="server">
<center>
<h1>SO FILE</h1>
    <asp:FormView ID="FormView_SOFile" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_SOFile" DefaultMode="Insert" 
        EnableModelValidation="True" onitemcommand="FormView_SOFile_ItemCommand" 
        oniteminserting="FormView_SOFile_ItemInserting" 
        oniteminserted="FormView_SOFile_ItemInserted" 
        onitemupdated="FormView_SOFile_ItemUpdated" 
        onitemupdating="FormView_SOFile_ItemUpdating">

        <EditItemTemplate>
           <table align="center" cellspacing="5">
                <tr align="left">
                    <td>Circular No:</td>
                      <td>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                       ControlToValidate="CircularsTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                    </td>
                    <td><asp:TextBox ID="CircularsTextBox" runat="server" Text='<%# Bind("Circulars") %>' Width="160px"  numeric="integer" MaxLength="10"/></td>
             
                </tr>
                <tr align="left">
                    <td>Date Of Circulars:</td> <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="DateOfCircularsTextBox" 
                        ErrorMessage="*">*</asp:RequiredFieldValidator>
                    </td>
                    <td> <asp:TextBox ID="DateOfCircularsTextBox" runat="server" Text='<%# Bind("DateOfCirculars") %>' Width="160px" MaxLength="10" /> </td>
                  
                </tr>
                <tr align="left">
                    <td>From Which Department:</td><td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="*" ControlToValidate="DropDownList1">*</asp:RequiredFieldValidator>
                    </td>
                    <td><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Name" DataValueField="Name"></asp:DropDownList></td>
                   
                </tr>
                <tr align="left">
                    <td>Subject:</td><td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="SubjectTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                    </td>
                    <td><asp:TextBox ID="SubjectTextBox"   runat="server" onkeypress="return AllowAlphabet(event)" Text='<%# Bind("Subject") %>' Width="160px" MaxLength="10" /></td>
                </tr>
                <tr align="left">
                    <td>Page No:</td><td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="PageNoTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator></td>
                    <td><asp:TextBox ID="PageNoTextBox" runat="server" Text='<%# Bind("PageNo") %>' Width="160px"  numeric="integer" MaxLength="10" /></td>
                   
                </tr>
                <tr>
                <td align="center" colspan="3">
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update"  CssClass="standardButton"/>
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="False" 
                            CommandName="Reset" Text="Reset" 
                            onclientclick="resetTextFields();return false;" CssClass="standardButton" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back"  CssClass="standardButton"/>
                </td>
                </tr>
                </table>
        </EditItemTemplate>
        <InsertItemTemplate>
             <table align="center" cellspacing="5">
                <%--  <tr><td>SrNo:</td>
          <td><asp:TextBox ID="SrNoTextBox" runat="server" Text='<%# Bind("SrNo") %>' /></td></tr> --%>
                <tr align="left">
                    <td>Circular No:</td>
                      <td>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                       ControlToValidate="CircularsTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                    </td>
                    <td><asp:TextBox ID="CircularsTextBox" runat="server" Text='<%# Bind("Circulars") %>' Width="160px"  numeric="integer" MaxLength="10"/></td>
             
                </tr>
                <tr align="left">
                    <td>Date Of Circulars:</td> <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="DateOfCircularsTextBox" 
                        ErrorMessage="*">*</asp:RequiredFieldValidator>
                    </td>
                    <td> <asp:TextBox ID="DateOfCircularsTextBox" runat="server"   Text='<%# Bind("DateOfCirculars") %>' Width="160px" MaxLength="10" /> </td>
                  
                </tr>
                <tr align="left">
                    <td>From Which Department:</td><td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="*" ControlToValidate="DropDownList1">*</asp:RequiredFieldValidator>
                    </td>
                    <td><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Name" DataValueField="Name"></asp:DropDownList></td>
                   
                </tr>
                <tr align="left">
                    <td>Subject:</td><td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="SubjectTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
                    </td>
                    <td><asp:TextBox ID="SubjectTextBox"   runat="server" onkeypress="return AllowAlphabet(event)" Text='<%# Bind("Subject") %>' Width="160px" MaxLength="10" /></td>
                </tr>
                <tr align="left">
                    <td>Page No:</td><td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="PageNoTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator></td>
                    <td><asp:TextBox ID="PageNoTextBox" runat="server" Text='<%# Bind("PageNo") %>' Width="160px"  numeric="integer" MaxLength="10" /></td>
                   
                </tr>
                <tr>
                <td align="center" colspan="3">
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert"  CssClass="standardButton" AccessKey="I" OnClientClick="comparedate()"/>
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="False" 
                            CommandName="Reset" Text="Reset" 
                            onclientclick="resetTextFields();return false;" 
                        CssClass="standardButton" AccessKey="R" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back"  CssClass="standardButton" 
                        AccessKey="B"/>
                </td>
                </tr>
                </table>
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            Circulars:
            <asp:Label ID="CircularsLabel" runat="server" Text='<%# Bind("Circulars") %>' />
            <br />
            DateOfCirculars:
            <asp:Label ID="DateOfCircularsLabel" runat="server" 
                Text='<%# Bind("DateOfCirculars") %>' />
            <br />
            Department:
            <asp:Label ID="DepartmentLabel" runat="server" 
                Text='<%# Bind("Department") %>' />
            <br />
            Subject:
            <asp:Label ID="SubjectLabel" runat="server" Text='<%# Bind("Subject") %>' />
            <br />
            PageNo:
            <asp:Label ID="PageNoLabel" runat="server" Text='<%# Bind("PageNo") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        DeleteMethod="Delete" InsertMethod="Insert" 
    SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.DataSetDepartmentTableAdapters.DepartmentMasterTableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter DbType="Guid" Name="Original_DepartmentID" />
            <asp:Parameter Name="Original_Name" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Guid" Name="DepartmentID" />
            <asp:Parameter Name="Name" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter DbType="Guid" Name="Original_DepartmentID" />
            <asp:Parameter Name="Original_Name" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
    &nbsp;
</center>
    
    <asp:ObjectDataSource ID="ods_SOFile" runat="server"  
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.SOFileTableAdapters.SOFILETableAdapter" 
        DeleteMethod="DeleteQuery" InsertMethod="Insert" UpdateMethod="UpdateQuery" 
        onselecting="ods_SOFile_Selecting" ondeleting="ods_SOFile_Deleting" 
        >
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Circulars" Type="Int32" />
            <asp:Parameter Name="DateOfCirculars" Type="DateTime" />
            <asp:Parameter Name="Department" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="PageNo" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Circulars" Type="Int32" />
            <asp:Parameter Name="DateOfCirculars" Type="DateTime" />
            <asp:Parameter Name="Department" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="PageNo" Type="Int32" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>

