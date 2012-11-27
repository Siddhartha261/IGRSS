using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_LekhanSamagri : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_LekhanSamagri.SetActiveView(View2_LekhanSamagri);
        FormView_LekhanSamagri.ChangeMode(FormViewMode.Insert);
        TextBox txt1 = (TextBox)FormView_LekhanSamagri.FindControl("TextBoxPurchaseAuthority");
        TextBox txt2 = (TextBox)FormView_LekhanSamagri.FindControl("TextBoxQuantity");
        TextBox txt3 = (TextBox)FormView_LekhanSamagri.FindControl("PurchaseDateTextBox");
        TextBox txt4 = (TextBox)FormView_LekhanSamagri.FindControl("Article_descTextBox");
        TextBox txt5 = (TextBox)FormView_LekhanSamagri.FindControl("RemarksTextBox");
        TextBox txt6 = (TextBox)FormView_LekhanSamagri.FindControl("EmployeeReceivingDateTextBox");
        TextBox txt7 = (TextBox)FormView_LekhanSamagri.FindControl("ArticleCompletiobDateTextBox");
        TextBox txt8 = (TextBox)FormView_LekhanSamagri.FindControl("EmployeeSignTextBox");
        TextBox txt9 = (TextBox)FormView_LekhanSamagri.FindControl("Article_descTextBox");
        txt1.Text = "";
        txt2.Text = "";
        txt3.Text = "";
        txt4.Text = "";
        txt5.Text = "";
        txt6.Text = "";
        txt7.Text = "";
        txt8.Text = "";
        txt8.Text = "";
        txt9.Text = "";
        txt1.Focus();
    }
    protected void ods_Lekhan_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
       
        e.InputParameters["searchKeyword"] = txtSearch.Text.Trim();
        ods_Lekhan_Samagri.SelectMethod = "GetDataBy";
    }

    protected void FormView_LekhanSamagri_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
              
                Multiview_LekhanSamagri.SetActiveView(View1_LekhanSamagri);
                View1_LekhanSamagri.DataBind();
                infoDiv.Visible = false;
                break;
        }

    }
    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void GridView_LekhanSamagri_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_LekhanSamagri_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_LekhanSamagri.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_LekhanSamagri.DataKeys[e.RowIndex].Value;
        ods_Lekhan_Samagri.Delete();
    }
    protected void GridView_LekhanSamagri_RowEditing(object sender, GridViewEditEventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_LekhanSamagri.SetActiveView(View2_LekhanSamagri);
        FormView_LekhanSamagri.PageIndex = e.NewEditIndex;
        FormView_LekhanSamagri.ChangeMode(FormViewMode.Edit);
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
        Multiview_LekhanSamagri.SetActiveView(View1_LekhanSamagri);
    }
    protected void ods_Lekhan_Samagri_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
}