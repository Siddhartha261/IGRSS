using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_KalpataruPurchaseStock : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        
        Multiview_Kalpataru.SetActiveView(View2_Formview_Kalpataru);
        FormView_Kalpataru.ChangeMode(FormViewMode.Insert);
    }
    
    protected void ods_Kalpataru_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtSearch.Text.Trim();
        ods_Kalpataru.SelectMethod = "GetDataBy";
    }
    protected void FormView_Kalpataru_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
               Multiview_Kalpataru.SetActiveView(View1_GridView_Kalpataru);
               View1_GridView_Kalpataru.DataBind();
               infoDiv.Visible = false;
                break;
        }


    }
    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void GridView_Kalpataru_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_Kalpataru_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_Kalpataru.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_Kalpataru.DataKeys[e.RowIndex].Value;
        ods_Kalpataru.Delete();
    }
    protected void GridView_Kalpataru_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_Kalpataru.SetActiveView(View2_Formview_Kalpataru);
        FormView_Kalpataru.PageIndex = e.NewEditIndex;
        FormView_Kalpataru.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void FormView_Kalpataru_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_Kalpataru_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void ods_Kalpataru_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
}