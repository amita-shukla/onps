using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Web.Configuration;


public partial class VoterRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SubmitBtn_Click(object sender, EventArgs e)
    {
        string name = nameTxtBox.Text;
        string dob = dobTxtBox.Text;
        string fname = fnameTxtBox.Text;
        string address = addressTxtBox.Text;
        string pob = consList.SelectedValue;
       // string pob = pobTxtBox.Text;
        string email = emailTxtBox.Text;
        string phno = phnoTxtBox.Text;
        string sex = sex = sexRadBtnList.SelectedItem.Text;
        string photoPath=null;
         
        if (FileUpload1.HasFile)
        {
            string ex = Path.GetExtension(FileUpload1.FileName);
            string fnwe = Path.GetFileNameWithoutExtension(FileUpload1.FileName);
            string guid = Guid.NewGuid().ToString();
            string acfn = fnwe + "_" + guid + ex;
            if (ex == ".jpg" || ex == ".jpeg" || ex == ".png" || ex==".gif")
            {
                photoPath = "~/voterPhoto/" + acfn;
            }
            else
            {
                uploadMsg.Text = "Please select file of extention .jpg, .jpeg, .png, .gif only";
            }
        }
        else
        {
            uploadMsg.Text = "Please Select File";
        }

        string voterId = keyGenerator.GetUniqueId(10);
        string password = keyGenerator.GetPassword(7);

        int g=databaseOperations.RegisterVoter(name,dob,sex,fname,pob,address,email,phno,photoPath,voterId,password);
        if (g != 0)
        {
            FileUpload1.SaveAs(Server.MapPath(photoPath));
            uploadMsg.Text = "File uploaded";
            Panel1.Enabled = false;
            VoterIdLbl.Text = "Your Voter Id is: "+voterId;
            PasswordLbl.Text = "Your Password is: "+password;
            SuccessfulRegMsg.Text = "Your details have been sent for verification... Keep a note of VoterId and Password";

            //Response.Redirect("~/SuccessfulVoterRegistration.aspx");
        }
    }


    
}