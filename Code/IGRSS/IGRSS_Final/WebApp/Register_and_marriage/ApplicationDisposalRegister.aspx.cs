using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_ApplicationDisposalRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_ApplicationDisposal.SetActiveView(view2_Formview);
        FormView_ApplicationDisposal.ChangeMode(FormViewMode.Insert);

    }
    protected void FormView_ApplicationDisposal_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_ApplicationDisposal.SetActiveView(View1_GridView);
                View1_GridView.DataBind();
                break;
        }

    }
    protected void ods_ApplicationDisposal5_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_ApplicationDisposal.SelectMethod = "GetDataBy";
    }
}