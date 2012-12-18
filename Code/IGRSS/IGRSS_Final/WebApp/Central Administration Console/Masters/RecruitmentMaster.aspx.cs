using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Central_Administration_Console_Masters_RecruitmentMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_RecruitmentMaster.SetActiveView(Multiview_RecruitmentMaster.Views[1]);
        FormView_RecruitmentMaster.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_RecruitmentMaster_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Cancel":

                Multiview_RecruitmentMaster.SetActiveView(ViewGrid);
                GridView_RecruitmentMaster.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
}