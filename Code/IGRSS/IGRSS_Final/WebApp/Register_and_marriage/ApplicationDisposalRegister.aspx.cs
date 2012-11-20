using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_ApplicationDisposalRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_ApplicationDisposal.SetActiveView(view2_Formview);
        FormView_ApplicationDisposal.ChangeMode(FormViewMode.Insert);

    }
    protected void FormView_ApplicationDisposal_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_ApplicationDisposal.SetActiveView(View1_GridView);
                View1_GridView.DataBind();
                infoDiv.Visible = false;
                break;
        }

    }
    protected void ods_ApplicationDisposal5_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_ApplicationDisposal.SelectMethod = "GetDataBy";
    }
    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void GridView_ApplicationDisposal_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_ApplicationDisposal_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_ApplicationDisposal.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_ApplicationDisposal.DataKeys[e.RowIndex].Value;
        ods_ApplicationDisposal.Delete();
    }
    protected void GridView_ApplicationDisposal_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_ApplicationDisposal.SetActiveView(view2_Formview);
        FormView_ApplicationDisposal.PageIndex = e.NewEditIndex;
        FormView_ApplicationDisposal.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void FormView_ApplicationDisposal_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void FormView_ApplicationDisposal_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void ods_ApplicationDisposal_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
}