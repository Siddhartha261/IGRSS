﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Central_Administration_Console_Masters_ReligionMaster : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_new_Click(object sender, EventArgs e)
    {
        Multiview_ReligionMaster.SetActiveView(Multiview_ReligionMaster.Views[1]);
        FormView_ReligionMaster.ChangeMode(FormViewMode.Insert);
    }
   
}