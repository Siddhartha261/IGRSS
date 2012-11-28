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
        TextBox txt1 = (TextBox)FormView_HighCourtReg.FindControl("FilenoTextBox") as TextBox;
        TextBox txt2 = (TextBox)FormView_HighCourtReg.FindControl("SpecialCivilApplNoTextBox") as TextBox;
        TextBox txt4 = (TextBox)FormView_HighCourtReg.FindControl("PetitionerNameTextBox") as TextBox;
        TextBox txt5 = (TextBox)FormView_HighCourtReg.FindControl("PetitionReasonTextBox") as TextBox;
        RadioButtonList txt6 = (RadioButtonList)FormView_HighCourtReg.FindControl("Radio_parawisermrksent") as RadioButtonList;
        TextBox txt7 = (TextBox)FormView_HighCourtReg.FindControl("ParawiseremarksdateTextBox") as TextBox;
        RadioButtonList txt8 = (RadioButtonList)FormView_HighCourtReg.FindControl("Radio_affidavit") as RadioButtonList;
        TextBox txt9 = (TextBox)FormView_HighCourtReg.FindControl("AffidavitdateTextBox") as TextBox;
        TextBox txt10 = (TextBox)FormView_HighCourtReg.FindControl("LatestStatusTextBox") as TextBox;
        TextBox txt11 = (TextBox)FormView_HighCourtReg.FindControl("PetitionDispoasedYearTextBox") as TextBox;
        TextBox txt12 = (TextBox)FormView_HighCourtReg.FindControl("DisposalDateTextBox") as TextBox;
        TextBox txt13 = (TextBox)FormView_HighCourtReg.FindControl("OrderJudgementSheetTextBox") as TextBox;
        TextBox txt14 = (TextBox)FormView_HighCourtReg.FindControl("JudgementDetailTextBox") as TextBox;
        txt1.Focus();
        txt1.Text = "";
        txt2.Text = "";
        
        txt4.Text = "";
        txt5.Text = "";
        txt6.Text = "";
        txt7.Text = "";
        txt8.Text = "";
        txt9.Text = "";
        txt10.Text = "";
        txt11.Text = "";
        txt12.Text = "";
        txt13.Text = "";
        txt14.Text = ""; 
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
                infoDiv.Visible = false;
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
        FormView_HighCourtReg.DefaultMode=FormViewMode.Edit;
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
    protected void FormView_HighCourtReg_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        RadioButtonList Radio_parawisermrksent = FormView_HighCourtReg.FindControl("Radio_parawisermrksent") as RadioButtonList;
        e.NewValues["Parawiseremarks"] = Convert.ToBoolean(Radio_parawisermrksent.SelectedValue);

        RadioButtonList Radio_AffidavitSent = FormView_HighCourtReg.FindControl("Radio_affidavit") as RadioButtonList;
        e.NewValues["Affidavit"] = Convert.ToBoolean(Radio_AffidavitSent.SelectedValue);

        DropDownList dropdownofficename = FormView_HighCourtReg.FindControl("Drop_officename") as DropDownList;
        e.NewValues["DistrictOfficeName"] = dropdownofficename.SelectedValue;
    }
    protected void GridView_HighCourtReg_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblParawiseremarks = e.Row.FindControl("lblParawiseremarks") as Label;
            lblParawiseremarks.Text = Convert.ToBoolean(GridView_HighCourtReg.DataKeys[e.Row.RowIndex].Values[1]) ? "Yes" : "No";

            Label lblAffidavit = e.Row.FindControl("lblAffidavit") as Label;
            lblAffidavit.Text = Convert.ToBoolean(GridView_HighCourtReg.DataKeys[e.Row.RowIndex].Values[1]) ? "Yes" : "No";

        }
    }
    protected void FormView_HighCourtReg_DataBound(object sender, EventArgs e)
    {
        if (FormView_HighCourtReg.DefaultMode == FormViewMode.Edit)
        {
            RadioButtonList Radio_parawisermrksent = FormView_HighCourtReg.FindControl("Radio_parawisermrksent") as RadioButtonList;
            Radio_parawisermrksent.SelectedIndex = Convert.ToBoolean(FormView_HighCourtReg.DataKey[1]) ? 0 : 1;

            RadioButtonList Radio_affidavit = FormView_HighCourtReg.FindControl("Radio_affidavit") as RadioButtonList;
            Radio_affidavit.SelectedIndex = Convert.ToBoolean(FormView_HighCourtReg.DataKey[1]) ? 0 : 1;
        }
    }
}