<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="VidhansabhaTarankitQuestionRegister.aspx.cs" Inherits="LatestPages_VidhansabhaTarankitQuestionRegister" %>

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
        var datePickers = ["DateTextBox"];
        for (var index = 0; index < datePickers.length; index++) {
            generateDatePicker(datePickers[index]);
        }
    });
 
    
</script>
<asp:MultiView ID="MultiviewTarankit" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<hr /><br />
<h1>VidhanSabha Tarankit Question Register</h1>
<table>
          <tr>
                    <td align="right" style="width:641px;" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" >
                        <asp:TextBox Width="160" ID="txtFileNo" runat="server" 
                            meta:resourcekey="txtFileNoResource1" ontextchanged="txtFileNo_TextChanged"></asp:TextBox></td>
                        <td align="right">
                        <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_Tarankit" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_Tarankit" 
                      EnableModelValidation="True">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="Tarankit_Atarnkit" HeaderText="Tarankit/Atarnkit" 
                              SortExpression="Tarankit_Atarnkit" />
                          <asp:BoundField DataField="quesno" HeaderText="Question Number" 
                              SortExpression="quesno" />
                          <asp:BoundField DataField="mlaName" HeaderText="Name Of MLA/MP" 
                              SortExpression="mlaName" />
                          <asp:BoundField DataField="mlaPlace" HeaderText="Place Of MLA/MP" 
                              SortExpression="mlaPlace" />
                          <asp:BoundField DataField="Subject" HeaderText="Subject" 
                              SortExpression="Subject" />
                          <asp:BoundField DataField="Number" HeaderText="Number given By Government" 
                              SortExpression="Number" Visible="False" />
                          <asp:BoundField DataField="Reply_Sent" HeaderText="Reply Sent" 
                              SortExpression="Reply_Sent" Visible="False" />
                          <asp:BoundField DataField="Date" HeaderText="Date On Which Information Is Sent" 
                              SortExpression="Date" />
                          <asp:BoundField DataField="Fileno" HeaderText="File Number" 
                              SortExpression="Fileno" />
                          <asp:BoundField DataField="Remarks" 
                              HeaderText="Remarks" 
                              SortExpression="Remarks" />
                          <asp:ButtonField CommandName="Update" Text="Update" />
                      </Columns>
                  </asp:GridView>
              </td>
          </tr>
 </table>
 <asp:LinkButton ID="Button_new" runat="server" Text="New" 
        onclick="Button_new_Click" CssClass="standardButton" />
</asp:View>

