using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Central_Administration_Console_Masters_DistrictMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_DistrictMaster.SetActiveView(Multiview_DistrictMaster.Views[1]);
        FormView_DistrictMaster.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_DistrictMaster_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Cancel":

                Multiview_DistrictMaster.SetActiveView(ViewGrid);
                GridView_DistrictMaster.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
}