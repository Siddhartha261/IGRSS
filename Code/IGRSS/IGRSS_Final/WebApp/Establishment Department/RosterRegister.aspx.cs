using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Establishment_Department_RosterRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void FormView_Roster_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_Roster.SetActiveView(ViewGrid);
                GridView_Roster.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    protected void FormView_Roster_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        ListBox ListBox_Designation = FormView_Roster.FindControl("ListBox_Designation") as ListBox;
        e.Values["Deatils_Of_Designation"] = ListBox_Designation.SelectedValue;

        DropDownList DropDown_AnamatType = FormView_Roster.FindControl("DropDownList_AnamatType") as DropDownList;
        e.Values["Anamat_Type"] = DropDown_AnamatType.SelectedValue;

        DropDownList DropDown_ReservedCategory = FormView_Roster.FindControl("DropDownList_ReservedCategory") as DropDownList;
        e.Values["Reserved_For_Category"] = DropDown_ReservedCategory.SelectedValue;

        DropDownList DropDown_EmployeeName = FormView_Roster.FindControl("DropDownList_EmployeeName") as DropDownList;
        e.Values["Employee_Name"] = DropDown_EmployeeName.SelectedValue;
    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_Roster.SetActiveView(Multiview_Roster.Views[1]);
        FormView_Roster.ChangeMode(FormViewMode.Insert);
        ListBox listbox_details_of_designation = FormView_Roster.FindControl("ListBox_Designation") as ListBox;
        TextBox txt1 = FormView_Roster.FindControl("Types_Of_RecruitmentTextBox") as TextBox;
        TextBox txt2 = FormView_Roster.FindControl("Recruitment_YearTextBox") as TextBox;
        TextBox txt3 = FormView_Roster.FindControl("Roster_SrNoTextBox") as TextBox;
        TextBox txt5 = FormView_Roster.FindControl("Date_Of_AppointmentTextBox") as TextBox;
        TextBox txt6 = FormView_Roster.FindControl("Appointed_AuthorityTextBox") as TextBox;
        TextBox txt7 = FormView_Roster.FindControl("RemarksTextBox") as TextBox;
        txt1.Text = "";
        txt2.Text = "";
        txt3.Text = "";
        txt5.Text = "";
        txt6.Text = "";
        txt7.Text = "";
        listbox_details_of_designation.Focus();
    }
    protected void ods_Roster_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_Roster.SelectMethod = "GetDataBy";
        
    }
    protected void GridView_Roster_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been deleted successfully", false);
        }
        else
        {
            ShowMessage("Unable to delete record", true);
        }
    }
    protected void GridView_Roster_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_Roster.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_Roster.DataKeys[e.RowIndex].Value;
        ods_Roster.Delete();
    }
    protected void GridView_Roster_RowEditing(object sender, GridViewEditEventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_Roster.SetActiveView(Formview);
        FormView_Roster.PageIndex = e.NewEditIndex;
        FormView_Roster.ChangeMode(FormViewMode.Edit);
        e.NewEditIndex = -1;
    }
    protected void FormView_Roster_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been added successfully", false);
        }
        else
        {
            ShowMessage("Unable to add record", true);
        }
    }
    protected void FormView_Roster_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been updated successfully", false);
        }
        else
        {
            ShowMessage("Unable to update record", true);
        }
        Multiview_Roster.SetActiveView(ViewGrid);
    }
    protected void FormView_Roster_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        ListBox ListBox_Designation = FormView_Roster.FindControl("ListBox_Designation") as ListBox;
        e.NewValues["Deatils_Of_Designation"] = ListBox_Designation.SelectedValue;

        DropDownList DropDown_AnamatType = FormView_Roster.FindControl("DropDownList_AnamatType") as DropDownList;
        e.NewValues["Anamat_Type"] = DropDown_AnamatType.SelectedValue;

        DropDownList DropDown_ReservedCategory = FormView_Roster.FindControl("DropDownList_ReservedCategory") as DropDownList;
        e.NewValues["Reserved_For_Category"] = DropDown_ReservedCategory.SelectedValue;

        DropDownList DropDown_EmployeeName = FormView_Roster.FindControl("DropDownList_EmployeeName") as DropDownList;
        e.NewValues["Employee_Name"] = DropDown_EmployeeName.SelectedValue;
    }
  
    protected void ods_Roster_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
}