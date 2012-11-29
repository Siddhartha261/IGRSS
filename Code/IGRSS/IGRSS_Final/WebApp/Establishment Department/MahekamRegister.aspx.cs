using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Establishment_Department_MahekamRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_Mahekam.SetActiveView(Multiview_Mahekam.Views[1]);
        FormView_Mahekam.ChangeMode(FormViewMode.Insert);
        ListBox listbox_details_of_designation = FormView_Mahekam.FindControl("ListBox_Designation") as ListBox;
        TextBox txt1 = FormView_Mahekam.FindControl("From_DateTextBox") as TextBox;
        TextBox txt2 = FormView_Mahekam.FindControl("To_DateTextBox") as TextBox;
        txt1.Text = "";
        txt2.Text = "";
        listbox_details_of_designation.Focus();
    }
    protected void FormView_Mahekam_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        ListBox ListBox_Designation = FormView_Mahekam.FindControl("ListBox_Designation") as ListBox;
        e.Values["Details_Of_Designation"] = ListBox_Designation.SelectedValue;

        DropDownList DropDown_EmployeeName = FormView_Mahekam.FindControl("DropDownList_EmployeeName") as DropDownList;
        e.Values["Employee_Name"] = DropDown_EmployeeName.SelectedValue;

        DropDownList DropDown_Designation = FormView_Mahekam.FindControl("DropDownList_Designation") as DropDownList;
        e.Values["Designation"] = DropDown_Designation.SelectedValue;

        DropDownList DropDown_Grade = FormView_Mahekam.FindControl("DropDownList_Grade") as DropDownList;
        e.Values["Grade"] = DropDown_Grade.SelectedValue;

        DropDownList DropDown_CurrentOffice = FormView_Mahekam.FindControl("DropDownList_CurrentOffice") as DropDownList;
        e.Values["Current_Office"] = DropDown_CurrentOffice.SelectedValue;

        DropDownList DropDown_ResidenceDistrict = FormView_Mahekam.FindControl("DropDownList_ResidenceDistrict") as DropDownList;
        e.Values["Residence_District"] = DropDown_ResidenceDistrict.SelectedValue;


    }
    protected void FormView_Mahekam_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_Mahekam.SetActiveView(ViewGrid);
                GridView_Mahekam.DataBind();
                infoDiv.Visible = false;        
                break;
        }
    }
    protected void ods_Mahekam_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_Mahekam.SelectMethod = "GetDataBy";
   }
    protected void GridView_Mahekam_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_Mahekam_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_Mahekam.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_Mahekam.DataKeys[e.RowIndex].Value;
        ods_Mahekam.Delete();
    }
    protected void GridView_Mahekam_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_Mahekam.SetActiveView(Formview);
        FormView_Mahekam.PageIndex = e.NewEditIndex;
        FormView_Mahekam.ChangeMode(FormViewMode.Edit);
        e.NewEditIndex = -1;
    }
    protected void FormView_Mahekam_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_Mahekam_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been updated successfully", false);
        }
        else
        {
            ShowMessage("Unable to update record", true);
        }
        Multiview_Mahekam.SetActiveView(ViewGrid);
    }
    protected void FormView_Mahekam_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        ListBox ListBox_Designation = FormView_Mahekam.FindControl("ListBox_Designation") as ListBox;
        e.NewValues["Details_Of_Designation"] = ListBox_Designation.SelectedValue;

        DropDownList DropDown_EmployeeName = FormView_Mahekam.FindControl("DropDownList_EmployeeName") as DropDownList;
        e.NewValues["Employee_Name"] = DropDown_EmployeeName.SelectedValue;

        DropDownList DropDown_Designation = FormView_Mahekam.FindControl("DropDownList_Designation") as DropDownList;
        e.NewValues["Designation"] = DropDown_Designation.SelectedValue;

        DropDownList DropDown_Grade = FormView_Mahekam.FindControl("DropDownList_Grade") as DropDownList;
        e.NewValues["Grade"] = DropDown_Grade.SelectedValue;

        DropDownList DropDown_CurrentOffice = FormView_Mahekam.FindControl("DropDownList_CurrentOffice") as DropDownList;
        e.NewValues["Current_Office"] = DropDown_CurrentOffice.SelectedValue;

        DropDownList DropDown_ResidenceDistrict = FormView_Mahekam.FindControl("DropDownList_ResidenceDistrict") as DropDownList;
        e.NewValues["Residence_District"] = DropDown_ResidenceDistrict.SelectedValue;
    }
    protected void ods_Mahekam_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
}