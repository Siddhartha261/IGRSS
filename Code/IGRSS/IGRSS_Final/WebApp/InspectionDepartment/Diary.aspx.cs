using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class InspectionDepartment_Diary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_Diary.SetActiveView(Multiview_Diary.Views[1]);
        FormView_Diary.ChangeMode(FormViewMode.Insert);
    }
    protected void FormView_Diary_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList DropDown_DaysDuringMonth = FormView_Diary.FindControl("DropDownList_DaysDuringMonth") as DropDownList;
        e.Values["Daysduringmonth"] =Convert.ToInt32(DropDown_DaysDuringMonth.SelectedValue);
        ListBox ListBox_office = FormView_Diary.FindControl("ListBox_officename") as ListBox;
        int[] selectedIndices = ListBox_office.GetSelectedIndices();
        e.Values["NoOfOfficeinspected"] = selectedIndices.Length;
        ViewState["SelectedItems"] = selectedIndices;
    }
    protected void FormView_Diary_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {

    }
    protected void ods_Diary_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
    {
        try
        {
            int[] selectedIndices = ViewState["SelectedItems"] as int[];
            ListBox ListBox_office = FormView_Diary.FindControl("ListBox_officename") as ListBox;

            foreach (int selectedIndex in selectedIndices)
            {
                ods_DiaryOfficeDetails.InsertParameters["DiaryID"].DefaultValue = e.ReturnValue.ToString();
                ods_DiaryOfficeDetails.InsertParameters["OfficeID"].DefaultValue = ListBox_office.Items[selectedIndex].Value;
                ods_DiaryOfficeDetails.Insert();
            }
        }
        finally
        {
            ViewState["SelectedItems"] = null;
        }
        
    }
}