using System;
using System.Data;
using System.Configuration;
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using IGRSS.BusinessLogicLayer;
using IGRSS.BusinessObjects;
using System.Collections.Generic;
using Resources;
public partial class Central_Administration_Console_DesignationMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        ((IGRSS_Default)this.Master).HideStatusMessage();
        
	}
	protected void GvDesignationGrid_SelectedIndexChanged(object sender, EventArgs e)
	{
		MvDesignationMaster.SetActiveView(MvDesignationMaster.Views[1]);
		FvDesignationMaster.ChangeMode(FormViewMode.Edit);
	}
	protected void FvDesignationMaster_ItemInserting(object sender, FormViewInsertEventArgs e)
	{

	}
	protected void OdsDesignationMasterById_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{

		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
        e.InputParameters["DesignationId"] = FvDesignationMaster.DataKey["DesignationId"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");

	}
	protected void FvDesignationMaster_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{
		Global.SetFormViewParameters(e.NewValues, Employee.GetDesignationRow());


	}
    protected void btnNew_Click(object sender, EventArgs e)
    {
        ((IGRSS_Default)this.Master).HideStatusMessage();
        MvDesignationMaster.SetActiveView(MvDesignationMaster.Views[1]);
        FvDesignationMaster.ChangeMode(FormViewMode.Insert);
        ((TextBox)FvDesignationMaster.FindControl("txtNameIns")).Text = "";
        ((TextBox)FvDesignationMaster.FindControl("txtDescriptionIns")).Text = "";
    }
    protected void FvDesignationMaster_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        MvDesignationMaster.SetActiveView(MvDesignationMaster.Views[0]);        
        GvDesignationGrid.SelectedIndex = -1;
        GvDesignationGrid.DataBind();
    }
    protected void FvDesignationMaster_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
       
    }
    protected void OdsDesignationMasterById_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MvDesignationMaster.SetActiveView(MvDesignationMaster.Views[0]);
        GvDesignationGrid.SelectedIndex = -1;
        GvDesignationGrid.DataBind();
        if (e.Exception == null)
        {
            if (Equals(e.ReturnValue, true))
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
            else
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, "Record already Exists!", MessageType.Error);

        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
    }
    protected void OdsDesignationMasterById_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MvDesignationMaster.SetActiveView(MvDesignationMaster.Views[0]);
        GvDesignationGrid.SelectedIndex = -1;
        GvDesignationGrid.DataBind();
        if (e.Exception == null)
        {
            if (Equals(e.ReturnValue, true))
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
            else
                ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, "Record already Exists!", MessageType.Error);

        }
        else
        {
            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        }
    }
    protected void GvDesignationGrid_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        ((IGRSS_Default)this.Master).HideStatusMessage();
    }
    protected void btnCancelIns_Click(object sender, EventArgs e)
    {
        MvDesignationMaster.SetActiveView(MvDesignationMaster.Views[0]);
        GvDesignationGrid.DataBind();
    }
    protected void btnCancelUpd_Click(object sender, EventArgs e)
    {
        MvDesignationMaster.SetActiveView(MvDesignationMaster.Views[0]);
        GvDesignationGrid.DataBind();
    }
}
