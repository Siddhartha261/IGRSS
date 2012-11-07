<%@ Page Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true"
    CodeFile="InwardRegister.aspx.cs" Inherits="Inward_Outward_InwardRegister" Title="Inward Register"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>

    
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

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
                var formattedNumber = 'IGR\/'+$('input[id*="InwardNoTextBox"]').val()+'\/'+new Date().getFullYear();
                $('input[id*="InwardNoTextBox"]').val(formattedNumber.toString());
            });

        var datePickers = ["InwardDateTextBox", "ApplicationDateTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
</script>
    <asp:MultiView ID="mvInward" runat="server" ActiveViewIndex="0">
        <asp:View ID="vieGrid" runat="server">
        <hr /><br />
        <h1>INWARD REGISTER</h1>
            <table width="100%" >
             <tr>
                    <td align="right" style="width:641px;" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" >
                        <asp:TextBox Width="160" ID="txtFileNo" runat="server" meta:resourcekey="txtFileNoResource1"></asp:TextBox></td>
                        <td align="right">
                        <asp:Button ID="btnSearchAppNo" runat="server" OnClick="btnSearchAppNo_Click" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />
                    </td>
                </tr>

                <tr>
                    <td colspan="6" style="height: 198px">
                        <asp:GridView ID="gvInwarddtl" runat="server" AutoGenerateColumns="False"
                            DataSourceID="odsgv"
                            meta:resourcekey="gvInwarddtlResource1" AllowPaging="True" 
                            EnableModelValidation="True" DataKeyNames="SrNo" 
                            onrowcommand="gvInwarddtl_RowCommand" onrowdatabound="gvInwarddtl_RowDataBound">
                            <Columns>
                                                            <asp:BoundField DataField="inward_no_" 
                                    HeaderText="Inward No" SortExpression="inward_no_" ReadOnly="True" />
                                <asp:BoundField DataField="SrNo" HeaderText="SrNo" 
                                    SortExpression="SrNo" InsertVisible="False" ReadOnly="True" Visible="false"/>
                                <asp:BoundField DataField="InwardNo" HeaderText="InwardNo" 
                                    SortExpression="InwardNo" Visible="false"/>
                                    <asp:BoundField DataField="InwardDate" HeaderText="Inward Date" 
                                    SortExpression="InwardDate" />
                                <asp:BoundField DataField="Description" HeaderText="Description" 
                                    SortExpression="Description" />
                                <asp:BoundField DataField="ApplicantName" HeaderText="Applicant Name" 
                                    SortExpression="ApplicantName" />
                                <asp:BoundField DataField="ApplicationDate" HeaderText="Application Date" 
                                    SortExpression="ApplicationDate" />
                                <asp:BoundField DataField="OfficeName" HeaderText="Sent To"
                                    SortExpression="OfficeName" />
                                <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                                    SortExpression="Remarks" />
                                <asp:BoundField DataField="ApplicantAddress" HeaderText="Applicant Address" 
                                    SortExpression="ApplicantAddress" />
                                <asp:BoundField DataField="Document_Upload_Id" HeaderText="Document_Upload_Id" 
                                    SortExpression="Document_Upload_Id" InsertVisible="False" 
                                    ReadOnly="True" Visible="false"/>
                                
                                <asp:BoundField DataField="Name" HeaderText="Name" 
                                    SortExpression="Name"/>


                                                            <asp:ButtonField CommandName="Update" Text="Update" />


                            </Columns>
                            <EmptyDataTemplate>
                                No Record Found.
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <br />
                        <asp:Button ID="btnNew" runat="server" onclick="btnNew_Click" Text="New" 
                            CssClass="standardButton" />
                    </td>
                </tr>
            </table>
        </asp:View>
        
        <asp:View ID="vieFv" runat="server">
       <center>
        <h1>INWARD REGISTER</h1>
            <asp:FormView ID="FormView_Inward" runat="server" DataKeyNames="SrNo" 
                DataSourceID="odsgv" EnableModelValidation="True" 
                oniteminserted="FormView_Inward_ItemInserted" DefaultMode="Insert" 
                Width="50%" onitemcommand="FormView_Inward_ItemCommand" 
                oniteminserting="FormView_Inward_ItemInserting">
                <EditItemTemplate>
                    <table cellpadding="2">
                    <tr><td align="right">Inward No:</td><td align="left"><asp:TextBox ID="InwardNoTextBox" runat="server" Text='<%# Bind("InwardNo") %>' Width="160px" /></td></tr>
                    <tr><td align="right">Inward Date:</td><td align="left"><asp:TextBox ID="InwardDateTextBox" runat="server" Text='<%# Bind("InwardDate") %>' /></td></tr>
                    <tr><td align="right">Description:</td><td align="left">
                        <asp:TextBox ID="DescriptionTextBox" runat="server" 
                            Text='<%# Bind("Description") %>' TextMode="MultiLine" Height="60px" 
                            Width="160px" /></td></tr>
                    <tr><td align="right">Applicant Name:</td><td align="left"><asp:TextBox ID="ApplicantNameTextBox" runat="server" Text='<%# Bind("ApplicantName") %>' /></td></tr>
                    <tr><td align="right">Application Date:</td><td align="left"><asp:TextBox ID="ApplicationDateTextBox" runat="server" Text='<%# Bind("ApplicationDate") %>' /></td></tr>
                    <tr><td align="right">Sent To:</td><td align="left">
                        <asp:DropDownList ID="dropdownlistSentTo" runat="server" 
                            DataSourceID="OdsOffices" DataTextField="OfficeName" 
                            DataValueField="OfficeName"></asp:DropDownList></td></tr>
                    <tr><td align="right">Remarks:</td><td align="left">
                        <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                            TextMode="MultiLine" Height="60px" Width="160px" /></td></tr>
                    <tr><td align="right">Applicant Address:</td><td align="left">
                        <asp:TextBox ID="ApplicantAddressTextBox" runat="server" 
                            Text='<%# Bind("ApplicantAddress") %>' TextMode="MultiLine" Height="60px" 
                            Width="160px" /></td></tr>
                             <tr>
                                <td align="right">
                                    Upload Document: 
                                </td>
                                <td align="left">
                                    <asp:FileUpload ID="FileUploadDocument" runat="server" />
                                </td>
                                <td>
                                    <asp:Button runat="server" ID="buttonUpload" Text="Upload" 
                                        CommandName="UploadFile" CssClass="standardButton" />
                                </td>
                            </tr>
                    <tr><td colspan="2" align="center"><asp:Button ID="UpdateButton" runat="server" 
                            CausesValidation="True" CommandName="Update" Text="Update" 
                            CssClass="standardButton" />
                    &nbsp;<asp:Button ID="ResetButton" Text="Reset"  runat="server" 
                            onclientclick="resetTextFields();return false;" 
                            CssClass="standardButton" />
                    &nbsp;<asp:Button ID="UpdateCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Back" Text="Back" 
                            CssClass="standardButton" /></tr>
                        <td>
                            </tr>
                        </td>
                    </table>
                    
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table cellpadding="2">
                    <tr><td align="right">Inward No:</td><td align="left">
                        <asp:TextBox ID="InwardNoTextBox" runat="server" Text='<%# Bind("InwardNo") %>' 
                            Width="160px" /></td></tr>
                    <tr><td align="right">Inward Date:</td><td align="left">
                        <asp:TextBox ID="InwardDateTextBox" runat="server" 
                            Text='<%# Bind("InwardDate") %>' Width="160px" /></td></tr>
                    <tr><td align="right">Description:</td><td align="left">
                        <asp:TextBox ID="DescriptionTextBox" runat="server" 
                            Text='<%# Bind("Description") %>' TextMode="MultiLine" Width="160px" 
                            Height="60px" /></td></tr>
                    <tr><td align="right">Applicant Name:</td><td align="left">
                        <asp:TextBox ID="ApplicantNameTextBox" runat="server" 
                            Text='<%# Bind("ApplicantName") %>' Width="160px" /></td></tr>
                    <tr><td align="right">Application Date:</td><td align="left">
                        <asp:TextBox ID="ApplicationDateTextBox" runat="server" 
                            Text='<%# Bind("ApplicationDate") %>' Width="160px" /></td></tr>
                    <tr><td align="right">Sent To:</td><td align="left">
                        <asp:DropDownList ID="dropdownlistSentTo" runat="server" 
                            DataSourceID="OdsOffices" DataTextField="OfficeName" DataValueField="OfficeId" 
                            Width="160px"></asp:DropDownList></td></tr>
                    <tr><td align="right">Remarks:</td><td align="left">
                        <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                            TextMode="MultiLine" Width="160px" Height="60px" /></td></tr>
                    <tr><td align="right">Applicant Address:</td><td align="left">
                        <asp:TextBox ID="ApplicantAddressTextBox" runat="server" 
                            Text='<%# Bind("ApplicantAddress") %>' TextMode="MultiLine" Width="160px" 
                            Height="60px" /></td></tr>
                            <tr>
                                <td align="right">
                                    Upload Document: 
                                </td>
                                <td align="left">
                                    <asp:FileUpload ID="FileUploadDocument" runat="server" />
                                </td>
                                <td>
                                    <asp:Button runat="server" ID="buttonUpload" Text="Upload" 
                                        CommandName="UploadFile" CssClass="standardButton" />
                                </td>
                            </tr>
                    <tr><td colspan="2" align="center">
                        <asp:Button ID="InsertButton" runat="server" 
                            CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="standardButton" 
                             />&nbsp;<asp:Button ID="ResetButton" Text="Reset" runat="server" 
                            onclientclick="resetTextFields();return false;" 
                            CssClass="standardButton" />&nbsp;
                             <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" 
                            CommandName="Back" Text="Back" CssClass="standardButton" /></tr>
                    </table>
                </InsertItemTemplate>
                <ItemTemplate>
                    SrNo:
                    <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
                    <br />
                    Inward No:
                    <asp:Label ID="InwardNoLabel" runat="server" Text='<%# Bind("InwardNo") %>' />
                    <br />
                    Inward Date:
                    <asp:Label ID="InwardDateLabel" runat="server" 
                        Text='<%# Bind("InwardDate") %>' />
                    <br />
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" 
                        Text='<%# Bind("Description") %>' />
                    <br />
                    Applicant Name:
                    <asp:Label ID="ApplicantNameLabel" runat="server" 
                        Text='<%# Bind("ApplicantName") %>' />
                    <br />
                    Application Date:
                    <asp:Label ID="ApplicationDateLabel" runat="server" 
                        Text='<%# Bind("ApplicationDate") %>' />
                    <br />
                    SentTo:
                    <asp:Label ID="SentToLabel" runat="server" Text='<%# Bind("SentTo") %>' />
                    <br />
                    Remarks:
                    <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
                    <br />
                    Applicant Address:
                    <asp:Label ID="ApplicantAddressLabel" runat="server" 
                        Text='<%# Bind("ApplicantAddress") %>' />
                    <br />
                    <asp:Button ID="EditButton" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:Button ID="DeleteButton" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:Button ID="NewButton" runat="server" CausesValidation="False" 
                        CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            </center>

<%--                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetInwardDetailsByInwardId"
                TypeName="IGRSS.BusinessLogicLayer.InwardOutward" UpdateMethod="UpdateInwardDetails"
                OnUpdating="odsInward_Updating" OnInserting="odsInward_Inserting" InsertMethod="AddInwardDetails"
                OnInserted="odsInward_Inserted" OnUpdated="odsInward_Updated">
                <UpdateParameters>
                    <asp:Parameter Name="Parameter" Type="Object" />
                    <asp:Parameter Name="Inward_outwardId" Type="Object" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvInwarddtl" Name="Inward_outwardId" PropertyName="SelectedValue"
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>
--%>

            <asp:ObjectDataSource ID="odsInward" runat="server" 
                TypeName="IGRSS.DataAccessLayer.InwardTableAdapters.InwardRegisterTableAdapter"
                OnUpdating="odsInward_Updating" OnInserting="odsInward_Inserting" InsertMethod="Insert"
                OnInserted="odsInward_Inserted" OnUpdated="odsInward_Updated" 
                OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetData" DeleteMethod="Delete" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_InwardNo" Type="String" />
                    <asp:Parameter Name="Original_InwardDate" Type="DateTime" />
                    <asp:Parameter Name="Original_Description" Type="String" />
                    <asp:Parameter Name="Original_ApplicantName" Type="String" />
                    <asp:Parameter Name="Original_ApplicationDate" Type="DateTime" />
                    <asp:Parameter DbType="Guid" Name="Original_SentTo" />
                    <asp:Parameter Name="Original_Remarks" Type="String" />
                    <asp:Parameter Name="Original_ApplicantAddress" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="InwardNo" Type="String" />
                    <asp:Parameter Name="InwardDate" Type="DateTime" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="ApplicantName" Type="String" />
                    <asp:Parameter Name="ApplicationDate" Type="DateTime" />
                    <asp:Parameter DbType="Guid" Name="SentTo" />
                    <asp:Parameter Name="Remarks" Type="String" />
                    <asp:Parameter Name="ApplicantAddress" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InwardNo" Type="String" />
                    <asp:Parameter Name="InwardDate" Type="DateTime" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="ApplicantName" Type="String" />
                    <asp:Parameter Name="ApplicationDate" Type="DateTime" />
                    <asp:Parameter DbType="Guid" Name="SentTo" />
                    <asp:Parameter Name="Remarks" Type="String" />
                    <asp:Parameter Name="ApplicantAddress" Type="String" />
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_InwardNo" Type="String" />
                    <asp:Parameter Name="Original_InwardDate" Type="DateTime" />
                    <asp:Parameter Name="Original_Description" Type="String" />
                    <asp:Parameter Name="Original_ApplicantName" Type="String" />
                    <asp:Parameter Name="Original_ApplicationDate" Type="DateTime" />
                    <asp:Parameter DbType="Guid" Name="Original_SentTo" />
                    <asp:Parameter Name="Original_Remarks" Type="String" />
                    <asp:Parameter Name="Original_ApplicantAddress" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <%--<asp:ObjectDataSource ID="objinwardoutward" runat="server" 
                DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter" 
                InsertMethod="AddInwardDetails" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetAllInwardDetails" 
                TypeName="IGRSS.BusinessLogicLayer.InwardOutward" 
                UpdateMethod="UpdateInwardDetails">
                <UpdateParameters>
                    <asp:Parameter Name="Parameter" Type="Object" />
                    <asp:Parameter DbType="Guid" Name="Inward_OutwardId" />
                </UpdateParameters>
            </asp:ObjectDataSource>--%>
            <asp:ObjectDataSource ID="OdsOffices" runat="server" 
                DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter" 
                InsertMethod="AddNewOffices" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetOfficeDetails" 
                TypeName="IGRSS.BusinessLogicLayer.OfficeMaster"></asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsDelivery" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetPostalDeliveryLookUpDetails" 
                TypeName="IGRSS.DataAccessLayer.InwardOutwardTableAdapters.PostalDeliveryType_LKPTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter DbType="Guid" Name="Original_PostalDeliveryType_Id" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                    <asp:Parameter Name="Original_Description" Type="String" />
                    <asp:Parameter Name="Original_IsDeleted" Type="Boolean" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Guid" Name="PostalDeliveryType_Id" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="IsDeleted" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="IsDeleted" Type="Boolean" />
                    <asp:Parameter DbType="Guid" Name="Original_PostalDeliveryType_Id" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                    <asp:Parameter Name="Original_Description" Type="String" />
                    <asp:Parameter Name="Original_IsDeleted" Type="Boolean" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsDocuments" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetData" 
                TypeName="IGRSS.DataAccessLayer.DocumentTableAdapters.DocumentMasterTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter DbType="Guid" Name="Original_DocumentTypeId" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                    <asp:Parameter Name="Original_Description" Type="String" />
                    <asp:Parameter Name="Original_CreatedBy" Type="String" />
                    <asp:Parameter Name="Original_CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_ModifiedBy" Type="String" />
                    <asp:Parameter Name="Original_ModifiedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_IsDeleted" Type="Boolean" />
                    <asp:Parameter Name="Original_DeletedBy" Type="String" />
                    <asp:Parameter Name="Original_DeletedAt" Type="DateTime" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Guid" Name="DocumentTypeId" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="CreatedBy" Type="String" />
                    <asp:Parameter Name="CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="ModifiedBy" Type="String" />
                    <asp:Parameter Name="ModifiedAt" Type="DateTime" />
                    <asp:Parameter Name="IsDeleted" Type="Boolean" />
                    <asp:Parameter Name="DeletedBy" Type="String" />
                    <asp:Parameter Name="DeletedAt" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="CreatedBy" Type="String" />
                    <asp:Parameter Name="CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="ModifiedBy" Type="String" />
                    <asp:Parameter Name="ModifiedAt" Type="DateTime" />
                    <asp:Parameter Name="IsDeleted" Type="Boolean" />
                    <asp:Parameter Name="DeletedBy" Type="String" />
                    <asp:Parameter Name="DeletedAt" Type="DateTime" />
                    <asp:Parameter DbType="Guid" Name="Original_DocumentTypeId" />
                    <asp:Parameter Name="Original_Name" Type="String" />
                    <asp:Parameter Name="Original_Description" Type="String" />
                    <asp:Parameter Name="Original_CreatedBy" Type="String" />
                    <asp:Parameter Name="Original_CreatedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_ModifiedBy" Type="String" />
                    <asp:Parameter Name="Original_ModifiedAt" Type="DateTime" />
                    <asp:Parameter Name="Original_IsDeleted" Type="Boolean" />
                    <asp:Parameter Name="Original_DeletedBy" Type="String" />
                    <asp:Parameter Name="Original_DeletedAt" Type="DateTime" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsSearch" runat="server"></asp:ObjectDataSource>
          <%--  <asp:ObjectDataSource ID="odsGetOffices" runat="server" DataObjectTypeName="System.Guid"
                DeleteMethod="DeActivateOffice" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
            </asp:ObjectDataSource>--%>
      <%--      <asp:ObjectDataSource ID="odsDeliveryType" runat="server" SelectMethod="GetDeliveryType"
                TypeName="IGRSS.BusinessLogicLayer.InwardOutward"></asp:ObjectDataSource>--%>
            <asp:ObjectDataSource ID="odsgv" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDataBy" 
                
                
                
                
                TypeName="IGRSS.DataAccessLayer.InwardTableAdapters.InwardRegisterTableAdapter" InsertMethod="InsertQuery" 
                onselecting="odsgv_Selecting">
                <InsertParameters>
                    <asp:Parameter Name="InwardNo" Type="String" />
                    <asp:Parameter Name="InwardDate" Type="DateTime" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="ApplicantName" Type="String" />
                    <asp:Parameter Name="ApplicationDate" Type="DateTime" />
                    <asp:Parameter DbType="Guid" Name="SentTo" />
                    <asp:Parameter Name="Remarks" Type="String" />
                    <asp:Parameter Name="ApplicantAddress" Type="String" />
                    <asp:Parameter Name="Document_Upload_Id" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                        PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server">
            </asp:ObjectDataSource>
            <asp:XmlDataSource ID="XmlInwarddoctype" runat="server"></asp:XmlDataSource>
            <asp:XmlDataSource ID="XmlInwardtype" runat="server"></asp:XmlDataSource>
         <%--   <asp:ObjectDataSource ID="OdsDepartmentMaster" runat="server" DataObjectTypeName="System.Guid"
                DeleteMethod="DeleteEmployeeQualification" InsertMethod="InsertDepartmentMaster"
                SelectMethod="GetDepartmentMasterDetails" TypeName="IGRSS.BusinessLogicLayer.Employee"
                OldValuesParameterFormatString="original_{0}">
                <InsertParameters>
                    <asp:Parameter Name="DepartmentId" Type="Object" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="CreatedBy" Type="String" />
                    <asp:Parameter Name="CreatedAt" Type="DateTime" />
                </InsertParameters>
            </asp:ObjectDataSource>--%>
        </asp:View>
    </asp:MultiView>
</asp:Content>
