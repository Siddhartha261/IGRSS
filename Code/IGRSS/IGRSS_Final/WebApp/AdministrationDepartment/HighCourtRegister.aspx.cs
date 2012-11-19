using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestPages_HighCourtRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   
    
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_HighCourtReg.SetActiveView(Multiview_HighCourtReg.Views[1]);
        FormView_HighCourtReg.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_HighCourtReg_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        RadioButtonList Radio_parawisermrksent = FormView_HighCourtReg.FindControl("Radio_parawisermrksent") as RadioButtonList;
        e.Values["Parawiseremarks"] = Convert.ToBoolean(Radio_parawisermrksent.SelectedValue);

        RadioButtonList Radio_AffidavitSent = FormView_HighCourtReg.FindControl("Radio_affidavit") as RadioButtonList;
        e.Values["Affidavit"] = Convert.ToBoolean(Radio_AffidavitSent.SelectedValue);

        DropDownList dropdownofficename = FormView_HighCourtReg.FindControl("Drop_officename") as DropDownList;
        e.Values["DistrictOfficeName"] = dropdownofficename.SelectedValue;
    }
    protected void FormView_HighCourtReg_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_HighCourtReg.SetActiveView(ViewGrid);
                GridView_HighCourtReg.DataBind();
                break;      
        }
    }
    protected void ods_HighCourtReg_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_HighCourtReg.SelectMethod = "GetDataBy";
        
    }
    protected void GridView_HighCourtReg_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_HighCourtReg_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_HighCourtReg.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_HighCourtReg.DataKeys[e.RowIndex].Value;
        ods_HighCourtReg.Delete();
    }
    protected void GridView_HighCourtReg_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_HighCourtReg.SetActiveView(Formview);
        FormView_HighCourtReg.PageIndex = e.NewEditIndex;
        FormView_HighCourtReg.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void FormView_HighCourtReg_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_HighCourtReg_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void ods_HighCourtReg_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
}