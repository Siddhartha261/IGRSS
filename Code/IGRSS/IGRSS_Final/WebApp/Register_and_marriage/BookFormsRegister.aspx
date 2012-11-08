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
<asp:MultiView ID="Multiview_BookFormsRegister" runat="server" ActiveViewIndex="0">
<asp:View ID="view1_GridView" runat="server">
<hr /><br />
<h1>book forms register</h1>
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
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="No_of_forms" HeaderText="No_of_forms" 
                              SortExpression="No_of_forms" Visible="False" />
                          <asp:BoundField DataField="No_Demand_quantity" HeaderText="No_Demand_quantity" 
                              SortExpression="No_Demand_quantity" />
                          <asp:BoundField DataField="No_Distributed_Stock" 
                              HeaderText="No_Distributed_Stock" SortExpression="No_Distributed_Stock" />
                          <asp:BoundField DataField="Actual_Stock" HeaderText="Actual_Stock" 
                              SortExpression="Actual_Stock" />
                          <asp:BoundField DataField="Form_no" HeaderText="Form_no" 
                              SortExpression="Form_no" Visible="False" />
                          <asp:BoundField DataField="Dept_name" HeaderText="Dept_name" 
                              SortExpression="Dept_name" />
                          <asp:BoundField DataField="No_Forms_Given" HeaderText="No_Forms_Given" 
                              SortExpression="No_Forms_Given" />
                          <asp:BoundField DataField="Recd_Date" HeaderText="Recd_Date" 
                              SortExpression="Recd_Date" />
                          <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                              SortExpression="Remarks" Visible="False" />
                          <asp:BoundField DataField="Emp_Name" HeaderText="Emp_Name" 
                              SortExpression="Emp_Name" />
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
<h1>book forms register</h1>
  
    <asp:FormView ID="FormView_BookFormRegister" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_BookFormRegister" DefaultMode="Insert" 
        EnableModelValidation="True" onitemcommand="FormView_BookForm_ItemCommand" 
        oniteminserting="FormView_BookForm_ItemInserting">
        <EditItemTemplate>
            SrNo:
            <asp:Label ID="SrNoLabel1" runat="server" Text='<%# Eval("SrNo") %>' />
            <br />
            No_of_forms:
            <asp:TextBox ID="No_of_formsTextBox" runat="server" 
                Text='<%# Bind("No_of_forms") %>' />
            <br />
            No_Demand_quantity:
            <asp:TextBox ID="No_Demand_quantityTextBox" runat="server" 
                Text='<%# Bind("No_Demand_quantity") %>' />
            <br />
            No_Distributed_Stock:
            <asp:TextBox ID="No_Distributed_StockTextBox" runat="server" 
                Text='<%# Bind("No_Distributed_Stock") %>' />
            <br />
            Actual_Stock:
            <asp:TextBox ID="Actual_StockTextBox" runat="server" 
                Text='<%# Bind("Actual_Stock") %>' />
            <br />
            Form_no:
            <asp:TextBox ID="Form_noTextBox" runat="server" Text='<%# Bind("Form_no") %>' />
            <br />
            Dept_name:
            <asp:TextBox ID="Dept_nameTextBox" runat="server" 
                Text='<%# Bind("Dept_name") %>' />
            <br />
            No_Forms_Given:
            <asp:TextBox ID="No_Forms_GivenTextBox" runat="server" 
                Text='<%# Bind("No_Forms_Given") %>' />
            <br />
            Recd_Date:
            <asp:TextBox ID="Recd_DateTextBox" runat="server" 
                Text='<%# Bind("Recd_Date") %>' />
            <br />
            Remarks:
            <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
            <br />
            Emp_Name:
            <asp:TextBox ID="Emp_NameTextBox" runat="server" 
                Text='<%# Bind("Emp_Name") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
                        
			
			<table align="center" cellspacing="5">
			<tr>
			<td align="left">
			<table>
			 <tr><td>No Of Forms :</td><td><asp:TextBox ID="No_of_formsTextBox" runat="server" 
                Text='<%# Bind("No_of_forms") %>' /></td></tr>
			
            
            <tr><td>No Of Demand Quantity :</td><td><asp:TextBox ID="No_Demand_quantityTextBox" runat="server" 
                Text='<%# Bind("No_Demand_quantity") %>' /></td></tr>
            
            
            <tr><td> No Of Distributed Stock :</td><td><asp:TextBox ID="No_Distributed_StockTextBox" runat="server" 
                Text='<%# Bind("No_Distributed_Stock") %>' /></td></tr>
           
            
            <tr><td>Actual Stock :</td><td> <asp:TextBox ID="Actual_StockTextBox" runat="server" 
                Text='<%# Bind("Actual_Stock") %>' /></td></tr>
            
           </table>
		   </td>
		   <td align="right">
		   <table>
           <tr><td colspan="2" align="right"><h5> After Giving To Employee </h5></td></tr>
            <tr><td> Form No :</td><td> <asp:TextBox ID="Form_noTextBox" runat="server" Text='<%# Bind("Form_no") %>' /></td></tr>
           
           
            <tr><td>Name Of Department:</td><td>
                <asp:DropDownList ID="DropDownListDepartment" runat="server" 
                    DataSourceID="ObjectDataSourceDepartment" DataTextField="Name" 
                    DataValueField="Name">
                </asp:DropDownList>
                </td></tr>
            
            
            <tr><td> No Of Given Forms :</td><td><asp:TextBox ID="No_Forms_GivenTextBox" runat="server" 
                Text='<%# Bind("No_Forms_Given") %>' /></td></tr>
           
            
            <tr><td> Date Of Employee Received :</td><td> <asp:TextBox ID="Recd_DateTextBox" runat="server" 
                Text='<%# Bind("Recd_Date") %>' /></td></tr>
				
           <tr><td>Name Of Employee Received:</td><td> <asp:TextBox ID="Emp_NameTextBox" runat="server" 
                Text='<%# Bind("Emp_Name") %>' /></td></tr>
           
            <tr><td>Remarks:</td><td> <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' /></td></tr>
            </table>
			</td>
			</tr>
           
            
            
           
            <tr><td align="center" colspan="2"> 
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" CssClass="standardButton" />
                 &nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                CausesValidation="False" CommandName="reset" Text="Reset" 
                    onclientclick="resetTextFields();return false;" CssClass="standardButton" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                    CssClass="standardButton" /></td></tr>
            
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
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
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
    
    <asp:ObjectDataSource ID="ods_BookFormRegister" runat="server" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.BookFormsTableAdapters.BookFormsRegisterTableAdapter" 
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" 
        onselecting="ods_BookformRegister_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_No_of_forms" Type="Int32" />
            <asp:Parameter Name="Original_No_Demand_quantity" Type="Int32" />
            <asp:Parameter Name="Original_No_Distributed_Stock" Type="Int32" />
            <asp:Parameter Name="Original_Actual_Stock" Type="Int32" />
            <asp:Parameter Name="Original_Form_no" Type="Int32" />
            <asp:Parameter Name="Original_Dept_name" Type="String" />
            <asp:Parameter Name="Original_No_Forms_Given" Type="Int32" />
            <asp:Parameter Name="Original_Recd_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Remarks" Type="String" />
            <asp:Parameter Name="Original_Emp_Name" Type="String" />
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
            <asp:Parameter Name="Recd_Date" Type="DateTime" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="Emp_Name" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_No_of_forms" Type="Int32" />
            <asp:Parameter Name="Original_No_Demand_quantity" Type="Int32" />
            <asp:Parameter Name="Original_No_Distributed_Stock" Type="Int32" />
            <asp:Parameter Name="Original_Actual_Stock" Type="Int32" />
            <asp:Parameter Name="Original_Form_no" Type="Int32" />
            <asp:Parameter Name="Original_Dept_name" Type="String" />
            <asp:Parameter Name="Original_No_Forms_Given" Type="Int32" />
            <asp:Parameter Name="Original_Recd_Date" Type="DateTime" />
            <asp:Parameter Name="Original_Remarks" Type="String" />
            <asp:Parameter Name="Original_Emp_Name" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    
</asp:View>    
</asp:MultiView>
</asp:Content>

