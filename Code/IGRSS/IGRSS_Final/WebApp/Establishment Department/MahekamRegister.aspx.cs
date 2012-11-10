using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Establishment_Department_MahekamRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_Mahekam.SetActiveView(Multiview_Mahekam.Views[1]);
        FormView_Mahekam.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_Mahekam_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        ListBox ListBox_Designation = FormView_Mahekam.FindControl("ListBox_Designation") as ListBox;
        e.Values["Details_Of_Designation"] = ListBox_Designation.SelectedValue;

        DropDownList DropDown_EmployeeName = FormView_Mahekam.FindControl("DropDownList_EmployeeName") as DropDownList;
        e.Values["Employee_Name"] = DropDown_EmployeeName.SelectedValue;

        DropDownList DropDown_Designation = FormView_Mahekam.FindControl("DropDownList_Designation") as DropDownList;
        e.Values["Designation"] = DropDown_Designation.SelectedValue;

        DropDownList DropDown_Grade = FormView_Mahekam.FindControl("DropDownList_Grade") as DropDownList;
        e.Values["Grade"] = DropDown_Grade.SelectedValue;

        DropDownList DropDown_CurrentOffice = FormView_Mahekam.FindControl("DropDownList_CurrentOffice") as DropDownList;
        e.Values["Current_Office"] = DropDown_CurrentOffice.SelectedValue;

        DropDownList DropDown_ResidenceDistrict = FormView_Mahekam.FindControl("DropDownList_ResidenceDistrict") as DropDownList;
        e.Values["Residence_District"] = DropDown_ResidenceDistrict.SelectedValue;


    }
    protected void FormView_Mahekam_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_Mahekam.SetActiveView(ViewGrid);
                GridView_Mahekam.DataBind();
                        
                break;
        }
    }
    protected void ods_Mahekam_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_Mahekam.SelectMethod = "GetDataBy";
   }
}