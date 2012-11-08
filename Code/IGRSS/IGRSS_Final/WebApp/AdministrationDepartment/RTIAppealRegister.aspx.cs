using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestPages_RTIAppealRegister : System.Web.UI.Page
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
        Multiview_RTI.SetActiveView(Multiview_RTI.Views[1]);
        FormView_RTI.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_RTI_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        RadioButtonList Radio_decisiontaken = FormView_RTI.FindControl("Radio_decisiontaken") as RadioButtonList;
        e.Values["Decision_Taken"] = Radio_decisiontaken.SelectedValue;
    }
    protected void FormView_RTI_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        { 
            case "Back":
                Multiview_RTI.SetActiveView(ViewGrid);
                GridView_RTI.DataBind();
                break;
        }
    }
    protected void ods_RTI_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_RTI.SelectMethod = "GetDataBy";
        
    }
    
}