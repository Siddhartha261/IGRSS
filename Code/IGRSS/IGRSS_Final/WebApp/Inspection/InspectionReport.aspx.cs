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

public partial class Inspection_InspectionReport : IgrssPage
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}
	protected void Wizard2_FinishButtonClick(object sender, WizardNavigationEventArgs e)
	{
		FormView1.InsertItem(false);
	}
}
