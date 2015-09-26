using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SetElection : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminUsername"] == null)
            Response.Redirect("~/Login.aspx");
    }
    protected void SetElectionBtn_Click(object sender, EventArgs e)
    {
        string cons = ElConsTxtBox.Text;
        string date = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
       // testLbl.Text = date;
        int g = databaseOperations.setElection(date,cons);
        if (g != 0)
        {
            msgLbl.Text = "Election set on " + date + " for the constituency " + cons;
            ElConsTxtBox.Text = " ";
        }
    }
}