using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_LekhanSamagri : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
       
        Multiview_LekhanSamagri.SetActiveView(View2_LekhanSamagri);
        FormView_LibraryRegister.ChangeMode(FormViewMode.Insert);
    }
    protected void ods_Lekhan_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
       
        e.InputParameters["searchKeyword"] = txtSearch.Text.Trim();
        ods_Lekhan_Samagri.SelectMethod = "GetDataBy";
    }

    protected void FormView_LekhanSamagri_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                //Multiview_SOFile.SetActiveView(GridView);
                //GridView.DataBind();
                Multiview_LekhanSamagri.SetActiveView(View1_LekhanSamagri);
                View1_LekhanSamagri.DataBind();
                break;
        }

    }
}