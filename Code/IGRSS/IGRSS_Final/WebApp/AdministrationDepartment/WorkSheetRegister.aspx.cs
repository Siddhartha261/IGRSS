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
       if (e.Exception == null)
        {
            ShowMessage("Record has been added successfully", false);
        }
        else 
        {
            ShowMessage("Unable to add record",true);
        }
    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        MultiView_worksheet.SetActiveView(MultiView_worksheet.Views[1]);
        FormView_worksheet.ChangeMode(FormViewMode.Insert);
    }
         
  
    protected void FormView_worksheet_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been updated successfully", false);
        }
        else
        {
            ShowMessage("Unable to update record", true);
        }
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
    protected void GridView_worksheet_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been deleted successfully", false);
        }
        else
        {
            ShowMessage("Unable to delete record", true);
        }
    }
    protected void GridView_worksheet_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_worksheet.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_worksheet.DataKeys[e.RowIndex].Value;
        ods_worksheet.Delete();
    }
    protected void GridView_worksheet_RowEditing(object sender, GridViewEditEventArgs e)
    {
        MultiView_worksheet.SetActiveView(Worksheetregister);
        FormView_worksheet.PageIndex = e.NewEditIndex;
        FormView_worksheet.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void ods_worksheet_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["ID"] = ViewState["deleteKey"];
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
}