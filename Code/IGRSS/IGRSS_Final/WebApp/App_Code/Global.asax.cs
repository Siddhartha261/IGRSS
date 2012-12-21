

using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Specialized;
using System.Collections;
using System.Reflection;
using System.Collections.Generic;
using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;
using System.Globalization;
using System.Xml;
using IGRSS.BusinessObjects;
using System.Diagnostics;
using System.Threading;

/// <summary>
/// Summary description for Global
/// </summary>
public class Global : HttpApplication
{
    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        RJS.Web.WebControl.PopCalendar.JavaScriptCustomPath = "~/App_Scripts/PopCalendar";

        IgrssCommon.SetConnectionString("IGRSS_FINALConnectionString", ConfigurationManager.ConnectionStrings["IGRSS_FINALConnectionString"].ConnectionString);
        IgrssCommon.SetConnectionString("IGRSS_DEVConnectionString", ConfigurationManager.ConnectionStrings["WorkflowConnection"].ConnectionString);
        MembershipCreateStatus CreateUser = new MembershipCreateStatus();
        Membership.CreateUser("admin", "admin", "admin@dmin.com", "admin", "admin", true, out CreateUser);

        ProfileCommon UserProfile = (ProfileCommon)ProfileCommon.Create("admin");
        XmlDocument xmlDoc = new XmlDocument();
        string XmlFilePath = "~/XMLFile.xml";
        xmlDoc.Load(Server.MapPath(XmlFilePath));
        UserProfile.Permissions.MenuItems = xmlDoc.OuterXml;
        UserProfile.Save();
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs
      //  Exception ex = Server.GetLastError();
       // ExceptionPolicy.HandleException(ex, "Global");
     //   string eventLogName = ConfigurationManager.AppSettings["ErrorLogName"];
        //if (!EventLog.SourceExists(eventLogName))
        //{
        //    EventLog.CreateEventSource(eventLogName, eventLogName);
        //}
        //EventLog Log = new EventLog();
        //Log.Source = eventLogName;
        //Log.WriteEntry(ex.ToString(), EventLogEntryType.Error);
        //if (ConfigurationManager.AppSettings["HideErrors"] == "true")
        //{
        //    Server.Transfer("~/ErrorPage.aspx");
        //}
    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

    protected void Application_BeginRequest(object sender, EventArgs e)
    {
    }

    public static void SetFormViewParameters(IOrderedDictionary parameters, object instance)
    {
        Type ObjType = instance.GetType();
        foreach (DictionaryEntry parameter in parameters)
        {
            PropertyInfo property = ObjType.GetProperty(parameter.Key.ToString());
            if (property != null)
            {
                Type t = property.PropertyType;
                object value = null;
                     switch (t.Name)
                {
                    case "Decimal":
                        if (!string.IsNullOrEmpty(parameter.Value.ToString()))
                            value = Convert.ToDecimal(parameter.Value);
                        else
                            value = Convert.ToDecimal(0.0);
                        break;
                    case "Boolean":
                        value = Convert.ToBoolean(parameter.Value);
                        break;
                    case "DateTime":
                        String DateTimeFormat = "dd/MM/yyyy";
                        DateTimeFormatInfo info = new DateTimeFormatInfo();
                        info.ShortDatePattern = DateTimeFormat;
                        String date = Convert.ToString(parameter.Value);
                        if (!String.IsNullOrEmpty(date) || date == "null")
                            value = Convert.ToDateTime(date,info);
                        break;
                    case "Double":
                        if (!string.IsNullOrEmpty(parameter.Value.ToString()))
                            value = Convert.ToDouble(parameter.Value);
                        else
                            value = 0.0;
                        break;
                    case "Int32":
                        value = Convert.ToInt32(parameter.Value);
                        break;
                    case "Single":
                        value = Convert.ToSingle(parameter.Value);
                        break;
                    case "String":
                        value = Convert.ToString(parameter.Value);
                        break;
                    case "Guid":
                        if (!string.IsNullOrEmpty(parameter.Value.ToString()))
                            value = new Guid("11111111111111111111111111111111");
                        break;
                    default:
                        break;
                }

                property.SetValue(instance, value, null);

            }
        }
        parameters.Clear();
        parameters.Add("Values", instance);
    }

}
