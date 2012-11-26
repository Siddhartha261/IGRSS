using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Inward_Outward_OutwardRegister_Latest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_OutwardRegister.SetActiveView(Multiview_OutwardRegister.Views[1]);
        FormView_OutWardRegister.ChangeMode(FormViewMode.Insert);
    }

    protected void FormView_OutWardRegister_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList Dropdown_CopyTo = FormView_OutWardRegister.FindControl("DropDownList_CopyTo") as DropDownList;
        e.Values["Copy_To"] = Dropdown_CopyTo.SelectedValue;
    }
}