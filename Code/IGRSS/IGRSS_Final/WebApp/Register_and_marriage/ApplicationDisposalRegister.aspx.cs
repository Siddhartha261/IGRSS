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
        infoDiv.Visible = false;
        Multiview_ApplicationDisposal.SetActiveView(view2_Formview);
        FormView_ApplicationDisposal.ChangeMode(FormViewMode.Insert);
        TextBox txt1 = (TextBox)FormView_ApplicationDisposal.FindControl("DateTextBox");
        TextBox txt2 = (TextBox)FormView_ApplicationDisposal.FindControl("ApplicantNameTextBox");
        TextBox txt3 = (TextBox)FormView_ApplicationDisposal.FindControl("ApplicantAddressTextBox");
        TextBox txt4 = (TextBox)FormView_ApplicationDisposal.FindControl("NoOfCopiesIssuedTextBox");
        TextBox txt5 = (TextBox)FormView_ApplicationDisposal.FindControl("FeesTakenTextBox");
        TextBox txt6 = (TextBox)FormView_ApplicationDisposal.FindControl("ReceiptNoTextBox");
        TextBox txt7 = (TextBox)FormView_ApplicationDisposal.FindControl("DisposalDateTextBox");
        txt1.Text = "";
        txt2.Text = "";
        txt3.Text = "";
        txt4.Text = "";
        txt5.Text = "";
        txt6.Text = "";
        txt7.Text = "";
        txt1.Focus();

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
    protected void ods_ApplicationDisposal_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
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
        infoDiv.Visible = false;
        Multiview_ApplicationDisposal.SetActiveView(view2_Formview);
        FormView_ApplicationDisposal.PageIndex = e.NewEditIndex;
        FormView_ApplicationDisposal.ChangeMode(FormViewMode.Edit);
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
        Multiview_ApplicationDisposal.SetActiveView(View1_GridView);
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