using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestPages_MLAandMinisterRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_MLA.SetActiveView(Multiview_MLA.Views[1]);
        FormView_MLA.ChangeMode(FormViewMode.Insert);
    }



    protected void FormView_MLA_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList dropDownOffice = FormView_MLA.FindControl("Drop_departmentname") as DropDownList;
        e.Values["DepartmentName"] = dropDownOffice.SelectedValue;
    }
    protected void ods_MLA_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_MLA.SelectMethod = "GetDataBy";
    }
    protected void FormView_MLA_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_MLA.SetActiveView(ViewGrid);
                GridView_MLA.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    protected void GridView_MLA_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_MLA_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_MLA.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_MLA.DataKeys[e.RowIndex].Value;
        ods_MLA.Delete();
    }
    protected void GridView_MLA_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_MLA.SetActiveView(Formview);
        FormView_MLA.PageIndex = e.NewEditIndex;
        FormView_MLA.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void FormView_MLA_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_MLA_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void ods_MLA_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void FormView_MLA_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        DropDownList dropDownOffice = FormView_MLA.FindControl("Drop_departmentname") as DropDownList;
        e.NewValues["DepartmentName"] = dropDownOffice.SelectedValue;
    }
}