using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class LatestPages_FileRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearchAppNo_Click(object sender, EventArgs e)
    {

    }
    protected void txtFileNo_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
       
        Multiview_FileRegister.SetActiveView(view2_Formview);
        FormView_FileRegister.ChangeMode(FormViewMode.Insert);
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }

    
    protected void FormView_FileRegister_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":

                Multiview_FileRegister.SetActiveView(view1_GridView);
                view1_GridView.DataBind();
                infoDiv.Visible = false;

                break;
        }
    }
    protected void ods_FileRegister_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_FileRegister.SelectMethod = "GetDataBy";
    }
    protected void ods_FileRegister_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
    protected void FormView_FileRegister_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void GridView_FileRegister_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_FileRegister.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_FileRegister.DataKeys[e.RowIndex].Value;
        ods_FileRegister.Delete();
    }
    protected void GridView_FileRegister_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_FileRegister.SetActiveView(view2_Formview);
        FormView_FileRegister.PageIndex = e.NewEditIndex;
        FormView_FileRegister.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void GridView_FileRegister_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void FormView_FileRegister_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_FileRegister_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDownList1 = FormView_FileRegister.FindControl("DropDownListWorksheet") as DropDownList;
        e.Values["Worksheet_ID"] = DropDownList1.SelectedValue;
    }
    protected void FormView_FileRegister_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        DropDownList DropDownList1 = FormView_FileRegister.FindControl("DropDownListWorksheet") as DropDownList;
        e.NewValues["Worksheet_ID"] = DropDownList1.SelectedValue;
    }
}

    