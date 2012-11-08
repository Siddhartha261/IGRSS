using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_KalpataruPurchaseStock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        
        Multiview_Kalpataru.SetActiveView(View2_Formview_Kalpataru);
        FormView_Kalpataru.ChangeMode(FormViewMode.Insert);
    }
    
    protected void ods_Kalpataru_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtSearch.Text.Trim();
        ods_Kalpataru.SelectMethod = "GetDataBy";
    }
    protected void FormView_Kalpataru_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
               Multiview_Kalpataru.SetActiveView(View1_GridView_Kalpataru);
               View1_GridView_Kalpataru.DataBind();
                break;
        }


    }
}