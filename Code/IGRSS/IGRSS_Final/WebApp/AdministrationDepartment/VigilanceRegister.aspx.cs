using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestPages_VigilanceRegister : System.Web.UI.Page
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
       
      
        Multiview_Vigilance.SetActiveView(view2_Formview);
        FormView_Vigilance.ChangeMode(FormViewMode.Insert);
    }
    protected void applsummaryTextBox_TextChanged(object sender, EventArgs e)
    {

    }
    
    protected void FormView_Vigilance_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                
               
                Multiview_Vigilance.SetActiveView(view1_GridView);
                view1_GridView.DataBind();
                infoDiv.Visible = false;
                break;
        }
    }
    protected void ods_Vigilance_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_Vigilance.SelectMethod = "GetDataBy";
    }
    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
   
    protected void FormView_Vigilance_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
         if (e.Exception == null)
        {
            ShowMessage("Record has been added successfully", false);
        }
        else 
        {
            ShowMessage("Unable to add record",true);
        }

    }
    protected void FormView_Vigilance_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void ods_Vigilance_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }

    protected void GridView_Vigilance_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_Vigilance_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_Vigilance.Rows[e.RowIndex].Visible = false;
            ViewState["deleteKey"] = GridView_Vigilance.DataKeys[e.RowIndex].Value;
            ods_Vigilance.Delete();
    }
    protected void GridView_Vigilance_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_Vigilance.SetActiveView(view2_Formview);
            FormView_Vigilance.PageIndex = e.NewEditIndex;
            FormView_Vigilance.DefaultMode = FormViewMode.Edit;
           e.NewEditIndex = -1;
    }
    protected void FormView_Vigilance_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDownList1 = FormView_Vigilance.FindControl("designation") as DropDownList;
        e.Values["emp_desig"] = DropDownList1.SelectedValue;
    }
    protected void FormView_Vigilance_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        DropDownList DropDownList1 = FormView_Vigilance.FindControl("designation") as DropDownList;
        e.NewValues["emp_desig"] = DropDownList1.SelectedValue;
    }
}