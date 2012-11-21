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
    
   
    protected void Button_new_Click(object sender, EventArgs e)
    {
        MultiView_RTI.SetActiveView(MultiView_RTI.Views[1]);
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
                MultiView_RTI.SetActiveView(ViewGrid);
                GridView_RTI.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    protected void ods_RTI_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_RTI.SelectMethod = "GetDataBy";        
    }


    protected void GridView_RTI_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_RTI_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        GridView_RTI.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_RTI.DataKeys[e.RowIndex].Value;
        ods_RTI.Delete();
    }
    protected void GridView_RTI_RowEditing(object sender, GridViewEditEventArgs e)
    {
        MultiView_RTI.SetActiveView(Formview);
        FormView_RTI.PageIndex = e.NewEditIndex;
        FormView_RTI.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void FormView_RTI_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been added successfully", false);
        }
        else
        {
            ShowMessage("Unable to add record", true);
        }
    }
    protected void FormView_RTI_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void ods_RTI_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["Sr_No"] = ViewState["deleteKey"];
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void FormView_RTI_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        RadioButtonList Radio_decisiontaken = FormView_RTI.FindControl("Radio_decisiontaken") as RadioButtonList;
        e.NewValues["Decision_Taken"] = Radio_decisiontaken.SelectedValue;
    }
     
}