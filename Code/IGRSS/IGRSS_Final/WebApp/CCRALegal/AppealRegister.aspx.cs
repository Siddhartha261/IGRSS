using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CCRALegal_AppealRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_AppealRegister.SetActiveView(Multiview_AppealRegister.Views[1]);
        FormView_AppealRegister.ChangeMode(FormViewMode.Insert);
    }

    protected void FormView_AppealRegister_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDownOffice = FormView_AppealRegister.FindControl("DropDownList_office") as DropDownList;
        e.Values["KacheriOffice"] = DropDownOffice.SelectedValue;

        DropDownList DropDownVersus = FormView_AppealRegister.FindControl("DropdownList_Versus") as DropDownList;
        e.Values["Versus"] = DropDownVersus.SelectedValue;

        RadioButtonList RadioButtonlist_continue = FormView_AppealRegister.FindControl("RadioButtonList_continue") as RadioButtonList;
        e.Values["Continue_remand"] = Convert.ToBoolean(RadioButtonlist_continue.SelectedValue);
    }
    protected void FormView_AppealRegister_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_AppealRegister.SetActiveView(ViewGrid);
                GridView_AppealRegister.DataBind();
                break;
        }
    }

    protected void ods_AppealRegister_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_AppealRegister.SelectMethod = "GetDataBy";
    }


    protected void GridView_AppealRegister_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_AppealRegister_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_AppealRegister.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_AppealRegister.DataKeys[e.RowIndex].Value;
        ods_AppealRegister.Delete();
    }
    protected void GridView_AppealRegister_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_AppealRegister.SetActiveView(Formview);
        FormView_AppealRegister.PageIndex = e.NewEditIndex;
        FormView_AppealRegister.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void FormView_AppealRegister_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_AppealRegister_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void ods_AppealRegister_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }


    protected void FormView_AppealRegister_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        DropDownList DropDownOffice = FormView_AppealRegister.FindControl("DropDownList_office") as DropDownList;
        e.NewValues["KacheriOffice"] = DropDownOffice.SelectedValue;

        DropDownList DropDownVersus = FormView_AppealRegister.FindControl("DropdownList_Versus") as DropDownList;
        e.NewValues["Versus"] = DropDownVersus.SelectedValue;

        RadioButtonList RadioButtonlist_continue = FormView_AppealRegister.FindControl("RadioButtonList_continue") as RadioButtonList;
        e.NewValues["Continue_remand"] = Convert.ToBoolean(RadioButtonlist_continue.SelectedValue);
    }
    protected void GridView_AppealRegister_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblContinue_remand = e.Row.FindControl("lblContinue_remand") as Label;
            lblContinue_remand.Text = Convert.ToBoolean(GridView_AppealRegister.DataKeys[e.Row.RowIndex].Values[1]) ? "Yes" : "No";
        }
    }
    protected void FormView_AppealRegister_DataBound(object sender, EventArgs e)
    {
        if (FormView_AppealRegister.DefaultMode == FormViewMode.Edit)
        {
            RadioButtonList RadioButtonlist_continue = FormView_AppealRegister.FindControl("RadioButtonList_continue") as RadioButtonList;
            RadioButtonlist_continue.SelectedIndex = Convert.ToBoolean(FormView_AppealRegister.DataKey[1]) ? 0 : 1;
        }
        
    }
}