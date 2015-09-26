using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ApproveCandiates : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminUsername"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
        loginStatusLbl.Text = "Welcome " + Session["adminUsername"].ToString();

        int requests = databaseOperations.pendingCandidateRequests();
        PendingRequestLbl.Text = "Number of Pending requests: " + requests;
    }

    protected void AcceptBtn_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("CheckBox1");
            if (chk.Checked)
            {
                string rowCandidateID = GridView1.DataKeys[row.RowIndex].Value.ToString();
                SqlDataSource1.UpdateParameters["candidateID"].DefaultValue = rowCandidateID;
                SqlDataSource1.UpdateParameters["status"].DefaultValue = "approved";
                SqlDataSource1.Update();
            }
        }
        int requests = databaseOperations.pendingCandidateRequests();
        PendingRequestLbl.Text = "Number of Pending requests: " + requests;
    }

    protected void RejectBtn_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("CheckBox1");
            if (chk.Checked)
            {
                string rowCandidateID = GridView1.DataKeys[row.RowIndex].Value.ToString();
                SqlDataSource1.UpdateParameters["candidateId"].DefaultValue = rowCandidateID;
                SqlDataSource1.UpdateParameters["status"].DefaultValue = "rejected";
                SqlDataSource1.Update();
            }

        }
        int requests = databaseOperations.pendingCandidateRequests();
        PendingRequestLbl.Text = "Number of Pending requests: " + requests;
    }

}