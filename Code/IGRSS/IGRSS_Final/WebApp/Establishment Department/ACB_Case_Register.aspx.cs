using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Establishment_Department_ACB_Case_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_ACB_Case_Register.SetActiveView(Multiview_ACB_Case_Register.Views[1]);
        FormView_ACB_Case_Register.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_ACB_Case_Register_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDown_EmployeeName = FormView_ACB_Case_Register.FindControl("DropDownList_EmployeeName") as DropDownList;
        e.Values["Employee_Name"] = DropDown_EmployeeName.SelectedValue;

        DropDownList DropDown_Designation = FormView_ACB_Case_Register.FindControl("DropDownList_Designation") as DropDownList;
        e.Values["Designation"] = DropDown_Designation.SelectedValue;

        RadioButtonList RadioList_HighCourt = FormView_ACB_Case_Register.FindControl("RadioButtonList_HighCourt") as RadioButtonList;
        e.Values["High_court_Appeal"] = Convert.ToBoolean(RadioList_HighCourt.SelectedValue);

        RadioButtonList RadioList_SupremeCourt = FormView_ACB_Case_Register.FindControl("RadioButtonList_SupremeCourt") as RadioButtonList;
        e.Values["Supreme_Court_Appeal"] = Convert.ToBoolean(RadioList_SupremeCourt.SelectedValue);
    }
    protected void FormView_ACB_Case_Register_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_ACB_Case_Register.SetActiveView(ViewGrid);
                GridView_ACB_Case_Register.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    protected void ods_ACB_Case_Register_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_ACB_Case_Register.SelectMethod = "GetDataBy";
    }
    protected void GridView_ACB_Case_Register_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_ACB_Case_Register_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_ACB_Case_Register.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_ACB_Case_Register.DataKeys[e.RowIndex].Value;
        ods_ACB_Case_Register.Delete();
    }
    protected void GridView_ACB_Case_Register_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_ACB_Case_Register.SetActiveView(Formview);
        FormView_ACB_Case_Register.PageIndex = e.NewEditIndex;
        FormView_ACB_Case_Register.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void FormView_ACB_Case_Register_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_ACB_Case_Register_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been updated successfully", false);
        }
        else
        {
            ShowMessage("Unable to update record", true);
        }
    }
    protected void FormView_ACB_Case_Register_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        DropDownList DropDown_EmployeeName = FormView_ACB_Case_Register.FindControl("DropDownList_EmployeeName") as DropDownList;
        e.NewValues["Employee_Name"] = DropDown_EmployeeName.SelectedValue;

        DropDownList DropDown_Designation = FormView_ACB_Case_Register.FindControl("DropDownList_Designation") as DropDownList;
        e.NewValues["Designation"] = DropDown_Designation.SelectedValue;

        RadioButtonList RadioList_HighCourt = FormView_ACB_Case_Register.FindControl("RadioButtonList_HighCourt") as RadioButtonList;
        e.NewValues["High_court_Appeal"] = Convert.ToBoolean(RadioList_HighCourt.SelectedValue);

        RadioButtonList RadioList_SupremeCourt = FormView_ACB_Case_Register.FindControl("RadioButtonList_SupremeCourt") as RadioButtonList;
        e.NewValues["Supreme_Court_Appeal"] = Convert.ToBoolean(RadioList_SupremeCourt.SelectedValue);
    }
    protected void ods_ACB_Case_Register_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void GridView_ACB_Case_Register_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblHigh_court_Appeal = e.Row.FindControl("lblHigh_court_Appeal") as Label;
            lblHigh_court_Appeal.Text = Convert.ToBoolean(GridView_ACB_Case_Register.DataKeys[e.Row.RowIndex].Values[1]) ? "Yes" : "No";

            Label lblSupreme_Court_Appeal = e.Row.FindControl("lblSupreme_Court_Appeal") as Label;
            lblSupreme_Court_Appeal.Text = Convert.ToBoolean(GridView_ACB_Case_Register.DataKeys[e.Row.RowIndex].Values[1]) ? "Yes" : "No";

        }
    }
    protected void FormView_ACB_Case_Register_DataBound(object sender, EventArgs e)
    {
        RadioButtonList RadioList_HighCourt = FormView_ACB_Case_Register.FindControl("RadioButtonList_HighCourt") as RadioButtonList;
        RadioList_HighCourt.SelectedIndex = Convert.ToBoolean(FormView_ACB_Case_Register.DataKey[1]) ? 0 : 1;

        RadioButtonList RadioList_SupremeCourt = FormView_ACB_Case_Register.FindControl("RadioButtonList_SupremeCourt") as RadioButtonList;
        RadioList_SupremeCourt.SelectedIndex = Convert.ToBoolean(FormView_ACB_Case_Register.DataKey[1]) ? 0 : 1;
    }
}