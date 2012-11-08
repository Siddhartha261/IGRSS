using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class LatestPages_WorkSheetRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    protected void FormView_worksheet_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        GridView_worksheet.DataBind();
    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        MultiView_worksheet.SetActiveView(MultiView_worksheet.Views[1]);
        FormView_worksheet.ChangeMode(FormViewMode.Insert);
    }
         
    protected void txtFileNo_TextChanged(object sender, EventArgs e)
    {

    }
    protected void FormView_worksheet_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        GridView_worksheet.DataBind();
        MultiView_worksheet.SetActiveView(viewGrid);
    }
    protected void ods_worksheet_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_worksheet.SelectMethod = "GetDataBy";
               
    }
    protected void FormView_worksheet_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        { 
            case "Back":
                MultiView_worksheet.SetActiveView(viewGrid);
                GridView_worksheet.DataBind();
                break;
        }
    }
}