using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Establishment_Department_TransferApplicationRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void FormView_TransferAppl_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        ListBox ListBox_Designation = FormView_TransferAppl.FindControl("ListBox_Designation") as ListBox;
        e.Values["Details_Of_Designation"] = ListBox_Designation.SelectedValue;

        DropDownList DropDown_EmployeeName = FormView_TransferAppl.FindControl("DropDownList_EmployeeName") as DropDownList;
        e.Values["Employee_Name"] = DropDown_EmployeeName.SelectedValue;

        DropDownList DropDown_CurrentPlace = FormView_TransferAppl.FindControl("DropDownList_CurrentPlace") as DropDownList;
        e.Values["Current_Place"] = DropDown_CurrentPlace.SelectedValue;

        DropDownList DropDown_ResidenceDistrict = FormView_TransferAppl.FindControl("DropDownList_ResidenceDistrict") as DropDownList;
        e.Values["Residence_District"] = DropDown_ResidenceDistrict.SelectedValue;

        DropDownList DropDown_Place_Of_Request = FormView_TransferAppl.FindControl("DropDownList_Place_Of_Request") as DropDownList;
        e.Values["Place_Of_Request"] = DropDown_Place_Of_Request.SelectedValue;
    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_TransferAppl.SetActiveView(Multiview_TransferAppl.Views[1]);
        FormView_TransferAppl.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_TransferAppl_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_TransferAppl.SetActiveView(ViewGrid);
                GridView_TransferAppl.DataBind();
                break;
        }
    }
    protected void ods_TransferAppl_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtFileNo.Text.Trim();
        ods_TransferAppl.SelectMethod = "GetDataBy";
    }
}