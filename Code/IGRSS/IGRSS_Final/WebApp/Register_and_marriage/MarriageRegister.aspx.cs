using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_MarriageRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_Marriage_Certificate.SetActiveView(view2_Formview);
        FormView_Marriagecertificate.ChangeMode(FormViewMode.Insert);
        TextBox txt1 = (TextBox)FormView_Marriagecertificate.FindControl("Bridegroom_nameTextBox");
        TextBox txt2 = (TextBox)FormView_Marriagecertificate.FindControl("Bridegroom_nameTextBox");
        TextBox txt3 = (TextBox)FormView_Marriagecertificate.FindControl("Bridegroom_nameTextBox");
        TextBox txt4 = (TextBox)FormView_Marriagecertificate.FindControl("Bridegroom_nameTextBox");
        TextBox txt5 = (TextBox)FormView_Marriagecertificate.FindControl("Bridegroom_nameTextBox");
        TextBox txt6 = (TextBox)FormView_Marriagecertificate.FindControl("Bridegroom_nameTextBox");
        TextBox txt7 = (TextBox)FormView_Marriagecertificate.FindControl("Bridegroom_nameTextBox");
        TextBox txt8 = (TextBox)FormView_Marriagecertificate.FindControl("Bridegroom_nameTextBox");
        TextBox txt9 = (TextBox)FormView_Marriagecertificate.FindControl("Bridegroom_nameTextBox");
        TextBox txt10 = (TextBox)FormView_Marriagecertificate.FindControl("Bridegroom_nameTextBox");
        TextBox txt11 = (TextBox)FormView_Marriagecertificate.FindControl("Bridegroom_nameTextBox");
        TextBox txt12 = (TextBox)FormView_Marriagecertificate.FindControl("Bridegroom_nameTextBox");
        TextBox txt13 = (TextBox)FormView_Marriagecertificate.FindControl("Bridegroom_nameTextBox");
        TextBox txt14 = (TextBox)FormView_Marriagecertificate.FindControl("Bridegroom_nameTextBox");
        TextBox txt15 = (TextBox)FormView_Marriagecertificate.FindControl("Bridegroom_nameTextBox");
        txt1.Text = "";
        txt2.Text = "";
        txt3.Text = "";
        txt4.Text = "";
        txt5.Text = "";
        txt6.Text = "";
        txt7.Text = "";
        txt8.Text = "";
        txt9.Text = "";
        txt10.Text = "";
        txt11.Text = "";
        txt12.Text = "";
        txt13.Text = "";
        txt14.Text = "";
        txt15.Text = "";
        txt1.Focus();

    }
    protected void FormView_Marriage_certificate_ItemCommand(object sender, FormViewCommandEventArgs e)
    {

        switch (e.CommandName)
        {
            case "Back":
             
                Multiview_Marriage_Certificate.SetActiveView(View1_GridView);
                View1_GridView.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    protected void ods_Marriage_certificate_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
       e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_Marriage_certificate.SelectMethod = "GetDataBy";
    }
    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void FormView_Marriagecertificate_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {

    }
    protected void FormView_Marriagecertificate_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been updated successfully", false);
        }
        else
        {
            ShowMessage("Unable to update record", true);
        }
        Multiview_Marriage_Certificate.SetActiveView(View1_GridView);
    }
    protected void GridView_Marriagecertificate_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_Marriagecertificate_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_Marriagecertificate.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_Marriagecertificate.DataKeys[e.RowIndex].Value;
        ods_Marriage_certificate.Delete();
    }
    protected void GridView_Marriagecertificate_RowEditing(object sender, GridViewEditEventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_Marriage_Certificate.SetActiveView(view2_Formview);
        FormView_Marriagecertificate.PageIndex = e.NewEditIndex;
        FormView_Marriagecertificate.ChangeMode(FormViewMode.Edit);
        e.NewEditIndex = -1;
    }
    protected void ods_Marriage_certificate_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
    protected void FormView_Marriagecertificate_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
   
}