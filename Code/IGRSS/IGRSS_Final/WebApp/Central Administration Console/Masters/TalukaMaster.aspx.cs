using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Central_Administration_Console_Masters_TalukaMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_TalukaMaster.SetActiveView(Multiview_TalukaMaster.Views[1]);
        FormView_TalukaMaster.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_TalukaMaster_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Cancel":

                Multiview_TalukaMaster.SetActiveView(ViewGrid);
                GridView_TalukaMaster.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
}