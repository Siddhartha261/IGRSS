using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Department_GrantRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_GrantRegister.SetActiveView(view2_Formview);
        FormView_GrantRegister.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_GrantRegister_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDownList1 = FormView_GrantRegister.FindControl("DropDownListBillNo") as DropDownList;
        if (DropDownList1 != null)
        {
            e.Values["BillNo"] = DropDownList1.SelectedValue;
        }
    }
    protected void FormView_GrantRegister_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case"Back":
                Multiview_GrantRegister.SetActiveView(view1_GridView);
                view1_GridView.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    protected void ods_GrantRegister_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_GrantRegister.SelectMethod = "GetDataBy1";
    }


    protected void GridView_GrantRegister_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_GrantRegister.SetActiveView(view2_Formview);
        FormView_GrantRegister.PageIndex = e.NewEditIndex;
        FormView_GrantRegister.ChangeMode(FormViewMode.Edit);
        e.NewEditIndex = -1;
    }
    protected void GridView_GrantRegister_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_GrantRegister.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_GrantRegister.DataKeys[e.RowIndex].Value;
        ods_GrantRegister.Delete();
    }
    protected void ods_GrantRegister_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
    protected void FormView_GrantRegister_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been added successfully", false);
        }
        else 
        {
            ShowMessage("Unable to add record",true);
        }
    }
    protected void FormView_GrantRegister_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been updated successfully", false);
        }
        else
        {
            ShowMessage("Unable to update record", true);
        }
        Multiview_GrantRegister.SetActiveView(view1_GridView);
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }

    protected void GridView_GrantRegister_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
}