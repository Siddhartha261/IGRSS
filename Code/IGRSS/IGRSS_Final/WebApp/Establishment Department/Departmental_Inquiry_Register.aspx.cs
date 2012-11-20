using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Establishment_Department_Departmental_Inquiry_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_Departmental_Inquiry_Register.SetActiveView(Multiview_Departmental_Inquiry_Register.Views[1]);
        FormView_Departmental_Inquiry_Register.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_Departmental_Inquiry_Register_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDown_Grade = FormView_Departmental_Inquiry_Register.FindControl("DropDownList_Grade") as DropDownList;
        e.Values["Grade"] = DropDown_Grade.SelectedValue;

        DropDownList DropDown_InquiryOfficer = FormView_Departmental_Inquiry_Register.FindControl("DropDownList_InquiryOfficer") as DropDownList;
        e.Values["Name_Of_Inquiry_Officer"] = DropDown_InquiryOfficer.SelectedValue;

        RadioButtonList RadioList_Govt_Dept = FormView_Departmental_Inquiry_Register.FindControl("RadioButtonList_Govt_Dept") as RadioButtonList;
        e.Values["Government_Department"] = RadioList_Govt_Dept.SelectedValue;
    }
    protected void FormView_Departmental_Inquiry_Register_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_Departmental_Inquiry_Register.SetActiveView(ViewGrid);
                GridView_Departmental_Inquiry_Register.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    protected void ods_Departmental_Inquiry_Register_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_Departmental_Inquiry_Register.SelectMethod = "GetDataBy1";
    }
    protected void GridView_Departmental_Inquiry_Register_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_Departmental_Inquiry_Register_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_Departmental_Inquiry_Register.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_Departmental_Inquiry_Register.DataKeys[e.RowIndex].Value;
        ods_Departmental_Inquiry_Register.Delete();
    }
    protected void GridView_Departmental_Inquiry_Register_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_Departmental_Inquiry_Register.SetActiveView(Formview);
        FormView_Departmental_Inquiry_Register.PageIndex = e.NewEditIndex;
        FormView_Departmental_Inquiry_Register.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void FormView_Departmental_Inquiry_Register_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_Departmental_Inquiry_Register_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void FormView_Departmental_Inquiry_Register_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        DropDownList DropDown_Grade = FormView_Departmental_Inquiry_Register.FindControl("DropDownList_Grade") as DropDownList;
        e.NewValues["Grade"] = DropDown_Grade.SelectedValue;

        DropDownList DropDown_InquiryOfficer = FormView_Departmental_Inquiry_Register.FindControl("DropDownList_InquiryOfficer") as DropDownList;
        e.NewValues["Name_Of_Inquiry_Officer"] = DropDown_InquiryOfficer.SelectedValue;

        RadioButtonList RadioList_Govt_Dept = FormView_Departmental_Inquiry_Register.FindControl("RadioButtonList_Govt_Dept") as RadioButtonList;
        e.NewValues["Government_Department"] = RadioList_Govt_Dept.SelectedValue;
    }
    protected void ods_Departmental_Inquiry_Register_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
}