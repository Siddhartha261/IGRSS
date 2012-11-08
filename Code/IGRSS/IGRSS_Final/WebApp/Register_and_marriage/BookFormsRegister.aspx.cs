using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_and_marriage_BookFormsRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_BookFormsRegister.SetActiveView(view2_Formview);
        FormView_BookFormRegister.ChangeMode(FormViewMode.Insert);

    }

    protected void FormView_BookForm_ItemInserting(object sender, FormViewInsertEventArgs e)
    {


        DropDownList DropDownList1 = FormView_BookFormRegister.FindControl("DropDownListDepartment") as DropDownList;
        e.Values["Dept_name"] = DropDownList1.SelectedValue;
    }
    protected void FormView_BookForm_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_BookFormsRegister.SetActiveView(view1_GridView);
                view1_GridView.DataBind();
                break;
                
        }

    }
    protected void ods_BookformRegister_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_BookFormRegister.SelectMethod = "GetDataBy";
    }
}