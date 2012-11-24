<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/IGRSS_Default.master"
    CodeFile="GovtDoc.aspx.cs" Inherits="GovtDoc" %>

<asp:Content ID="content1" ContentPlaceHolderID="Main" runat="server">
    <script language="javascript">
        function generateDatePicker(id) {
            $('input[id*="' + id + '"]').datepicker({
                showOn: "both",
                buttonImage: "/WebApp/Styles/css/sunny/images/calendar.gif",
                buttonImageOnly: true
            });
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

            var datePickers = ["LetterDate"];
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

    <asp:MultiView ID="mvgovtdoc" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewGrid" runat="server">
       
<h1 style="text-align: center">GOVERMENT DOCUMENTS</h1>
    <table width="100%">
        <tr>
        
            <td align="right">
            <table>
                <tr>
                    <td align="right" style="width:641px;">
                        <asp:Label ID="lbllls" runat="server" meta:resourcekey="lblllsResource1" 
                            Text="Enter File Number :"></asp:Label>
                    </td>
                    <td class="textColumn">
                        <asp:TextBox ID="txtSearch" runat="server" 
                            meta:resourcekey="txtFileNoResource1" Width="265"></asp:TextBox>
                    </td>
                    <td>
                        <asp:LinkButton ID="ButtonSearch" runat="server" CssClass="standardButton" 
                            meta:resourcekey="btnSearchAppNoResource1" Text="Search" AccessKey="e" />
                    </td>
                </tr>
            </table>
            </td>
        </tr>
        <tr>
            <td align="right" colspan="3">
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="SrNo" 
                    DataSourceID="ObjectDataSource_govtdoc" EnableModelValidation="True" 
                    Width="100%" onrowdeleted="GridView2_RowDeleted" 
                    onrowdeleting="GridView2_RowDeleting" onrowediting="GridView2_RowEditing">
                    <Columns>
                        <asp:BoundField DataField="Details" HeaderText="Details" 
                            SortExpression="Details" Visible="False" />
                        <asp:BoundField DataField="DetailsOfOutput" HeaderText="DetailsOfOutput" 
                            SortExpression="DetailsOfOutput" Visible="False" />
                        <asp:BoundField DataField="DetailsOfPreservingFiles" 
                            HeaderText="DetailsOfPreservingFiles" 
                            SortExpression="DetailsOfPreservingFiles" Visible="False" />
                        <asp:BoundField DataField="FileNo" HeaderText="File No" 
                            SortExpression="FileNo" />
                        <asp:BoundField DataField="InwardNo" HeaderText="Inward No" 
                            SortExpression="InwardNo" />
                        <asp:BoundField DataField="LetterDate" HeaderText="Letter Date" 
                            SortExpression="LetterDate" />
                        <asp:BoundField DataField="LetterNo" HeaderText="Letter No" 
                            SortExpression="LetterNo" />
                        <asp:BoundField DataField="NameOfDepartment" HeaderText="Name Of Department" 
                            SortExpression="NameOfDepartment" />
                        <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                            SortExpression="Remarks" Visible="False" />
                        <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                            ReadOnly="True" SortExpression="SrNo" Visible="False" />
                        <asp:BoundField DataField="TypesOfRecord" HeaderText="Types Of Record" 
                            SortExpression="TypesOfRecord" />
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
             <asp:LinkButton ID="Button_new" runat="server" OnClick="Button_new_Click" 
                    Text="New" CssClass="standardButton" align="left" AccessKey="n" />
        </asp:View>
        <asp:View ID="viewFv" runat="server">
            <center>
            <h1>GOVERMENT DOCUMENTS</h1>
                <asp:FormView ID="FvGovtDoc" runat="server" BorderStyle="None" DataKeyNames="SrNo"
                    DataSourceID="ObjectDataSource_govtdoc" DefaultMode="Insert" 
                    EnableModelValidation="True" OnItemCommand="FvGovtDoc_ItemCommand" 
                    OnItemInserting="FvGovtDoc_ItemInserting" 
                    oniteminserted="FvGovtDoc_ItemInserted" 
                    onitemupdated="FvGovtDoc_ItemUpdated" onitemupdating="FvGovtDoc_ItemUpdating">
                    <EditItemTemplate>
                        <table align="center" cellspacing="5">
<tr align="left"><td align="left">Inward No:</td>
    <td align="left">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="InwardNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="InwardNoTextBox" runat="server" Text='<%# Bind("InwardNo") %>' 
        Width="160px" MaxLength="10" /></td></tr>
<tr align="left"><td align="left">Details:</td>
    <td align="left">
        &nbsp;</td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="DetailsTextBox" runat="server" Text='<%# Bind("Details") %>' 
        Height="60px" Width="160px" /></td></tr>		
<tr align="left"><td align="left">Letter No:</td>
    <td align="left">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="LetterNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="LetterNoTextBox" runat="server" numeric="integer" Text='<%# Bind("LetterNo") %>' 
        Width="160px" MaxLength="10" /></td></tr>		
<tr align="left"><td align="left">Letter Date:</td>
    <td align="left">
        &nbsp;</td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="LetterDateTextBox" runat="server" 
        Text='<%# Bind("LetterDate") %>' Width="140px" /></td></tr>
<tr align="left"><td align="left">Name Of Department:</td>
    <td align="left">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="DropDownListNameOfDepartment" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td>
    <td align="left" style="width:50%">
    <asp:DropDownList ID="DropDownListNameOfDepartment" runat="server" 
        DataSourceID="ObjectDataSource3" DataTextField="Name" 
        DataValueField="Name" Width="160px">
    </asp:DropDownList>
    </td></tr>
<tr align="left"><td align="left">File No:</td>
    <td align="left">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="FileNoTextBox" runat="server" numeric="integer" Text='<%# Bind("FileNo") %>' 
        Width="160px" MaxLength="10" /></td></tr>	
<tr align="left"><td align="left">Details Of Output:</td>
    <td align="left">
        &nbsp;</td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="DetailsOfOutputTextBox" runat="server" 
        Text='<%# Bind("DetailsOfOutput") %>' Height="60px" Width="160px" /></td></tr>		
<tr align="left"><td align="left">Details Of Preserving Files:</td>
    <td align="left">
        &nbsp;</td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="DetailsOfPreservingFilesTextBox" runat="server" 
        Text='<%# Bind("DetailsOfPreservingFiles") %>' Height="60px" Width="160px" /></td></tr>		
<tr align="left"><td align="left">Types Of Record:</td>
    <td align="left">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
            ControlToValidate="TypesOfRecordTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="TypesOfRecordTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
        Text='<%# Bind("TypesOfRecord") %>' Width="160px" MaxLength="20" /></td></tr>		
<tr align="left"><td  align="left">Remarks:</td>
    <td align="left">
        &nbsp;</td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="RemarksTextBox" runat="server" onkeypress="return AllowAlphabet(event)" Text='<%# Bind("Remarks") %>' 
        Height="60px" Width="160px" /></td></tr>
<tr>
   <td  colspan="3" align="center">
    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
           CommandName="Update" Text="Update" CssClass="standardButton" />
     &nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="True" 
           CommandName="Reset" Text="Reset" 
           onclientclick="resetTextFields();return false;" CssClass="standardButton"/>
    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
           CausesValidation="False" CommandName="Back" Text="Back" 
           CssClass="standardButton" AccessKey="b" />
   </td>
</tr>
</table>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                                   <table align="center" cellspacing="5">
<tr align="left"><td align="left">Inward No:</td>
    <td align="left">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="InwardNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="InwardNoTextBox" runat="server" Text='<%# Bind("InwardNo") %>' 
        Width="160px" MaxLength="10" /></td></tr>
<tr align="left"><td align="left">Details:</td>
    <td align="left">
        &nbsp;</td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="DetailsTextBox" runat="server" Text='<%# Bind("Details") %>' 
        Height="60px" Width="160px" /></td></tr>		
<tr align="left"><td align="left">Letter No:</td>
    <td align="left">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="LetterNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="LetterNoTextBox" runat="server" numeric="integer" Text='<%# Bind("LetterNo") %>' 
        Width="160px" MaxLength="10" /></td></tr>		
<tr align="left"><td align="left">Letter Date:</td>
    <td align="left">
        &nbsp;</td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="LetterDateTextBox" runat="server" 
        Text='<%# Bind("LetterDate") %>' Width="140px" /></td></tr>
<tr align="left"><td align="left">Name Of Department:</td>
    <td align="left">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="DropDownListNameOfDepartment" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td>
    <td align="left" style="width:50%">
    <asp:DropDownList ID="DropDownListNameOfDepartment" runat="server" 
        DataSourceID="ObjectDataSource3" DataTextField="Name" 
        DataValueField="Name" Width="160px">
    </asp:DropDownList>
    </td></tr>
<tr align="left"><td align="left">File No:</td>
    <td align="left">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="FileNoTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="FileNoTextBox" runat="server" numeric="integer" Text='<%# Bind("FileNo") %>' 
        Width="160px" MaxLength="10" /></td></tr>	
<tr align="left"><td align="left">Details Of Output:</td>
    <td align="left">
        &nbsp;</td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="DetailsOfOutputTextBox" runat="server" 
        Text='<%# Bind("DetailsOfOutput") %>' Height="60px" Width="160px" /></td></tr>		
<tr align="left"><td align="left">Details Of Preserving Files:</td>
    <td align="left">
        &nbsp;</td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="DetailsOfPreservingFilesTextBox" runat="server" 
        Text='<%# Bind("DetailsOfPreservingFiles") %>' Height="60px" Width="160px" /></td></tr>		
<tr align="left"><td align="left">Types Of Record:</td>
    <td align="left">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
            ControlToValidate="TypesOfRecordTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
    </td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="TypesOfRecordTextBox" runat="server" onkeypress="return AllowAlphabet(event)"
        Text='<%# Bind("TypesOfRecord") %>' Width="160px" MaxLength="20" /></td></tr>		
<tr align="left"><td  align="left">Remarks:</td>
    <td align="left">
        &nbsp;</td>
    <td align="left" style="width:50%">
    <asp:TextBox ID="RemarksTextBox" runat="server" onkeypress="return AllowAlphabet(event)" Text='<%# Bind("Remarks") %>' 
        Height="60px" Width="160px" /></td></tr>
<tr>
   <td  colspan="3" align="center">
    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
           CommandName="Insert" Text="Insert" CssClass="standardButton" />
     &nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="True" 
           CommandName="Reset" Text="Reset" 
           onclientclick="resetTextFields();return false;" CssClass="standardButton"/>
    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
           CausesValidation="False" CommandName="Back" Text="Back" 
           CssClass="standardButton" AccessKey="b" />
   </td>
</tr>
</table>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Details:
                        <asp:Label ID="DetailsLabel" runat="server" Text='<%# Bind("Details") %>' />
                        <br />
                        DetailsOfOutput:
                        <asp:Label ID="DetailsOfOutputLabel" runat="server" 
                            Text='<%# Bind("DetailsOfOutput") %>' />
                        <br />
                        DetailsOfPreservingFiles:
                        <asp:Label ID="DetailsOfPreservingFilesLabel" runat="server" 
                            Text='<%# Bind("DetailsOfPreservingFiles") %>' />
                        <br />
                        FileNo:
                        <asp:Label ID="FileNoLabel" runat="server" Text='<%# Bind("FileNo") %>' />
                        <br />
                        InwardNo:
                        <asp:Label ID="InwardNoLabel" runat="server" Text='<%# Bind("InwardNo") %>' />
                        <br />
                        LetterDate:
                        <asp:Label ID="LetterDateLabel" runat="server" 
                            Text='<%# Bind("LetterDate") %>' />
                        <br />
                        LetterNo:
                        <asp:Label ID="LetterNoLabel" runat="server" Text='<%# Bind("LetterNo") %>' />
                        <br />
                        NameOfDepartment:
                        <asp:Label ID="NameOfDepartmentLabel" runat="server" 
                            Text='<%# Bind("NameOfDepartment") %>' />
                        <br />
                        Remarks:
                        <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
                        <br />
                        SrNo:
                        <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
                        <br />
                        TypesOfRecord:
                        <asp:Label ID="TypesOfRecordLabel" runat="server" 
                            Text='<%# Bind("TypesOfRecord") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New" />
                    </ItemTemplate>
                </asp:FormView>
            </center>
            
            <%--<asp:FormView ID="FvGovtDoc" runat="server" DataKeyNames="SrNo" DataSourceID="ObjectDataSource_govtdoc"
                    EnableModelValidation="True" DefaultMode="Insert">
                    <EditItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    SrNo:
                                </td>
                                <td>
                                    <asp:TextBox ID="SrNoTextBox" runat="server" Text='<%# Bind("SrNo") %>' Width="160px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    InwardNo:
                                </td>
                                <td>
                                    <asp:TextBox ID="InwardNoTextBox" runat="server" Text='<%# Bind("InwardNo") %>' Width="160px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Details:
                                </td>
                                <td>
                                    <asp:TextBox ID="DetailsTextBox" runat="server" Text='<%# Bind("Details") %>' TextMode="MultiLine"
                                        Width="160px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    LetterNo:
                                </td>
                                <td>
                                    <asp:TextBox ID="LetterNoTextBox" runat="server" Text='<%# Bind("LetterNo") %>' Width="160px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    LetterDate:
                                </td>
                                <td>
                                    <asp:TextBox ID="LetterDateTextBox" runat="server" Text='<%# Bind("LetterDate") %>'
                                        Width="160px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    NameOfDepartment:
                                </td>
                                <td>
                                    <asp:TextBox ID="NameOfDepartmentTextBox" runat="server" Text='<%# Bind("NameOfDepartment") %>'
                                        Width="160px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    FileNo:
                                </td>
                                <td>
                                    <asp:TextBox ID="FileNoTextBox" runat="server" Text='<%# Bind("FileNo") %>' Width="160px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    DetailsOfOutput:
                                </td>
                                <td>
                                    <asp:TextBox ID="DetailsOfOutputTextBox" runat="server" Text='<%# Bind("DetailsOfOutput") %>'
                                        TextMode="MultiLine" Width="160px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    DetailsOfPreservingFiles:
                                </td>
                                <td>
                                    <asp:TextBox ID="DetailsOfPreservingFilesTextBox" runat="server" Text='<%# Bind("DetailsOfPreservingFiles") %>'
                                        TextMode="MultiLine" Width="160px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    TypesOfRecord:
                                </td>
                                <td>
                                    <asp:DropDownList ID="TypesOfRecord" runat="server" DataSourceID="ObjectDataSource_govtdoc"
                                        DataTextField="TypesOfRecord" DataValueField="TypesOfRecord" Width="160px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Remarks:
                                </td>
                                <td>
                                    <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                        Text="Insert" />
                                    &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancel" />
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <table>
                            <tr>
                                <td align="right" style="width: 228px">
                                    SrNo:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="SrNoTextBox" runat="server" Text='<%# Bind("SrNo") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 228px">
                                    InwardNo:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="InwardNoTextBox" runat="server" 
                                        Text='<%# Bind("InwardNo") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 228px">
                                    Details:
                                </td>
                                <td>
                                    <asp:TextBox ID="DetailsTextBox" runat="server" Text='<%# Bind("Details") %>' 
                                        TextMode="MultiLine" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 228px">
                                    LetterNo:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="LetterNoTextBox" runat="server" 
                                        Text='<%# Bind("LetterNo") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 228px">
                                    LetterDate:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="LetterDateTextBox" runat="server" 
                                        Text='<%# Bind("LetterDate") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 228px">
                                    NameOfDepartment:
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="DropDownListDepartment" runat="server" DataSourceID="ObjectDataSource3"
                                        DataTextField="Name" DataValueField="Name">
                                    </asp:DropDownList>
                                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="IGRSS.DataAccessLayer.FileManagementTableAdapters.FileManagementMasterTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 228px">
                                    FileNo:
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource2"
                                        DataTextField="FileNo" DataValueField="FileNo">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 228px">
                                    DetailsOfOutput:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="DetailsOfOutputTextBox" runat="server" Text='<%# Bind("DetailsOfOutput") %>'
                                        TextMode="MultiLine" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 228px">
                                    DetailsOfPreservingFiles:
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="DetailsOfPreservingFilesTextBox" runat="server" Text='<%# Bind("DetailsOfPreservingFiles") %>'
                                        TextMode="MultiLine" />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 228px">
                                    TypesOfRecord:
                                </td>
                                <td align="left">
                                    <asp:DropDownList ID="TypesOfRecord" runat="server" DataSourceID="ObjectDataSource_govtdoc"
                                        DataTextField="TypesOfRecord" DataValueField="TypesOfRecord">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="width: 228px">
                                    Remarks:
                                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                                        SelectMethod="GetData" TypeName="IGRSS.DataAccessLayer.FileRegisterTableAdapters.FileRegisterTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                                <td align="left">
                                    <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                        Text="Insert" />
                                    &nbsp;<asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False"
                                        CommandName="Cancel" Text="Cancel" />
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        SrNo:
                        <asp:Label ID="SrNoLabel" runat="server" Text='<%# Eval("SrNo") %>' />
                        <br />
                        InwardNo:
                        <asp:Label ID="InwardNoLabel" runat="server" Text='<%# Bind("InwardNo") %>' />
                        <br />
                        Details:
                        <asp:Label ID="DetailsLabel" runat="server" Text='<%# Bind("Details") %>' />
                        <br />
                        LetterNo:
                        <asp:Label ID="LetterNoLabel" runat="server" Text='<%# Bind("LetterNo") %>' />
                        <br />
                        LetterDate:
                        <asp:Label ID="LetterDateLabel" runat="server" Text='<%# Bind("LetterDate") %>' />
                        <br />
                        NameOfDepartment:
                        <asp:Label ID="NameOfDepartmentLabel" runat="server" Text='<%# Bind("NameOfDepartment") %>' />
                        <br />
                        FileNo:
                        <asp:Label ID="FileNoLabel" runat="server" Text='<%# Bind("FileNo") %>' />
                        <br />
                        DetailsOfOutput:
                        <asp:Label ID="DetailsOfOutputLabel" runat="server" Text='<%# Bind("DetailsOfOutput") %>' />
                        <br />
                        DetailsOfPreservingFiles:
                        <asp:Label ID="DetailsOfPreservingFilesLabel" runat="server" Text='<%# Bind("DetailsOfPreservingFiles") %>' />
                        <br />
                        TypesOfRecord:
                        <asp:Label ID="TypesOfRecordLabel" runat="server" Text='<%# Bind("TypesOfRecord") %>' />
                        <br />
                        Remarks:
                        <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
                        <br />
                        <asp:Button ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                            Text="Edit" />
                        &nbsp;<asp:Button ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                            Text="Delete" />
                        &nbsp;<asp:Button ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                            Text="New" />
                    </ItemTemplate>
                </asp:FormView>--%>
            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetData" TypeName="IGRSS.DataAccessLayer.DataSetDepartmentTableAdapters.DepartmentMasterTableAdapter">
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="ObjectDataSource_govtdoc" runat="server" DeleteMethod="DeleteQuery"
                InsertMethod="Insert"  OnSelecting="ObjectDataSource_govtdoc_Selecting"
                SelectMethod="GetData" TypeName="IGRSS.DataAccessLayer.GovtDocsTableAdapters.GovtDocsTableAdapter"
                UpdateMethod="UpdateQuery" ondeleting="ObjectDataSource_govtdoc_Deleting">
                <DeleteParameters>
                    <asp:Parameter Name="SrNo" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Details" Type="String" />
                    <asp:Parameter Name="DetailsOfOutput" Type="String" />
                    <asp:Parameter Name="DetailsOfPreservingFiles" Type="String" />
                    <asp:Parameter Name="FileNo" Type="Int32" />
                    <asp:Parameter Name="InwardNo" Type="String" />
                    <asp:Parameter Name="LetterDate" Type="DateTime" />
                    <asp:Parameter Name="LetterNo" Type="Int32" />
                    <asp:Parameter Name="NameOfDepartment" Type="String" />
                    <asp:Parameter Name="Remarks" Type="String" />
                    <asp:Parameter Name="TypesOfRecord" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearch" Name="searchKeyWord" PropertyName="Text"
                        Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InwardNo" Type="String" />
                    <asp:Parameter Name="Details" Type="String" />
                    <asp:Parameter Name="LetterNo" Type="Int32" />
                    <asp:Parameter Name="LetterDate" Type="DateTime" />
                    <asp:Parameter Name="NameOfDepartment" Type="String" />
                    <asp:Parameter Name="FileNo" Type="Int32" />
                    <asp:Parameter Name="DetailsOfOutput" Type="String" />
                    <asp:Parameter Name="DetailsOfPreservingFiles" Type="String" />
                    <asp:Parameter Name="TypesOfRecord" Type="String" />
                    <asp:Parameter Name="Remarks" Type="String" />
                    <asp:Parameter Name="SrNo" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>
