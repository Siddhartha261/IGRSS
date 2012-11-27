<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="BookFormsRegister.aspx.cs" Inherits="Register_and_marriage_BookFormsRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<script language="javascript">
    function generateDatePicker(id) {
        $('input[id*="' + id + '"]').datepicker({
            showOn: "both",
            buttonImage: "/WebApp/Styles/css/sunny/images/calendar.gif",
            buttonImageOnly: true
        });
    }


    function AllowAlphabet(e) {
        isIE = document.all ? 1 : 0
        keyEntry = !isIE ? e.which : event.keyCode;
        if (((keyEntry >= '65') && (keyEntry <= '90')) || ((keyEntry >= '97') && (keyEntry <= '122')) || (keyEntry == '46') || (keyEntry == '32') || keyEntry == '45')
            return true;
        else {
            alert('Please Enter Only Character values.');
            return false;
        }
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

        var datePickers = ["Recd_DateTextBox"];
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
<asp:MultiView ID="Multiview_BookFormsRegister" runat="server" ActiveViewIndex="0">
<asp:View ID="view1_GridView" runat="server">
<br />
<h1 style="text-align: center" align="center">BOOKFORMS REGISTER</h1>
<table>
          <tr>
          <td align="right">
          <table>
                <tr>    <td align="right" style="width:641px;" >
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
                    </table>
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_BookFormRegister" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_BookFormRegister" 
                      EnableModelValidation="True" 
                      onrowdeleted="GridView_BookFormRegister_RowDeleted" 
                      onrowdeleting="GridView_BookFormRegister_RowDeleting" 
                      onrowediting="GridView_BookFormRegister_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="Sr No" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="No_of_forms" HeaderText="No of Forms" 
                              SortExpression="No_of_forms" Visible="False" />
                          <asp:BoundField DataField="No_Demand_quantity" HeaderText="No Demand Quantity" 
                              SortExpression="No_Demand_quantity" />
                          <asp:BoundField DataField="No_Distributed_Stock" 
                              HeaderText="No Distributed Stock" SortExpression="No_Distributed_Stock" 
                              Visible="False" />
                          <asp:BoundField DataField="Actual_Stock" HeaderText="Actual Stock" 
                              SortExpression="Actual_Stock" Visible="False" />
                          <asp:BoundField DataField="Form_no" HeaderText="Form No" 
                              SortExpression="Form_no" Visible="False" />
                          <asp:BoundField DataField="Dept_name" HeaderText="Department Name" 
                              SortExpression="Dept_name" Visible="False" />
                          <asp:BoundField DataField="No_Forms_Given" HeaderText="No Forms Given" 
                              SortExpression="No_Forms_Given" />
                          <asp:BoundField DataField="Recd_Date" HeaderText="Received Date" 
                              SortExpression="Recd_Date" />
                          <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                              SortExpression="Remarks" />
                          <asp:BoundField DataField="Emp_Name" HeaderText="Employee Name" 
                              SortExpression="Emp_Name" Visible="False" />
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
        onclick="Button_new_Click" CssClass="standardButton" AccessKey="N" />
</asp:View>

<asp:View ID="view2_Formview" runat="server">
<center>
<h1 style="text-align: center" align="center">BOOK FORMS REGISTER</h1>
  
    <asp:FormView ID="FormView_BookFormRegister" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_BookFormRegister" DefaultMode="Insert" 
        EnableModelValidation="True" onitemcommand="FormView_BookForm_ItemCommand" 
        oniteminserting="FormView_BookForm_ItemInserting" 
        oniteminserted="FormView_BookFormRegister_ItemInserted" 
        onitemupdated="FormView_BookFormRegister_ItemUpdated" 
        onitemupdating="FormView_BookFormRegister_ItemUpdating">
        <EditItemTemplate>
         <table align="center" cellspacing="5">
         <tr align="left">
		 <td></td>
		 <td></td>
         <td></td>
		 <td colspan="3" align="center"><h4> After Giving To Employee :</h4></td>
		 </tr>
		 <tr align="left">
		 <td>No Of Forms :</td><td>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                 ControlToValidate="No_Forms_GivenTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
             </td>
		 <td><asp:TextBox ID="No_of_formsTextBox" runat="server" numeric="integer"
                Text='<%# Bind("No_of_forms") %>' MaxLength="10" Width="160px" /></td>
		 <td>Name Of Department:</td><td></td>
		 <td> 
             <asp:DropDownList ID="DropDownListDepartment" runat="server" 
                    DataSourceID="ObjectDataSourceDepartment" DataTextField="Name" 
                    DataValueField="Name" Width="160px">
                </asp:DropDownList></td>
		 </tr>
		 <tr align="left">
		 <td>No Of Demand Quantity :</td><td></td>
		 <td><asp:TextBox ID="No_Demand_quantityTextBox" runat="server" numeric="integer"
                Text='<%# Bind("No_Demand_quantity") %>' MaxLength="10" Width="160px" /></td>
		<td> No Of&nbsp; Forms Given:</td><td>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                 ControlToValidate="No_Forms_GivenTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
             </td><td>
             <asp:TextBox ID="No_Forms_GivenTextBox" runat="server"  numeric="integer"
                Text='<%# Bind("No_Forms_Given") %>' MaxLength="10" Width="160px" /></td>
		 </tr>
		 <tr align="left">
		 <td> No Of Distributed Stock :</td><td>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                 ControlToValidate="No_Distributed_StockTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
             </td><td>
             <asp:TextBox ID="No_Distributed_StockTextBox" runat="server" numeric="integer"
                Text='<%# Bind("No_Distributed_Stock") %>' MaxLength="10" Width="160px" /></td>
		<td> Date Of Employee Receiving Forms:</td><td></td><td> 
             <asp:TextBox ID="Recd_DateTextBox" runat="server" 
                Text='<%# Bind("Recd_Date") %>' MaxLength="20" Width="160px" /></td>
		 </tr>
		 <tr align="left">
		<td>Actual Stock :</td><td>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                 ControlToValidate="Actual_StockTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
             </td><td> 
             <asp:TextBox ID="Actual_StockTextBox" runat="server" numeric="integer"
                Text='<%# Bind("Actual_Stock") %>' MaxLength="10" Width="160px" /></td>
		 <td>Name Of Employee Receiving Forms:</td><td>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                 ControlToValidate="Emp_NameTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
             </td><td> 
             <asp:TextBox ID="Emp_NameTextBox" runat="server"  onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Emp_Name") %>' MaxLength="30" Width="160px" /></td>
		 </tr>
		 <tr align="left">
		<td>Remarks:</td><td></td><td> <asp:TextBox ID="RemarksTextBox" runat="server" 
                 Text='<%# Bind("Remarks") %>' Height="60px" TextMode="MultiLine" 
                 Width="160px" /></td>
                 <td></td>
		 <td></td>
		 <td></td>
		 </tr>
		 <tr>
		  <td align="center" colspan="6">
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" CssClass="standardButton" AccessKey="U" />
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" 
                  CssClass="standardButton" AccessKey="R" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                  CssClass="standardButton" AccessKey="B" />
				</td>
		 </tr>
		 </table>
        </EditItemTemplate>
        <InsertItemTemplate>
            <table align="center" cellspacing="5">
         <tr align="left">
		 <td></td>
		 <td></td>
         <td></td>
		 <td colspan="3" align="center"><h4> After Giving To Employee :</h4></td>
		 </tr>
		 <tr align="left">
		 <td>No Of Forms :</td><td>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                 ControlToValidate="No_Forms_GivenTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
             </td>
		 <td><asp:TextBox ID="No_of_formsTextBox" runat="server" numeric="integer"
                Text='<%# Bind("No_of_forms") %>' MaxLength="10" Width="160px" /></td>
		 <td>Name Of Department:</td><td></td>
		 <td> 
             <asp:DropDownList ID="DropDownListDepartment" runat="server" 
                    DataSourceID="ObjectDataSourceDepartment" DataTextField="Name" 
                    DataValueField="Name" Width="160px">
                </asp:DropDownList></td>
		 </tr>
		 <tr align="left">
		 <td>No Of Demand Quantity :</td><td></td>
		 <td><asp:TextBox ID="No_Demand_quantityTextBox" runat="server" numeric="integer"
                Text='<%# Bind("No_Demand_quantity") %>' MaxLength="10" Width="160px" /></td>
		<td> No Of&nbsp; Forms Given:</td><td>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                 ControlToValidate="No_Forms_GivenTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
             </td><td>
             <asp:TextBox ID="No_Forms_GivenTextBox" runat="server"  numeric="integer"
                Text='<%# Bind("No_Forms_Given") %>' MaxLength="10" Width="160px" /></td>
		 </tr>
		 <tr align="left">
		 <td> No Of Distributed Stock :</td><td>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                 ControlToValidate="No_Distributed_StockTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
             </td><td>
             <asp:TextBox ID="No_Distributed_StockTextBox" runat="server" numeric="integer"
                Text='<%# Bind("No_Distributed_Stock") %>' MaxLength="10" Width="160px" /></td>
		<td> Date Of Employee Receiving Forms :</td><td></td><td> 
             <asp:TextBox ID="Recd_DateTextBox" runat="server" 
                Text='<%# Bind("Recd_Date") %>' MaxLength="20" Width="160px" /></td>
		 </tr>
		 <tr align="left">
		<td>Actual Stock :</td><td>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                 ControlToValidate="Actual_StockTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
             </td><td> 
             <asp:TextBox ID="Actual_StockTextBox" runat="server" numeric="integer"
                Text='<%# Bind("Actual_Stock") %>' MaxLength="10" Width="160px" /></td>
		 <td>Name Of Employee Receiving Forms:</td><td>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                 ControlToValidate="Emp_NameTextBox" ErrorMessage="*">*</asp:RequiredFieldValidator>
             </td><td> 
             <asp:TextBox ID="Emp_NameTextBox" runat="server"  onkeypress="return AllowAlphabet(event)"
                Text='<%# Bind("Emp_Name") %>' MaxLength="30" Width="160px" /></td>
		 </tr>
		 <tr align="left">
		<td>Remarks:</td><td></td><td> <asp:TextBox ID="RemarksTextBox" runat="server" 
                 Text='<%# Bind("Remarks") %>' Height="60px" TextMode="MultiLine" 
                 Width="160px" /></td>
                 <td></td>
		 <td></td>
		 <td></td>
		 </tr>
		 <tr>
		  <td align="center" colspan="6">
            <asp:LinkButton ID="Button" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" CssClass="standardButton" AccessKey="I" />
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" 
                  CssClass="standardButton" AccessKey="R" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                  CssClass="standardButton" AccessKey="B" />
				</td>
		 </tr>
		 </table>
            
        </InsertItemTemplate>
        <ItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            No_of_forms:
            <asp:Label ID="No_of_formsLabel" runat="server" 
                Text='<%# Bind("No_of_forms") %>' />
            <br />
            No_Demand_quantity:
            <asp:Label ID="No_Demand_quantityLabel" runat="server" 
                Text='<%# Bind("No_Demand_quantity") %>' />
            <br />
            No_Distributed_Stock:
            <asp:Label ID="No_Distributed_StockLabel" runat="server" 
                Text='<%# Bind("No_Distributed_Stock") %>' />
            <br />
            Actual_Stock:
            <asp:Label ID="Actual_StockLabel" runat="server" 
                Text='<%# Bind("Actual_Stock") %>' />
            <br />
            Form_no:
            <asp:Label ID="Form_noLabel" runat="server" Text='<%# Bind("Form_no") %>' />
            <br />
            Dept_name:
            <asp:Label ID="Dept_nameLabel" runat="server" Text='<%# Bind("Dept_name") %>' />
            <br />
            No_Forms_Given:
            <asp:Label ID="No_Forms_GivenLabel" runat="server" 
                Text='<%# Bind("No_Forms_Given") %>' />
            <br />
            Recd_Date:
            <asp:Label ID="Recd_DateLabel" runat="server" Text='<%# Bind("Recd_Date") %>' />
            <br />
            Remarks:
            <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
            <br />
            Emp_Name:
            <asp:Label ID="Emp_NameLabel" runat="server" Text='<%# Bind("Emp_Name") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSourceDepartment" runat="server" 
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
</center>
    
    <asp:ObjectDataSource ID="ods_BookFormRegister" runat="server"  
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.BookFormsTableAdapters.BookFormsRegisterTableAdapter" 
        DeleteMethod="DeleteQuery" InsertMethod="Insert" UpdateMethod="UpdateQuery" 
        onselecting="ods_BookformRegister_Selecting" 
        ondeleting="ods_BookFormRegister_Deleting">
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="No_of_forms" Type="Int32" />
            <asp:Parameter Name="No_Demand_quantity" Type="Int32" />
            <asp:Parameter Name="No_Distributed_Stock" Type="Int32" />
            <asp:Parameter Name="Actual_Stock" Type="Int32" />
            <asp:Parameter Name="Form_no" Type="Int32" />
            <asp:Parameter Name="Dept_name" Type="String" />
            <asp:Parameter Name="No_Forms_Given" Type="Int32" />
            <asp:Parameter Name="Recd_Date" Type="DateTime" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="Emp_Name" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="No_of_forms" Type="Int32" />
            <asp:Parameter Name="No_Demand_quantity" Type="Int32" />
            <asp:Parameter Name="No_Distributed_Stock" Type="Int32" />
            <asp:Parameter Name="Actual_Stock" Type="Int32" />
            <asp:Parameter Name="Form_no" Type="Int32" />
            <asp:Parameter Name="Dept_name" Type="String" />
            <asp:Parameter Name="No_Forms_Given" Type="Int32" />
            <asp:Parameter Name="Recd_Date" Type="String" />
            <asp:Parameter Name="Emp_Name" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>

