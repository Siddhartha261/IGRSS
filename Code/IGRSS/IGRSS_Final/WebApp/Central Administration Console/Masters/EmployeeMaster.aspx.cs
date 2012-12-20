using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Central_Administration_Console_Masters_EmployeeMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ObjectDataSource_history_card_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["searchKeyWord"] = txtSearch.Text.Trim();
        ObjectDataSource_history_card.SelectMethod = "GetDataBy";
    }
    protected void Fv_History_Card_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Back":
                Multiview_history_card.SetActiveView(view1_gridview);
                view1_gridview.DataBind();
                infoDiv.Visible = false;

                break;
        }
    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_history_card.SetActiveView(view2_Fv);
        Formview_History_Card.ChangeMode(FormViewMode.Insert);
        TextBox txt1 = (TextBox)Formview_History_Card.FindControl("Employee_NameTextBox");
        TextBox txt2 = (TextBox)Formview_History_Card.FindControl("Promtion_DateTextBox");
        TextBox txt3 = (TextBox)Formview_History_Card.FindControl("Actual_Date_of_Joining_DeptTextBox");
        TextBox txt4 = (TextBox)Formview_History_Card.FindControl("Preservice_training_Passing_DateTextBox");
        TextBox txt5 = (TextBox)Formview_History_Card.FindControl("Sub_Register_Exam_Pass_DateTextBox");
        TextBox txt6 = (TextBox)Formview_History_Card.FindControl("First_Hier_Grade_DateTextBox");
        TextBox txt7 = (TextBox)Formview_History_Card.FindControl("Date_To_DateTextBox");
        TextBox txt8 = (TextBox)Formview_History_Card.FindControl("Transfer_DateTextBox");
        TextBox txt9 = (TextBox)Formview_History_Card.FindControl("Extra_Currclar_ActivitiesTextBox");
        TextBox txt10 = (TextBox)Formview_History_Card.FindControl("Retire_DateTextBox");
        TextBox txt11 = (TextBox)Formview_History_Card.FindControl("Birth_DateTextBox");
        TextBox txt12 = (TextBox)Formview_History_Card.FindControl("Joining_DateTextBox");
        TextBox txt13 = (TextBox)Formview_History_Card.FindControl("Promotion_DesignTextBox");
        TextBox txt14 = (TextBox)Formview_History_Card.FindControl("Clerk_Dept_Exam_Pass_DateTextBox");
        TextBox txt15 = (TextBox)Formview_History_Card.FindControl("Upgrade_Promotion_DateTextBox");
        TextBox txt16 = (TextBox)Formview_History_Card.FindControl("Sec_Hier_Grade_DateTextBox");
        TextBox txt17 = (TextBox)Formview_History_Card.FindControl("Servc_Break_LeaveTextBox");
        TextBox txt18 = (TextBox)Formview_History_Card.FindControl("Extra_QualitiesTextBox");
        TextBox txt19 = (TextBox)Formview_History_Card.FindControl("Other_DetailsTextBox");
        TextBox txt20 = (TextBox)Formview_History_Card.FindControl("Employee_NameTextBox");
        txt1.Text = "";
        txt2.Text = "";
        txt3.Text = "";
        txt4.Text = "";
        txt5.Text = "";
        txt6.Text = "";
        txt7.Text = "";
        txt8.Text = "";
        txt9.Text = "";
        txt10.Text = "";
        txt11.Text = "";
        txt12.Text = "";
        txt13.Text = "";
        txt14.Text = "";
        txt15.Text = "";
        txt16.Text = "";
        txt17.Text = "";
        txt18.Text = "";
        txt19.Text = "";
        txt20.Text = "";
        txt1.Focus();
    }
    protected void Formview_History_Card_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDownList1 = Formview_History_Card.FindControl("DropDownListCaste") as DropDownList;
        e.Values["Caste"] = DropDownList1.SelectedValue;
        DropDownList DropDownList2 = Formview_History_Card.FindControl("DropDownListDesignation1") as DropDownList;
        e.Values["Join_as_Design"] = DropDownList2.SelectedValue;

        DropDownList DropDownList4 = Formview_History_Card.FindControl("DropDownListEduQualfn") as DropDownList;
        e.Values["Educn_Qualfn"] = DropDownList4.SelectedValue;
        DropDownList DropDownList5 = Formview_History_Card.FindControl("DropDownListCurrDesigwithOffice") as DropDownList;
        e.Values["Curr_Desig_with_office"] = DropDownList5.SelectedValue;
        DropDownList DropDownList6 = Formview_History_Card.FindControl("DropDownListCurrentDesign") as DropDownList;
        e.Values["Current_Desig"] = DropDownList6.SelectedValue;
        DropDownList DropDownList7 = Formview_History_Card.FindControl("DropDownListReligionMaster") as DropDownList;
        e.Values["Religion"] = DropDownList7.SelectedValue;

    }
    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }


    protected void GridView_History_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been deleted successfully", false);
        }
        else
        {
            ShowMessage("Unable to delete record", true);
        }
    }
    protected void GridView_History_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        GridView_History.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_History.DataKeys[e.RowIndex].Value;
        ObjectDataSource_history_card.Delete();
    }
    protected void GridView_History_RowEditing(object sender, GridViewEditEventArgs e)
    {
        infoDiv.Visible = false;
        Multiview_history_card.SetActiveView(view2_Fv);
        Formview_History_Card.PageIndex = e.NewEditIndex;
        Formview_History_Card.ChangeMode(FormViewMode.Edit);
        e.NewEditIndex = -1;
    }
    protected void Formview_History_Card_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been updated successfully", false);
        }
        else
        {
            ShowMessage("Unable to update record", true);
        }
        Multiview_history_card.SetActiveView(view1_gridview);
    }
    protected void Formview_History_Card_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been added successfully", false);
        }
        else
        {
            ShowMessage("Unable to add record", true);
        }
    }
    protected void ObjectDataSource_history_card_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
    protected void Formview_History_Card_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        DropDownList DropDownList1 = Formview_History_Card.FindControl("DropDownListCaste") as DropDownList;
        e.NewValues["Caste"] = DropDownList1.SelectedValue;
        DropDownList DropDownList2 = Formview_History_Card.FindControl("DropDownListDesignation1") as DropDownList;
        e.NewValues["Join_as_Design"] = DropDownList2.SelectedValue;

        DropDownList DropDownList4 = Formview_History_Card.FindControl("DropDownListEduQualfn") as DropDownList;
        e.NewValues["Educn_Qualfn"] = DropDownList4.SelectedValue;
        DropDownList DropDownList5 = Formview_History_Card.FindControl("DropDownListCurrDesigwithOffice") as DropDownList;
        e.NewValues["Curr_Desig_with_office"] = DropDownList5.SelectedValue;
        DropDownList DropDownList6 = Formview_History_Card.FindControl("DropDownListCurrentDesign") as DropDownList;
        e.NewValues["Current_Desig"] = DropDownList6.SelectedValue;
        DropDownList DropDownList7 = Formview_History_Card.FindControl("DropDownListReligionMaster") as DropDownList;
        e.NewValues["Religion"] = DropDownList7.SelectedValue;

    }
}