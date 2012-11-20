using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Department_ChequeRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_ChequeRegister.SetActiveView(view2_Formview);
        FormView_ChequeRgister.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_ChequeRegister_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch(e.CommandName)
        {
            case "Back":
                Multiview_ChequeRegister.SetActiveView(View1_GridView);
                View1_GridView.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    protected void ods_ChequeRegister_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_ChequeRegister.SelectMethod = "GetDataBy";
    }
    protected void GridView_ChequeRegister_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_ChequeRegister.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_ChequeRegister.DataKeys[e.RowIndex].Value;
        ods_ChequeRegister.Delete();
    }
    protected void GridView_ChequeRegister_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_ChequeRegister.SetActiveView(view2_Formview);
        FormView_ChequeRgister.PageIndex = e.NewEditIndex;
        FormView_ChequeRgister.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;

    }
    
    protected void GridView_ChequeRegister_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void FormView_ChequeRgister_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_ChequeRgister_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void ods_ChequeRegister_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
  
}