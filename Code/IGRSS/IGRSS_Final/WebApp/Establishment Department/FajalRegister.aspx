<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="FajalRegister.aspx.cs" Inherits="Establishment_Department_FajalRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
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

        $(function () {
            var datePickers = ["From_DateTextBox", "To_DateTextBox"];
            for (var index = 0; index < datePickers.length; index++) {
                generateDatePicker(datePickers[index]);
            }
        });
 
    
    </script>
    <br />
    <br />
    <center>
        <asp:Panel ID="infoDiv" runat="server" Visible="false" CssClass="infoBar">
            &nbsp;<asp:Label ID="lblMsg" runat="server"></asp:Label></asp:Panel>
        <hr />
        <br />
    </center>
    <asp:MultiView ID="Multiview_Fajal" runat="server" ActiveViewIndex="0">
        <asp:View ID="ViewGrid" runat="server">
            <hr />
            <br />
            <h1>
                Fajal Register</h1>
            <table>
                <tr>
                    <td align="right" style="width: 641px;">
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" meta:resourcekey="lblllsResource1"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox Width="160" ID="txtFileNo" runat="server" meta:resourcekey="txtFileNoResource1"></asp:TextBox>
                    </td>
                    <td align="right">
                        <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search" meta:resourcekey="btnSearchAppNoResource1"
                            CssClass="standardButton" />
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="3">
                        <asp:GridView ID="GridView_Fajal" runat="server" AutoGenerateColumns="False" DataKeyNames="SrNo"
                            DataSourceID="ods_Fajal" EnableModelValidation="True" OnRowDeleted="GridView_Fajal_RowDeleted"
                            OnRowDeleting="GridView_Fajal_RowDeleting" OnRowEditing="GridView_Fajal_RowEditing">
                            <Columns>
                                <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" ReadOnly="True"
                                    SortExpression="SrNo" Visible="False" />
                                <asp:BoundField DataField="Details_Of_Designation" HeaderText="Details_Of_Designation"
                                    SortExpression="Details_Of_Designation" Visible="False" />
                                <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" SortExpression="Employee_Name" />
                                <asp:BoundField DataField="Designation" HeaderText="Designation" SortExpression="Designation" />
                                <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
                                <asp:BoundField DataField="Residence_District" HeaderText="Residence District" SortExpression="Residence_District" />
                                <asp:BoundField DataField="Current_Office" HeaderText="Current Office" SortExpression="Current_Office" />
                                <asp:BoundField DataField="From_Date" HeaderText="From Date" SortExpression="From_Date" />
                                <asp:BoundField DataField="To_Date" HeaderText="To Date" SortExpression="To_Date" />
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:ImageButton ID="ImageButton1" CommandName="Edit" runat="server" ImageUrl="~/Styles/css/sunny/images/edit.png" />
                                                </td>
                                                <td>
                                                    <asp:ImageButton ID="ImageButton2" CommandName="Delete" runat="server" ImageUrl="~/Styles/css/sunny/images/deletecross.png" />
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
            <asp:LinkButton ID="Button_new" runat="server" Text="New" OnClick="Button_new_Click"
                CssClass="standardButton" AccessKey="n" />
        </asp:View>
        <asp:View ID="Formview" runat="server">
            <center>
                <h1>
                    Fajal Register</h1>
                <asp:FormView ID="FormView_Fajal" runat="server" DataKeyNames="SrNo" DataSourceID="ods_Fajal"
                    EnableModelValidation="True" DefaultMode="Insert" OnItemCommand="FormView_Fajal_ItemCommand"
                    OnItemInserting="FormView_Fajal_ItemInserting" OnItemInserted="FormView_Fajal_ItemInserted"
                    OnItemUpdated="FormView_Fajal_ItemUpdated" 
                    OnItemUpdating="FormView_Fajal_ItemUpdating" style="margin-right: 0px">
                    <EditItemTemplate>
                        <table align="center">
                            <tr align="left">
                                <td>
                                    Details Of Designation:
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ListBox_Designation"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:ListBox ID="ListBox_Designation" runat="server" DataSourceID="ods_Designation"
                                        DataTextField="Description" DataValueField="Description" Width="160px"></asp:ListBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Employee Name:
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList_EmployeeName"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_EmployeeName" runat="server" DataSourceID="ods_EmployeeName"
                                        DataTextField="Employee_Name" DataValueField="Employee_Name" Width="160px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Designation:
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList_Designation"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_Designation" runat="server" DataSourceID="ods_Designation"
                                        DataTextField="Name" DataValueField="Name" Width="160px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Grade:
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList_Grade"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_Grade" runat="server" DataSourceID="ods_Grade"
                                        DataTextField="Grade_Name" DataValueField="Grade_Name" Width="160px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Residence District:
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList_ResidenceDistrict"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_ResidenceDistrict" runat="server" 
                                        DataSourceID="ods_ResidenceDistrict" DataTextField="District_Name" 
                                        DataValueField="District_Name" Width="160px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Current Office:
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList_CurrentOffice"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_CurrentOffice" runat="server" 
                                        DataSourceID="ods_CurrentOffice" DataTextField="OfficeName" 
                                        DataValueField="OfficeName" Width="160px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    From Date:
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="From_DateTextBox" runat="server" Text='<%# Bind("From_Date") %>'
                                        Width="160px" />
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    To Date:
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="To_DateTextBox" runat="server" Text='<%# Bind("To_Date") %>' Width="160px" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="3">
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                        Text="Update" CssClass="standardButton" />
                                    &nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="False" CommandName="Reset"
                                        Text="Reset" CssClass="standardButton" OnClientClick="resetTextFields();return false;" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Back" Text="Back" CssClass="standardButton" />
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table align="center">
                            <tr align="left">
                                <td>
                                    Details Of Designation:
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ListBox_Designation"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:ListBox ID="ListBox_Designation" runat="server" DataSourceID="ods_Designation"
                                        DataTextField="Description" DataValueField="Description" Width="160px"></asp:ListBox>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Employee Name:
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList_EmployeeName"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_EmployeeName" runat="server" DataSourceID="ods_EmployeeName"
                                        DataTextField="Employee_Name" DataValueField="Employee_Name" Width="160px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Designation:
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList_Designation"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_Designation" runat="server" DataSourceID="ods_Designation"
                                        DataTextField="Name" DataValueField="Name" Width="160px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Grade:
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DropDownList_Grade"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_Grade" runat="server" DataSourceID="ods_Grade"
                                        DataTextField="Grade_Name" DataValueField="Grade_Name" Width="160px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Residence District:
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList_ResidenceDistrict"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_ResidenceDistrict" runat="server" 
                                        DataSourceID="ods_ResidenceDistrict" DataTextField="District_Name" 
                                        DataValueField="District_Name" Width="160px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    Current Office:
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="DropDownList_CurrentOffice"
                                        ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList_CurrentOffice" runat="server" 
                                        DataSourceID="ods_CurrentOffice" DataTextField="OfficeName" 
                                        DataValueField="OfficeName" Width="160px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    From Date:
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="From_DateTextBox" runat="server" Text='<%# Bind("From_Date") %>'
                                        Width="160px" />
                                </td>
                            </tr>
                            <tr align="left">
                                <td>
                                    To Date:
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:TextBox ID="To_DateTextBox" runat="server" Text='<%# Bind("To_Date") %>' Width="160px" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="3">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                        Text="Insert" CssClass="standardButton" />
                                    &nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="False" CommandName="Reset"
                                        Text="Reset" CssClass="standardButton" OnClientClick="resetTextFields();return false;" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Back" Text="Back" CssClass="standardButton" />
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        SrNo:
                        <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
                        <br />
                        Details_Of_Designation:
                        <asp:Label ID="Details_Of_DesignationLabel" runat="server" Text='<%# Bind("Details_Of_Designation") %>' />
                        <br />
                        Employee_Name:
                        <asp:Label ID="Employee_NameLabel" runat="server" Text='<%# Bind("Employee_Name") %>' />
                        <br />
                        Designation:
                        <asp:Label ID="DesignationLabel" runat="server" Text='<%# Bind("Designation") %>' />
                        <br />
                        Grade:
                        <asp:Label ID="GradeLabel" runat="server" Text='<%# Bind("Grade") %>' />
                        <br />
                        Residence_District:
                        <asp:Label ID="Residence_DistrictLabel" runat="server" Text='<%# Bind("Residence_District") %>' />
                        <br />
                        Current_Office:
                        <asp:Label ID="Current_OfficeLabel" runat="server" Text='<%# Bind("Current_Office") %>' />
                        <br />
                        From_Date:
                        <asp:Label ID="From_DateLabel" runat="server" Text='<%# Bind("From_Date") %>' />
                        <br />
                        To_Date:
                        <asp:Label ID="To_DateLabel" runat="server" Text='<%# Bind("To_Date") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="ods_Grade" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="IGRSS.DataAccessLayer.GradeTableAdapters.GradeTableAdapter"
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_SrNo" Type="Int32" />
                        <asp:Parameter Name="Original_Grade_Name" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Grade_Name" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Grade_Name" Type="String" />
                        <asp:Parameter Name="Original_SrNo" Type="Int32" />
                        <asp:Parameter Name="Original_Grade_Name" Type="String" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <asp:ObjectDataSource ID="ods_EmployeeName" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                    
                    TypeName="IGRSS.DataAccessLayer.HistoryCardTableAdapters.HistroryCardTableAdapter">
                </asp:ObjectDataSource>
                <br />
                <asp:ObjectDataSource ID="ods_ResidenceDistrict" runat="server" 
                    DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="IGRSS.DataAccessLayer.ResidenceDistrictTableAdapters.DistrictMasterTableAdapter" 
                    UpdateMethod="Update">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_SrNo" Type="Int32" />
                        <asp:Parameter Name="Original_District_Name" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="District_Name" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="District_Name" Type="String" />
                        <asp:Parameter Name="Original_SrNo" Type="Int32" />
                        <asp:Parameter Name="Original_District_Name" Type="String" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
            </center>
            <asp:ObjectDataSource ID="ods_Designation" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="IGRSS.DataAccessLayer.DesignationMasterTableAdapters.DesignationMasterTableAdapter"
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter DbType="Guid" Name="Original_DesignationID" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                    <asp:Parameter Name="Original_Description" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Guid" Name="DesignationID" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter DbType="Guid" Name="Original_DesignationID" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                    <asp:Parameter Name="Original_Description" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ods_Fajal" runat="server" DeleteMethod="DeleteQuery" InsertMethod="Insert"
                SelectMethod="GetDataBy" TypeName="IGRSS.DataAccessLayer.FajalTableAdapters.FajalRegisterTableAdapter"
                UpdateMethod="UpdateQuery" OnSelecting="ods_Fajal_Selecting" OnDeleting="ods_Fajal_Deleting">
                <DeleteParameters>
                    <asp:Parameter Name="SrNo" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Details_Of_Designation" Type="String" />
                    <asp:Parameter Name="Employee_Name" Type="String" />
                    <asp:Parameter Name="Designation" Type="String" />
                    <asp:Parameter Name="Grade" Type="String" />
                    <asp:Parameter Name="Residence_District" Type="String" />
                    <asp:Parameter Name="Current_Office" Type="String" />
                    <asp:Parameter Name="From_Date" Type="DateTime" />
                    <asp:Parameter Name="To_Date" Type="DateTime" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" PropertyName="Text"
                        Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Details_Of_Designation" Type="String" />
                    <asp:Parameter Name="Employee_Name" Type="String" />
                    <asp:Parameter Name="Designation" Type="String" />
                    <asp:Parameter Name="Grade" Type="String" />
                    <asp:Parameter Name="Residence_District" Type="String" />
                    <asp:Parameter Name="Current_Office" Type="String" />
                    <asp:Parameter Name="From_Date" Type="DateTime" />
                    <asp:Parameter Name="To_Date" Type="DateTime" />
                    <asp:Parameter Name="SrNo" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ods_CurrentOffice" runat="server" 
                DeleteMethod="Delete" InsertMethod="Insert" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="IGRSS.DataAccessLayer.officenameTableAdapters.OfficesTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter DbType="Guid" Name="Original_OfficeId" />
                    <asp:Parameter Name="Original_OfficeName" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Guid" Name="OfficeId" />
                    <asp:Parameter Name="OfficeName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="OfficeName" Type="String" />
                    <asp:Parameter DbType="Guid" Name="Original_OfficeId" />
                    <asp:Parameter Name="Original_OfficeName" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
