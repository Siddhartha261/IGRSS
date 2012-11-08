using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_MarriageRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
     
        Multiview_Marriage_Certificate.SetActiveView(view2_Formview);
        FormView_Marriagecertificate.ChangeMode(FormViewMode.Insert);

    }
    protected void FormView_Marriage_certificate_ItemCommand(object sender, FormViewCommandEventArgs e)
    {

        switch (e.CommandName)
        {
            case "Back":
               // Multiview_SOFile.SetActiveView(GridView);
               // GridView.DataBind();
                Multiview_Marriage_Certificate.SetActiveView(View1_GridView);
                View1_GridView.DataBind();
                break;
        }
    }
    protected void ods_Marriage_certificate_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
       e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_Marriage_certificate.SelectMethod = "GetDataBy";
    }
}