<%@ Page Title="" Language="C#" MasterPageFile="~/IGRSS_Default.master" AutoEventWireup="true" CodeFile="Sealing.aspx.cs" Inherits="InspectionDepartment_Sealing" %>

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
        var datePickers = ["FromDateTextBox", "ToDateTextBox"];
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
<asp:MultiView ID="Multiview_Sealing" runat="server" ActiveViewIndex="0">
<asp:View ID="ViewGrid" runat="server">
<hr /><br />
<h1>Sealing</h1>
<table>
          <tr>
                    <td align="right" style="width:641px; height: 30px;" >
                        <asp:Label ID="lbllls" runat="server" Text="Enter File Number :" 
                            meta:resourcekey="lblllsResource1"></asp:Label></td>
                    <td align="left" style="height: 30px" >
                        <asp:TextBox Width="160" ID="txtFileNo" runat="server" 
                            meta:resourcekey="txtFileNoResource1"></asp:TextBox></td>
                        <td align="right" style="height: 30px">
                        <asp:LinkButton ID="btnSearchAppNo" runat="server" Text="Search"
                            meta:resourcekey="btnSearchAppNoResource1" CssClass="standardButton" />
                    </td>
          </tr>
          <tr>
              <td align="right" colspan="3">
                  <asp:GridView ID="GridView_Sealing" runat="server" AutoGenerateColumns="False" 
                      DataKeyNames="SrNo" DataSourceID="ods_Sealing" 
                      EnableModelValidation="True" onrowdeleted="GridView_Sealing_RowDeleted" 
                      onrowdeleting="GridView_Sealing_RowDeleting" 
                      onrowediting="GridView_Sealing_RowEditing">
                      <Columns>
                          <asp:BoundField DataField="SrNo" HeaderText="SrNo" InsertVisible="False" 
                              ReadOnly="True" SortExpression="SrNo" Visible="False" />
                          <asp:BoundField DataField="Kacheri_Office" HeaderText="Name Of Kacheri/Office" 
                              SortExpression="Kacheri_Office" />
                          <asp:BoundField DataField="FromDate" HeaderText="From Date" 
                              SortExpression="FromDate" />
                          <asp:BoundField DataField="ToDate" HeaderText="To Date" 
                              SortExpression="ToDate" />
                          <asp:BoundField DataField="PhotoVolumeNo" HeaderText="Photo Volume No" 
                              SortExpression="PhotoVolumeNo" />
                          <asp:BoundField DataField="BookNo" HeaderText="Book No" 
                              SortExpression="BookNo" />
                          <asp:BoundField DataField="SealedVolumes" HeaderText="Sealed Volumes" 
                              SortExpression="SealedVolumes" />
                          <asp:BoundField DataField="RemainingVolumes" HeaderText="Remaining Volumes" 
                              SortExpression="RemainingVolumes" />
                          <asp:BoundField DataField="Remarks" HeaderText="Remarks" 
                              SortExpression="Remarks" Visible="False" />
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
        CssClass="standardButton" onclick="Button_new_Click" />
</asp:View>

