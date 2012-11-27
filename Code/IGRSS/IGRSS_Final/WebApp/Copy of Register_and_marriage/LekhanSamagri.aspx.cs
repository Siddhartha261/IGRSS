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
       
        Multiview_LekhanSamagri.SetActiveView(View2_LekhanSamagri);
        FormView_LekhanSamagri.ChangeMode(FormViewMode.Insert);
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

        Multiview_LekhanSamagri.SetActiveView(View2_LekhanSamagri);
        FormView_LekhanSamagri.PageIndex = e.NewEditIndex;
        FormView_LekhanSamagri.DefaultMode = FormViewMode.Edit;
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
    protected void ods_Lekhan_Samagri_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
}