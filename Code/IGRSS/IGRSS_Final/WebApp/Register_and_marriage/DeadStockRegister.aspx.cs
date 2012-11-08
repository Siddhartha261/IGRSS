using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_DeadStockRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_DeadStock.SetActiveView(View2_Formview);
        FormView_DeadStock.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_DeadStock_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
             
                Multiview_DeadStock.SetActiveView(View1_GridView);
                View1_GridView.DataBind();
                break;
        }
    }
    protected void ods_DeadStock_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtSearch.Text.Trim();
        ods_DeadStock.SelectMethod = "GetDataBy";
    }

    protected void FormView_DeadStock_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
      
        RadioButtonList RadioButtonList1 = FormView_DeadStock.FindControl("RadioButtonList1") as RadioButtonList;
        e.Values["Authorityvoucher"] = RadioButtonList1.SelectedValue;
    } 
}