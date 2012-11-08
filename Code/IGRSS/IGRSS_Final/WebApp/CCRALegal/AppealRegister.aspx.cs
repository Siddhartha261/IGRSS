using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CCRALegal_AppealRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_AppealRegister.SetActiveView(Multiview_AppealRegister.Views[1]);
        FormView_AppealRegister.ChangeMode(FormViewMode.Insert);
    }

    protected void FormView_AppealRegister_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDownOffice = FormView_AppealRegister.FindControl("DropDownList_office") as DropDownList;
        e.Values["KacheriOffice"] = DropDownOffice.SelectedValue;

        DropDownList DropDownVersus = FormView_AppealRegister.FindControl("DropdownList_Versus") as DropDownList;
        e.Values["Versus"] = DropDownVersus.SelectedValue;

        RadioButtonList RadioButtonlist_continue = FormView_AppealRegister.FindControl("RadioButtonList_continue") as RadioButtonList;
        e.Values["Continue_remand"] = Convert.ToBoolean(RadioButtonlist_continue.SelectedValue);
    }
    protected void FormView_AppealRegister_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_AppealRegister.SetActiveView(ViewGrid);
                GridView_AppealRegister.DataBind();
                break;
        }
    }

    protected void ods_AppealRegister_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_AppealRegister.SelectMethod = "GetDataBy";
    }

  
}