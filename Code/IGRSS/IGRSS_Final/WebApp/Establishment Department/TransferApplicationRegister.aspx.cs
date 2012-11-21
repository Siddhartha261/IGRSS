using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Establishment_Department_TransferApplicationRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void FormView_TransferAppl_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        ListBox ListBox_Designation = FormView_TransferAppl.FindControl("ListBox_Designation") as ListBox;
        e.Values["Details_Of_Designation"] = ListBox_Designation.SelectedValue;

        DropDownList DropDown_EmployeeName = FormView_TransferAppl.FindControl("DropDownList_EmployeeName") as DropDownList;
        e.Values["Employee_Name"] = DropDown_EmployeeName.SelectedValue;

        DropDownList DropDown_CurrentPlace = FormView_TransferAppl.FindControl("DropDownList_CurrentPlace") as DropDownList;
        e.Values["Current_Place"] = DropDown_CurrentPlace.SelectedValue;

        DropDownList DropDown_ResidenceDistrict = FormView_TransferAppl.FindControl("DropDownList_ResidenceDistrict") as DropDownList;
        e.Values["Residence_District"] = DropDown_ResidenceDistrict.SelectedValue;

        DropDownList DropDown_Place_Of_Request = FormView_TransferAppl.FindControl("DropDownList_Place_Of_Request") as DropDownList;
        e.Values["Place_Of_Request"] = DropDown_Place_Of_Request.SelectedValue;
    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_TransferAppl.SetActiveView(Multiview_TransferAppl.Views[1]);
        FormView_TransferAppl.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_TransferAppl_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_TransferAppl.SetActiveView(ViewGrid);
                GridView_TransferAppl.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    protected void ods_TransferAppl_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_TransferAppl.SelectMethod = "GetDataBy";
    }
    protected void GridView_TransferAppl_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_TransferAppl_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_TransferAppl.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_TransferAppl.DataKeys[e.RowIndex].Value;
        ods_TransferAppl.Delete();
    }
    protected void GridView_TransferAppl_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_TransferAppl.SetActiveView(Formview);
        FormView_TransferAppl.PageIndex = e.NewEditIndex;
        FormView_TransferAppl.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void FormView_TransferAppl_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_TransferAppl_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void FormView_TransferAppl_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        ListBox ListBox_Designation = FormView_TransferAppl.FindControl("ListBox_Designation") as ListBox;
        e.NewValues["Details_Of_Designation"] = ListBox_Designation.SelectedValue;

        DropDownList DropDown_EmployeeName = FormView_TransferAppl.FindControl("DropDownList_EmployeeName") as DropDownList;
        e.NewValues["Employee_Name"] = DropDown_EmployeeName.SelectedValue;

        DropDownList DropDown_CurrentPlace = FormView_TransferAppl.FindControl("DropDownList_CurrentPlace") as DropDownList;
        e.NewValues["Current_Place"] = DropDown_CurrentPlace.SelectedValue;

        DropDownList DropDown_ResidenceDistrict = FormView_TransferAppl.FindControl("DropDownList_ResidenceDistrict") as DropDownList;
        e.NewValues["Residence_District"] = DropDown_ResidenceDistrict.SelectedValue;

        DropDownList DropDown_Place_Of_Request = FormView_TransferAppl.FindControl("DropDownList_Place_Of_Request") as DropDownList;
        e.NewValues["Place_Of_Request"] = DropDown_Place_Of_Request.SelectedValue;
    }
    protected void ods_TransferAppl_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
}