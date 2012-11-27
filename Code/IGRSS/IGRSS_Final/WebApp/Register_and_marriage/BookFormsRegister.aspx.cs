using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_BookFormsRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_BookFormsRegister.SetActiveView(view2_Formview);
        FormView_BookFormRegister.ChangeMode(FormViewMode.Insert);
        TextBox txt1 = (TextBox)FormView_BookFormRegister.FindControl("No_of_formsTextBox");
        TextBox txt2 = (TextBox)FormView_BookFormRegister.FindControl("No_of_formsTextBox");
        TextBox txt3= (TextBox)FormView_BookFormRegister.FindControl("No_of_formsTextBox");
        TextBox txt4 = (TextBox)FormView_BookFormRegister.FindControl("No_of_formsTextBox");
        TextBox txt5 = (TextBox)FormView_BookFormRegister.FindControl("No_of_formsTextBox");
        TextBox txt6 = (TextBox)FormView_BookFormRegister.FindControl("No_of_formsTextBox");
        TextBox txt7 = (TextBox)FormView_BookFormRegister.FindControl("No_of_formsTextBox");
        TextBox txt8 = (TextBox)FormView_BookFormRegister.FindControl("No_of_formsTextBox");
        TextBox txt9 = (TextBox)FormView_BookFormRegister.FindControl("No_of_formsTextBox");
        txt1.Text = "";
        txt2.Text = "";
        txt3.Text = "";
        txt4.Text = "";
        txt5.Text = "";
        txt6.Text = "";
        txt7.Text = "";
        txt8.Text = "";
        txt9.Text = "";
        txt1.Focus();

    }

    protected void FormView_BookForm_ItemInserting(object sender, FormViewInsertEventArgs e)
    {


        DropDownList DropDownList1 = FormView_BookFormRegister.FindControl("DropDownListDepartment") as DropDownList;
        e.Values["Dept_name"] = DropDownList1.SelectedValue;
    }
    protected void FormView_BookForm_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_BookFormsRegister.SetActiveView(view1_GridView);
                view1_GridView.DataBind();
                infoDiv.Visible = false;
                break;
                
        }

    }
    protected void ods_BookformRegister_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_BookFormRegister.SelectMethod = "GetDataBy";
    }
    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void GridView_BookFormRegister_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_BookFormRegister_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        GridView_BookFormRegister.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_BookFormRegister.DataKeys[e.RowIndex].Value;
        ods_BookFormRegister.Delete();
    }
    protected void GridView_BookFormRegister_RowEditing(object sender, GridViewEditEventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_BookFormsRegister.SetActiveView(view2_Formview);
        FormView_BookFormRegister.PageIndex = e.NewEditIndex;
        FormView_BookFormRegister.ChangeMode(FormViewMode.Edit);
        e.NewEditIndex = -1;
    }
    protected void FormView_BookFormRegister_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_BookFormRegister_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been updated successfully", false);
        }
        else
        {
            ShowMessage("Unable to update record", true);
        }
        Multiview_BookFormsRegister.SetActiveView(view1_GridView);
    }
    protected void ods_BookFormRegister_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
    protected void FormView_BookFormRegister_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        DropDownList DropDownList1 = FormView_BookFormRegister.FindControl("DropDownListDepartment") as DropDownList;
        e.NewValues["Dept_name"] = DropDownList1.SelectedValue;
    }
}