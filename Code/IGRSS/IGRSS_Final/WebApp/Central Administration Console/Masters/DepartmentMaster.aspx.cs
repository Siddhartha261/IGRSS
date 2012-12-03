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

public partial class Central_Administration_Console_DepartmentMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
       
        //((IGRSS_Default)this.Master).HideStatusMessage();
	}
	protected void GvDepartmentMaster_SelectedIndexChanged(object sender, EventArgs e)
	{
		MvDepartmentMaster.SetActiveView(MvDepartmentMaster.Views[1]);
		fvDepartmentMaster.ChangeMode(FormViewMode.Edit);
	}

	protected void fvDepartmentMaster_ItemUpdating(object sender, FormViewUpdateEventArgs e)
	{
		Global.SetFormViewParameters(e.NewValues, Employee.GetDepartmentMasterRow());
	}
	protected void odsDepartmentMasterById_Updating(object sender, ObjectDataSourceMethodEventArgs e)
	{
		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");


	}
    protected void btnNew_Click(object sender, EventArgs e)
    {
        ((IGRSS_Default)this.Master).HideStatusMessage();
        MvDepartmentMaster.SetActiveView(MvDepartmentMaster.Views[1]);
        fvDepartmentMaster.ChangeMode(FormViewMode.Insert);
        ((TextBox)fvDepartmentMaster.FindControl("txtDescriptionIns")).Text = "";
        ((TextBox)fvDepartmentMaster.FindControl("txtNameIns")).Text = "";

    }
    protected void odsDepartmentMasterById_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MvDepartmentMaster.SetActiveView(MvDepartmentMaster.Views[0]);
        GvDepartmentMaster.DataBind();
        //if (e.Exception == null)
        //{
        //    if (Equals(e.ReturnValue, true))
        //        ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
        //    else
        //        ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, "Record already Exists!", MessageType.Error);

        //}
        //else
        //{
        //    ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        //}
    }
    protected void odsDepartmentMasterById_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MvDepartmentMaster.SetActiveView(MvDepartmentMaster.Views[0]);
        GvDepartmentMaster.DataBind();
        //if (e.Exception == null)
        //{
        //    if (Equals(e.ReturnValue, true))
        //        ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
        //    else
        //        ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, "Record already Exists!", MessageType.Error);

        //}
        //else
        //{
        //    ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
        //}
    }
    protected void btnCancelIns_Click(object sender, EventArgs e)
    {
        MvDepartmentMaster.SetActiveView(MvDepartmentMaster.Views[0]);
        GvDepartmentMaster.DataBind();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        MvDepartmentMaster.SetActiveView(MvDepartmentMaster.Views[0]);
        GvDepartmentMaster.DataBind();
    }
}
