using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Inward_Outward_OutwardRegister_Latest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_OutwardRegister.SetActiveView(Multiview_OutwardRegister.Views[1]);
        FormView_OutWardRegister.ChangeMode(FormViewMode.Insert);
    }

    protected void FormView_OutWardRegister_ItemInserting(object sender, FormViewInsertEventArgs e)
    {
        DropDownList Dropdown_CopyTo = FormView_OutWardRegister.FindControl("DropDownList_CopyTo") as DropDownList;
        e.Values["Copy_To"] = Dropdown_CopyTo.SelectedValue;

        ListBox ListBox_Office = FormView_OutWardRegister.FindControl("ListBox_Office_CopyTo") as ListBox;
        e.Values["Office_Copy_To"] = ListBox_Office.SelectedValue;
    }
    protected void DropDownList_CopyTo_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    private void BindGrid(int rowcount)
    {
        //ListBox ListBox_Office = FormView_OutWardRegister.FindControl("ListBox_Office_CopyTo") as ListBox;
        DataTable dt = new DataTable();
        DataRow dr;
        dt.Columns.Add(new DataColumn("Column1", typeof(String)));

        if (ViewState["CurrentData"] != null)
        {
            for (int i = 0; i < rowcount + 1; i++)
            {
                dt = (DataTable)ViewState["CurrentData"];
                 if (dt.Rows.Count > 0)
                 {
                     dr = dt.NewRow();
                     dr[0] = dt.Rows[0][0].ToString(); //Grabs the Data from the ViewState to retain its values on PostBacks

                 }               
            }
            dr = dt.NewRow();
            ListBox ListBox_Office = FormView_OutWardRegister.FindControl("ListBox_Office_CopyTo") as ListBox;
            dr[0] = ListBox_Office.SelectedItem.Text; // Add the selected ListBox items in the DataRow of DataTable in subsequent time
            dt.Rows.Add(dr);
        }

        else //Adds the First Row to the Grid for the first time
        {
            dr = dt.NewRow();
            ListBox ListBox_Office = FormView_OutWardRegister.FindControl("ListBox_Office_CopyTo") as ListBox;
            dr[0] = ListBox_Office.SelectedItem.Text; // Add the selected ListBox items in the DataRow of DataTable
            dt.Rows.Add(dr);
        }

        // Show the DataTable values in the GridView
        GridView GridView_CopyTo = FormView_OutWardRegister.FindControl("GridView_CopyTo") as GridView;
        if (ViewState["CurrentData"] != null)
        {
           
            GridView_CopyTo.DataSource = (DataTable)ViewState["CurrentData"];
            GridView_CopyTo.DataBind();
        }

        else
        {
            GridView_CopyTo.DataSource = dt;
            GridView_CopyTo.DataBind();

        }
        ViewState["CurrentData"] = dt;    
    }
    
    protected void Button_addcopytodetails_Click(object sender, EventArgs e)
    {
        if (ViewState["CurrentData"] != null)
        {
            DataTable dt = (DataTable)ViewState["CurrentData"];
            int count = dt.Rows.Count;
            BindGrid(count);
        }
        else
        {
            BindGrid(1);
        }
    }
}