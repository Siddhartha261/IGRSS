using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class LatestPages_FileRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearchAppNo_Click(object sender, EventArgs e)
    {

    }
    protected void txtFileNo_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
       
        Multiview_FileRegister.SetActiveView(view2_Formview);
        FormView_FileRegister.ChangeMode(FormViewMode.Insert);
    }

    

    
    protected void FormView_FileRegister_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":

                Multiview_FileRegister.SetActiveView(view1_GridView);
                view1_GridView.DataBind();

                break;
        }
    }
    protected void ods_FileRegister_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_FileRegister.SelectMethod = "GetDataBy";
    }
}

    