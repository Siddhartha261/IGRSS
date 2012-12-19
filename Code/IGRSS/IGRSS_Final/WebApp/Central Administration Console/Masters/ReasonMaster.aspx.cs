using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Central_Administration_Console_Masters_ReasonMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_ReasonMaster.SetActiveView(Multiview_ReasonMaster.Views[1]);
        FormView_ReasonMaster.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_ReasonMaster_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Cancel":

                Multiview_ReasonMaster.SetActiveView(ViewGrid);
                GridView_ReasonMaster.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
}