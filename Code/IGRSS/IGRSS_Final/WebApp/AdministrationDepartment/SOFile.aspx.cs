﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LatestPages_SOFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearchAppNo_Click(object sender, EventArgs e)
    {

    }
    protected void txtFileNo_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_SOFile.SetActiveView(Formview);
        FormView_SOFile.ChangeMode(FormViewMode.Insert);
    }

    protected void ods_SOFile_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_SOFile.SelectMethod = "GetDataBy";
        
    }
    protected void FormView_SOFile_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        { 
            case "Back":
                Multiview_SOFile.SetActiveView(GridView);
                GridView.DataBind();
                break;
        }
    }
    protected void FormView_SOFile_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDownList1 = FormView_SOFile.FindControl("DropDownList1") as DropDownList;
        e.Values["Department"] = DropDownList1.SelectedValue;
    }

    
}