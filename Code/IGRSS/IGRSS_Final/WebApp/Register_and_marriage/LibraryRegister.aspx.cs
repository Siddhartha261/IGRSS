using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_LibraryRegisteraspx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_LibraryRegister.SetActiveView(View2_LibraryRegister);
        FormView_LibraryRegister.ChangeMode(FormViewMode.Insert);
    }
    protected void ods_Library_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtSearch.Text.Trim();
        ods_LibraryRegister.SelectMethod = "GetDataBy";
    }
    protected void FormView_LibraryRegister_ItemCommand(object sender, FormViewCommandEventArgs e)
    {

        switch (e.CommandName)
        {
            case "Back":
                
                Multiview_LibraryRegister.SetActiveView(View1_LibraryRgister);
                View1_LibraryRgister.DataBind();
                break;
        }
    }
}