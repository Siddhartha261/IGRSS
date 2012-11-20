using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InspectionDepartment_Sealing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_Sealing.SetActiveView(Multiview_Sealing.Views[1]);
        FormView_Sealing.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_Sealing_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDownOffice = FormView_Sealing.FindControl("DropDownList_officename") as DropDownList;
        e.Values["Kacheri_Office"] = DropDownOffice.SelectedValue;
    }
    protected void FormView_Sealing_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_Sealing.SetActiveView(ViewGrid);
                GridView_Sealing.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    protected void ods_Sealing_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_Sealing.SelectMethod = "GetDataBy";
    }
    protected void GridView_Sealing_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_Sealing_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_Sealing.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_Sealing.DataKeys[e.RowIndex].Value;
        ods_Sealing.Delete();
    }
    protected void GridView_Sealing_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_Sealing.SetActiveView(Formview);
        FormView_Sealing.PageIndex = e.NewEditIndex;
        FormView_Sealing.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void FormView_Sealing_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_Sealing_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void FormView_Sealing_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        DropDownList DropDownOffice = FormView_Sealing.FindControl("DropDownList_officename") as DropDownList;
        e.NewValues["Kacheri_Office"] = DropDownOffice.SelectedValue;
    }
    protected void ods_Sealing_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
}