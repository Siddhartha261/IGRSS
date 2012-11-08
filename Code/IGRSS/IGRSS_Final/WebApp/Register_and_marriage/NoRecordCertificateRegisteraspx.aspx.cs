using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_NoRecordCertificateRegisteraspx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        
        Multiview_NoRecordCertificate.SetActiveView(View2_Formview);
        FormView_NoRecordCertificate.ChangeMode(FormViewMode.Insert);

    }
    protected void FormView_NoRecordCertficate_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                
                Multiview_NoRecordCertificate.SetActiveView(view1_GridView);
                view1_GridView.DataBind();
                break;
        }
    }
    protected void ods_NoRecordCertificate_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_NoRecordCertificate.SelectMethod = "GetDataBy";
    }
}