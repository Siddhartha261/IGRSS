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
    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_Roster.SetActiveView(Multiview_Roster.Views[1]);
        FormView_Roster.ChangeMode(FormViewMode.Insert);
    }
    protected void ods_Roster_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_Roster.SelectMethod = "GetDataBy";
        
    }
}