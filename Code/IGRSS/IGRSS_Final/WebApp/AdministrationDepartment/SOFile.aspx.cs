using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;


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
        infoDiv.Visible = false;
        TextBox txt = (TextBox)FormView_SOFile.FindControl("CircularsTextBox");
        txt.Focus();
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
                infoDiv.Visible = false;
                break;
        }
    }
    protected void FormView_SOFile_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        TextBox txt1 = (TextBox)FormView_SOFile.FindControl("CircularsTextBox");
        TextBox txt2 = (TextBox)FormView_SOFile.FindControl("DateOfCircularsTextBox");
        TextBox txt3= (TextBox)FormView_SOFile.FindControl("CircularsTextBox");
        TextBox txt4 = (TextBox)FormView_SOFile.FindControl("SubjectTextBox");
        TextBox txt5 = (TextBox)FormView_SOFile.FindControl("PageNoTextBox");
        DateTime curr_date = DateTime.Now;

        if (txt1.Text=="")
        {
            e.Values["Circulars"] = 0;
        }
        if (txt2.Text == "")
        {
            e.Values["DateOfCirculars"] = curr_date;
        }
       
        if (txt4.Text == "")
        {
            e.Values["Subject"] = "";
        }
        if (txt5.Text == "")
        {
            e.Values["PageNo"] = 0;
        }
        DropDownList DropDownList1 = FormView_SOFile.FindControl("DropDownList1") as DropDownList;
        e.Values["Department"] = DropDownList1.SelectedValue;
    }

    private void ShowMessage(string message, bool isError)
    {
        lblMsg.Text = message;
        infoDiv.Visible = true;
    }
    protected void GridView_SOFile_RowDeleted(object sender, GridViewDeletedEventArgs e)
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
    protected void GridView_SOFile_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridView_SOFile.Rows[e.RowIndex].Visible = false;
        ViewState["deleteKey"] = GridView_SOFile.DataKeys[e.RowIndex].Value;
        ods_SOFile.Delete();
    }
    protected void GridView_SOFile_RowEditing(object sender, GridViewEditEventArgs e)
    {
        ////temp code
        //DropDownList DropDownList1 = (DropDownList)FormView_SOFile.FindControl("DropDownList1");
        //GridView gridview = (GridView)FormView_SOFile.FindControl("GridView_SOFile");
        //String str=gridview.Columns[2].ToString();
        //DropDownList1.SelectedValue = str;
        ////ends temp code

        //temp code
        //DropDownList DropDownList1 = (DropDownList)FormView_SOFile.FindControl("DropDownList1");
        //GridView gridview = (GridView)FormView_SOFile.FindControl("GridView_SOFile");
        //DropDownList1.SelectedValue=ods_SOFile.UpdateParameters["Department"].DefaultValue;   
        //ends temp code
        Multiview_SOFile.SetActiveView(Formview);
        FormView_SOFile.PageIndex = e.NewEditIndex;
        FormView_SOFile.ChangeMode(FormViewMode.Edit);
        e.NewEditIndex = -1;

    }
    protected void ods_SOFile_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
    {
        e.InputParameters["SrNo"] = ViewState["deleteKey"];
    }
    protected void FormView_SOFile_ItemInserted(object sender, FormViewInsertedEventArgs e)
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
    protected void FormView_SOFile_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.Exception == null)
        {
            ShowMessage("Record has been updated successfully", false);
        }
        else
        {
            ShowMessage("Unable to update record", true);
        }
        Multiview_SOFile.SetActiveView(GridView);
    }




    protected void FormView_SOFile_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        DropDownList DropDownList1 = FormView_SOFile.FindControl("DropDownList1") as DropDownList;
        e.NewValues["Department"] = DropDownList1.SelectedValue;
    }
}
    