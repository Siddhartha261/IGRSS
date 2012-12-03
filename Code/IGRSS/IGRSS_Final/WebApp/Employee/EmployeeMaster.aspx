<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="EmployeeMaster.aspx.cs" Inherits="Employee_EmployeeMaster" Title="Employee Details" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:MultiView ID="MvEmployeeMaster" runat="server" ActiveViewIndex="1">
        <asp:View ID="View1" runat="server">
            <asp:FormView ID="FvemployeeMaster" runat="server" DataSourceID="OdsSelectEmployeeByID"
                DataKeyNames="EmployeeID" DefaultMode="Insert" OnItemInserting="FvemployeeMaster_ItemInserting"
                OnDataBound="FvemployeeMaster_DataBound" OnItemUpdating="FvemployeeMaster_ItemUpdating"
                OnItemInserted="FvemployeeMaster_ItemInserted" meta:resourcekey="FvemployeeMasterResource1">
                <InsertItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblEmployeeDetailsIns" runat="server" meta:resourcekey="lblEmployeeDetailsIns"
                                    SkinID="SubHeading" Text="Employee Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblEmployeeNoIns" runat="server" meta:resourcekey="lblEmployeeNoIns"
                                    Text="Employee Number"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtEmployeeNoIns" MaxLength="15" runat="server" meta:resourcekey="EmployeeNoIns"
                                    Text='<%# Bind("EmployeeNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvEmployeeNoIns" runat="server" ControlToValidate="txtEmployeeNoIns"
                                    ErrorMessage="Please Enter Employee No" meta:resourcekey="rfvEmployeeNoInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regEmployeeNoIns" runat="server" ControlToValidate="txtEmployeeNoIns"
                                    ErrorMessage="Enter Valid Employee No" ValidationExpression="<%$ Resources:ValidationRegx, AlphaNum %>" meta:resourcekey="regEmployeeNoInsResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn" align="right">
                                <asp:Label ID="lblDateOfBirthIns" runat="server" meta:resourcekey="lblDateOfBirthIns"
                                    Text="Date Of Birth"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDateOfBirthIns" runat="server" meta:resourcekey="txtReceiptNumberIns"
                                    SkinID="Calendar" Text='<%# Bind("DateOfBirth") %>' ReadOnly="True"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalendar3" runat="server" Control="txtDateOfBirthIns" To-Date=""
                                    To-Today="True" meta:resourcekey="PopCalendar3Resource1" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvDateOfBirthIns" runat="server" ControlToValidate="txtDateOfBirthIns"
                                    ErrorMessage="Please Enter Date Of Birth" meta:resourcekey="rfvDateOfBirthInsResource1">
							*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="labelColumn" colspan="2">
                                <asp:Label ID="lblFirstNameIns" runat="server" meta:resourcekey="lblFirstNameIns"
                                    Text="First Name"></asp:Label>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn" colspan="2">
                                <asp:Label ID="lblMiddleNameIns" runat="server" meta:resourcekey="lblMiddleNameIns"
                                    Text="Middle Name/LastName"></asp:Label></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtFirstNameIns" runat="server" meta:resourcekey="txtFirstNameIns"
                                    Text='<%# Bind("FirstName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtMiddleNameIns" runat="server" meta:resourcekey="txtMiddleNameIns"
                                    Text='<%# Bind("MiddleName") %>'></asp:TextBox></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" colspan="2">
                                <asp:Label ID="lblPostalAddressIns" runat="server" meta:resourcekey="lblPostalAddressIns"
                                    Text="Postal Address"></asp:Label>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn" colspan="2">
                                <asp:Label ID="lblPermanentAddressIns" runat="server" meta:resourcekey="lblPermanentAddressIns"
                                    Text="Permanent Address"></asp:Label>
                                <td class="validationColumn">
                                </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtPostalAddressIns" runat="server" meta:resourcekey="txtPostalAddressIns"
                                    Text='<%# Bind("PostalAddress") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtPermanentAddressIns" runat="server" meta:resourcekey="txtPermanentAddressIns"
                                    Text='<%# Bind("PermanentAddress") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblFatherNameIns" runat="server" meta:resourcekey="lblFatherNameIns"
                                    Text="Father Name"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtFatherNameIns" runat="server" meta:resourcekey="txtFatherNameIns"
                                    Text='<%# Bind("FatherName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RegularExpressionValidator ID="regFatherName" runat="server" ControlToValidate="txtFatherNameIns"
                                    ErrorMessage="Enter Valid Father Name" ValidationExpression="<%$ Resources:ValidationRegx, Name %>" meta:resourcekey="regFatherNameResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblHeightIns" runat="server" meta:resourcekey="lblHeightIns" Text="Height"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtHeightIns" runat="server" meta:resourcekey="txtHeightIns" Text='<%# Bind("Height") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvHeighiIns" runat="server" ControlToValidate="txtHeightIns"
                                    ErrorMessage="Please Enter Height" meta:resourcekey="rfvHeighiInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="rngHeightIns" runat="server" MaximumValue="9.99" MinimumValue="0.0"
                                    ControlToValidate="txtHeightIns" ErrorMessage="Height Should be Less then 10"
                                    Type="Double" meta:resourcekey="rngHeightInsResource1">*</asp:RangeValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblVisibleMarksIns" runat="server" meta:resourcekey="lblVisibleMarksIns"
                                    Text="VisibleMarks"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtVisibleMarksIns" runat="server" meta:resourcekey="txtVisibleMarksIns"
                                    Text='<%# Bind("VisibleMarks") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblboxQualificationIns" runat="server" meta:resourcekey="lblboxQualificationIns"
                                    Text="Qualification"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:ListBox ID="lboxQualificationIns" runat="server" DataSourceID="OdsQualificationMaster"
                                    DataTextField="Name" DataValueField="QualificationID" SelectionMode="Multiple" ></asp:ListBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblQualificationDetailsIns" runat="server" meta:resourcekey="lblQualificationDetailsIns"
                                    SkinID="SubHeading" Text="Office Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label7" runat="server" meta:resourcekey="lblReceiptNumberIns" Text="Office Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlOfficeNameIns" runat="server" DataSourceID="OdsOfficeMaster"
                                    DataTextField="OfficeName" DataValueField="OfficeID" SelectedValue='<%# Bind("OfficeID") %>'
                                    Width="157px" meta:resourcekey="ddlOfficeNameInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDepartmentIns" runat="server" meta:resourcekey="LblDepartmentIns"
                                    Text="Department"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDepartmentIns" runat="server" DataSourceID="OdsDepartmentMaster"
                                    DataTextField="Name" DataValueField="DepartmentID" SelectedValue='<%# Bind("DepartmentID") %>'
                                    Width="157px" meta:resourcekey="ddlDepartmentInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionIns" runat="server" meta:resourcekey="lblDescriptionIns"
                                    Text="Designation"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDescriptionIns" runat="server" DataSourceID="OdsDesignationMaster"
                                    DataTextField="Description" DataValueField="DesignationID" SelectedValue='<%# Bind("DesignationID") %>'
                                    Width="157px" meta:resourcekey="ddlDescriptionInsResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="Label13" runat="server" meta:resourcekey="lblReceiptNumberIns" Text="Joining Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtStartDateIns" runat="server" meta:resourcekey="txtReceiptNumberIns"
                                    SkinID="Calendar" Text='<%# Bind("StartDate") %>' ReadOnly="True"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCaltxtStartDateIns" runat="server" Control="txtStartDateIns" meta:resourcekey="PopCaltxtStartDateInsResource1" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvStartDateIns" runat="server" ControlToValidate="txtStartDateIns"
                                    ErrorMessage="Please Enter Start Date" meta:resourcekey="rfvStartDateInsResource1">
							*</asp:RequiredFieldValidator>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblSalaryIns" runat="server" meta:resourcekey="lblSalaryIns" Text="Salary"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtSalaryIns" MaxLength="7" runat="server" meta:resourcekey="txtSalaryIns"
                                    Text='<%# Bind("Salary") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvSalaryIns" runat="server" ControlToValidate="txtSalaryIns"
                                    ErrorMessage="Please Enter Salary" meta:resourcekey="rfvSalaryInsResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regSalaryIns" runat="server" ControlToValidate="txtSalaryIns"
                                    ErrorMessage="Enter Valid Salary" ValidationExpression="<%$ Resources:ValidationRegx, Salary %>" meta:resourcekey="regSalaryInsResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAllowancesIns" runat="server" meta:resourcekey="lblAllowancesIns"
                                    Text="Allowances"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAllowancesIns" MaxLength="7" runat="server" meta:resourcekey="txtAllowancesIns"
                                    Text='<%# Bind("Allowances") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvAllowancesIns" runat="server" ControlToValidate="txtAllowancesIns"
                                    ErrorMessage="Please Enter Allowances" meta:resourcekey="rfvAllowancesInsResource1"></asp:RequiredFieldValidator><%--<asp:RegularExpressionValidator ID="regAllowancesIns"
                                    runat="server" ControlToValidate="txtAllowancesIns" ErrorMessage="Enter Valid Allowances"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Allowance %>" meta:resourcekey="regAllowancesInsResource1">*</asp:RegularExpressionValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" align="right">
                                <asp:Button ID="SaveFvemployeeIns" runat="server" CommandName="Insert" Text="Save"
                                    OnClick="SaveFvemployeeIns_Click" meta:resourcekey="SaveFvemployeeInsResource1" />
                                <asp:Button ID="CancelFvemployeeIns" runat="server" CommandName="Cancel" CausesValidation="False"
                                    Text="Cancel" OnClick="CancelFvemployeeUpd_Click" meta:resourcekey="CancelFvemployeeInsResource1" />
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblEmployeeDetailsUpd" runat="server" meta:resourcekey="lblEmployeeDetailsUpd"
                                    SkinID="SubHeading" Text="Employee Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblEmployeeNoUpd" runat="server" meta:resourcekey="lblEmployeeNoUpd"
                                    Text="Employee Number"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtEmployeeNoUpd" MaxLength="15" runat="server" meta:resourcekey="txtEmployeeNoUpd"
                                    Text='<%# Bind("EmployeeNo") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvEmployeeNoUpd" runat="server" ControlToValidate="txtEmployeeNoUpd"
                                    ErrorMessage="Please Enter Employee No" meta:resourcekey="rfvEmployeeNoUpdResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regEmployeeNoUpd" runat="server" ControlToValidate="txtEmployeeNoUpd"
                                    ErrorMessage="Enter Valid Employee No" ValidationExpression="<%$ Resources:ValidationRegx, AlphaNum %>" meta:resourcekey="regEmployeeNoUpdResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDateOfBirthUpd" runat="server" meta:resourcekey="lblDateOfBirthUpd"
                                    Text="Date Of Birth"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDateOfBirthUpd" runat="server" meta:resourcekey="txtReceiptNumberUpd"
                                    SkinID="Calendar" Text='<%# Bind("DateOfBirth") %>' ReadOnly="True"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalendar3" runat="server" Control="txtDateOfBirthUpd" To-Date=""
                                    To-Today="True" meta:resourcekey="PopCalendar3Resource3" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvDateOfBirthUpd" runat="server" ControlToValidate="txtDateOfBirthUpd"
                                    ErrorMessage="Please Enter Date Of Birth" meta:resourcekey="rfvDateOfBirthUpdResource1">
							*</asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="labelColumn" colspan="2">
                                <asp:Label ID="lblFirstNameUpd" runat="server" meta:resourcekey="lblFirstNameUpd"
                                    Text="First Name"></asp:Label>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn" colspan="2">
                                <asp:Label ID="lblMiddleNameUpd" runat="server" meta:resourcekey="lblMiddleNameUpd"
                                    Text="Middle Name/LastName"></asp:Label></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtFirstNameUpd" runat="server" meta:resourcekey="txtFirstNameUpd"
                                    Text='<%# Bind("FirstName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtMiddleNameUpd" runat="server" meta:resourcekey="txtMiddleNameUpd"
                                    Text='<%# Bind("MiddleName") %>'></asp:TextBox></td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" colspan="2">
                                <asp:Label ID="lblPostalAddressUpd" runat="server" meta:resourcekey="lblPostalAddressUpd"
                                    Text="Postal Address"></asp:Label>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn" colspan="2">
                                <asp:Label ID="lblPermanentAddressUpd" runat="server" meta:resourcekey="lblPermanentAddressUpd"
                                    Text="Permanent Address"></asp:Label>
                                <td class="validationColumn">
                                </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:TextBox ID="txtPostalAddressUpd" runat="server" meta:resourcekey="txtPostalAddressUpd"
                                    Text='<%# Bind("PostalAddress") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td colspan="2">
                                <asp:TextBox ID="txtPermanentAddressUpd" runat="server" meta:resourcekey="txtPermanentAddressUpd"
                                    Text='<%# Bind("PermanentAddress") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblFatherNameUpd" runat="server" meta:resourcekey="lblFatherNameUpd"
                                    Text="Father Name"></asp:Label>
                            </td>
                            <td class="textColumn" colspan="4">
                                <asp:TextBox ID="txtFatherNameUpd" runat="server" meta:resourcekey="txtFatherNameUpd"
                                    Text='<%# Bind("FatherName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RegularExpressionValidator ID="regFatherName" runat="server" ControlToValidate="txtFatherNameUpd"
                                    ErrorMessage="Enter Valid Father Name" ValidationExpression="<%$ Resources:ValidationRegx, Name %>" meta:resourcekey="regFatherNameResource2">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblHeightUpd" runat="server" meta:resourcekey="lblHeightUpd" Text="Height"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtHeightUpd" runat="server" meta:resourcekey="txtHeightUpd" Text='<%# Bind("Height") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvHeighiUpd" runat="server" ControlToValidate="txtHeightUpd"
                                    ErrorMessage="Please Enter Height" meta:resourcekey="rfvHeighiUpdResource1">*</asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="rngHeightUpd" runat="server" MaximumValue="9.99" MinimumValue="0.0"
                                    ControlToValidate="txtHeightUpd" ErrorMessage="Height Should be Less then 10"
                                    Type="Double" meta:resourcekey="rngHeightUpdResource1">*</asp:RangeValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblVisibleMarksUpd" runat="server" meta:resourcekey="lblVisibleMarksUpd"
                                    Text="VisibleMarks"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtVisibleMarksUpd" runat="server" meta:resourcekey="txtVisibleMarksUpd"
                                    Text='<%# Bind("VisibleMarks") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lbllboxQualificationUpd" runat="server" meta:resourcekey="lbllboxQualificationUpd"
                                    Text="Qualification"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:ListBox ID="lboxQualificationUpd" runat="server" DataSourceID="OdsQualificationMaster"
                                    DataTextField="Name" DataValueField="QualificationID" SelectionMode="Multiple" meta:resourcekey="lboxQualificationUpdResource1"></asp:ListBox>
                            </td>
                            <td class="validationColumn" colspan="4">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblQualificationDetailsUpd" runat="server" meta:resourcekey="lblQualificationDetailsUpd"
                                    SkinID="SubHeading" Text="Office Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label7" runat="server" meta:resourcekey="lblReceiptNumberUpd" Text="Office Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlOfficeNameUpd" runat="server" DataSourceID="OdsOfficeMaster"
                                    DataTextField="OfficeName" DataValueField="OfficeID" SelectedValue='<%# Bind("OfficeID") %>'
                                    Width="157px" meta:resourcekey="ddlOfficeNameUpdResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDepartmentUpd" runat="server" meta:resourcekey="LblDepartmentUpd"
                                    Text="Department"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDepartmentUpd" runat="server" DataSourceID="OdsDepartmentMaster"
                                    DataTextField="Name" DataValueField="DepartmentID" SelectedValue='<%# Bind("DepartmentID") %>'
                                    Width="157px" meta:resourcekey="ddlDepartmentUpdResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionUpd" runat="server" meta:resourcekey="lblDescriptionUpd"
                                    Text="Designation"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDescriptionUpd" runat="server" DataSourceID="OdsDesignationMaster"
                                    DataTextField="Description" DataValueField="DesignationID" SelectedValue='<%# Bind("DesignationID") %>'
                                    Width="157px" meta:resourcekey="ddlDescriptionUpdResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="Label1" runat="server" meta:resourcekey="lblReceiptNumberUpd" Text="Joining Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="TextBox1" runat="server" meta:resourcekey="txtReceiptNumberUpd"
                                    SkinID="Calendar" Text='<%# Bind("StartDate") %>' ReadOnly="True"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalendar1" runat="server" Control="txtStartDateUpd" meta:resourcekey="PopCalendar1Resource1" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtStartDateUpd"
                                    ErrorMessage="Please Enter Start Date" meta:resourcekey="RequiredFieldValidator1Resource1">
							*</asp:RequiredFieldValidator>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblSalaryUpd" runat="server" meta:resourcekey="lblSalaryUpd" Text="Salary"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtSalaryUpd" MaxLength="7" runat="server" meta:resourcekey="txtSalaryUpd"
                                    Text='<%# Bind("Salary") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvSalaryUpd" runat="server" ControlToValidate="txtSalaryUpd"
                                    ErrorMessage="Please Enter Salary" meta:resourcekey="rfvSalaryUpdResource1">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regSalaryUpd" runat="server" ControlToValidate="txtSalaryUpd"
                                    ErrorMessage="Enter Valid Salary" ValidationExpression="<%$ Resources:ValidationRegx, Salary %>" meta:resourcekey="regSalaryUpdResource1">*</asp:RegularExpressionValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAllowancesUpd" runat="server" meta:resourcekey="lblAllowancesUpd"
                                    Text="Allowances"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAllowancesUpd" MaxLength="7" runat="server" meta:resourcekey="txtAllowancesUpd"
                                    Text='<%# Bind("Allowances") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvAllowancesUpd" runat="server" ControlToValidate="txtAllowancesUpd"
                                    ErrorMessage="Please Enter Allowances" meta:resourcekey="rfvAllowancesUpdResource1"></asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="regAllowancesUpd"
                                    runat="server" ControlToValidate="txtAllowancesUpd" ErrorMessage="Enter Valid Allowances"
                                    ValidationExpression="<%$ Resources:ValidationRegx, Allowance %>" meta:resourcekey="regAllowancesUpdResource1">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label13" runat="server" meta:resourcekey="lblReceiptNumberUpd" Text="Start Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtStartDateUpd" runat="server" meta:resourcekey="txtReceiptNumberUpd"
                                    SkinID="Calendar" Text='<%# Bind("StartDate") %>' OnDataBinding="txtStartDateUpd_DataBinding"
                                    ReadOnly="True"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCaltxtStartDateUpd" runat="server" Control="txtStartDateUpd" meta:resourcekey="PopCaltxtStartDateUpdResource1" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvStartDateUpd" runat="server" ControlToValidate="txtStartDateUpd"
                                    ErrorMessage="Please Enter Start Date " meta:resourcekey="rfvStartDateUpdResource1">
							*</asp:RequiredFieldValidator>
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblEndDateUpd" runat="server" meta:resourcekey="lblEndDateUpd" Text="End Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtEnddateUpd" runat="server" meta:resourcekey="txtAdjudicationTotalFeesUpd"
                                    SkinID="Calendar" Text='<%# Bind("EndDate") %>' OnDataBinding="txtEnddateUpd_DataBinding"
                                    ReadOnly="True"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCaltxtEndDateUpd" runat="server" Control="txtEnddateUpd" meta:resourcekey="PopCaltxtEndDateUpdResource1" />
                            </td>
                            <td class="validationColumn">
                                <asp:RequiredFieldValidator ID="rfvEndDateUpd" runat="server" ControlToValidate="txtEnddateUpd"
                                    ErrorMessage="Please Enter End Date " meta:resourcekey="rfvEndDateUpdResource1">
							*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" align="right">
                                <asp:Button ID="UpdateFvemployeeUpd" runat="server" CommandName="Update" Text="Update" meta:resourcekey="UpdateFvemployeeUpdResource1" />
                                <asp:Button ID="CancelFvemployeeUpd" runat="server" CommandName="Cancel" CausesValidation="False"
                                    Text="Cancel" OnClick="CancelFvemployeeUpd_Click" meta:resourcekey="CancelFvemployeeUpdResource1" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblEmployeeDetailsItm" runat="server" meta:resourcekey="lblEmployeeDetailsItm"
                                    SkinID="SubHeading" Text="Employee Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblEmployeeNoItm" runat="server" meta:resourcekey="lblEmployeeNoItm"
                                    Text="Employee Number"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtEmployeeNoItm" runat="server" meta:resourcekey="txtEmployeeNoItm"
                                    Text='<%# Bind("EmployeeNo") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblFirstNameItm" runat="server" meta:resourcekey="lblFirstNameItm"
                                    Text="First Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtFirstNameItm" runat="server" meta:resourcekey="txtFirstNameItm"
                                    Text='<%# Bind("FirstName") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblMiddleNameItm" runat="server" meta:resourcekey="lblMiddleNameItm"
                                    Text="Middle Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtMiddleNameItm" runat="server" meta:resourcekey="txtMiddleNameItm"
                                    Text='<%# Bind("MiddleName") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblLastNameItm" runat="server" meta:resourcekey="lblLastNameItm" Text="Last Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtLastNameItm" runat="server" meta:resourcekey="txtLastNameItm"
                                    Text='<%# Bind("LastName") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblPostalAddressItm" runat="server" meta:resourcekey="lblPostalAddressItm"
                                    Text="Postal Address"></asp:Label>
                            </td>
                            <td colspan="4" style="width: 25%">
                                <asp:TextBox ID="txtPostalAddressItm" runat="server" meta:resourcekey="txtPostalAddressItm"
                                    Text='<%# Bind("PostalAddress") %>' TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblPermanentAddressItm" runat="server" meta:resourcekey="lblPermanentAddressItm"
                                    Text="Permanent Address"></asp:Label>
                            </td>
                            <td colspan="4" style="width: 25%">
                                <asp:TextBox ID="txtPermanentAddressItm" runat="server" meta:resourcekey="txtPermanentAddressItm"
                                    Text='<%# Bind("PermanentAddress") %>' TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblFatherNameItm" runat="server" meta:resourcekey="lblFatherNameItm"
                                    Text="Father Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtFatherNameItm" runat="server" meta:resourcekey="txtFatherNameItm"
                                    Text='<%# Bind("FatherName") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblHeightItm" runat="server" meta:resourcekey="lblHeightItm" Text="Height"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtHeightItm" runat="server" meta:resourcekey="txtHeightItm" Text='<%# Bind("Height") %>'
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDateOfBirthItm" runat="server" meta:resourcekey="lblDateOfBirthItm"
                                    Text="Date Of Birth"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDateOfBirthItm" runat="server" meta:resourcekey="txtReceiptNumberItm"
                                    SkinID="Calendar" Text='<%# Bind("DateOfBirth") %>' ReadOnly="True"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCalendar3" runat="server" Control="txtDateOfBirthItm" meta:resourcekey="PopCalendar3Resource2" />
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblVisibleMarksItm" runat="server" meta:resourcekey="lblVisibleMarksItm"
                                    Text="VisibleMarks"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtVisibleMarksItm" runat="server" meta:resourcekey="txtVisibleMarksItm"
                                    Text='<%# Bind("VisibleMarks") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label7" runat="server" meta:resourcekey="lblReceiptNumberItm" Text="Office Id "></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlOfficeNameItm" runat="server" DataSourceID="OdsOfficeMaster"
                                    DataTextField="OfficeName" DataValueField="OfficeId" SelectedValue='<%# Bind("OfficeId") %>'
                                    Width="157px" Enabled="False" meta:resourcekey="ddlOfficeNameItmResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDepartmentItm" runat="server" meta:resourcekey="LblDepartmentItm"
                                    Text="Department"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDepartmentItm" runat="server" DataSourceID="OdsDepartmentMaster"
                                    DataTextField="Name" DataValueField="DepartmentId" SelectedValue='<%# Bind("DepartmentId") %>'
                                    Width="157px" Enabled="False" meta:resourcekey="ddlDepartmentItmResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionItm" runat="server" meta:resourcekey="lblDescriptionItm"
                                    Text="Designation"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDescriptionItm" runat="server" DataSourceID="OdsDesignationMaster"
                                    DataTextField="Description" DataValueField="DesignationID" SelectedValue='<%# Bind("DesignationId") %>'
                                    Width="157px" Enabled="False" meta:resourcekey="ddlDescriptionItmResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblSalaryItm" runat="server" meta:resourcekey="lblSalaryItm" Text="Salary"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtSalaryItm" runat="server" meta:resourcekey="txtSalaryItm" Text='<%# Bind("Salary") %>'
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAllowancesItm" runat="server" meta:resourcekey="lblAllowancesItm"
                                    Text="Allowances"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAllowancesItm" runat="server" meta:resourcekey="txtAllowancesItm"
                                    Text='<%# Bind("Allowances") %>' ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label13" runat="server" meta:resourcekey="lblReceiptNumberItm" Text="Start Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtStartDateItm" runat="server" meta:resourcekey="txtReceiptNumberItm"
                                    SkinID="Calendar" Text='<%# Bind("StartDate") %>' ReadOnly="True"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCaltxtStartDateItm" runat="server" Control="txtStartDateItm" meta:resourcekey="PopCaltxtStartDateItmResource1" />
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblEndDateItm" runat="server" meta:resourcekey="lblEndDateItm" Text="End Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtEnddateItm" runat="server" meta:resourcekey="txtAdjudicationTotalFeesItm"
                                    SkinID="Calendar" Text='<%# Bind("EndDate") %>' ReadOnly="True"></asp:TextBox>
                                <rjs:PopCalendar ID="PopCaltxtEndDateItm" runat="server" Control="txtEnddateItm" meta:resourcekey="PopCaltxtEndDateItmResource1" />
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblQualificationDetailsItm" runat="server" meta:resourcekey="lblQualificationDetailsItm"
                                    SkinID="SubHeading" Text="Qualification Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lbllboxQualificationItm" runat="server" meta:resourcekey="lbllboxQualificationItm"
                                    Text="Qualification"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:ListBox ID="lboxQualificationItm" runat="server" DataSourceID="OdsQualificationMaster"
                                    DataTextField="Name" SelectionMode="Multiple" meta:resourcekey="lboxQualificationItmResource1"></asp:ListBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDetailsItm" runat="server" meta:resourcekey="lblDetailsItm" Text="Details"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDetailsItm" runat="server" meta:resourcekey="txtDetailsItm" ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                            </td>
                            <td>
                                <asp:Button ID="BtnBack" runat="server" Text="Back" OnClick="BtnBack_Click" meta:resourcekey="BtnBackResource1" /></td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
        <asp:View ID="view2" runat="server">
            <table width="100%">
                <tr>
                    <td class="labelColumn">
                        <asp:Label ID="lblEmployeeNoIns" runat="server" meta:resourcekey="lblEmployeeNoIns"
                            Text="Employee No"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtEmployeeNoUpd" runat="server" meta:resourcekey="txtEmployeeNoIns"></asp:TextBox>
                    </td>
                    <td colspan="4" align="right">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" meta:resourcekey="btnSearchResource1" /></td>
                    <td class="textColumn">
                    </td>
                </tr>
            </table>
            <asp:GridView ID="GvEmployeeDetails" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                DataKeyNames="EmployeeID" DataSourceID="OdsSearchEmpDetailsByEmpNo" OnSelectedIndexChanged="GvEmployeeDetails_SelectedIndexChanged" meta:resourcekey="GvEmployeeDetailsResource1">
                <Columns>
                    <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" ReadOnly="True" SortExpression="EmployeeID"
                        Visible="False" meta:resourcekey="BoundFieldResource1" />
                    <asp:BoundField DataField="EmployeeNo" HeaderText="Employee No" SortExpression="EmployeeNo"
                        Visible="False" meta:resourcekey="BoundFieldResource2" />
                    <asp:BoundField DataField="FirstName" HeaderText="Name" SortExpression="FirstName" meta:resourcekey="BoundFieldResource3" />
                    <asp:BoundField DataField="DateOfBirth" HeaderText="DOB" SortExpression="DateOfBirth"
                        Visible="False" meta:resourcekey="BoundFieldResource4" />
                    <asp:BoundField DataField="FatherName" HeaderText="Father Name" SortExpression="FatherName" meta:resourcekey="BoundFieldResource5" />
                    <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" Visible="False" meta:resourcekey="BoundFieldResource6" />
                    <asp:BoundField DataField="OfficeID" HeaderText="OfficeID" SortExpression="OfficeID"
                        Visible="False" meta:resourcekey="BoundFieldResource7" />
                    <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" SortExpression="DepartmentID"
                        Visible="False" meta:resourcekey="BoundFieldResource8" />
                    <asp:BoundField DataField="DesignationID" HeaderText="DesignationID" SortExpression="DesignationID"
                        Visible="False" meta:resourcekey="BoundFieldResource9" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" Visible="False" meta:resourcekey="BoundFieldResource10" />
                    <asp:BoundField DataField="Allowances" HeaderText="Allowances" SortExpression="Allowances"
                        Visible="False" meta:resourcekey="BoundFieldResource11" />
                    <asp:BoundField DataField="StartDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="StartDate"
                        HtmlEncode="False" SortExpression="StartDate" meta:resourcekey="BoundFieldResource12" />
                    <asp:BoundField DataField="EndDate" DataFormatString="{0:dd/MM/yyyy}" HeaderText="EndDate"
                        HtmlEncode="False" SortExpression="EndDate" meta:resourcekey="BoundFieldResource13" />
                    <asp:CommandField ShowSelectButton="True" meta:resourcekey="CommandFieldResource1" />
                </Columns>
            </asp:GridView>
            <table width="100%">
                <tr>
                    <td colspan="6" align="right">
                        <asp:Button ID="BtnAddNew" runat="server" Text="AddNew" OnClick="BtnAddNew_Click" meta:resourcekey="BtnAddNewResource1" />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="ViewEmployeeReadOnly" runat="server">
            <asp:FormView ID="FvEmployeeMasterReadOnly" runat="server" DataKeyNames="EmployeeID"
                DataSourceID="OdsSelectEmployeeByID" meta:resourcekey="FvEmployeeMasterReadOnlyResource1">
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="4">
                                <asp:Label ID="lblEmployeeDetailsReadOnly" runat="server" meta:resourcekey="lblEmployeeDetailsReadOnly"
                                    SkinID="SubHeading" Text="Employee Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblEmployeeNoReadOnly" runat="server" meta:resourcekey="lblEmployeeNoReadOnly"
                                    Text="Employee Number"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtEmployeeNoReadOnly" runat="server" meta:resourcekey="txtEmployeeNoReadOnly"
                                    ReadOnly="True" Text='<%# Bind("EmployeeNo") %>'></asp:TextBox>
                            </td>
                             <td class="validationColumn">
                            </td>
                            
                             <td class="labelColumn">
                                <asp:Label ID="lblMiddleNameReadOnly" runat="server" meta:resourcekey="lblMiddleNameReadOnly"
                                    Text="Middle Name"></asp:Label>
                            </td>
                            
                            <td class="textColumn">
                                <asp:TextBox ID="txtMiddleNameReadOnly" runat="server" meta:resourcekey="txtMiddleNameReadOnly"
                                    ReadOnly="True" Text='<%# Bind("MiddleName") %>'></asp:TextBox>
                            </td>
                             <td class="validationColumn">
                            </td>
                           
                           
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblFirstNameReadOnly" runat="server" meta:resourcekey="lblFirstNameReadOnly"
                                    Text="First Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtFirstNameReadOnly" runat="server" meta:resourcekey="txtFirstNameReadOnly"
                                    ReadOnly="True" Text='<%# Bind("FirstName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                           
                           
                            <td class="labelColumn">
                                <asp:Label ID="lblLastNameReadOnly" runat="server" meta:resourcekey="lblLastNameReadOnly"
                                    Text="Last Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtLastNameReadOnly" runat="server" meta:resourcekey="txtLastNameReadOnly"
                                    ReadOnly="True" Text='<%# Bind("LastName") %>'></asp:TextBox>
                            </td>
                           
                           
                           
                           
                           
                            <td class="validationColumn">
                            </td>
                        </tr>
                       
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblPostalAddressReadOnly" runat="server" meta:resourcekey="lblPostalAddressReadOnly"
                                    Text="Postal Address"></asp:Label>
                            </td>
                            
                            <td >
                                <asp:TextBox ID="txtPostalAddressReadOnly" runat="server" meta:resourcekey="txtPostalAddressReadOnly"
                                    ReadOnly="True" Text='<%# Bind("PostalAddress") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        
                            <td class="labelColumn">
                                <asp:Label ID="lblPermanentAddressReadOnly" runat="server" meta:resourcekey="lblPermanentAddressReadOnly"
                                    Text="Permanent Address"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPermanentAddressReadOnly" runat="server" meta:resourcekey="txtPermanentAddressReadOnly"
                                    ReadOnly="True" Text='<%# Bind("PermanentAddress") %>' TextMode="MultiLine"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblFatherNameReadOnly" runat="server" meta:resourcekey="lblFatherNameReadOnly"
                                    Text="Father Name"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtFatherNameReadOnly" runat="server" meta:resourcekey="txtFatherNameReadOnly"
                                    ReadOnly="True" Text='<%# Bind("FatherName") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblHeightReadOnly" runat="server" meta:resourcekey="lblHeightReadOnly"
                                    Text="Height"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtHeightReadOnly" runat="server" meta:resourcekey="txtHeightReadOnly"
                                    ReadOnly="True" Text='<%# Bind("Height") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDateOfBirthReadOnly" runat="server" meta:resourcekey="lblDateOfBirthReadOnly"
                                    Text="Date Of Birth"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDateOfBirthReadOnly" runat="server" meta:resourcekey="txtReceiptNumberReadOnly"
                                    ReadOnly="True" Text='<%# Bind("DateOfBirth") %>' OnDataBinding="txtDateOfBirthReadOnly_DataBinding"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblVisibleMarksReadOnly" runat="server" meta:resourcekey="lblVisibleMarksReadOnly"
                                    Text="VisibleMarks"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtVisibleMarksReadOnly" runat="server" meta:resourcekey="txtVisibleMarksReadOnly"
                                    ReadOnly="True" Text='<%# Bind("VisibleMarks") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label7" runat="server" meta:resourcekey="lblReceiptNumberReadOnly"
                                    Text="Office Id "></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlOfficeNameReadOnly" runat="server" DataSourceID="OdsOfficeMaster"
                                    DataTextField="OfficeName" DataValueField="OfficeId" Enabled="False" SelectedValue='<%# Bind("OfficeId") %>'
                                    Width="157px" meta:resourcekey="ddlOfficeNameReadOnlyResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDepartmentReadOnly" runat="server" meta:resourcekey="LblDepartmentReadOnly"
                                    Text="Department"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDepartmentReadOnly" runat="server" DataSourceID="OdsDepartmentMaster"
                                    DataTextField="Name" DataValueField="DepartmentId" Enabled="False" SelectedValue='<%# Bind("DepartmentId") %>'
                                    Width="157px" meta:resourcekey="ddlDepartmentReadOnlyResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblDescriptionReadOnly" runat="server" meta:resourcekey="lblDescriptionReadOnly"
                                    Text="Designation"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:DropDownList ID="ddlDescriptionReadOnly" runat="server" DataSourceID="OdsDesignationMaster"
                                    DataTextField="Description" DataValueField="DesignationID" Enabled="False" SelectedValue='<%# Bind("DesignationId") %>'
                                    Width="157px" meta:resourcekey="ddlDescriptionReadOnlyResource1">
                                </asp:DropDownList>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblSalaryReadOnly" runat="server" meta:resourcekey="lblSalaryReadOnly"
                                    Text="Salary"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtSalaryReadOnly" runat="server" meta:resourcekey="txtSalaryReadOnly"
                                    ReadOnly="True" Text='<%# Bind("Salary", "{0:F}") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblAllowancesReadOnly" runat="server" meta:resourcekey="lblAllowancesReadOnly"
                                    Text="Allowances"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtAllowancesReadOnly" runat="server" meta:resourcekey="txtAllowancesReadOnly"
                                    ReadOnly="True" Text='<%# Bind("Allowances", "{0:F}") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="Label13" runat="server" meta:resourcekey="lblReceiptNumberReadOnly"
                                    Text="Start Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtStartDateReadOnly" runat="server" meta:resourcekey="txtReceiptNumberReadOnly"
                                    ReadOnly="True" Text='<%# Bind("StartDate") %>' OnDataBinding="txtStartDateReadOnly_DataBinding"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblEndDateReadOnly" runat="server" meta:resourcekey="lblEndDateReadOnly"
                                    Text="End Date"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtEnddateReadOnly" runat="server" meta:resourcekey="txtAdjudicationTotalFeesReadOnly"
                                    ReadOnly="True" Text='<%# Bind("EndDate") %>' OnTextChanged="txtEnddateReadOnly_TextChanged"
                                    OnDataBinding="txtEnddateReadOnly_DataBinding"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:Label ID="lblQualificationDetailsReadOnly" runat="server" meta:resourcekey="lblQualificationDetailsReadOnly"
                                    SkinID="SubHeading" Text="Qualification Details"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn">
                                <asp:Label ID="lblboxQualificationReadOnly" runat="server" meta:resourcekey="lbllboxQualificationReadOnly"
                                    Text="Qualification"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:ListBox ID="lboxQualificationReadOnly" runat="server" DataSourceID="OdsQualificationMaster"
                                    DataTextField="Name" SelectionMode="Multiple" meta:resourcekey="lboxQualificationReadOnlyResource1"></asp:ListBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDetailsReadOnly" runat="server" meta:resourcekey="lblDetailsReadOnly"
                                    Text="Details"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDetailsReadOnly" runat="server" meta:resourcekey="txtDetailsReadOnly"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px;">
                                <asp:Label ID="lblCreatedByReadOnly" runat="server" meta:resourcekey="lblCreatedByReadOnly"
                                    Text="Created By" Width="76px"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCreatedByReadOnly" runat="server" meta:resourcekey="txtCreatedByReadOnly"
                                    ReadOnly="True" Text='<%# Bind("CreatedBy") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblCreatedAtReadOnly" runat="server" meta:resourcekey="lblCreatedAtReadOnly"
                                    Text="Created At"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtCreatedAtReadOnly" runat="server" meta:resourcekey="txtCreatedAtReadOnly"
                                    ReadOnly="True" Text='<%# Bind("CreatedAt", "{0:d}") %>' OnTextChanged="txtCreatedAtReadOnly_TextChanged"
                                    OnDataBinding="txtCreatedAtReadOnly_DataBinding"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px;">
                                <asp:Label ID="lblModifiedByReadOnly" runat="server" meta:resourcekey="lblModifiedByReadOnly"
                                    Text="Modified By" Width="76px"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtModifiedByReadOnly" runat="server" meta:resourcekey="txtModifiedByReadOnly"
                                    ReadOnly="True" Text='<%# Bind("ModifiedBy") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblModifiedAtReadOnly" runat="server" meta:resourcekey="lblModifiedAtReadOnly"
                                    Text="Modified At"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtModifiedAtReadOnly" runat="server" meta:resourcekey="txtModifiedAtReadOnly"
                                    ReadOnly="True" Text='<%# Bind("ModifiedAt", "{0:d}") %>' OnTextChanged="txtModifiedAtReadOnly_TextChanged"
                                    OnDataBinding="txtModifiedAtReadOnly_DataBinding"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px;">
                                <asp:Label ID="lblIsDeletedReadOnly" runat="server" meta:resourcekey="lblIsDeletedReadOnly"
                                    Text="Is Deleted" Width="76px"></asp:Label>
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                                <asp:Label ID="lblDeletedByReadOnly" runat="server" meta:resourcekey="lblDeletedByReadOnly"
                                    Text="Deleted By"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDeletedByReadOnly" runat="server" meta:resourcekey="txtDeletedByReadOnly"
                                    ReadOnly="True" Text='<%# Bind("DeletedBy") %>'></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                        <tr>
                            <td class="labelColumn" style="width: 77px; height: 28px;">
                                <asp:Label ID="lblDeletedAtReadOnly" runat="server" meta:resourcekey="lblDeletedAtReadOnly"
                                    Text="Deleted At" Width="76px"></asp:Label>
                            </td>
                            <td class="textColumn">
                                <asp:TextBox ID="txtDeletedAtReadOnly" runat="server" meta:resourcekey="txtDeletedAtReadOnly"
                                    Text='<%# Bind("DeletedAt") %>' OnTextChanged="txtDeletedAtReadOnly_TextChanged"
                                    ReadOnly="True"></asp:TextBox>
                            </td>
                            <td class="validationColumn">
                            </td>
                            <td class="labelColumn">
                            </td>
                            <td class="textColumn">
                            </td>
                            <td class="validationColumn">
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
        </asp:View>
    </asp:MultiView>
    &nbsp;<asp:ObjectDataSource ID="OdsOfficeMaster" runat="server" SelectMethod="GetOffices"
        TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices" OldValuesParameterFormatString="original_{0}">
    </asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="OdsDepartmentMaster" runat="server" SelectMethod="GetDepartmentMasterDetails"
        TypeName="IGRSS.BusinessLogicLayer.Employee" UpdateMethod="UpdateDepartmentMaster"
        DataObjectTypeName="System.Guid" DeleteMethod="DeleteEmployeeQualification" InsertMethod="InsertDepartmentMaster">
        <UpdateParameters>
            <asp:Parameter Name="DepartmentID" Type="Object" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="ModifiedAt" Type="DateTime" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="DepartmentId" Type="Object" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedAt" Type="DateTime" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OdsDesignationMaster" runat="server" SelectMethod="GetDesignationMasterDetails"
        TypeName="IGRSS.BusinessLogicLayer.Employee" UpdateMethod="UpdateDesignationMaster"
        InsertMethod="InsertDesignationMaster" DataObjectTypeName="System.Guid" DeleteMethod="DeleteEmployeeQualification">
        <UpdateParameters>
            <asp:Parameter Name="DesignationID" Type="Object" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="ModifiedBy" Type="String" />
            <asp:Parameter Name="ModifiedAt" Type="DateTime" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="DesignationID" Type="Object" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="CreatedBy" Type="String" />
            <asp:Parameter Name="CreatedAt" Type="DateTime" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="OdsEmployeeMaster" runat="server" InsertMethod="AddNewEmployeeMaster"
        SelectMethod="GetEmployeeDetails" TypeName="IGRSS.BusinessLogicLayer.Employee"
        OnInserting="OdsEmployeeMaster_Inserting" UpdateMethod="UpdateEmployeeMaster"
        OldValuesParameterFormatString="original_{0}" DataObjectTypeName="System.Guid"
        DeleteMethod="DeleteEmployeeQualification">
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="dtQualification" Type="Object" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="EmployeeID" Type="Object" />
            <asp:Parameter Name="Parameters" Type="Object" />
            <asp:Parameter Name="QualificationDetails" Type="Object" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <br />
    <asp:ObjectDataSource ID="OdsSelectEmployeeByID" runat="server" InsertMethod="AddNewEmployeeMaster"
        SelectMethod="GetEmployeeDetailsById" TypeName="IGRSS.BusinessLogicLayer.Employee"
        UpdateMethod="UpdateEmployeeMaster" OnInserting="OdsSelectEmployeeByID_Inserting"
        OnUpdating="OdsSelectEmployeeByID_Updating" DeleteMethod="DeleteEmployeeQualification"
        OnInserted="OdsSelectEmployeeByID_Inserted">
        <UpdateParameters>
            <asp:Parameter Name="EmployeeID" Type="Object" />
            <asp:Parameter Name="Parameters" Type="Object" />
            <asp:Parameter Name="QualificationDetails" Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GvEmployeeDetails" Name="EmployeeID" PropertyName="SelectedValue"
                Type="Object" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="dtQualification" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OdsSearchEmpDetailsByEmpNo" runat="server" DataObjectTypeName="System.Guid"
        DeleteMethod="DeleteEmployeeQualification" InsertMethod="AddNewEmployeeMaster"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetEmployeeDetailsByEmpNo"
        TypeName="IGRSS.BusinessLogicLayer.Employee" UpdateMethod="UpdateEmployeeMaster">
        <UpdateParameters>
            <asp:Parameter Name="EmployeeID" Type="Object" />
            <asp:Parameter Name="Parameters" Type="Object" />
            <asp:Parameter Name="QualificationDetails" Type="Object" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtEmployeeNoUpd" Name="EmployeeNo" PropertyName="Text"
                Type="String" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="Parameter" Type="Object" />
            <asp:Parameter Name="dtQualification" Type="Object" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="OdsQualificationMaster" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetQualificationMasterDetails" TypeName="IGRSS.BusinessLogicLayer.Employee"></asp:ObjectDataSource>
</asp:Content>
