using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Management;
using System.Web;

namespace IGRSS.Management
{
	public class SampleEvent : WebAuditEvent
	{
		private string userID;
		private string authType;
		private bool isAuthenticated;

		public SampleEvent(string msg, object eventSource, int eventCode)
			: base(msg, eventSource, eventCode)
		{
			// Obtain the HTTP Context and store authentication details
			userID = HttpContext.Current.User.Identity.Name;
			authType = HttpContext.Current.User.Identity.AuthenticationType;
			isAuthenticated = HttpContext.Current.User.Identity.IsAuthenticated;
		}

		public SampleEvent(string msg, object eventSource, int eventCode,
							   int eventDetailCode)
			: base(msg, eventSource, eventCode, eventDetailCode)
		{
			// Obtain the HTTP Context and store authentication details
			userID = HttpContext.Current.User.Identity.Name;
			authType = HttpContext.Current.User.Identity.AuthenticationType;
			isAuthenticated = HttpContext.Current.User.Identity.IsAuthenticated;
		}

		// Formats Web request event information.
		// This method is invoked indirectly by the provider using one of the
		// overloaded ToString methods. If buffering is enabled, this method is
		// called asynchronously on a non-Web request thread, where the 
		// HttpContext is not available.
		public override void FormatCustomEventDetails(WebEventFormatter formatter)
		{
			base.FormatCustomEventDetails(formatter);
			formatter.AppendLine(">>User ID: " + userID);
			formatter.AppendLine(">>Authentication Type: " + authType);
			formatter.AppendLine(">>User Authenticated: " +
								  isAuthenticated.ToString());
			formatter.AppendLine(">>Activity Description: Critical Operation");
		}

	}
}