<asp:View ID="Formview" runat="server">
<center>
<h1>Sealing</h1></center>
<center>
<asp:FormView ID="FormView_Sealing" runat="server" DataKeyNames="SrNo" 
        DataSourceID="ods_Sealing" EnableModelValidation="True" 
        DefaultMode="Insert" oniteminserting="FormView_Sealing_ItemInserting" 
        onitemcommand="FormView_Sealing_ItemCommand" Width="70%" 
        oniteminserted="FormView_Sealing_ItemInserted" 
        onitemupdated="FormView_Sealing_ItemUpdated" 
        onitemupdating="FormView_Sealing_ItemUpdating" >
        <EditItemTemplate>
                               <table>
	       <tr>
		       <td>Name Of Kacheri/Office:</td>
			   <td>
                   <asp:DropDownList ID="DropDownList_officename" runat="server" Width="160px" 
                       DataSourceID="ods_officesmaster" DataTextField="OfficeName" 
                       DataValueField="OfficeName">
                   </asp:DropDownList>
               </td>
			</tr>  
       		   
           <tr>
		       <td colspan="2" class="gridItems">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Time Span During Year:</td>
     	   </tr>
       	   
                                   <tr>
                                       <td>
                                           From Date:</td>
                                       <td>
                                           <asp:TextBox ID="FromDateTextBox" runat="server" Text='<%# Bind("FromDate") %>' 
                                               Width="160px" />
                                       </td>
                                   </tr>
       	   
           <tr>
		       <td>To Date:</td>
			   <td><asp:TextBox ID="ToDateTextBox" runat="server" 
                   Text='<%# Bind("ToDate") %>' Width="160px" /></td>
		   </tr>
        		 
           <tr>
		       <td>Photo Volume No:</td>
			   <td><asp:TextBox ID="PhotoVolumeNoTextBox" runat="server" 
                   Text='<%# Bind("PhotoVolumeNo") %>' Width="160px" /></td>
		   </tr>   
		   
           <tr>
		       <td>Book No:</td>
			   <td><asp:TextBox ID="BookNoTextBox" runat="server" 
                   Text='<%# Bind("BookNo") %>' Width="160px" /></td>
		   </tr>   
			  
           <tr>
		      <td>Sealed Photo Volumes During a Single Month:</td>
			  <td><asp:TextBox ID="SealedVolumesTextBox" runat="server" 
                  Text='<%# Bind("SealedVolumes") %>' Width="160px" /></td>
		   </tr>
            	   
           <tr>
		      <td>Remaining Volumes To Be Sealed At the end of the month:</td>
			  <td><asp:TextBox ID="RemainingVolumesTextBox" runat="server" 
                  Text='<%# Bind("RemainingVolumes") %>' Width="160px" /></td>
		   </tr>   
          		 
           <tr>
		      <td>Remarks:</td>
			  <td><asp:TextBox ID="RemarksTextBox" runat="server" 
                  Text='<%# Bind("Remarks") %>' Height="60px" Width="160px" /></td>
		  </tr>     
            	  
          <tr>
		      <td align="center" colspan=2 >
                  <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                  CommandName="Update" Text="Update" CssClass="standardButton" />
		          &nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="False" 
                  CommandName="Reset" Text="Reset" CssClass="standardButton" 
                      onclientclick="resetTextFields();return false;" />
                  &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" 
                  CommandName="Back" Text="Back" CssClass="standardButton" />
			  </td>			
		  </tr>	   
    </table>
            
        </EditItemTemplate>
        <InsertItemTemplate>
                               <table>
	       <tr>
		       <td>Name Of Kacheri/Office:</td>
			   <td>
                   <asp:DropDownList ID="DropDownList_officename" runat="server" Width="160px" 
                       DataSourceID="ods_officesmaster" DataTextField="OfficeName" 
                       DataValueField="OfficeName">
                   </asp:DropDownList>
               </td>
			</tr>  
       		   
           <tr>
		       <td colspan="2" class="gridItems">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Time Span During Year:</td>
     	   </tr>
       	   
                                   <tr>
                                       <td>
                                           From Date:</td>
                                       <td>
                                           <asp:TextBox ID="FromDateTextBox" runat="server" Text='<%# Bind("FromDate") %>' 
                                               Width="160px" />
                                       </td>
                                   </tr>
       	   
           <tr>
		       <td>To Date:</td>
			   <td><asp:TextBox ID="ToDateTextBox" runat="server" 
                   Text='<%# Bind("ToDate") %>' Width="160px" /></td>
		   </tr>
        		 
           <tr>
		       <td>Photo Volume No:</td>
			   <td><asp:TextBox ID="PhotoVolumeNoTextBox" runat="server" 
                   Text='<%# Bind("PhotoVolumeNo") %>' Width="160px" /></td>
		   </tr>   
		   
           <tr>
		       <td>Book No:</td>
			   <td><asp:TextBox ID="BookNoTextBox" runat="server" 
                   Text='<%# Bind("BookNo") %>' Width="160px" /></td>
		   </tr>   
			  
           <tr>
		      <td>Sealed Photo Volumes During a Single Month:</td>
			  <td><asp:TextBox ID="SealedVolumesTextBox" runat="server" 
                  Text='<%# Bind("SealedVolumes") %>' Width="160px" /></td>
		   </tr>
            	   
           <tr>
		      <td>Remaining Volumes To Be Sealed At the end of the month:</td>
			  <td><asp:TextBox ID="RemainingVolumesTextBox" runat="server" 
                  Text='<%# Bind("RemainingVolumes") %>' Width="160px" /></td>
		   </tr>   
          		 
           <tr>
		      <td>Remarks:</td>
			  <td><asp:TextBox ID="RemarksTextBox" runat="server" 
                  Text='<%# Bind("Remarks") %>' Height="60px" Width="160px" /></td>
		  </tr>     
            	  
          <tr>
		      <td align="center" colspan=2 >
                  <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                  CommandName="Insert" Text="Insert" CssClass="standardButton" />
		          &nbsp;<asp:LinkButton ID="ResetButton" runat="server" CausesValidation="False" 
                  CommandName="Reset" Text="Reset" CssClass="standardButton" 
                      onclientclick="resetTextFields();return false;" />
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
            Kacheri_Office:
            <asp:Label ID="Kacheri_OfficeLabel" runat="server" 
                Text='<%# Bind("Kacheri_Office") %>' />
            <br />
            FromDate:
            <asp:Label ID="FromDateLabel" runat="server" 
                Text='<%# Bind("FromDate") %>' />
            <br />
            ToDate:
            <asp:Label ID="ToDateLabel" runat="server" 
                Text='<%# Bind("ToDate") %>' />
            <br />
            PhotoVolumeNo:
            <asp:Label ID="PhotoVolumeNoLabel" runat="server" 
                Text='<%# Bind("PhotoVolumeNo") %>' />
            <br />
            BookNo:
            <asp:Label ID="BookNoLabel" runat="server" 
                Text='<%# Bind("BookNo") %>' />
            <br />
            SealedVolumes:
            <asp:Label ID="SealedVolumesLabel" runat="server" 
                Text='<%# Bind("SealedVolumes") %>' />
            <br />
            RemainingVolumes:
            <asp:Label ID="RemainingVolumesLabel" runat="server" 
                Text='<%# Bind("RemainingVolumes") %>' />
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
    
    <asp:ObjectDataSource ID="ods_Sealing" runat="server" DeleteMethod="DeleteQuery" 
        InsertMethod="Insert" 
        SelectMethod="GetDataBy" 
        TypeName="IGRSS.DataAccessLayer.SealingTableAdapters.SealingTableAdapter" 
        UpdateMethod="UpdateQuery" onselecting="ods_Sealing_Selecting" 
        ondeleting="ods_Sealing_Deleting" >
        <DeleteParameters>
            <asp:Parameter Name="SrNo" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Kacheri_Office" Type="String" />
            <asp:Parameter Name="FromDate" Type="DateTime" />
            <asp:Parameter Name="ToDate" Type="DateTime" />
            <asp:Parameter Name="PhotoVolumeNo" Type="Int32" />
            <asp:Parameter Name="BookNo" Type="Int32" />
            <asp:Parameter Name="SealedVolumes" Type="Int32" />
            <asp:Parameter Name="RemainingVolumes" Type="Int32" />
            <asp:Parameter Name="Remarks" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtFileNo" Name="searchKeyWord" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Kacheri_Office" Type="String" />
            <asp:Parameter Name="FromDate" Type="DateTime" />
            <asp:Parameter Name="ToDate" Type="DateTime" />
            <asp:Parameter Name="PhotoVolumeNo" Type="Int32" />
            <asp:Parameter Name="BookNo" Type="Int32" />
            <asp:Parameter Name="SealedVolumes" Type="Int32" />
            <asp:Parameter Name="RemainingVolumes" Type="Int32" />
            <asp:Parameter Name="Remarks" Type="String" />
            <asp:Parameter Name="SrNo" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ods_officesmaster" runat="server" 
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
            <asp:Parameter DbType="Guid" Name="OfficeId" />
            <asp:Parameter Name="OfficeName" Type="String" />
            <asp:Parameter DbType="Guid" Name="Original_OfficeId" />
            <asp:Parameter Name="Original_OfficeName" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:View>    
</asp:MultiView>
</asp:Content>

