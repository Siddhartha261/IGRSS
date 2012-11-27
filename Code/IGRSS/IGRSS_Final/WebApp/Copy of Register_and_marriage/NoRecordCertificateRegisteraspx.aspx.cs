using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_NoRecordCertificateRegisteraspx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        
        Multiview_NoRecordCertificate.SetActiveView(View2_Formview);
        FormView_NoRecordCertificate.ChangeMode(FormViewMode.Insert);

    }
    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void FormView_NoRecordCertficate_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                
                Multiview_NoRecordCertificate.SetActiveView(view1_GridView);
                view1_GridView.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    protected void ods_NoRecordCertificate_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_NoRecordCertificate.SelectMethod = "GetDataBy";
    }
    protected void GridView_NoRecordCertificate_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_NoRecordCertificate_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_NoRecordCertificate.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_NoRecordCertificate.DataKeys[e.RowIndex].Value;
        ods_NoRecordCertificate.Delete();
    }
    protected void GridView_NoRecordCertificate_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_NoRecordCertificate.SetActiveView(View2_Formview);
        FormView_NoRecordCertificate.PageIndex = e.NewEditIndex;
        FormView_NoRecordCertificate.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void FormView_NoRecordCertificate_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_NoRecordCertificate_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void ods_NoRecordCertificate_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
}