<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/IGRSS_Default.master" CodeFile="WorkSheetRegister.aspx.cs" Inherits="LatestPages_WorkSheetRegister" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="server">
&nbsp;<script language="javascript">

   

    function generateDatePicker(id) {
        $('input[id*="' + id + '"]').datepicker({
            showOn: "both",
            buttonImage: "/WebApp/Styles/css/sunny/images/calendar.gif",
            buttonImageOnly: true
        });
    }
    $(function () {
        $('input[id*="Inward_NoTextBox"]').keydown(function (event) {
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

        $('input[id*="Inward_NoTextBox"]').blur(function () {
            if (isNaN($('input[id*="Inward_NoTextBox"]').val()) || $('input[id*="Inward_NoTextBox"]').val().length == 0) { $('input[id*="Inward_NoTextBox"]').val(''); return; }
            var formattedNumber = 'IGR\/' + $('input[id*="Inward_NoTextBox"]').val() + '\/' + new Date().getFullYear();
            $('input[id*="Inward_NoTextBox"]').val(formattedNumber.toString());
        });

        var datePickers = ["Work_Disposal_DateTextBox"];
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
<asp:MultiView ID="MultiView_worksheet" runat="server" ActiveViewIndex="0">
<asp:View ID="viewGrid" runat="server">
<h1>WORKSHEET REGISTER</h1>
<table>
<tr>
                <td align="right" style="width: 641px">
                    <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                        meta:resourcekey="lblllsResource1"></asp:Label>
                    </td>
                <td>
                    <asp:TextBox ID="txtFileNo" runat="server" MaxLength="15" 
                        meta:resourcekey="txtFileNoResource1" Width="160px" >
                        </asp:TextBox> 
                </td>
                <td>
                    <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search" 
                        meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />           
                </td>
            </tr>
    <tr>
        <td align="right" colspan="3">
            <asp:GridView ID="GridView_worksheet" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
                DataSourceID="ods_worksheet" EnableModelValidation="True" 
                onrowdeleted="GridView_worksheet_RowDeleted" 
                onrowdeleting="GridView_worksheet_RowDeleting" 
                onrowediting="GridView_worksheet_RowEditing">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                        SortExpression="ID" Visible="False" InsertVisible="False" />
                    <asp:BoundField DataField="WorkSheet_No" HeaderText="WorkSheet No" 
                        SortExpression="WorkSheet_No" />
                    <asp:BoundField DataField="Inward_No" HeaderText="Inward No" 
                        SortExpression="Inward_No" />
                    <asp:BoundField DataField="Name_Of_Person" HeaderText="Name Of Person" 
                        SortExpression="Name_Of_Person" />
                    <asp:BoundField DataField="Letter_Details" HeaderText="Letter Details" 
                        SortExpression="Letter_Details" Visible="False" />
                    <asp:BoundField DataField="Work_Disposal_Date" HeaderText="Work Disposal Date" 
                        SortExpression="Work_Disposal_Date" />
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
    <tr>
        <td align="right" colspan="3" style="text-align: left;">
            <asp:LinkButton ID="Button_new" runat="server" Text="New" 
                onclick="Button_new_Click" CssClass="standardButton" />
        </td>
    </tr>
</table>
</asp:View>

<asp:View ID="Worksheetregister" runat="server">
<h1>WORKSHEET REGISTER</h1>

    <asp:ObjectDataSource ID="ods_worksheet" runat="server" SelectMethod="GetDataBy" 
        
        
        TypeName="IGRSS.DataAccessLayer.WorksheetregisterTableAdapters.WorkSheetRegisterTableAdapter" 
        DeleteMethod="DeleteQuery" InsertMethod="Insert" UpdateMethod="UpdateQuery" 
        onselecting="ods_worksheet_Selecting" ondeleting="ods_worksheet_Deleting">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="WorkSheet_No" Type="Int32" />
            <asp:Parameter Name="Inward_No" Type="String" />
            <asp:Parameter Name="Name_Of_Person" Type="String" />
            <asp:Parameter Name="Letter_Details" Type="String" />
            <asp:Parameter Name="Work_Disposal_Date" Type="DateTime" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="WorkSheet_No" Type="Int32" />
            <asp:Parameter Name="Inward_No" Type="String" />
            <asp:Parameter Name="Name_Of_Person" Type="String" />
            <asp:Parameter Name="Letter_Details" Type="String" />
            <asp:Parameter Name="Work_Disposal_Date" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <center>
        <asp:FormView ID="FormView_worksheet" Width="50%" runat="server" DataKeyNames="ID" 
        DataSourceID="ods_worksheet" EnableModelValidation="True" 
        DefaultMode="Insert" oniteminserted="FormView_worksheet_ItemInserted" 
        onitemupdated="FormView_worksheet_ItemUpdated" 
            onitemcommand="FormView_worksheet_ItemCommand">
        <EditItemTemplate>
                <table>
        <tr><td>WorkSheet No:</td>
		    <td><asp:TextBox ID="WorkSheet_NoTextBox" runat="server" 
                Text='<%# Bind("WorkSheet_No") %>' Width="160px" />
			</td>
		</tr>		
           
		<tr><td>Inward No:</td>
		    <td><asp:TextBox ID="Inward_NoTextBox" runat="server" 
                Text='<%# Bind("Inward_No") %>' Width="160px" />
			</td>
		</tr>        
            				
        <tr><td>Name Of Person:</td>
		    <td><asp:TextBox ID="Name_Of_PersonTextBox" runat="server" 
                Text='<%# Bind("Name_Of_Person") %>' Width="160px" />
			</td>
		</tr>          
            			
        <tr><td>Letter Details:</td>
		    <td><asp:TextBox ID="Letter_DetailsTextBox" runat="server" Height="60px" 
                Text='<%# Bind("Letter_Details") %>' TextMode="MultiLine" Width="160px" />
			</td>
		</tr>           
            				
        <tr><td>Work Disposal Date:</td>
		    <td><asp:TextBox ID="Work_Disposal_DateTextBox" runat="server" 
                Text='<%# Bind("Work_Disposal_Date") %>' Width="140px" />
			</td>
		</tr>           
            			
        <tr><td colspan=2 align="center">
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" CssClass="standardButton" />
			&nbsp;<asp:LinkButton ID="ResetButton"  runat="server" 
                CausesValidation="False" CommandName="Reset" Text="Reset" 
                onclientclick="resetTextFields();return false;" 
                CssClass="standardButton" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Back" Text="Back" 
                CssClass="standardButton" />
			</td>
		</tr>	
	</table>			
            
        </EditItemTemplate>
        <InsertItemTemplate>
                <table>
        <tr><td>WorkSheet No:</td>
		    <td><asp:TextBox ID="WorkSheet_NoTextBox" runat="server" 
                Text='<%# Bind("WorkSheet_No") %>' Width="160px" />
			</td>
		</tr>		
           
		<tr><td>Inward No:</td>
		    <td><asp:TextBox ID="Inward_NoTextBox" runat="server" 
                Text='<%# Bind("Inward_No") %>' Width="160px" />
			</td>
		</tr>        
            				
        <tr><td>Name Of Person:</td>
		    <td><asp:TextBox ID="Name_Of_PersonTextBox" runat="server" 
                Text='<%# Bind("Name_Of_Person") %>' Width="160px" />
			</td>
		</tr>          
            			
        <tr><td>Letter Details:</td>
		    <td><asp:TextBox ID="Letter_DetailsTextBox" runat="server" Height="60px" 
                Text='<%# Bind("Letter_Details") %>' TextMode="MultiLine" Width="160px" />
			</td>
		</tr>           
            				
        <tr><td>Work Disposal Date:</td>
		    <td><asp:TextBox ID="Work_Disposal_DateTextBox" runat="server" 
                Text='<%# Bind("Work_Disposal_Date") %>' Width="140px" />
			</td>
		</tr>           
            			
        <tr><td colspan=2 align="center">
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" CssClass="standardButton" 
                onclientclick="checkForEmptyFields();" />
			&nbsp;<asp:LinkButton ID="ResetButton"  runat="server" 
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
            ID:
            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            WorkSheet_No:
            <asp:Label ID="WorkSheet_NoLabel" runat="server" 
                Text='<%# Bind("WorkSheet_No") %>' />
            <br />
            Inward_No:
            <asp:Label ID="Inward_NoLabel" runat="server" 
                Text='<%# Bind("Inward_No") %>' />
            <br />
            Name_Of_Person:
            <asp:Label ID="Name_Of_PersonLabel" runat="server" 
                Text='<%# Bind("Name_Of_Person") %>' />
            <br />
            Letter_Details:
            <asp:Label ID="Letter_DetailsLabel" runat="server" 
                Text='<%# Bind("Letter_Details") %>' />
            <br />
            Work_Disposal_Date:
            <asp:Label ID="Work_Disposal_DateLabel" runat="server" 
                Text='<%# Bind("Work_Disposal_Date") %>' />
            <br />
        </ItemTemplate>
    </asp:FormView></center>
    

</asp:View> 
</asp:MultiView> 
</asp:Content>