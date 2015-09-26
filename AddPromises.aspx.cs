using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddPromises : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CandidateID"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    protected void AddPromise_Click(object sender, EventArgs e)
    {
        string candId = Session["CandidateId"].ToString();
        string promise = PromiseTxtBox.Text;
        int g=databaseOperations.addPromise(candId,promise);
        if (g != 0)
        {
            PromiseTxtBox.Text = " ";
        }
    }
}