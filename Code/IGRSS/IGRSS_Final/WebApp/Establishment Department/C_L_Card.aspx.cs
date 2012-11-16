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
} 