﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminPanel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminUserName"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        loginStatusLbl.Text = "Welcome " + Session["adminUsername"].ToString();
    }
    protected void LogoutBtn_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
}