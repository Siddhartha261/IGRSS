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
        infoDiv.Visible = false;
        Multiview_NoRecordCertificate.SetActiveView(View2_Formview);
        FormView_NoRecordCertificate.ChangeMode(FormViewMode.Insert);
        TextBox txt1 = (TextBox)FormView_NoRecordCertificate.FindControl("ApplicantNameTextBox");
        TextBox txt2 = (TextBox)FormView_NoRecordCertificate.FindControl("ApplicantNameTextBox");
        TextBox txt3 = (TextBox)FormView_NoRecordCertificate.FindControl("ApplicantNameTextBox");
        TextBox txt4 = (TextBox)FormView_NoRecordCertificate.FindControl("ApplicantNameTextBox");
        TextBox txt5= (TextBox)FormView_NoRecordCertificate.FindControl("ApplicantNameTextBox");
        TextBox txt6 = (TextBox)FormView_NoRecordCertificate.FindControl("ApplicantNameTextBox");
        TextBox txt7 = (TextBox)FormView_NoRecordCertificate.FindControl("ApplicantNameTextBox");
        txt1.Text = "";
        txt2.Text = "";
        txt3.Text = "";
        txt4.Text = "";
        txt5.Text = "";
        txt6.Text = "";
        txt7.Text = "";
        txt1.Focus();
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
        infoDiv.Visible = false;
        Multiview_NoRecordCertificate.SetActiveView(View2_Formview);
        FormView_NoRecordCertificate.PageIndex = e.NewEditIndex;
        FormView_NoRecordCertificate.ChangeMode(FormViewMode.Edit);
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
        Multiview_NoRecordCertificate.SetActiveView(view1_GridView);
    }
    protected void ods_NoRecordCertificate_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
}