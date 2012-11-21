using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GovtDoc : System.Web.UI.Page
{

    protected void Button_new_Click(object sender, EventArgs e)
    {
        mvgovtdoc.SetActiveView(viewFv);
        FvGovtDoc.ChangeMode(FormViewMode.Insert); ;
    }



    protected void FvGovtDoc_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                mvgovtdoc.SetActiveView(viewGrid);
                viewGrid.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }

    protected void ObjectDataSource_govtdoc_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtSearch.Text.Trim();
        ObjectDataSource_govtdoc.SelectMethod = "GetData";
    }
    protected void FvGovtDoc_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDownListDepartment = FvGovtDoc.FindControl("DropDownListNameOfDepartment") as DropDownList;
        e.Values["NameOfDepartment"] = DropDownListDepartment.SelectedValue;
    }
    protected void ButtonSearch_Click(object sender, EventArgs e)
    {

    }
    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void GridView2_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView2.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView2.DataKeys[e.RowIndex].Value;
        ObjectDataSource_govtdoc.Delete();
    }
    protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        mvgovtdoc.SetActiveView(viewFv);
        FvGovtDoc.PageIndex = e.NewEditIndex;
        FvGovtDoc.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;

    }
    protected void FvGovtDoc_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FvGovtDoc_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void ObjectDataSource_govtdoc_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
    protected void FvGovtDoc_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        DropDownList DropDownListDepartment = FvGovtDoc.FindControl("DropDownListNameOfDepartment") as DropDownList;
        e.NewValues["NameOfDepartment"] = DropDownListDepartment.SelectedValue;
    }

  
}