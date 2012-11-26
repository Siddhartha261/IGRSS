using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Inward_Outward_OutwardRegisterNew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        mvOutwardRegister.SetActiveView(mvOutwardRegister.Views[1]);
        FvOutward.ChangeMode(FormViewMode.Insert);
    }
    protected void FvOutward_ItemCommand(object sender, FormViewCommandEventArgs e)
    {

    }
    protected void FvOutward_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {

    }
    protected void FvOutward_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {

    }
    protected void odsgv_Updating(object sender, ObjectDataSourceMethodEventArgs e)
    {

    }
    protected void odsgv_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {

    }
   

    void bindData()
    {
        DataTable table = new DataTable();
        table.Columns.Add("Name", typeof(string));
        table.Columns.Add("Address", typeof(string));
        table.Columns.Add("PriceOrStampValue", typeof(string));
        

        table.Rows.Add("Name1", "Address1", "100");
        table.Rows.Add("Name2", "Address1", "200");
        table.Rows.Add("Name3", "Address1", "300");
        table.Rows.Add("Name4", "Address1", "400");
        table.Rows.Add("Name5", "Address1", "500");

        GridView GridView1 = FvOutward.FindControl("GridView1") as GridView;
        GridView1.DataSource = table;
        GridView1.DataBind();

    }
    protected void FvOutward_Load(object sender, EventArgs e)
    {
        bindData();
    }
}