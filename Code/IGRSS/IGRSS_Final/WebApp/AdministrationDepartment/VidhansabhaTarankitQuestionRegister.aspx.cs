using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestPages_VidhansabhaTarankitQuestionRegister : System.Web.UI.Page
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
        infoDiv.Visible = false;
        Multiview_Tarankit.SetActiveView(Multiview_Tarankit.Views[1]);
        FormView_Tarankit.ChangeMode(FormViewMode.Insert);
        TextBox txt1 = FormView_Tarankit.FindControl("quesnoTextBox") as TextBox;
        TextBox txt2 = FormView_Tarankit.FindControl("mlaPlaceTextBox") as TextBox;
        TextBox txt3 = FormView_Tarankit.FindControl("SubjectTextBox") as TextBox;
        TextBox txt4 = FormView_Tarankit.FindControl("NumberTextBox") as TextBox;
        TextBox txt5 = FormView_Tarankit.FindControl("Reply_SentTextBox") as TextBox;
        TextBox txt6 = FormView_Tarankit.FindControl("DateTextBox") as TextBox;
        TextBox txt7 = FormView_Tarankit.FindControl("FilenoTextBox") as TextBox;
        TextBox txt8 = FormView_Tarankit.FindControl("RemarksTextBox") as TextBox;
        txt1.Text = "";
        txt2.Text = "";
        txt3.Text = "";
        txt4.Text = "";
        txt5.Text = "";
        txt6.Text = "";
        txt7.Text = "";
        txt8.Text = "";
        RadioButtonList Radio_Tarankit = FormView_Tarankit.FindControl("Radio_tarankit") as RadioButtonList;
        Radio_Tarankit.Focus();
    }
    protected void FormView_Tarankit_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        RadioButtonList Radio_Tarankit = FormView_Tarankit.FindControl("Radio_tarankit") as RadioButtonList;
        e.Values["Tarankit_Atarnkit"] = Radio_Tarankit.SelectedValue;

        DropDownList Drop_mlaname = FormView_Tarankit.FindControl("Drop_mlaname") as DropDownList;
        e.Values["mlaName"] = Drop_mlaname.SelectedValue;
    }
    protected void FormView_Tarankit_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_Tarankit.SetActiveView(ViewGrid);
                GridView_Tarankit.DataBind();
                infoDiv.Visible = false;
               break;
        }
    }
    protected void ods_Tarankit_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_Tarankit.SelectMethod = "GetDataBy";
        
    }
    protected void GridView_Tarankit_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_Tarankit_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_Tarankit.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_Tarankit.DataKeys[e.RowIndex].Value;
        ods_Tarankit.Delete();
    }
    protected void GridView_Tarankit_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_Tarankit.SetActiveView(Formview);
        FormView_Tarankit.PageIndex = e.NewEditIndex;
        FormView_Tarankit.ChangeMode(FormViewMode.Edit);
        e.NewEditIndex = -1;
    }
    protected void FormView_Tarankit_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_Tarankit_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been updated successfully", false);
        }
        else
        {
            ShowMessage("Unable to update record", true);
        }
        Multiview_Tarankit.SetActiveView(ViewGrid);
    }
    protected void ods_Tarankit_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void FormView_Tarankit_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        RadioButtonList Radio_Tarankit = FormView_Tarankit.FindControl("Radio_tarankit") as RadioButtonList;
        e.NewValues["Tarankit_Atarnkit"] = Radio_Tarankit.SelectedValue;

        DropDownList Drop_mlaname = FormView_Tarankit.FindControl("Drop_mlaname") as DropDownList;
        e.NewValues["mlaName"] = Drop_mlaname.SelectedValue;
    }
}