<%@ Page AutoEventWireup="true" CodeFile="InspectionItenary.aspx.cs" Inherits="Inspection_InspectionItenary"
	Language="C#" MasterPageFile="~/IGRSS_Default.master" Title="Untitled Page" %>
<%@ Register Assembly="RJS.Web.WebControl.PopCalendar" Namespace="RJS.Web.WebControl"
	TagPrefix="rjs" %>
<asp:Content ID="Content1" runat="Server" ContentPlaceHolderID="Main">
	<asp:MultiView ID="mvItenary" runat="server" ActiveViewIndex="0">
		<asp:View ID="viewItenary" runat="server">
			<asp:FormView ID="frmItenary" runat="server" DefaultMode="Insert">
				<InsertItemTemplate>
					<table style="width: 100%; text-align: left;">
						<tr>
							<td colspan="6">
								<asp:Label ID="lblScheduleHeaderIns" runat="server" meta:resourcekey="lblScheduleHeaderIns"
									SkinID="SubHeading" Text="Schedule Detail"></asp:Label>
							</td>
						</tr>
						<tr>
							<td align="left" class="labelColumn">
								<asp:Label ID="lblYearIns" runat="server" meta:resourcekey="lblYearIns" Text="Schedule year"></asp:Label>
							</td>
							<td class="textColumn">
								<asp:TextBox ID="txtYearIns" runat="server" meta:resourcekey="txtYearIns" ReadOnly="true"
									SkinID="Calendar" Text='<%# Bind("Year") %>'></asp:TextBox>
								<rjs:PopCalendar ID="calYearIns" runat="server" meta:resourcekey="calYearIns" Move="True" />
							</td>
							<td class="validationColumn">
							</td>
							<td align="left" class="labelColumn">
								<asp:Label ID="lblOfficerIdIns" runat="server" meta:resourcekey="lblOfficerIdIns"
									Text="Scheduling Officer"></asp:Label>
							</td>
							<td align="left" class="textColumn">
								<asp:DropDownList ID="ddlOfficerIdIns" runat="server" DataTextField="OfficerName"
									DataValueField="OfficerId" meta:resourcekey="ddlOfficerIdIns" Text='<%# Bind("OfficerId") %>'>
								</asp:DropDownList>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td align="left" class="labelColumn">
								<asp:Label ID="lblOfficeIdIns" runat="server" meta:resourcekey="lblOfficeIdIns" Text="Office Id"></asp:Label>
							</td>
							<td align="left" class="textColumn" colspan ="3">
								<asp:DropDownList ID="ddlOfficeIdIns" runat="server" DataTextField="OfficeName" DataValueField="OfficeId"
									meta:resourcekey="ddlOfficeIdIns" Text='<%# Bind("OfficeId") %>' Enabled ="false" >
								</asp:DropDownList>
							</td>
							<td class="validationColumn">
							</td>
						</tr>
						<tr>
							<td colspan="6">
								<asp:Label ID="lblHeaderMonthItenaryIns" runat="server" meta:resourcekey="lblHeaderMonthItenary"
									SkinID="SubHeading" Text="Itenary Details"></asp:Label>
							</td>
						</tr>
						<tr>
							<table width="100%">
								<tr>
									<td class="labelColumn">
										<asp:Label ID="lblInspectingDateIns" runat="server" meta:resourcekey="lblInspectingDateIns"
											Text="Date"></asp:Label>
									</td>
									<td class="textColumn">
										<asp:TextBox ID="txtInspectingDateIns" runat="server" meta:resourcekey="txtInspectingDate"
											SkinID="Calendar" Text='<%# Bind("InspectingDate") %>'></asp:TextBox>
										<rjs:PopCalendar ID="PopCalendar1" runat="server" meta:resourcekey="calInspectingDate"
											Move="True" />
									</td>
									<td class="validationColumn">
									</td>								
									<td align="left" class="labelColumn">
										<asp:Label ID="lblInspectingOfficeIdIns" runat="server" meta:resourcekey="lblInspectingOfficeIdIns"
											Text="Inspecting Office"></asp:Label>
									</td>
									<td align="left" class="textColumn">
										<asp:DropDownList ID="ddlInspectingOfficeIdIns" runat="server" DataTextField="OfficeName"
											DataValueField="InspectingOfficeId" meta:resourcekey="ddlInspectingOfficeIdIns"
											Text='<%# Bind("InspectingOfficeId") %>' Width="100">
										</asp:DropDownList>
									</td>
									<td class="validationColumn">
									</td>
								</tr>
								<tr>
									<td align="left" class="labelColumn">
										<asp:Label ID="lblItenaryDetailsIns" runat="server" meta:resourcekey="lblItenaryDetails"
											SkinID="" Text="Remarks"></asp:Label>
									</td>
									<td align="left" class="textColumn" colspan="5">
										<asp:TextBox ID="txtItenaryDetailsIns" runat="server" meta:resourcekey="txtItenaryDetailsIns"
											ReadOnly="false" TextMode="MultiLine"></asp:TextBox>
									</td>
								</tr>
								<tr>
									<td align="right" colspan="6">
										<asp:Button ID="btnAddItenary" runat="server" Text="Add" />
										<asp:Button ID="btnUpdateItenary" runat="server" Text="Update" Visible="true" />
									</td>
								</tr>
							</table>
						</tr>
						<tr>
							<asp:GridView ID="gvItenaryDetails" runat="server" AutoGenerateColumns="False" CellPadding="4"
								DataKeyNames="InspectionItenary" ForeColor="#333333" GridLines="None"
								Width="100%">
								<FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
								<RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
								<EditRowStyle BackColor="#999999" />
								<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
								<PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
								<HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
								<AlternatingRowStyle BackColor="White" ForeColor="#284775" />
								<Columns>
									<asp:BoundField DataField="ItenaryId" HeaderText="Itenary Id" Visible="False" />
									<asp:BoundField DataField="ScheduleId" HeaderText="Schedule Id" Visible="False" />
									<asp:BoundField DataField="Month" HeaderText="Month" Visible="False" />
									<asp:TemplateField HeaderText="Month" ShowHeader="False">
										<ItemTemplate>
											<asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
												Text='<%# Bind("ScheduleId") %>'></asp:LinkButton>
										</ItemTemplate>
									</asp:TemplateField>
									<asp:BoundField DataField="InspectingDate" HeaderText="Inspecting Date" />
									<asp:BoundField DataField="InspectingOfficeId" HeaderText="Inspecting Office" />
									<asp:BoundField DataField="ItenaryDetails" HeaderText="Itenary Details" />
									<asp:CommandField ShowDeleteButton="True" />
								</Columns>
							</asp:GridView>
						</tr>
						<tr>
							<td align="right" colspan="6">
								<asp:Button ID="CancelButtonIns" runat="server" CausesValidation="False" CommandName="Cancel"
									Text="Cancel" />
							</td>
						</tr>
					</table>
				</InsertItemTemplate>
			</asp:FormView>
		</asp:View>
	</asp:MultiView>
</asp:Content>
