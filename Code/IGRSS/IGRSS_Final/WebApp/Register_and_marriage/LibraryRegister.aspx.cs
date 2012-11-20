using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_LibraryRegisteraspx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_LibraryRegister.SetActiveView(View2_LibraryRegister);
        FormView_LibraryRegister.ChangeMode(FormViewMode.Insert);
    }
    protected void ods_Library_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtSearch.Text.Trim();
        ods_LibraryRegister.SelectMethod = "GetDataBy";
    }
    protected void FormView_LibraryRegister_ItemCommand(object sender, FormViewCommandEventArgs e)
    {

        switch (e.CommandName)
        {
            case "Back":
                
                Multiview_LibraryRegister.SetActiveView(View1_LibraryRgister);
                View1_LibraryRgister.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void LibraryRegister_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void LibraryRegister_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        LibraryRegister.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = LibraryRegister.DataKeys[e.RowIndex].Value;
        ods_LibraryRegister.Delete();
    }
    protected void LibraryRegister_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_LibraryRegister.SetActiveView(View2_LibraryRegister);
        FormView_LibraryRegister.PageIndex = e.NewEditIndex;
        FormView_LibraryRegister.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void FormView_LibraryRegister_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_LibraryRegister_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void ods_LibraryRegister_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
}