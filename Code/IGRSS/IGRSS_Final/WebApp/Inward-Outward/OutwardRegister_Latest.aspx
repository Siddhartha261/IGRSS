<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="OutwardRegister_Latest.aspx.cs" Inherits="Inward_Outward_OutwardRegister_Latest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
<script>


    $(function () {

        function generateDatePicker(id) {
            $('input[id*="' + id + '"]').datepicker({
                showOn: "both",
                buttonImage: "/WebApp/Styles/css/sunny/images/calendar.gif",
                buttonImageOnly: true
            });
        }

        var datePickers = ["OutwardDateTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }

        $('input[id*="FormattedOutwardNoTextBox"]').keydown(function (event) {
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

        $('input[id*="FormattedOutwardNoTextBox"]').blur(function () {

            if (isNaN($('input[id*="FormattedOutwardNoTextBox"]').val()) || $('input[id*="FormattedOutwardNoTextBox"]').val().length == 0) { $('input[id*="FormattedOutwardNoTextBox"]').val(''); return; }
            var formattedNumber = 'IGR\/' + $('input[id*="FormattedOutwardNoTextBox"]').val() + '\/' + new Date().getFullYear();
            $('input[id*="FormattedOutwardNoTextBox"]').val(formattedNumber.toString());
        });
    });
</script>
<asp:MultiView ID="Multiview_OutwardRegister" runat="server" ActiveViewIndex="0">
        <asp:View ID="ViewGrid" runat="server">
        <hr /><br />
        <table >
            <tr>
                <td align="right" style="width: 641px">
                    <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                        meta:resourcekey="lblllsResource1"></asp:Label>
                    </td>
                <td>
                    <asp:TextBox ID="txtFileNo" runat="server" MaxLength="15" meta:resourcekey="txtFileNoResource1" Width="160px"></asp:TextBox> 
                </td>
                <td>
                    <asp:Button ID="btnSearchAppNo" runat="server" 
                        Text="Search" meta:resourcekey="btnSearchAppNoResource1" 
                        CssClass="standardButton" />           
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:GridView ID="GridView_OutWardRegister" runat="server" AutoGenerateColumns="False"
                DataSourceID="ods_OutWardRegister"
                meta:resourcekey="gvOutWardDetailsResource1" EnableModelValidation="True" 
                AllowPaging="True" AllowSorting="True" DataKeyNames="SrNo">
                <Columns>
                    <asp:BoundField DataField="SrNo" HeaderText="SrNo" ReadOnly="True" 
                        SortExpression="SrNo" InsertVisible="False"/>
                    <asp:BoundField DataField="Outward_No" HeaderText="Outward_No" 
                        SortExpression="Outward_No"/>
                        <asp:BoundField DataField="OutWard_Date" HeaderText="OutWard_Date" 
                        SortExpression="OutWard_Date" />
                    <asp:BoundField DataField="File_No" HeaderText="File_No" 
                        SortExpression="File_No" />
                    <asp:BoundField DataField="Letter_No" HeaderText="Letter_No" 
                        SortExpression="Letter_No" />
                    <asp:BoundField DataField="Document_From_Branch" HeaderText="Document_From_Branch" 
                        SortExpression="Document_From_Branch" />
                    <asp:BoundField DataField="Description" HeaderText="Description" 
                        SortExpression="Description" />
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                        SortExpression="Remarks" />
                    <asp:BoundField DataField="Sent_To" HeaderText="Sent_To" 
                        SortExpression="Sent_To" />
                    <asp:BoundField DataField="Office_Sent_To" HeaderText="Office_Sent_To" 
                        SortExpression="Office_Sent_To" />
                    <asp:BoundField DataField="Name_Other" HeaderText="Name_Other" 
                        SortExpression="Name_Other" />
                    
                    <asp:BoundField DataField="Address_Other" HeaderText="Address_Other" 
                        SortExpression="Address_Other" />
                    <asp:BoundField DataField="Send_Via" HeaderText="Send_Via" 
                        SortExpression="Send_Via" />
                    <asp:BoundField DataField="Courier_Name" HeaderText="Courier_Name" 
                        SortExpression="Courier_Name" />
                    <asp:BoundField DataField="Copy_To" HeaderText="Copy_To" 
                        SortExpression="Copy_To" />
                    <asp:BoundField DataField="Office_Copy_To" HeaderText="Office_Copy_To" 
                        SortExpression="Office_Copy_To" />
                    
                </Columns>
                <EmptyDataTemplate>
                    Record Not Available
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:Button ID="Button_new" runat="server" onclick="Button_new_Click" Text="New" 
                        CssClass="standardButton" />
                </td>
            </tr>
        </table>
          
            
         
            
        </asp:View>
        <asp:View ID="FormView" runat="server">
        <hr />
        <center>
            <asp:FormView ID="FormView_OutWardRegister" runat="server" Width="50%" DataKeyNames="SrNo"
                DefaultMode="Insert" meta:resourcekey="FvOutward" 
                DataSourceID="ods_OutWardRegister" EnableModelValidation="True" 
                oniteminserting="FormView_OutWardRegister_ItemInserting">
                <InsertItemTemplate>
                                <table align="center">
                <tr>
				    <td>Outward No:</td>
					<td><asp:TextBox ID="Outward_NoTextBox" runat="server" 
                        Text='<%# Bind("Outward_No") %>' Width="160px" /></td>
				</tr>								
                    
                <tr>
				    <td>OutWard Date:</td>
					<td><asp:TextBox ID="OutWard_DateTextBox" runat="server" 
                        Text='<%# Bind("OutWard_Date") %>' Width="160px" /></td>
				</tr>                
                    
                <tr>
				    <td>File No:</td>
					<td><asp:TextBox ID="File_NoTextBox" runat="server" Text='<%# Bind("File_No") %>' 
                            Width="160px" /></td>
				</tr>                   
                    
                <tr>
				    <td>Letter No:</td>
					<td><asp:TextBox ID="Letter_NoTextBox" runat="server" 
                        Text='<%# Bind("Letter_No") %>' Width="160px" /></td>
				</tr>                   
                    
                <tr>
				    <td>Document From Branch:</td>
					<td>
                        <asp:DropDownList ID="DropDownList_documentFromBranch" runat="server">
                        </asp:DropDownList>
                    </td>
				</tr>                    
                    
                <tr>
				    <td>Description:</td>
					<td><asp:TextBox ID="DescriptionTextBox" runat="server" 
                        Text='<%# Bind("Description") %>' Height="60px" TextMode="MultiLine" 
                            Width="160px" /></td>
				</tr>                   
                    
                <tr>
				    <td>Remarks:</td>
					<td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                            Height="60px" TextMode="MultiLine" Width="160px" /></td>
				</tr>                   
                    
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center">
                                            SENT TO DETAILS</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                    
                <tr><td>Sent To:</td>
				    <td>
                        <asp:DropDownList ID="DropDownList_SentTo" runat="server">
                        </asp:DropDownList>
                    </td>
				</tr>                    
                    
                <tr>
				    <td>Office:</td>
					<td>
                        <asp:DropDownList ID="DropDownList_Office" runat="server">
                        </asp:DropDownList>
                    </td>
				</tr>                    
				
                <tr>
				    <td>Name:</td>
					<td><asp:TextBox ID="Name_OtherTextBox" runat="server" 
                        Text='<%# Bind("Name_Other") %>' Width="160px" /></td>
				</tr>                   
                    
                <tr>
				    <td>Address:</td>
					<td><asp:TextBox ID="Address_OtherTextBox" runat="server" 
                        Text='<%# Bind("Address_Other") %>' Height="60px" TextMode="MultiLine" 
                            Width="160px" /></td>
				</tr>                    
				
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center">
                                            DISPATCH DETAILS</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
				
                <tr>
				    <td>Send Via:</td>
					<td>
                        <asp:DropDownList ID="DropDownList_SendVia" runat="server">
                        </asp:DropDownList>
                    </td>
				</tr>                   
                    
                <tr>
				    <td>Courier Name(If Sent Through Courier):</td>
					<td><asp:TextBox ID="Courier_NameTextBox" runat="server" 
                        Text='<%# Bind("Courier_Name") %>' Width="160px" /></td>
				</tr>                    
                    
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center">
                                            COPY TO DETAILS</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                    
                <tr>
				    <td>Copy To:</td>
					<td>
                        <asp:DropDownList ID="DropDownList_CopyTo" runat="server" 
                            DataSourceID="ods_CopyTo" DataTextField="OfficeTypeName" 
                            DataValueField="OfficeTypeId">
                        </asp:DropDownList>
                    </td>
				</tr>                   
                    
                <tr>
				    <td>Office:</td>
					<td>
                        <asp:ListBox ID="ListBox_Office_CopyTo" runat="server" 
                            DataSourceID="ods_offices" DataTextField="OfficeName" 
                            DataValueField="OfficeTypeId"></asp:ListBox>
                    </td>
				</tr>                   
                    
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            <asp:Button ID="Button_addcopytodetails" runat="server" Text="Add" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:GridView ID="GridView_CopyTo" runat="server">
                                            </asp:GridView>
                                        </td>
                                    </tr>
                    
                <tr><td align="center" colspan=2><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insert" />
					&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                        CausesValidation="False" CommandName="Reset" Text="Reset" />	
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" /></td>
				</tr>                    
			</table>		
                </InsertItemTemplate>
                <EditItemTemplate>
                                <table align="center">
                <tr>
				    <td>Outward No:</td>
					<td><asp:TextBox ID="Outward_NoTextBox" runat="server" 
                        Text='<%# Bind("Outward_No") %>' Width="160px" /></td>
				</tr>								
                    
                <tr>
				    <td>OutWard Date:</td>
					<td><asp:TextBox ID="OutWard_DateTextBox" runat="server" 
                        Text='<%# Bind("OutWard_Date") %>' Width="160px" /></td>
				</tr>                
                    
                <tr>
				    <td>File No:</td>
					<td><asp:TextBox ID="File_NoTextBox" runat="server" Text='<%# Bind("File_No") %>' 
                            Width="160px" /></td>
				</tr>                   
                    
                <tr>
				    <td>Letter No:</td>
					<td><asp:TextBox ID="Letter_NoTextBox" runat="server" 
                        Text='<%# Bind("Letter_No") %>' Width="160px" /></td>
				</tr>                   
                    
                <tr>
				    <td>Document From Branch:</td>
					<td><asp:TextBox ID="Document_From_BranchTextBox" runat="server" 
                        Text='<%# Bind("Document_From_Branch") %>' Width="160px" /></td>
				</tr>                    
                    
                <tr>
				    <td>Description:</td>
					<td><asp:TextBox ID="DescriptionTextBox" runat="server" 
                        Text='<%# Bind("Description") %>' Width="160px" /></td>
				</tr>                   
                    
                <tr>
				    <td>Remarks:</td>
					<td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                            Width="160px" /></td>
				</tr>                   
                    
                <tr><td>Sent To:</td>
				    <td><asp:TextBox ID="Sent_ToTextBox" runat="server" Text='<%# Bind("Sent_To") %>' 
                            Width="160px" /></td>
				</tr>                    
                    
                <tr>
				    <td>Office:</td>
					<td><asp:TextBox ID="Office_Sent_ToTextBox" runat="server" 
                        Text='<%# Bind("Office_Sent_To") %>' Width="160px" /></td>
				</tr>                    
				
                <tr>
				    <td>Name:</td>
					<td><asp:TextBox ID="Name_OtherTextBox" runat="server" 
                        Text='<%# Bind("Name_Other") %>' Width="160px" /></td>
				</tr>                   
                    
                <tr>
				    <td>Address:</td>
					<td><asp:TextBox ID="Address_OtherTextBox" runat="server" 
                        Text='<%# Bind("Address_Other") %>' Width="160px" /></td>
				</tr>                    
				
                <tr>
				    <td>Send Via:</td>
					<td><asp:TextBox ID="Send_ViaTextBox" runat="server" 
                        Text='<%# Bind("Send_Via") %>' Width="160px" /></td>
				</tr>                   
                    
                <tr>
				    <td>Courier Name(If Sent Through Courier):</td>
					<td><asp:TextBox ID="Courier_NameTextBox" runat="server" 
                        Text='<%# Bind("Courier_Name") %>' Width="160px" /></td>
				</tr>                    
                    
                <tr>
				    <td>Copy To:</td>
					<td><asp:TextBox ID="Copy_ToTextBox" runat="server" Text='<%# Bind("Copy_To") %>' 
                            Width="160px" /></td>
				</tr>                   
                    
                <tr>
				    <td>Office:</td>
					<td><asp:TextBox ID="Office_Copy_ToTextBox" runat="server" 
                        Text='<%# Bind("Office_Copy_To") %>' Width="160px" /></td>
				</tr>                   
                    
                <tr><td align="center" colspan=2><asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" />
					&nbsp;<asp:LinkButton ID="ResetButton" runat="server" 
                        CausesValidation="False" CommandName="Reset" Text="Reset" />	
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" /></td>
				</tr>                    
			</table>		
                </EditItemTemplate>
                <ItemTemplate>
                    SrNo:
                    <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
                    <br />
                    Outward_No:
                    <asp:Label ID="Outward_NoLabel" runat="server" 
                        Text='<%# Bind("Outward_No") %>' />
                    <br />
                    OutWard_Date:
                    <asp:Label ID="OutWard_DateLabel" runat="server" 
                        Text='<%# Bind("OutWard_Date") %>' />
                    <br />
                    File_No:
                    <asp:Label ID="File_NoLabel" runat="server" Text='<%# Bind("File_No") %>' />
                    <br />
                    Letter_No:
                    <asp:Label ID="Letter_NoLabel" runat="server" 
                        Text='<%# Bind("Letter_No") %>' />
                    <br />
                    Document_From_Branch:
                    <asp:Label ID="Document_From_BranchLabel" runat="server" 
                        Text='<%# Bind("Document_From_Branch") %>' />
                    <br />
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" 
                        Text='<%# Bind("Description") %>' />
                    <br />
                    Remarks:
                    <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
                    <br />
                    Sent_To:
                    <asp:Label ID="Sent_ToLabel" runat="server" Text='<%# Bind("Sent_To") %>' />
                    <br />
                    Office_Sent_To:
                    <asp:Label ID="Office_Sent_ToLabel" runat="server" 
                        Text='<%# Bind("Office_Sent_To") %>' />
                    <br />
                    Name_Other:
                    <asp:Label ID="Name_OtherLabel" runat="server" 
                        Text='<%# Bind("Name_Other") %>' />
                    <br />
                    Address_Other:
                    <asp:Label ID="Address_OtherLabel" runat="server" 
                        Text='<%# Bind("Address_Other") %>' />
                    <br />
                    Send_Via:
                    <asp:Label ID="Send_ViaLabel" runat="server" Text='<%# Bind("Send_Via") %>' />
                    <br />
                    Courier_Name:
                    <asp:Label ID="Courier_NameLabel" runat="server" 
                        Text='<%# Bind("Courier_Name") %>' />
                    <br />
                    Copy_To:
                    <asp:Label ID="Copy_ToLabel" runat="server" Text='<%# Bind("Copy_To") %>' />
                    <br />
                    Office_Copy_To:
                    <asp:Label ID="Office_Copy_ToLabel" runat="server" 
                        Text='<%# Bind("Office_Copy_To") %>' />
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
          <%--  <asp:ObjectDataSource ID="odsGetOffices" runat="server" DataObjectTypeName="System.Guid"
                DeleteMethod="DeActivateOffice" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetOffices" TypeName="IGRSS.BusinessLogicLayer.Administration.ManageOffices">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="odsDeliveryType" runat="server" DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter"
                InsertMethod="AddInwardDetails" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetDeliveryType" TypeName="IGRSS.BusinessLogicLayer.InwardOutward"
                UpdateMethod="UpdateInwardDetails">
                <UpdateParameters>
                    <asp:Parameter Name="Parameter" Type="Object" />
                    <asp:Parameter Name="Inward_outwardId" Type="Object" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:XmlDataSource ID="XmlInwarddoctype" runat="server"></asp:XmlDataSource>--%>
            <asp:ObjectDataSource ID="ods_OutWardRegister" runat="server" 
                DeleteMethod="Delete" InsertMethod="Insert" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="IGRSS.DataAccessLayer.OutwardRegister_LatestTableAdapters.OutwardRegister_LatestTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_Outward_No" Type="String" />
                    <asp:Parameter Name="Original_OutWard_Date" Type="DateTime" />
                    <asp:Parameter Name="Original_File_No" Type="Int32" />
                    <asp:Parameter Name="Original_Letter_No" Type="Int32" />
                    <asp:Parameter Name="Original_Document_From_Branch" Type="String" />
                    <asp:Parameter Name="Original_Sent_To" Type="String" />
                    <asp:Parameter Name="Original_Office_Sent_To" Type="String" />
                    <asp:Parameter Name="Original_Name_Other" Type="String" />
                    <asp:Parameter Name="Original_Send_Via" Type="String" />
                    <asp:Parameter Name="Original_Courier_Name" Type="String" />
                    <asp:Parameter Name="Original_Copy_To" Type="String" />
                    <asp:Parameter Name="Original_Office_Copy_To" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Outward_No" Type="String" />
                    <asp:Parameter Name="OutWard_Date" Type="DateTime" />
                    <asp:Parameter Name="File_No" Type="Int32" />
                    <asp:Parameter Name="Letter_No" Type="Int32" />
                    <asp:Parameter Name="Document_From_Branch" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Remarks" Type="String" />
                    <asp:Parameter Name="Sent_To" Type="String" />
                    <asp:Parameter Name="Office_Sent_To" Type="String" />
                    <asp:Parameter Name="Name_Other" Type="String" />
                    <asp:Parameter Name="Address_Other" Type="String" />
                    <asp:Parameter Name="Send_Via" Type="String" />
                    <asp:Parameter Name="Courier_Name" Type="String" />
                    <asp:Parameter Name="Copy_To" Type="String" />
                    <asp:Parameter Name="Office_Copy_To" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Outward_No" Type="String" />
                    <asp:Parameter Name="OutWard_Date" Type="DateTime" />
                    <asp:Parameter Name="File_No" Type="Int32" />
                    <asp:Parameter Name="Letter_No" Type="Int32" />
                    <asp:Parameter Name="Document_From_Branch" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Remarks" Type="String" />
                    <asp:Parameter Name="Sent_To" Type="String" />
                    <asp:Parameter Name="Office_Sent_To" Type="String" />
                    <asp:Parameter Name="Name_Other" Type="String" />
                    <asp:Parameter Name="Address_Other" Type="String" />
                    <asp:Parameter Name="Send_Via" Type="String" />
                    <asp:Parameter Name="Courier_Name" Type="String" />
                    <asp:Parameter Name="Copy_To" Type="String" />
                    <asp:Parameter Name="Office_Copy_To" Type="String" />
                    <asp:Parameter Name="Original_SrNo" Type="Int32" />
                    <asp:Parameter Name="Original_Outward_No" Type="String" />
                    <asp:Parameter Name="Original_OutWard_Date" Type="DateTime" />
                    <asp:Parameter Name="Original_File_No" Type="Int32" />
                    <asp:Parameter Name="Original_Letter_No" Type="Int32" />
                    <asp:Parameter Name="Original_Document_From_Branch" Type="String" />
                    <asp:Parameter Name="Original_Sent_To" Type="String" />
                    <asp:Parameter Name="Original_Office_Sent_To" Type="String" />
                    <asp:Parameter Name="Original_Name_Other" Type="String" />
                    <asp:Parameter Name="Original_Send_Via" Type="String" />
                    <asp:Parameter Name="Original_Courier_Name" Type="String" />
                    <asp:Parameter Name="Original_Copy_To" Type="String" />
                    <asp:Parameter Name="Original_Office_Copy_To" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <asp:XmlDataSource ID="XmlInwardtype" runat="server"></asp:XmlDataSource>
            <%--<asp:ObjectDataSource ID="odsOutward" runat="server" InsertMethod="AddOutWardDetails"
                OnInserting="odsOutward_Inserting" SelectMethod="GetAllOutwardDetailsById" TypeName="IGRSS.BusinessLogicLayer.InwardOutward"
                UpdateMethod="UpdateOutwardDetails" OnUpdating="odsOutward_Updating" OnInserted="odsOutward_Inserted">
                <UpdateParameters>
                    <asp:Parameter Name="Parameter" Type="Object" />
                    <asp:Parameter Name="Inward_OutwardId" Type="Object" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvOutWardDetails" Name="OutwardId" PropertyName="SelectedValue"
                        Type="Object" />
                </SelectParameters>
            </asp:ObjectDataSource>--%>
            <asp:ObjectDataSource ID="OdsDepartmentMaster" runat="server" SelectMethod="GetDepartmentMasterDetails"
                TypeName="IGRSS.BusinessLogicLayer.Employee" OldValuesParameterFormatString="original_{0}">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ods_offices" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                TypeName="IGRSS.DataAccessLayer.OfficesTypeTableAdapters.Offices1TableAdapter">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ods_CopyTo" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetData" 
                TypeName="IGRSS.DataAccessLayer.CopyToTableAdapters.OfficeTypes_LKPTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter DbType="Guid" Name="Original_OfficeTypeId" />
                    <asp:Parameter Name="Original_OfficeTypeName" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Guid" Name="OfficeTypeId" />
                    <asp:Parameter Name="OfficeTypeName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="OfficeTypeName" Type="String" />
                    <asp:Parameter DbType="Guid" Name="Original_OfficeTypeId" />
                    <asp:Parameter Name="Original_OfficeTypeName" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <%--<asp:ObjectDataSource ID="odsgv" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" 
                
                
                TypeName="IGRSS.DataAccessLayer.OutwardTableAdapters.OutwardRegisterTableAdapter" 
                DeleteMethod="Delete" InsertMethod="Insert" 
                onupdating="odsgv_Updating" onselecting="odsgv_Selecting">
                <DeleteParameters>
                    <asp:Parameter Name="Original_OutwardNo" Type="Int32" />
                    <asp:Parameter Name="Original_FormattedOutwardNo" Type="String" />
                    <asp:Parameter Name="Original_LetterNo" Type="Int32" />
                    <asp:Parameter Name="Original_OutwardDate" Type="DateTime" />
                    <asp:Parameter Name="Original_documentfrombranch" Type="String" />
                    <asp:Parameter Name="Original_SentTo" Type="String" />
                    <asp:Parameter Name="Original_CopyTo" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="FormattedOutwardNo" Type="String" />
                    <asp:Parameter Name="LetterNo" Type="Int32" />
                    <asp:Parameter Name="OutwardDate" Type="DateTime" />
                    <asp:Parameter Name="documentfrombranch" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="SentTo" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="CopyTo" Type="String" />
                    <asp:Parameter Name="Remarks" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>--%>
          <%--  <asp:ObjectDataSource ID="OdsOffices" runat="server" 
                DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter" 
                InsertMethod="AddNewOffices" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetOfficeDetails" 
                TypeName="IGRSS.BusinessLogicLayer.OfficeMaster"></asp:ObjectDataSource>--%>
        </asp:View>
    </asp:MultiView>
</asp:Content>

