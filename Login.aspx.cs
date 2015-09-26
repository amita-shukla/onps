using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

   

    protected void LoginBtn_Click(object sender, EventArgs e)
    {
        string username = IDTxtBox.Text;
        string password = PassTxtBox.Text;
        foreach (ListItem userType in UserTypeList.Items)
        {
            if (userType.Selected)
            {
                if (userType.Text.Equals("Voter"))
                { 
                    if (databaseOperations.authenticateVoter(username, password))
                    {
                        Session["VoterID"] = username;
                        Session["Password"] = password;
                        Response.Redirect("~/VoterHome.aspx");
                    }
                    else
                    {
                        ErrMsg.Text = "Your Login Attempt was unsuccessful. Please Try again";
                    }
                }
                else if(userType.Text.Equals("Candidate"))
                {
                    
                    if (databaseOperations.authenticateCandidate(username, password))
                    {
                        Session["CandidateId"] = username;
                        Session["CandPass"] = password;
                        Response.Redirect("~/CandHome.aspx");
                    }
                    else
                    {
                        ErrMsg.Text = "Your Login Attempt was unsuccessful. Please Try again";
                    }   
                }
                else
                {
                    if (databaseOperations.authenticateAdmin(username, password))
                    {
                        //Create a session here
                        Session["adminUsername"] = username;
                        Response.Redirect("~/AdminPanel.aspx");
                    }
                    else
                    {
                        ErrMsg.Text = "Your Login Attempt was unsuccessful. Please Try again";
                    }
                }
            }
        }
        
    }

   
}