<asp:View ID="Formview" runat="server">
<center>
<h1>VidhanSabha Tarankit Question Register</h1>
<asp:FormView ID="FormView_Tarankit" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_Tarankit" EnableModelValidation="True" DefaultMode="Insert" 
        Width="60%" oniteminserting="FormView_Tarankit_ItemInserting" 
        onitemcommand="FormView_Tarankit_ItemCommand">
        <EditItemTemplate>
                    <table>
        <tr><td>Tarankit/Atarnkit:</td>
		    <td><asp:RadioButtonList ID="Radio_tarankit" runat="server" 
                RepeatDirection="Horizontal" Width="160px">
                <asp:ListItem Text="Starred" Value="Starred"></asp:ListItem>
                <asp:ListItem Text="UnStarred" Value="UnStarred"></asp:ListItem>
                </asp:RadioButtonList>
			</td>
		</tr>			
            
        <tr><td>Question Number:</td>
		    <td><asp:TextBox ID="quesnoTextBox" runat="server" Text='<%# Bind("quesno") %>' 
                    Width="160px" /></td>
		</tr>	             
            
		<tr><td>Name Of MLA/MP:</td>
		    <td>
                <asp:DropDownList ID="Drop_mlaname" runat="server" DataSourceID="ods_mlaname" 
                    DataTextField="MLAname" DataValueField="MLAname">
                </asp:DropDownList>
            </td>
		</tr>	            
            
        <tr><td>Place Of MLA/MP:</td>
		    <td><asp:TextBox ID="mlaPlaceTextBox" runat="server" 
                Text='<%# Bind("mlaPlace") %>' Width="160px" />
			</td>
		</tr>	              
                
        <tr><td>Subject:</td>
		    <td><asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' 
                    Width="160px" /></td>
		</tr>	              
                
        <tr><td>Number Given By Government:</td>
		    <td><asp:TextBox ID="NumberTextBox" runat="server" Text='<%# Bind("Number") %>' 
                    Width="160px" /></td>
		</tr>	              
                
        <tr><td>Reply Sent:</td>
		    <td><asp:TextBox ID="Reply_SentTextBox" runat="server" 
                    Text='<%# Bind("Reply_Sent") %>' Width="160px" />
			</td>
		</tr>	
                
                
        <tr><td>Date On Which Information Is Sent:</td>
		    <td><asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' 
                    Width="160px" /></td>
		</tr>	               
                
        <tr><td>File Number:</td>
		    <td><asp:TextBox ID="FilenoTextBox" runat="server" Text='<%# Bind("Fileno") %>' 
                    Width="160px" /></td>
		</tr>	             
                
        <tr><td>Remarks:</td>
		    <td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                    Height="60px" TextMode="MultiLine" Width="160px" /></td>
		</tr>	             
                
        <tr><td colspan=2 align="center">
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" CssClass="standardButton" />
					&nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="False" 
                    CommandName="Reset" Text="Reset" 
                onclientclick="resetTextFields();return false;" 
                CssClass="standardButton" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                    CommandName="Back" Text="Back" CssClass="standardButton" />
			</td>
		</tr>
    </table> 		
                            
        </EditItemTemplate>
        <InsertItemTemplate>
                    <table>
        <tr><td>Tarankit/Atarnkit:</td>
		    <td><asp:RadioButtonList ID="Radio_tarankit" runat="server" 
                RepeatDirection="Horizontal" Width="160px">
                <asp:ListItem Text="Starred" Value="Starred"></asp:ListItem>
                <asp:ListItem Text="UnStarred" Value="UnStarred"></asp:ListItem>
                </asp:RadioButtonList>
			</td>
		</tr>			
            
        <tr><td>Question Number:</td>
		    <td><asp:TextBox ID="quesnoTextBox" runat="server" Text='<%# Bind("quesno") %>' 
                    Width="160px" /></td>
		</tr>	             
            
		<tr><td>Name Of MLA/MP:</td>
		    <td>
                <asp:DropDownList ID="Drop_mlaname" runat="server" DataSourceID="ods_mlaname" 
                    DataTextField="MLAname" DataValueField="MLAname">
                </asp:DropDownList>
            </td>
		</tr>	            
            
        <tr><td>Place Of MLA/MP:</td>
		    <td><asp:TextBox ID="mlaPlaceTextBox" runat="server" 
                Text='<%# Bind("mlaPlace") %>' Width="160px" />
			</td>
		</tr>	              
                
        <tr><td>Subject:</td>
		    <td><asp:TextBox ID="SubjectTextBox" runat="server" Text='<%# Bind("Subject") %>' 
                    Width="160px" /></td>
		</tr>	              
                
        <tr><td>Number Given By Government:</td>
		    <td><asp:TextBox ID="NumberTextBox" runat="server" Text='<%# Bind("Number") %>' 
                    Width="160px" /></td>
		</tr>	              
                
        <tr><td>Reply Sent:</td>
		    <td><asp:TextBox ID="Reply_SentTextBox" runat="server" 
                    Text='<%# Bind("Reply_Sent") %>' Width="160px" />
			</td>
		</tr>	
                
                
        <tr><td>Date On Which Information Is Sent:</td>
		    <td><asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' 
                    Height="22px" Width="160px" /></td>
		</tr>	               
                
        <tr><td>File Number:</td>
		    <td><asp:TextBox ID="FilenoTextBox" runat="server" Text='<%# Bind("Fileno") %>' 
                    Width="160px" /></td>
		</tr>	             
                
        <tr><td>Remarks:</td>
		    <td><asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' 
                    Height="60px" TextMode="MultiLine" Width="160px" /></td>
		</tr>	             
                
        <tr><td colspan=2 align="center">
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" CssClass="standardButton" />
					&nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="False" 
                    CommandName="Reset" Text="Reset" 
                onclientclick="resetTextFields();return false;" 
                CssClass="standardButton" />
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
            Tarankit_Atarnkit:
            <asp:Label ID="Tarankit_AtarnkitLabel" runat="server" 
                Text='<%# Bind("Tarankit_Atarnkit") %>' />
            <br />
            quesno:
            <asp:Label ID="quesnoLabel" runat="server" Text='<%# Bind("quesno") %>' />
            <br />
            mlaName:
            <asp:Label ID="mlaNameLabel" runat="server" Text='<%# Bind("mlaName") %>' />
            <br />
            mlaPlace:
            <asp:Label ID="mlaPlaceLabel" runat="server" Text='<%# Bind("mlaPlace") %>' />
            <br />
            Subject:
            <asp:Label ID="SubjectLabel" runat="server" Text='<%# Bind("Subject") %>' />
            <br />
            Number:
            <asp:Label ID="NumberLabel" runat="server" 
                Text='<%# Bind("Number") %>' />
            <br />
            Reply_Sent:
            <asp:Label ID="Reply_SentLabel" runat="server" 
                Text='<%# Bind("Reply_Sent") %>' />
            <br />
            Date:
            <asp:Label ID="DateLabel" runat="server" 
                Text='<%# Bind("Date") %>' />
            <br />
            Fileno:
            <asp:Label ID="FilenoLabel" runat="server" 
                Text='<%# Bind("Fileno") %>' />
            <br />
            Remarks:
            <asp:Label ID="RemarksLabel" runat="server" 
                Text='<%# Bind("Remarks") %>' />
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
    
    <asp:ObjectDataSource ID="ods_Tarankit" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.TarankitTableAdapters.tarankitTableAdapter" 
        UpdateMethod="Update" onselecting="ods_Tarankit_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Tarankit_Atarnkit" Type="String" />
            <asp:Parameter Name="Original_quesno" Type="Int32" />
            <asp:Parameter Name="Original_MLAname" Type="String" />
            <asp:Parameter Name="Original_mlaPlace" Type="String" />
            <asp:Parameter Name="Original_Subject" Type="String" />
            <asp:Parameter Name="Original_Number" Type="Int32" />
            <asp:Parameter Name="Original_Reply_Sent" Type="String" />
            <asp:Parameter Name="Original_Date" Type="DateTime" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Tarankit_Atarnkit" Type="String" />
            <asp:Parameter Name="quesno" Type="Int32" />
            <asp:Parameter Name="MLAname" Type="String" />
            <asp:Parameter Name="mlaPlace" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Number" Type="Int32" />
            <asp:Parameter Name="Reply_Sent" Type="String" />
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Tarankit_Atarnkit" Type="String" />
            <asp:Parameter Name="quesno" Type="Int32" />
            <asp:Parameter Name="MLAname" Type="String" />
            <asp:Parameter Name="mlaPlace" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Number" Type="Int32" />
            <asp:Parameter Name="Reply_Sent" Type="String" />
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_Tarankit_Atarnkit" Type="String" />
            <asp:Parameter Name="Original_quesno" Type="Int32" />
            <asp:Parameter Name="Original_MLAname" Type="String" />
            <asp:Parameter Name="Original_mlaPlace" Type="String" />
            <asp:Parameter Name="Original_Subject" Type="String" />
            <asp:Parameter Name="Original_Number" Type="Int32" />
            <asp:Parameter Name="Original_Reply_Sent" Type="String" />
            <asp:Parameter Name="Original_Date" Type="DateTime" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_mlaname" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetData" 
        TypeName="IGRSS.DataAccessLayer.MLATableAdapters.MLATableAdapter" 
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_InwardNo" Type="String" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_MLAname" Type="String" />
            <asp:Parameter Name="Original_Subject" Type="String" />
            <asp:Parameter Name="Original_LetterNo" Type="Int32" />
            <asp:Parameter Name="Original_LetterDate" Type="DateTime" />
            <asp:Parameter Name="Original_DepartmentName" Type="String" />
            <asp:Parameter Name="Original_FileNumber" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="InwardNo" Type="String" />
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="MLAname" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="LetterNo" Type="Int32" />
            <asp:Parameter Name="LetterDate" Type="DateTime" />
            <asp:Parameter Name="DepartmentName" Type="String" />
            <asp:Parameter Name="FileNumber" Type="Int32" />
            <asp:Parameter Name="DetailsofOutput" Type="String" />
            <asp:Parameter Name="DetailsofFilePreservation" Type="String" />
            <asp:Parameter Name="DetailsOfRecord" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="InwardNo" Type="String" />
            <asp:Parameter Name="FileNo" Type="Int32" />
            <asp:Parameter Name="MLAname" Type="String" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="LetterNo" Type="Int32" />
            <asp:Parameter Name="LetterDate" Type="DateTime" />
            <asp:Parameter Name="DepartmentName" Type="String" />
            <asp:Parameter Name="FileNumber" Type="Int32" />
            <asp:Parameter Name="DetailsofOutput" Type="String" />
            <asp:Parameter Name="DetailsofFilePreservation" Type="String" />
            <asp:Parameter Name="DetailsOfRecord" Type="String" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="Original_SrNo" Type="Int32" />
            <asp:Parameter Name="Original_InwardNo" Type="String" />
            <asp:Parameter Name="Original_FileNo" Type="Int32" />
            <asp:Parameter Name="Original_MLAname" Type="String" />
            <asp:Parameter Name="Original_Subject" Type="String" />
            <asp:Parameter Name="Original_LetterNo" Type="Int32" />
            <asp:Parameter Name="Original_LetterDate" Type="DateTime" />
            <asp:Parameter Name="Original_DepartmentName" Type="String" />
            <asp:Parameter Name="Original_FileNumber" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView>
</asp:Content>

