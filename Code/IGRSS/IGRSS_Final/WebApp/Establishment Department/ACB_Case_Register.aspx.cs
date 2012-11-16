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
                break;
        }
    }
    protected void ods_ACB_Case_Register_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_ACB_Case_Register.SelectMethod = "GetDataBy";
    }
}