using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VoteNow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["VoterId"] != null)
        {
            
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }



    protected void VoteBtn_Click(object sender, EventArgs e)
    {
        
        int totalVotes;
        foreach (GridViewRow gr in GridView1.Rows)
        {
            RadioButton rb = (RadioButton)gr.FindControl("rb");
            if (rb.Checked)
            {
                
                string candidateId = GridView1.DataKeys[gr.RowIndex].Value.ToString();
                //Get the total votes
                totalVotes=int.Parse(GridView1.DataKeys[gr.RowIndex].Values[1].ToString());
                totalVotes++;
                SqlDataSource1.UpdateParameters["candidateID"].DefaultValue = candidateId;
                SqlDataSource1.UpdateParameters["totalVotes"].DefaultValue = totalVotes.ToString();
                SqlDataSource1.Update();
               
            }
        }
        databaseOperations.markVoted(Session["VoterId"].ToString());
        Response.Redirect("VoterHome.aspx");
    }

   
}