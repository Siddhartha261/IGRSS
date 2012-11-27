using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_DeadStockRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_DeadStock.SetActiveView(View2_Formview);
        FormView_DeadStock.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_DeadStock_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
             
                Multiview_DeadStock.SetActiveView(View1_GridView);
                View1_GridView.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    protected void ods_DeadStock_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtSearch.Text.Trim();
        ods_DeadStock.SelectMethod = "GetDataBy";
    }

    protected void FormView_DeadStock_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
      
        RadioButtonList RadioButtonList1 = FormView_DeadStock.FindControl("RadioButtonList1") as RadioButtonList;
        e.Values["Authorityvoucher"] = RadioButtonList1.SelectedValue;
    }
    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void FormView_DeadStock_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_DeadStock_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void GridView_DeadStock_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_DeadStock_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_DeadStock.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_DeadStock.DataKeys[e.RowIndex].Value;
        ods_DeadStock.Delete();
    }
    protected void GridView_DeadStock_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_DeadStock.SetActiveView(View2_Formview);
        FormView_DeadStock.PageIndex = e.NewEditIndex;
        FormView_DeadStock.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void ods_DeadStock_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
    protected void FormView_DeadStock_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {

        RadioButtonList RadioButtonList1 = FormView_DeadStock.FindControl("RadioButtonList1") as RadioButtonList;
        e.NewValues["Authorityvoucher"] = RadioButtonList1.SelectedValue;
    }
}