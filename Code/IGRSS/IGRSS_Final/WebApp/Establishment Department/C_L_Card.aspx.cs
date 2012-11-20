using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Establishment_Department_C_L_Card : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_C_L_Card.SetActiveView(Multiview_C_L_Card.Views[1]);
        FormView_C_L_Card.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_C_L_Card_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDown_Office = FormView_C_L_Card.FindControl("DropDownList_Office") as DropDownList;
        e.Values["OfficeName"] = DropDown_Office.SelectedValue;

        DropDownList DropDown_Designation = FormView_C_L_Card.FindControl("DropDownList_Designation") as DropDownList;
        e.Values["Designation"] = DropDown_Designation.SelectedValue;

        DropDownList DropDown_EmployeeName = FormView_C_L_Card.FindControl("DropDownList_EmployeeName") as DropDownList;
        e.Values["Employee_Name"] = DropDown_EmployeeName.SelectedValue;

        RadioButtonList RadioList_HalfFullDay = FormView_C_L_Card.FindControl("RadioButtonList_HalfFullDay") as RadioButtonList;
        e.Values["HalfDay_FullDay"] = RadioList_HalfFullDay.SelectedValue;

        RadioButtonList RadioList_Shift = FormView_C_L_Card.FindControl("RadioButtonList_shift") as RadioButtonList;
        e.Values["FirstShift_SecondShift"] = RadioList_Shift.SelectedValue;

        RadioButtonList RadioList_LeaveApproved = FormView_C_L_Card.FindControl("RadioButtonList_LeaveApproved") as RadioButtonList;
        e.Values["Leave_Approved_Or_Not"] = Convert.ToBoolean(RadioList_LeaveApproved.SelectedValue);
    }
    protected void FormView_C_L_Card_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_C_L_Card.SetActiveView(ViewGrid);
                GridView_C_L_Card.DataBind();
                break;
        }
    }
    protected void ods_C_L_Card_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_C_L_Card.SelectMethod = "GetDataBy";
    }
    protected void GridView_C_L_Card_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_C_L_Card_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_C_L_Card.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_C_L_Card.DataKeys[e.RowIndex].Value;
        ods_C_L_Card.Delete();
    }
    protected void GridView_C_L_Card_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_C_L_Card.SetActiveView(Formview);
        FormView_C_L_Card.PageIndex = e.NewEditIndex;
        FormView_C_L_Card.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void FormView_C_L_Card_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_C_L_Card_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void ods_C_L_Card_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void FormView_C_L_Card_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        DropDownList DropDown_Office = FormView_C_L_Card.FindControl("DropDownList_Office") as DropDownList;
        e.NewValues["OfficeName"] = DropDown_Office.SelectedValue;

        DropDownList DropDown_Designation = FormView_C_L_Card.FindControl("DropDownList_Designation") as DropDownList;
        e.NewValues["Designation"] = DropDown_Designation.SelectedValue;

        DropDownList DropDown_EmployeeName = FormView_C_L_Card.FindControl("DropDownList_EmployeeName") as DropDownList;
        e.NewValues["Employee_Name"] = DropDown_EmployeeName.SelectedValue;

        RadioButtonList RadioList_HalfFullDay = FormView_C_L_Card.FindControl("RadioButtonList_HalfFullDay") as RadioButtonList;
        e.NewValues["HalfDay_FullDay"] = RadioList_HalfFullDay.SelectedValue;

        RadioButtonList RadioList_Shift = FormView_C_L_Card.FindControl("RadioButtonList_shift") as RadioButtonList;
        e.NewValues["FirstShift_SecondShift"] = RadioList_Shift.SelectedValue;

        RadioButtonList RadioList_LeaveApproved = FormView_C_L_Card.FindControl("RadioButtonList_LeaveApproved") as RadioButtonList;
        e.NewValues["Leave_Approved_Or_Not"] = Convert.ToBoolean(RadioList_LeaveApproved.SelectedValue);
    }
    protected void GridView_C_L_Card_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblLeave_Approved_Or_Not = e.Row.FindControl("lblLeave_Approved_Or_Not") as Label;
            lblLeave_Approved_Or_Not.Text = Convert.ToBoolean(GridView_C_L_Card.DataKeys[e.Row.RowIndex].Values[1]) ? "Yes" : "No";                  
        }
    }
    protected void FormView_C_L_Card_DataBound(object sender, EventArgs e)
    {
        RadioButtonList RadioList_LeaveApproved = FormView_C_L_Card.FindControl("RadioButtonList_LeaveApproved") as RadioButtonList;
        RadioList_LeaveApproved.SelectedIndex = Convert.ToBoolean(FormView_C_L_Card.DataKey[1]) ? 0 : 1;
    }
} 