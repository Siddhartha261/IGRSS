using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ADM_Photo_department_CDRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_CDRegister.SetActiveView(view2_Formview);
        FormView_CDRegister.ChangeMode(FormViewMode.Insert);
        TextBox txt1 = (TextBox)FormView_CDRegister.FindControl("YearDateTextBox");
        TextBox txt2 = (TextBox)FormView_CDRegister.FindControl("CD_NoTextBox");
        TextBox txt3 = (TextBox)FormView_CDRegister.FindControl("DetailsOfDocumentTextBox");
        TextBox txt4 = (TextBox)FormView_CDRegister.FindControl("StartingNoTextBox");
        TextBox txt5 = (TextBox)FormView_CDRegister.FindControl("EndingNoTextBox");
        TextBox txt6 = (TextBox)FormView_CDRegister.FindControl("SecondCopyDateTextBox");
        TextBox txt7 = (TextBox)FormView_CDRegister.FindControl("RemarksTextBox");
        txt1.Focus();
        txt1.Text = "";
        txt2.Text = "";
        txt3.Text = "";
        txt4.Text = "";
        txt5.Text = "";
        txt6.Text = "";
        txt7.Text = "";
     }
    protected void FormView_CDRegister_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case"Back":
                Multiview_CDRegister.SetActiveView(view1_GridView);
                view1_GridView.DataBind();
                infoDiv.Visible = false;
            break;
        }


    }
    protected void ods_CDRegister_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_CDRegister.SelectMethod = "GetDataBy";
    }
    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void GridView_CDRegister_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_CDRegister_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_CDRegister.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_CDRegister.DataKeys[e.RowIndex].Value;
        ods_CDRegister.Delete();
    }
    protected void GridView_CDRegister_RowEditing(object sender, GridViewEditEventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_CDRegister.SetActiveView(view2_Formview);
        FormView_CDRegister.PageIndex = e.NewEditIndex;
        FormView_CDRegister.ChangeMode(FormViewMode.Edit);
        e.NewEditIndex = -1;
    }
    protected void FormView_CDRegister_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_CDRegister_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been updated successfully", false);
        }
        else
        {
            ShowMessage("Unable to update record", true);
        }
        Multiview_CDRegister.SetActiveView(view1_GridView);
    }
    protected void ods_CDRegister_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
}