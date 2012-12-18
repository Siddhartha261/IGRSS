using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Central_Administration_Console_Masters_CasteMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void FormView_CasteMaster_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Cancel":

                Multiview_CasteMaster.SetActiveView(ViewGrid);
                GridView_CasteMaster.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_CasteMaster.SetActiveView(Multiview_CasteMaster.Views[1]);
        FormView_CasteMaster.ChangeMode(FormViewMode.Insert);
    }
}