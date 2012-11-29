using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Establishment_Department_FajalRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_Fajal.SetActiveView(Multiview_Fajal.Views[1]);
        FormView_Fajal.ChangeMode(FormViewMode.Insert);
        ListBox listbox_details_Of_designation = FormView_Fajal.FindControl("ListBox_Designation") as ListBox;
        TextBox txt1 = FormView_Fajal.FindControl("Residence_DistrictTextBox") as TextBox;
        TextBox txt2 = FormView_Fajal.FindControl("Current_OfficeTextBox") as TextBox;
        TextBox txt3 = FormView_Fajal.FindControl("From_DateTextBox") as TextBox;
        TextBox txt4 = FormView_Fajal.FindControl("To_DateTextBox") as TextBox;
        txt1.Text = "";
        txt2.Text = "";
        txt3.Text = "";
        txt4.Text = "";
        listbox_details_Of_designation.Focus();
    }
    protected void FormView_Fajal_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        ListBox ListBox_Designation = FormView_Fajal.FindControl("ListBox_Designation") as ListBox;
        e.Values["Details_Of_Designation"] = ListBox_Designation.SelectedValue;

        DropDownList DropDown_EmployeeName = FormView_Fajal.FindControl("DropDownList_EmployeeName") as DropDownList;
        e.Values["Employee_Name"] = DropDown_EmployeeName.SelectedValue;

        DropDownList DropDown_Designation = FormView_Fajal.FindControl("DropDownList_Designation") as DropDownList;
        e.Values["Designation"] = DropDown_Designation.SelectedValue;

        DropDownList DropDown_Grade = FormView_Fajal.FindControl("DropDownList_Grade") as DropDownList;
        e.Values["Grade"] = DropDown_Grade.SelectedValue;
    }
    protected void FormView_Fajal_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_Fajal.SetActiveView(ViewGrid);
                GridView_Fajal.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    protected void ods_Fajal_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_Fajal.SelectMethod = "GetDataBy";
 
    }
    protected void GridView_Fajal_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_Fajal_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_Fajal.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_Fajal.DataKeys[e.RowIndex].Value;
        ods_Fajal.Delete();
    }
    protected void GridView_Fajal_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_Fajal.SetActiveView(Formview);
        FormView_Fajal.PageIndex = e.NewEditIndex;
        FormView_Fajal.ChangeMode(FormViewMode.Edit);
        e.NewEditIndex = -1;
    }
    protected void FormView_Fajal_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_Fajal_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been updated successfully", false);
        }
        else
        {
            ShowMessage("Unable to update record", true);
        }
        Multiview_Fajal.SetActiveView(ViewGrid);
    }
    protected void FormView_Fajal_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        ListBox ListBox_Designation = FormView_Fajal.FindControl("ListBox_Designation") as ListBox;
        e.NewValues["Details_Of_Designation"] = ListBox_Designation.SelectedValue;

        DropDownList DropDown_EmployeeName = FormView_Fajal.FindControl("DropDownList_EmployeeName") as DropDownList;
        e.NewValues["Employee_Name"] = DropDown_EmployeeName.SelectedValue;

        DropDownList DropDown_Designation = FormView_Fajal.FindControl("DropDownList_Designation") as DropDownList;
        e.NewValues["Designation"] = DropDown_Designation.SelectedValue;

        DropDownList DropDown_Grade = FormView_Fajal.FindControl("DropDownList_Grade") as DropDownList;
        e.NewValues["Grade"] = DropDown_Grade.SelectedValue;
    }
    protected void ods_Fajal_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
}