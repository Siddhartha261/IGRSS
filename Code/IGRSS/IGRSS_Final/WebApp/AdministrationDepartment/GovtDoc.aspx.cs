using System;
using System.Collections.Generic;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GovtDoc : System.Web.UI.Page
{

    protected void Button_new_Click(object sender, EventArgs e)
    {
        mvgovtdoc.SetActiveView(viewFv);
        FvGovtDoc.ChangeMode(FormViewMode.Insert); ;
    }



    protected void FvGovtDoc_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                mvgovtdoc.SetActiveView(viewGrid);
                viewGrid.DataBind();
                break;
        }
    }

    protected void ObjectDataSource_govtdoc_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtSearch.Text.Trim();
        ObjectDataSource_govtdoc.SelectMethod = "GetData";
    }
    protected void FvGovtDoc_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDownListDepartment = FvGovtDoc.FindControl("DropDownListNameOfDepartment") as DropDownList;
        e.Values["NameOfDepartment"] = DropDownListDepartment.SelectedValue;
    }
    protected void ButtonSearch_Click(object sender, EventArgs e)
    {

    }
}