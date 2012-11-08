using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_MarriageVolumeRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
     
        Multiview_Marriage_Volume.SetActiveView(view2_Formview_MarriageVolume);
        FormView_MarriageVolume.ChangeMode(FormViewMode.Insert);
    }
    protected void ods_Marriage_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_MarriageVolume.SelectMethod = "GetDataBy";
    }
    
    protected void FormView_Marriage_ItemCommand(object sender, FormViewCommandEventArgs e)
    {

        switch (e.CommandName)
        {
            case "Back":
             
                Multiview_Marriage_Volume.SetActiveView(View1_Gridview_MarriageVolume);
                GridView_MarriageVolume.DataBind();
                break;
        }
      }
}