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



public partial class Purchase_VendorMaster : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

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
}
