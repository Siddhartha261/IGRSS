using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Department_ChequeRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_ChequeRegister.SetActiveView(view2_Formview);
        FormView_ChequeRgister.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_ChequeRegister_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch(e.CommandName)
        {
            case "Back":
                Multiview_ChequeRegister.SetActiveView(View1_GridView);
                View1_GridView.DataBind();
                break;
        }
    }
    protected void ods_ChequeRegister_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_ChequeRegister.SelectMethod = "GetDataBy";
    }
}