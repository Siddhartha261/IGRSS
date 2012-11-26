<%@ Page  Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="Copy of OutwardRegisterNew.aspx.cs"
 Inherits="Inward_Outward_OutwardRegisterNew" Title="Outward Register" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>    

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
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
    <asp:MultiView ID="mvOutwardRegister" runat="server" ActiveViewIndex="0">
        <asp:View ID="vieGrid" runat="server">
        <hr />
        <h1>OUTWARD REGISTER</h1>
        <br />
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
                    <asp:GridView ID="gvOutWardDetails" runat="server" AutoGenerateColumns="False"
                DataSourceID="odsgv"
                meta:resourcekey="gvOutWardDetailsResource1" EnableModelValidation="True" 
                AllowPaging="True" AllowSorting="True" DataKeyNames="OutwardNo">
                <Columns>
                    <asp:BoundField DataField="OutwardNo" HeaderText="OutwardNo" ReadOnly="True" 
                        SortExpression="OutwardNo" InsertVisible="False" Visible="false"/>
                    <asp:BoundField DataField="FormattedOutwardNo" HeaderText="FormattedOutwardNo" 
                        SortExpression="FormattedOutwardNo" Visible="false"/>
                        <asp:BoundField DataField="outward_no" HeaderText="Outward No" ReadOnly="True" 
                        SortExpression="outward_no" />
                    <asp:BoundField DataField="LetterNo" HeaderText="Letter No" 
                        SortExpression="LetterNo" />
                    <asp:BoundField DataField="OutwardDate" HeaderText="Outward Date" 
                        SortExpression="OutwardDate" />
                    <asp:BoundField DataField="documentfrombranch" HeaderText="Document Sent From Branch" 
                        SortExpression="documentfrombranch" />
                    <asp:BoundField DataField="Description" HeaderText="Description" 
                        SortExpression="Description" Visible="False" />
                    <asp:BoundField DataField="SentTo" HeaderText="Sent To" 
                        SortExpression="SentTo" />
                    <asp:BoundField DataField="Address" HeaderText="Address" 
                        SortExpression="Address" Visible="False" />
                    <asp:BoundField DataField="CopyTo" HeaderText="Copy To" 
                        SortExpression="CopyTo" />
                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                        SortExpression="Remarks" Visible="False" />
                    
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
        <asp:View ID="viewOutwardRegister" runat="server">
        <hr />
        <h1>OUTWARD REGISTER</h1>
        <center>
            <asp:FormView ID="FvOutward" runat="server" Width="50%" DataKeyNames="OutwardNo"
                DefaultMode="Insert" meta:resourcekey="FvOutward" DataSourceID="odsgv" EnableModelValidation="True" 
                onitemcommand="FvOutward_ItemCommand" 
                onitemupdating="FvOutward_ItemUpdating" 
                oniteminserted="FvOutward_ItemInserted" onload="FvOutward_Load">
                <InsertItemTemplate>
                    <table >
                        <tr><td align="right">Outward No:</td><td align="left"><asp:TextBox ID="FormattedOutwardNoTextBox" runat="server" 
                        Text='<%# Bind("FormattedOutwardNo") %>' Width="160px"/></td></tr>
                        <tr><td align="right">Outward Date:</td><td align="left">
                            <asp:TextBox ID="OutwardDateTextBox" runat="server" 
                                Text='<%# Bind("OutwardDate") %>' Width="140px" /></td></tr>
                        <tr>
                            <td align="right">
                                File Number:</td>
                            <td align="left">
                                <asp:TextBox ID="TextBox_Fileno" runat="server" 
                                    Text='<%# Bind("OutwardDate") %>' Width="160px" />
                            </td>
                        </tr>
                        <tr><td align="right">Letter No:</td><td align="left">
                            <asp:ListBox ID="ListBox1" runat="server">
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                            </asp:ListBox>
                            </td></tr>
                        <tr><td align="right">Document From Branch:</td><td align="left">
                            <asp:DropDownList ID="DropDownList_frombranch" runat="server">
                                <asp:ListItem>Branch1</asp:ListItem>
                                <asp:ListItem>Branch2</asp:ListItem>
                                <asp:ListItem>Branch3</asp:ListItem>
                                <asp:ListItem>Branch4</asp:ListItem>
                                <asp:ListItem>Branch5</asp:ListItem>
                            </asp:DropDownList>
                            </td></tr>
                        <tr><td align="right">Description:</td><td align="left">
                            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                                Text='<%# Bind("Description") %>' TextMode="MultiLine" Width="160px" 
                                Height="60px" /></td></tr>
                        <tr>
                            <td align="right">
                                Remarks:</td>
                            <td align="left">
                                <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                                    TextMode="MultiLine" Width="160px" Height="60px" />
                            </td>
                        </tr>
                        
                        <tr>
                            <td align="right" colspan="2" style="text-align: center">
                                SENT TO DETAILS</td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2" style="text-align: center">
                                &nbsp;</td>
                        </tr>
                        <tr><td align="right">Sent To:</td><td align="left">
                            <asp:DropDownList ID="DropDownList_SentTo" runat="server" Width="160px">
                                <asp:ListItem>Registrar</asp:ListItem>
                                <asp:ListItem>SubRegistrar</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                            </td></tr>
                        <tr><td align="right">Office</td><td align="left">
                            <asp:DropDownList ID="DropDownList_Office" runat="server" Width="160px">
                                <asp:ListItem>Office1</asp:ListItem>
                                <asp:ListItem>Office2</asp:ListItem>
                                <asp:ListItem>Office3</asp:ListItem>
                                <asp:ListItem>Office4</asp:ListItem>
                                <asp:ListItem>Office5</asp:ListItem>
                            </asp:DropDownList>
                            </td></tr>
                        <tr>
                            <td align="right">
                                &nbsp;Name:</td>
                            <td align="left">
                                <asp:TextBox ID="OfficeNameTextBox" runat="server" Text='<%# Bind("CopyTo") %>' 
                                    Width="160px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Address:</td>
                            <td align="left">
                                <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' 
                                    TextMode="MultiLine" Width="160px" Height="60px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2" style="text-align: center">
                                DISPATCH DETAILS</td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                Send Via:</td>
                            <td align="left">
                                <asp:DropDownList ID="DropDownList_SendVia" runat="server" Width="160px">
                                    <asp:ListItem>Post</asp:ListItem>
                                    <asp:ListItem>Couriers</asp:ListItem>
                                    <asp:ListItem>Speed Post</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Courier Name(If Sent through Courier):&nbsp;
                            </td>
                            <td align="left" style="margin-left: 40px">
                                <asp:TextBox ID="CourierTextBox" runat="server" Text='<%# Bind("CopyTo") %>' 
                                    Width="160px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td align="left" style="margin-left: 40px">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2" style="text-align: center">
                                COPY TO DETAILS</td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td align="left" style="margin-left: 40px">
                                &nbsp;</td>
                        </tr>
                        <tr><td align="right">Copy To:</td><td align="left">
                            <asp:ListBox ID="ListBox2" runat="server">
                                <asp:ListItem>Registrar</asp:ListItem>
                                <asp:ListItem>SubRegistrar</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:ListBox>
                            </td></tr>
                        <tr><td align="right">Office:</td><td align="left">
                            <asp:DropDownList ID="DropDownList_Office_copyto" runat="server" Width="160px">
                                <asp:ListItem>Office1</asp:ListItem>
                                <asp:ListItem>Office2</asp:ListItem>
                                <asp:ListItem>Office3</asp:ListItem>
                                <asp:ListItem>Office4</asp:ListItem>
                                <asp:ListItem>Office5</asp:ListItem>
                            </asp:DropDownList>
                            </td></tr>
                        <tr>
                            <td align="right">
                                Name:</td>
                            <td align="left">
                                <asp:TextBox ID="OfficeNameTextBox_copyto" runat="server" 
                                    Text='<%# Bind("CopyTo") %>' Width="160px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Address:</td>
                            <td align="left">
                                <asp:TextBox ID="AddressTextBox_copyto" runat="server" Height="60px" 
                                    Text='<%# Bind("CopyTo") %>' TextMode="MultiLine" Width="160px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td align="left">
                                <asp:Button ID="Button_addcopytodetails" runat="server" Text="Add" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                    EnableModelValidation="True">
                                    <Columns>
                                        <asp:TemplateField HeaderText="">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="CheckBox2" runat="server" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"> <%#Eval("Name")%></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    
                       <asp:TemplateField HeaderText="Address">
                       <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"> <%#Eval("Address")%></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Price Or Stamp Value">
                             <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"> <%#Eval("PriceOrStampValue")%></asp:Label>
                            </ItemTemplate>
                       </asp:TemplateField>

                                      
                                       
                      </Columns>                                    
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr><td colspan="2" align="center"><asp:Button ID="InsertButton" runat="server" 
                                CausesValidation="True" CommandName="Insert" Text="Insert" 
                                CssClass="standardButton" />&nbsp;<asp:Button 
                                ID="ResetButton" runat="server" CausesValidation="True" CommandName="Reset" 
                                Text="Reset" onclientclick="resetTextFields();return false;" 
                                CssClass="standardButton" />&nbsp;<asp:Button ID="InsertCancelButton" 
                                runat="server" CausesValidation="False" CommandName="Back" Text="Back" 
                                CssClass="standardButton" /></td></tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <%--<table >
                        <tr><td align="right">Outward No:</td><td align="left"><asp:TextBox ID="FormattedOutwardNoTextBox" runat="server" 
                        Text='<%# Bind("FormattedOutwardNo") %>' Width="160px"/></td></tr>
                        <tr><td align="right">Outward Date:</td><td align="left"><asp:TextBox ID="OutwardDateTextBox" runat="server" Text='<%# Bind("OutwardDate") %>' Width="160px" /></td></tr>
                        <tr><td align="right">Letter No:</td><td align="left"><asp:TextBox ID="LetterNoTextBox" runat="server" Text='<%# Bind("LetterNo") %>' Width="160px" /></td></tr>
                        <tr><td align="right">Document From Branch:</td><td align="left"><asp:TextBox ID="documentfrombranchTextBox" runat="server" Text='<%# Bind("documentfrombranch") %>' Width="160px" /></td></tr>
                        <tr><td align="right">Description:</td><td align="left"><asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine" Width="160px" /></td></tr>
                        <tr><td align="right">Sent To:</td><td align="left">
                            <asp:DropDownList ID="DropDownList_SentTo" runat="server" Width="160px">
                            </asp:DropDownList>
                            </td></tr>
                        <tr><td align="right">Address:</td><td align="left"><asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' TextMode="MultiLine" Width="160px" /></td></tr>
                        <tr><td align="right">Copy To:</td><td align="left"><asp:TextBox ID="CopyToTextBox" runat="server" Text='<%# Bind("CopyTo") %>' Width="160px" /></td></tr>
                        <tr><td align="right">Remarks:</td><td align="left"><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' TextMode="MultiLine" Width="160px" /></td></tr>
                        <tr><td colspan="2" align="center">
                            <asp:Button ID="UpdateButton" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" CssClass="standardButton" />&nbsp; <asp:Button ID="ResetButton" 
                                runat="server" CausesValidation="True" 
                        CommandName="Reset" Text="Reset" onclientclick="resetTextFields();return false;" 
                                CssClass="standardButton" /> &nbsp;<asp:Button ID="UpdateCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Back" Text="Back" 
                                CssClass="standardButton" /></td></tr>
                    </table>--%>
                    <table >
                        <tr><td align="right">Outward No:</td><td align="left"><asp:TextBox ID="FormattedOutwardNoTextBox" runat="server" 
                        Text='<%# Bind("FormattedOutwardNo") %>' Width="160px"/></td></tr>
                        <tr><td align="right">Outward Date:</td><td align="left">
                            <asp:TextBox ID="OutwardDateTextBox" runat="server" 
                                Text='<%# Bind("OutwardDate") %>' Width="140px" /></td></tr>
                        <tr>
                            <td align="right">
                                File Number:</td>
                            <td align="left">
                                <asp:TextBox ID="TextBox_Fileno" runat="server" 
                                    Text='<%# Bind("OutwardDate") %>' Width="160px" />
                            </td>
                        </tr>
                        <tr><td align="right">Letter No:</td><td align="left">
                            <asp:ListBox ID="ListBox1" runat="server">
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                                <asp:ListItem>13</asp:ListItem>
                                <asp:ListItem>14</asp:ListItem>
                            </asp:ListBox>
                            </td></tr>
                        <tr><td align="right">Document From Branch:</td><td align="left">
                            <asp:DropDownList ID="DropDownList_frombranch" runat="server">
                                <asp:ListItem>Branch1</asp:ListItem>
                                <asp:ListItem>Branch2</asp:ListItem>
                                <asp:ListItem>Branch3</asp:ListItem>
                                <asp:ListItem>Branch4</asp:ListItem>
                                <asp:ListItem>Branch5</asp:ListItem>
                            </asp:DropDownList>
                            </td></tr>
                        <tr><td align="right">Description:</td><td align="left">
                            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                                Text='<%# Bind("Description") %>' TextMode="MultiLine" Width="160px" 
                                Height="60px" /></td></tr>
                        <tr>
                            <td align="right">
                                Remarks:</td>
                            <td align="left">
                                <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                                    TextMode="MultiLine" Width="160px" Height="60px" />
                            </td>
                        </tr>
                        
                        <tr>
                            <td align="right" colspan="2" style="text-align: center">
                                SENT TO DETAILS</td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2" style="text-align: center">
                                &nbsp;</td>
                        </tr>
                        <tr><td align="right">Sent To:</td><td align="left">
                            <asp:DropDownList ID="DropDownList_SentTo" runat="server" Width="160px">
                                <asp:ListItem>Registrar</asp:ListItem>
                                <asp:ListItem>SubRegistrar</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                            </td></tr>
                        <tr><td align="right">Office</td><td align="left">
                            <asp:DropDownList ID="DropDownList_Office" runat="server" Width="160px">
                                <asp:ListItem>Office1</asp:ListItem>
                                <asp:ListItem>Office2</asp:ListItem>
                                <asp:ListItem>Office3</asp:ListItem>
                                <asp:ListItem>Office4</asp:ListItem>
                                <asp:ListItem>Office5</asp:ListItem>
                            </asp:DropDownList>
                            </td></tr>
                        <tr>
                            <td align="right">
                                &nbsp;Name:</td>
                            <td align="left">
                                <asp:TextBox ID="OfficeNameTextBox" runat="server" Text='<%# Bind("CopyTo") %>' 
                                    Width="160px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Address:</td>
                            <td align="left">
                                <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' 
                                    TextMode="MultiLine" Width="160px" Height="60px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2" style="text-align: center">
                                DISPATCH DETAILS</td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right">
                                Send Via:</td>
                            <td align="left">
                                <asp:DropDownList ID="DropDownList_SendVia" runat="server" Width="160px">
                                    <asp:ListItem>Post</asp:ListItem>
                                    <asp:ListItem>Couriers</asp:ListItem>
                                    <asp:ListItem>Speed Post</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Courier Name(If Sent through Courier):&nbsp;
                            </td>
                            <td align="left" style="margin-left: 40px">
                                <asp:TextBox ID="CourierTextBox" runat="server" Text='<%# Bind("CopyTo") %>' 
                                    Width="160px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td align="left" style="margin-left: 40px">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2" style="text-align: center">
                                COPY TO DETAILS</td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td align="left" style="margin-left: 40px">
                                &nbsp;</td>
                        </tr>
                        <tr><td align="right">Copy To:</td><td align="left">
                            <asp:ListBox ID="ListBox2" runat="server">
                                <asp:ListItem>Registrar</asp:ListItem>
                                <asp:ListItem>SubRegistrar</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:ListBox>
                            </td></tr>
                        <tr><td align="right">Office:</td><td align="left">
                            <asp:DropDownList ID="DropDownList_Office_copyto" runat="server" Width="160px">
                                <asp:ListItem>Office1</asp:ListItem>
                                <asp:ListItem>Office2</asp:ListItem>
                                <asp:ListItem>Office3</asp:ListItem>
                                <asp:ListItem>Office4</asp:ListItem>
                                <asp:ListItem>Office5</asp:ListItem>
                            </asp:DropDownList>
                            </td></tr>
                        <tr>
                            <td align="right">
                                Name:</td>
                            <td align="left">
                                <asp:TextBox ID="OfficeNameTextBox_copyto" runat="server" 
                                    Text='<%# Bind("CopyTo") %>' Width="160px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                Address:</td>
                            <td align="left">
                                <asp:TextBox ID="AddressTextBox_copyto" runat="server" Height="60px" 
                                    Text='<%# Bind("CopyTo") %>' TextMode="MultiLine" Width="160px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                &nbsp;</td>
                            <td align="left">
                                <asp:Button ID="Button_addcopytodetails" runat="server" Text="Add" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                    EnableModelValidation="True">
                                    <Columns>
                                        <asp:TemplateField HeaderText="">
                                            <HeaderTemplate>
                                                <asp:CheckBox ID="CheckBox2" runat="server" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                                <asp:Label ID="Label1" runat="server"> <%#Eval("Name")%></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    
                       <asp:TemplateField HeaderText="Address">
                       <ItemTemplate>
                                <asp:Label ID="Label2" runat="server"> <%#Eval("Address")%></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Price Or Stamp Value">
                             <ItemTemplate>
                                <asp:Label ID="Label3" runat="server"> <%#Eval("PriceOrStampValue")%></asp:Label>
                            </ItemTemplate>
                       </asp:TemplateField>

                                      
                                       
                      </Columns>                                    
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr><td colspan="2" align="center"><asp:Button ID="UpdateButton" runat="server" 
                                CausesValidation="True" CommandName="Update" Text="Update" 
                                CssClass="standardButton" />&nbsp;<asp:Button 
                                ID="ResetButton" runat="server" CausesValidation="True" CommandName="Reset" 
                                Text="Reset" onclientclick="resetTextFields();return false;" 
                                CssClass="standardButton" />&nbsp;<asp:Button ID="InsertCancelButton" 
                                runat="server" CausesValidation="False" CommandName="Back" Text="Back" 
                                CssClass="standardButton" /></td></tr>
                    </table>
                </EditItemTemplate>
                <ItemTemplate>
                    OutwardNo:
                    <asp:Label ID="OutwardNoLabel" runat="server" Text='<%# Eval("OutwardNo") %>' />
                    <br />
                    FormattedOutwardNo:
                    <asp:Label ID="FormattedOutwardNoLabel" runat="server" 
                        Text='<%# Bind("FormattedOutwardNo") %>' />
                    <br />
                    OutwardDate:
                    <asp:Label ID="OutwardDateLabel" runat="server" 
                        Text='<%# Bind("OutwardDate") %>' />
                    <br />
                    LetterNo:
                    <asp:Label ID="LetterNoLabel" runat="server" Text='<%# Bind("LetterNo") %>' />
                    <br />
                    documentfrombranch:
                    <asp:Label ID="documentfrombranchLabel" runat="server" 
                        Text='<%# Bind("documentfrombranch") %>' />
                    <br />
                    Description:
                    <asp:Label ID="DescriptionLabel" runat="server" 
                        Text='<%# Bind("Description") %>' />
                    <br />
                    SentTo:
                    <asp:Label ID="SentToLabel" runat="server" Text='<%# Bind("SentTo") %>' />
                    <br />
                    Address:
                    <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                    <br />
                    CopyTo:
                    <asp:Label ID="CopyToLabel" runat="server" Text='<%# Bind("CopyTo") %>' />
                    <br />
                    Remarks:
                    <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
                    <br />
                </ItemTemplate>
            </asp:FormView>
            </center>
            <asp:ObjectDataSource ID="odsGetOffices" runat="server" DataObjectTypeName="System.Guid"
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
            <asp:XmlDataSource ID="XmlInwarddoctype" runat="server"></asp:XmlDataSource>
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
            <asp:ObjectDataSource ID="odsgv" runat="server" OldValuesParameterFormatString="original_{0}"
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
            </asp:ObjectDataSource>
            <asp:ObjectDataSource ID="OdsOffices" runat="server" 
                DataObjectTypeName="IGRSS.BusinessObjects.FormViewParameter" 
                InsertMethod="AddNewOffices" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetOfficeDetails" 
                TypeName="IGRSS.BusinessLogicLayer.OfficeMaster"></asp:ObjectDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>

