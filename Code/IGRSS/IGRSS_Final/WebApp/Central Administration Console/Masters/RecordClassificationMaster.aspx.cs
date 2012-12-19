using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Central_Administration_Console_Masters_RecordClassificationMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_RecordClassificationMaster.SetActiveView(Multiview_RecordClassificationMaster.Views[1]);
        FormView_RecordClassificationMaster.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_RecordClassificationMaster_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Cancel":

                Multiview_RecordClassificationMaster.SetActiveView(ViewGrid);
                GridView_RecordClassificationMaster.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
}