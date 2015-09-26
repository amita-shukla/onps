using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class PartyRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminUsername"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        loginStatusLbl.Text = "Welcome " + Session["adminUsername"].ToString();
    }
    protected void registerPartyBtn_Click(object sender, EventArgs e)
    {
        string pName = PNameTxtBox.Text;
        string photoPath = null;
        if (UploadSymb.HasFile)
        {
            string symbPath = Path.GetFileName(UploadSymb.FileName);
            string ex = Path.GetExtension(UploadSymb.FileName);
            
            if (ex == ".jpg" || ex == ".jpeg" || ex == ".png" || ex == ".gif")
            {
                photoPath = "~/partySymbol/" + symbPath;
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

        int g=databaseOperations.registerParty(pName,photoPath);
        if (g != 0)
        {
            UploadSymb.SaveAs(Server.MapPath(photoPath));
            PNameTxtBox.Text = " ";

           // uploadMsg.Text = "File uploaded";
           // Panel1.Enabled = false;
        }
    }
    
}