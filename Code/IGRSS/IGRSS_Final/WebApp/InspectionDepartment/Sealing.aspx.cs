using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InspectionDepartment_Sealing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_Sealing.SetActiveView(Multiview_Sealing.Views[1]);
        FormView_Sealing.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_Sealing_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDownOffice = FormView_Sealing.FindControl("DropDownList_officename") as DropDownList;
        e.Values["Kacheri_Office"] = DropDownOffice.SelectedValue;
    }
    protected void FormView_Sealing_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        { 
            case "Back":
                Multiview_Sealing.SetActiveView(ViewGrid);
                GridView_Sealing.DataBind();
                break;       
        }
    }
    protected void ods_Sealing_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_Sealing.SelectMethod = "GetDataBy";
    }
}