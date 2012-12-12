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

public partial class Central_Administration_Console_VendorMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{
        ((IGRSS_Default)this.Master).HideStatusMessage();
	}

	protected void OdsVendorMaster_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
	{

		FormViewParameter Parameters = new FormViewParameter();
		Parameters.Values = (DataRow) e.InputParameters["Values"];
		e.InputParameters["Parameter"] = Parameters;
		e.InputParameters.Remove("Values");
      
	}

	protected void FvvendorMaster_ItemInserting(object sender, FormViewInsertEventArgs e)
	{

		Global.SetFormViewParameters(e.Values, Purchase.GetVendorMasterRow());
	}
    protected void btnNew_Click(object sender, EventArgs e)
    {
        MvVendorMaster.SetActiveView(viewVendorMaster);
        FvvendorMaster.ChangeMode(FormViewMode.Insert);
       // //((TextBox)FvvendorMaster.FindControl("txtReceiptNumberIns")).Text = "";
       //((TextBox)FvvendorMaster.FindControl("txtAdjudicationTotalFeesIns")).Text = "";
       // ((TextBox)FvvendorMaster.FindControl("txtVendorNameIns")).Text = "";
       // ((TextBox)FvvendorMaster.FindControl("txtAddressIns")).Text = "";
       // ((TextBox)FvvendorMaster.FindControl("txtPhoneIns")).Text = "";
       // ((TextBox)FvvendorMaster.FindControl("txtContactPersonIns")).Text = "";
    }
    protected void GvDepartmentMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        MvVendorMaster.SetActiveView(MvVendorMaster.Views[1]);
        FvvendorMaster.ChangeMode(FormViewMode.Edit);
    }
    protected void OdsVendorMaster_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MvVendorMaster.SetActiveView(MvVendorMaster.Views[0]);
        GvDepartmentMaster.DataBind();
    }
    protected void OdsVendorMaster_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        MvVendorMaster.SetActiveView(MvVendorMaster.Views[0]);
        GvDepartmentMaster.DataBind();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        MvVendorMaster.SetActiveView(MvVendorMaster.Views[0]);
        GvDepartmentMaster.DataBind();
    }
    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        MvVendorMaster.SetActiveView(MvVendorMaster.Views[0]);
        GvDepartmentMaster.DataBind();
    }
}
