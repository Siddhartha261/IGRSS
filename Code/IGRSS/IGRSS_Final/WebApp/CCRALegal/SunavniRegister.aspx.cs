using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CCRALegal_SunavniRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_SunavniRegister.SetActiveView(Multiview_SunavniRegister.Views[1]);
        FormView_SunavniRegister.ChangeMode(FormViewMode.Insert);
        DropDownList Dropdown_appealno = FormView_SunavniRegister.FindControl("DropDownList_AppealNo") as DropDownList;
        TextBox txt1 = FormView_SunavniRegister.FindControl("FileNoTextBox") as TextBox;
        TextBox txt2 = FormView_SunavniRegister.FindControl("NameOfPetitionerTextBox") as TextBox;
        TextBox txt3 = FormView_SunavniRegister.FindControl("IssueDateOfLetterTextBox") as TextBox;
        TextBox txt4 = FormView_SunavniRegister.FindControl("DateOfHearingTextBox") as TextBox;
        TextBox txt5 = FormView_SunavniRegister.FindControl("ResultTextBox") as TextBox;
        txt1.Text = "";
        txt2.Text = "";
        txt3.Text = "";
        txt4.Text = "";
        txt5.Text = "";
        Dropdown_appealno.Focus();
    }

    protected void FormView_SunavniRegister_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDownList_AppealNo = FormView_SunavniRegister.FindControl("DropDownList_AppealNo") as DropDownList;
        e.Values["AppealNo"] = DropDownList_AppealNo.SelectedValue;

        DropDownList DropDownList_Versus = FormView_SunavniRegister.FindControl("DropDownList_EmployeeName") as DropDownList;
        e.Values["Versus"] = DropDownList_Versus.SelectedValue;
    }
    protected void FormView_SunavniRegister_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_SunavniRegister.SetActiveView(ViewGrid);
                GridView_SunavniRegister.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    protected void ods_SunavniRegister_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_SunavniRegister.SelectMethod = "GetDataBy";
    }
    protected void GridView_SunavniRegister_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_SunavniRegister_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_SunavniRegister.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_SunavniRegister.DataKeys[e.RowIndex].Value;
        ods_SunavniRegister.Delete();
    }
    protected void GridView_SunavniRegister_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_SunavniRegister.SetActiveView(Formview);
        FormView_SunavniRegister.PageIndex = e.NewEditIndex;
        FormView_SunavniRegister.ChangeMode(FormViewMode.Edit);
        e.NewEditIndex = -1;
    }
    protected void FormView_SunavniRegister_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_SunavniRegister_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been updated successfully", false);
        }
        else
        {
            ShowMessage("Unable to update record", true);
        }
        Multiview_SunavniRegister.SetActiveView(ViewGrid);
    }
    protected void ods_SunavniRegister_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void FormView_SunavniRegister_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        DropDownList DropDownList_AppealNo = FormView_SunavniRegister.FindControl("DropDownList_AppealNo") as DropDownList;
        e.NewValues["AppealNo"] = DropDownList_AppealNo.SelectedValue;

        DropDownList DropDownList_Versus = FormView_SunavniRegister.FindControl("DropDownList_EmployeeName") as DropDownList;
        e.NewValues["Versus"] = DropDownList_Versus.SelectedValue;
    }
}