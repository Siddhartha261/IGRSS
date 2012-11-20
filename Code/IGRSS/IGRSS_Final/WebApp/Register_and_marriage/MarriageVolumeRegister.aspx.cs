using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_MarriageVolumeRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
     
        Multiview_Marriage_Volume.SetActiveView(view2_Formview_MarriageVolume);
        FormView_MarriageVolume.ChangeMode(FormViewMode.Insert);
    }
    protected void ods_Marriage_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_MarriageVolume.SelectMethod = "GetDataBy";
    }
    
    protected void FormView_Marriage_ItemCommand(object sender, FormViewCommandEventArgs e)
    {

        switch (e.CommandName)
        {
            case "Back":
             
                Multiview_Marriage_Volume.SetActiveView(View1_Gridview_MarriageVolume);
                GridView_MarriageVolume.DataBind();
                infoDiv.Visible = false;
                break;
        }
      }
    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void GridView_MarriageVolume_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_MarriageVolume_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_MarriageVolume.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_MarriageVolume.DataKeys[e.RowIndex].Value;
        ods_MarriageVolume.Delete();
    }
    protected void GridView_MarriageVolume_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Multiview_Marriage_Volume.SetActiveView(view2_Formview_MarriageVolume);
        FormView_MarriageVolume.PageIndex = e.NewEditIndex;
        FormView_MarriageVolume.DefaultMode = FormViewMode.Edit;
        e.NewEditIndex = -1;
    }
    protected void FormView_MarriageVolume_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_MarriageVolume_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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
    protected void ods_MarriageVolume_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
}