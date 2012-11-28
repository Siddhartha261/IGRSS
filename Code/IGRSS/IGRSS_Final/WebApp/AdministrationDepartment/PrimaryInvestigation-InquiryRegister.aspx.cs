using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestPages_PrimaryInvestigation_InquiryRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_Inquiry.SetActiveView(Multiview_Inquiry.Views[1]);
        FormView_Inquiry.ChangeMode(FormViewMode.Insert);
        TextBox txt1 = FormView_Inquiry.FindControl("FileNoTextBox") as TextBox;
        TextBox txt2 = FormView_Inquiry.FindControl("Date_Of_ComplaintTextBox") as TextBox;
        TextBox txt3 = FormView_Inquiry.FindControl("Details_To_Vigilance_CommissionerTextBox") as TextBox;
        txt1.Text = "";
        txt2.Text = "";
        txt3.Text = "";
        txt1.Focus();
    }
    protected void FormView_Inquiry_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDownEmployeeName = FormView_Inquiry.FindControl("Name_Of_EmployeeDropDown") as DropDownList;
        e.Values["Name_Of_Employee"] = DropDownEmployeeName.SelectedValue;

        DropDownList DropDownDesignation = FormView_Inquiry.FindControl("Drop_employeedesignation") as DropDownList;
        e.Values["Designation_Of_Employee"] = DropDownDesignation.SelectedValue;
    }
    protected void ods_Inquiry_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_Inquiry.SelectMethod = "GetDataBy";
        //ods_MLA.SelectMethod = "GetDataBy";
    }
    protected void FormView_Inquiry_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_Inquiry.SetActiveView(ViewGrid);
                GridView_Inquiry.DataBind();
                infoDiv.Visible = false;
               break;
        }
    }
    protected void GridView_Inquiry_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_Inquiry_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_Inquiry.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_Inquiry.DataKeys[e.RowIndex].Value;
        ods_Inquiry.Delete();
    }
    protected void GridView_Inquiry_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_Inquiry.SetActiveView(Formview);
        FormView_Inquiry.PageIndex = e.NewEditIndex;
        FormView_Inquiry.ChangeMode(FormViewMode.Edit);
        e.NewEditIndex = -1;
    }
    protected void FormView_Inquiry_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_Inquiry_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been updated successfully", false);
        }
        else
        {
            ShowMessage("Unable to update record", true);
        }
        Multiview_Inquiry.SetActiveView(ViewGrid);
    }
    protected void ods_Inquiry_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void FormView_Inquiry_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        DropDownList DropDownEmployeeName = FormView_Inquiry.FindControl("Name_Of_EmployeeDropDown") as DropDownList;
        e.NewValues["Name_Of_Employee"] = DropDownEmployeeName.SelectedValue;

        DropDownList DropDownDesignation = FormView_Inquiry.FindControl("Drop_employeedesignation") as DropDownList;
        e.NewValues["Designation_Of_Employee"] = DropDownDesignation.SelectedValue;
    }
}