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
using IGRSS.DataAccessLayer.ConfigTableAdapters;
using Resources;

public partial class Inward_Outward_OutwardRegister : IgrssPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            switch (Request.Params["Mode"])
            {
                case "DataEntry":
                    mvOutwardRegister.SetActiveView(mvOutwardRegister.Views[1]);
                    FvOutward.ChangeMode(FormViewMode.Insert);
                    break;
                case "Verify":
                    mvOutwardRegister.SetActiveView(mvOutwardRegister.Views[0]);
                    break;
             
            }
        }
        if (FvOutward.CurrentMode == FormViewMode.Insert)
        {
            //Creating Instance Of the IgrssGlobalConfigTableAdapter
            IgrssGlobalConfigTableAdapter ConfigAdapter = new IgrssGlobalConfigTableAdapter();
            //Calling Bll method and storing result into XmlDataSource
            XmlInwarddoctype.Data = (string)ConfigAdapter.GetConfigByModule("IOW", "IOWDOCTYPE");
            //Binding XmlDataSource
            XmlInwarddoctype.DataBind();
            //Calling Bll method and storing result into XmlDataSource
            XmlInwardtype.Data = (string)ConfigAdapter.GetConfigByModule("IOW", "IOWTYPE");
            //Binding XmlDataSource
            XmlInwardtype.DataBind();
        }
        if (FvOutward.CurrentMode == FormViewMode.Edit)
        {
            //Creating Instance Of the IgrssGlobalConfigTableAdapter
            IgrssGlobalConfigTableAdapter ConfigAdapter = new IgrssGlobalConfigTableAdapter();
            //Calling Bll method and storing result into XmlDataSource
            XmlInwarddoctype.Data = (string)ConfigAdapter.GetConfigByModule("IOW", "IOWDOCTYPE");
            //Binding XmlDataSource
            XmlInwarddoctype.DataBind();
            //Calling Bll method and storing result into XmlDataSource
            XmlInwardtype.Data = (string)ConfigAdapter.GetConfigByModule("IOW", "IOWTYPE");
            //Binding XmlDataSource
            XmlInwardtype.DataBind();
        }
    }

    protected void odsOutward_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        FormViewParameter Parameters = new FormViewParameter();
        Parameters.Values = (DataRow)e.InputParameters["Values"];
        e.InputParameters["Parameter"] = Parameters;
        e.InputParameters.Remove("Values");
    }
    protected void gvOutWardDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        mvOutwardRegister.SetActiveView(mvOutwardRegister.Views[1]);
        FvOutward.ChangeMode(FormViewMode.Edit);
    }

    protected void FvOutward_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        gvOutWardDetails.DataBind();
        mvOutwardRegister.SetActiveView(vieGrid);
    }
    protected void FvOutward_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        Global.SetFormViewParameters(e.NewValues, new IGRSS.DataAccessLayer.Outward.OutwardRegisterDataTable().NewOutwardRegisterRow());
    }
    //protected void odsOutward_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    //{
    //    FormViewParameter Parameters = new FormViewParameter();
    //    Parameters.Values = (DataRow)e.InputParameters["Values"];
    //    e.InputParameters["Parameter"] = Parameters;
    //    e.InputParameters.Remove("Values");
    //}
    //protected void odsOutward_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    //{
    //    if (e.Exception == null)
    //    {
    //        if (Equals(e.ReturnValue, true))
    //            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveSucess, Status_Messages.SaveSucessDescription, MessageType.Success);
    //        else
    //            ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, "Record already Exists!", MessageType.Error);

    //    }
    //    else
    //    {
    //        ((IGRSS_Default)this.Master).ShowStatusMessage(Status_Messages.SaveFailed, e.Exception.Message, MessageType.Error);
    //    }
    //}
   
 
    protected void Button_new_Click(object sender, EventArgs e)
    {
        mvOutwardRegister.SetActiveView(mvOutwardRegister.Views[1]);
        FvOutward.ChangeMode(FormViewMode.Insert);
    }
    protected void FvOutward_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        { 
            case "Back":
                mvOutwardRegister.SetActiveView(vieGrid);
                break;
            case "UpdateData":

                break;
        }
    }


    protected void gvOutWardDetails_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        { 
            case "Modify":
                mvOutwardRegister.SetActiveView(viewOutwardRegister);
                FvOutward.ChangeMode(FormViewMode.Edit);
                FvOutward.PageIndex = Convert.ToInt32(e.CommandArgument);
                break;
        }
    }
    protected void gvOutWardDetails_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton linkbuttonEdit = e.Row.FindControl("linkbuttonEdit") as LinkButton;
            if (linkbuttonEdit != null)
            {
                linkbuttonEdit.CommandArgument = Convert.ToString(e.Row.RowIndex);
            }
        }
    }
    protected void btnSearchAppNo_Click(object sender, EventArgs e)
    {
        odsgv.Select();
    }

    protected void odsgv_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {

    }
    protected void FvOutward_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        gvOutWardDetails.DataBind();
    }
    protected void odsgv_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        odsgv.SelectMethod = "GetDataBy1";
    }
}
