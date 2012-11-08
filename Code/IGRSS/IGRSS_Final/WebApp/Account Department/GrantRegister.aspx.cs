using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Account_Department_GrantRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_GrantRegister.SetActiveView(view2_Formview);
        FormView_GrantRegister.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_GrantRegister_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDownList1 = FormView_GrantRegister.FindControl("DropDownListBillNo") as DropDownList;
        e.Values["BillNo"] = DropDownList1.SelectedValue;
    }
    protected void FormView_GrantRegister_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case"Back":
                Multiview_GrantRegister.SetActiveView(view1_GridView);
                view1_GridView.DataBind();
                break;
        }
    }
    protected void ods_GrantRegister_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_GrantRegister.SelectMethod = "GetDataBy";
    }
}