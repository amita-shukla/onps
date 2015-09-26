using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class ApproveApplicants : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminUsername"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        loginStatusLbl.Text = "Welcome " + Session["adminUsername"].ToString();

        int requests = databaseOperations.pendingRequests();
        PendingRequestLbl.Text = "Number of Pending requests: " + requests;
    }

    protected void acceptBtn_Click(object sender, EventArgs e)
    {
        foreach(GridViewRow row in GridView1.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("CheckBox1");
            if (chk.Checked)
            {
                string rowVoterID =GridView1.DataKeys[row.RowIndex].Value.ToString();
                SqlDataSource1.UpdateParameters["voterid"].DefaultValue = rowVoterID;
                SqlDataSource1.UpdateParameters["status"].DefaultValue = "approved";
                SqlDataSource1.Update();
            }
        }
        int requests = databaseOperations.pendingRequests();
        PendingRequestLbl.Text = "Number of Pending requests: " + requests;
    }

    protected void rejectBtn_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("CheckBox1");
            if (chk.Checked)
            {
                string rowVoterID = GridView1.DataKeys[row.RowIndex].Value.ToString();
                SqlDataSource1.UpdateParameters["voterid"].DefaultValue = rowVoterID;
                SqlDataSource1.UpdateParameters["status"].DefaultValue = "rejected";
                SqlDataSource1.Update();
            }

        }
        int requests = databaseOperations.pendingRequests();
        PendingRequestLbl.Text = "Number of Pending requests: " + requests;
    }
}