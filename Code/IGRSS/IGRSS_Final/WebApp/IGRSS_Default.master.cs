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
using System.Xml.Serialization;
using System.IO;
using IGRSS.BusinessObjects;
using IGRSS.BusinessLogicLayer;
using System.Collections.Generic;
using System.Drawing;
using System.Xml;

public partial class IGRSS_Default : System.Web.UI.MasterPage
{
	private string m_CurrentForm;
	public string CurrentForm
	{
		get
		{
			return m_CurrentForm;
		}
		set
		{
			m_CurrentForm = value;
		}
	}

	private bool m_Mode;
	public bool Mode
	{
		get
		{
			return m_Mode;
		}
		set
		{
			m_Mode = value;
		}
	}

    //private string m_ErrorMessage;
    //public string ErrorMessage
    //{
    //    get
    //    {
    //        return m_ErrorMessage;
    //    }
    //    set
    //    {

    //        m_ErrorMessage = value;
    //    }
    //}
	
    protected void Page_Load(object sender, EventArgs e)
    {
        //XmlDocument doc = new XmlDocument();
        //doc.LoadXml(Profile.Permissions.MenuItems);
        //string filter = "/";
        //XmlNodeList lst =  doc.SelectNodes(filter);

        masterBody.Attributes.Add("onload", "setContentHeight('" + IgrssMainMenu.ClientID + "', '" + imgLogo.ClientID + "')");
        
        MenuSource.Data = Profile.Permissions.MenuItems;
		MenuSource.DataBind();
		IgrssMainMenu.DataBind();
	}

	protected void Button1_Click(object sender, EventArgs e)
	{
		FormView fv = ((FormView) Main.FindControl("FormView1"));
		fv.InsertItem(true);
	}

	protected void grdAlerts_SelectedIndexChanged(object sender, EventArgs e)
	{
		GridView gv = (GridView) sender;
		string alertId = "AlertId=" + gv.SelectedDataKey.Value.ToString();
		Response.Redirect(((string) ViewState["Url"]) + alertId);
	}

	protected void grdAlerts_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		ViewState["Url"] = e.CommandArgument + "&";
	}

    public void ShowStatusMessage(string shortMessage, string msgDetails, MessageType Mode)
    {
        //StatusInformation1.Message = shortMessage;
        //StatusInformation1.MessageDetails = msgDetails;
        //StatusInformation1.Mode = Mode;
        //StatusInformation1.ShowMessge();
    }

    public void HideStatusMessage()
    {
//        StatusInformation1.HideMessge();
    }
}
