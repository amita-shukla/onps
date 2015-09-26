using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["VoterId"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }
    protected void ChangePassBtn_Click(object sender, EventArgs e)
    {
        string oldPass = OldPassTxtBox.Text;
        string newPass = NewPassTxtBox.Text;
        if (oldPass == Session["Password"])
        {
            int g = databaseOperations.changeVoterPassword(newPass, Session["VoterId"].ToString());
            if (g != 0)
                MsgLbl.Text = "Password Changed";
            else
                MsgLbl.Text = "Error while changing Password.";
        }
        else
        {
            MsgLbl.Text = "Old Password entered incorrectly, Try Again";
        }
        OldPassTxtBox.Text = " ";
        NewPassTxtBox.Text = " ";
    }
}