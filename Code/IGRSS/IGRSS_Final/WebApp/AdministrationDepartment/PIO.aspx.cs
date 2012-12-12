using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestPages_PIO : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //TextBox TextBox_FileNo = FormView_PIO.FindControl("FileNoTextBox") as TextBox;
        //TextBox_FileNo.Focus();
    }
   
    protected void Button_new_Click(object sender, EventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_PIO.SetActiveView(Formview);
        FormView_PIO.ChangeMode(FormViewMode.Insert);
        TextBox TextBox_FileNo = FormView_PIO.FindControl("FileNoTextBox") as TextBox;
        TextBox_FileNo.Focus();
    }
    protected void FormView_PIO_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        RadioButtonList Radio_BPL = FormView_PIO.FindControl("Radio_applbpl") as RadioButtonList;
        e.Values["Appl_BPL"] = Convert.ToBoolean(Radio_BPL.SelectedValue);

        RadioButtonList Radio_information = FormView_PIO.FindControl("Radio_information") as RadioButtonList;
        e.Values["Information"] = Radio_information.SelectedValue;

        DropDownList Drop_FeeMode = FormView_PIO.FindControl("Drop_recvdfessmode") as DropDownList;
        e.Values["Recvd_Fees_Mode"] = Drop_FeeMode.SelectedValue;

        RadioButtonList Radio_InfoSend = FormView_PIO.FindControl("Radio_informationsend") as RadioButtonList ;
        e.Values["Info_Send"] = Convert.ToBoolean(Radio_InfoSend.SelectedValue);
    }
    protected void FormView_PIO_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_PIO.SetActiveView(ViewGrid);
                   GridView_PIO.DataBind();
                break;            
        }
    }
    protected void ods_PIO_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_PIO.SelectMethod = "GetDataBy";
    }
    protected void GridView_PIO_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_PIO_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_PIO.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_PIO.DataKeys[e.RowIndex].Value;
        ods_PIO.Delete();
    }
    protected void GridView_PIO_RowEditing(object sender, GridViewEditEventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_PIO.SetActiveView(Formview);
        FormView_PIO.PageIndex = e.NewEditIndex;
        FormView_PIO.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void FormView_PIO_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_PIO_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been updated successfully", false);
        }
        else
        {
            ShowMessage("Unable to update record", true);
        }
        Multiview_PIO.SetActiveView(ViewGrid);
    }
    protected void FormView_PIO_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        RadioButtonList Radio_BPL = FormView_PIO.FindControl("Radio_applbpl") as RadioButtonList;
        e.NewValues["Appl_BPL"] = Convert.ToBoolean(Radio_BPL.SelectedValue);

        RadioButtonList Radio_information = FormView_PIO.FindControl("Radio_information") as RadioButtonList;
        e.NewValues["Information"] = Radio_information.SelectedValue;

        DropDownList Drop_FeeMode = FormView_PIO.FindControl("Drop_recvdfessmode") as DropDownList;
        e.NewValues["Recvd_Fees_Mode"] = Drop_FeeMode.SelectedValue;

        RadioButtonList Radio_InfoSend = FormView_PIO.FindControl("Radio_informationsend") as RadioButtonList;
        e.NewValues["Info_Send"] = Convert.ToBoolean(Radio_InfoSend.SelectedValue);
    }
    protected void ods_PIO_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void GridView_PIO_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblAppl_BPL = e.Row.FindControl("lblAppl_BPL") as Label;
            lblAppl_BPL.Text = Convert.ToBoolean(GridView_PIO.DataKeys[e.Row.RowIndex].Values[1]) ? "Yes" : "No";


        }
    }
    protected void FormView_PIO_DataBound(object sender, EventArgs e)
    {
        if (FormView_PIO.DefaultMode == FormViewMode.Edit)
        {
            RadioButtonList Radio_BPL = FormView_PIO.FindControl("Radio_applbpl") as RadioButtonList;
            Radio_BPL.SelectedIndex = Convert.ToBoolean(FormView_PIO.DataKey[1]) ? 0 : 1;

            RadioButtonList Radio_InfoSend = FormView_PIO.FindControl("Radio_informationsend") as RadioButtonList;
            Radio_InfoSend.SelectedIndex = Convert.ToBoolean(FormView_PIO.DataKey[1]) ? 0 : 1;
        }
    }
}