using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Central_Administration_Console_Masters_AnamatTypeMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void FormView_AnamatTypeMaster_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Cancel":

                Multiview_AnamatTypeMaster.SetActiveView(ViewGrid);
                GridView_AnamatTypeMaster.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_AnamatTypeMaster.SetActiveView(Multiview_AnamatTypeMaster.Views[1]);
        FormView_AnamatTypeMaster.ChangeMode(FormViewMode.Insert);
    }
}