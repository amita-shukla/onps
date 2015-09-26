using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class VoterHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["VoterId"] != null)
        {
            //find voter's status
            string status = databaseOperations.checkStatus(Session["VoterId"].ToString());
            if (status.Equals("approved"))
            {
                ApprovedStatusPanel.Visible = true;
                approvedStatusLbl.Text = "Congratulations! your application has been approved!";

                //find voter's constituency
                string cons = databaseOperations.voterCons(Session["VoterId"].ToString());
                Session["constituency"] = cons;

                //find election date corresponding to voter's constiuency
                string eDate = databaseOperations.eDate(cons);
                DateTime elDate = Convert.ToDateTime(eDate);

                //compare elction date to today's date
                DateTime curDate = DateTime.Today.Date;
                if (elDate.CompareTo(curDate) == 0)
                {
                    msgLbl.Text = "Election is today. Cast your vote now!";
                    voteBtn.Visible = true;
                }
                else if (elDate.CompareTo(curDate) > 0)
                {
                    msgLbl.Text = "election on " + eDate + " in your constituency. Do not forget to cast your vote!";
                    BeforeElectionPanel.Visible = true;
                }
                else if (elDate.CompareTo(curDate) < 0)
                {
                    msgLbl.Text = "elections are over..";
                    AfterElectionPanel.Visible = true;
                }

            }
            else
            {
                PendingStatusPanel.Visible = true;
                pendingStatusLbl.Text = "Your application status is pending";
            }
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }

        
        
    }
    
    protected void KnowMoreBtn_Click1(object sender, EventArgs e)
    {
        string candId = ((Button)sender).CommandArgument;
        Response.Redirect("~/KnowMore.aspx?candId="+candId);

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AskQuestion.aspx");
    }

    protected void voteBtn_Click(object sender, EventArgs e)
    {
        string voterId = Session["VoterID"].ToString();
       
        if(databaseOperations.hasVoted(voterId))
        {
            VoteMsg.Text = "You have already casted your vote!!";
        }
        else{
             Response.Redirect("~/VoteNow.aspx");
        }
        
    }
    protected void LogoutBtn_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/Login.aspx");
    }
}