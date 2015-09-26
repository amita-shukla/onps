using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class CandidateRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void AddPromiseBtn_Click(object sender, EventArgs e)
    {
        string promise = promiseTxtBox.Text;
        PromiseList.Items.Add(promise);
    }
    protected void RegisterBtn_Click(object sender, EventArgs e)
    {
        if (partyListValidator.IsValid)
        {
            string name = nameTxtBox.Text;
            string dob = dobTxtBox.Text;
            string sex = sexRdBtnLst.SelectedItem.Text;
            string cons = ConsList.SelectedValue;
            int partyId = int.Parse(partyList.SelectedItem.Value);
            string email = emailTxtBox.Text;
            string promises = "";
            foreach (ListItem li in PromiseList.Items)
            {
                promises = promises + "," + li.Text;
            }

            string photoPath = null;
            if (FileUpload1.HasFile)
            {
                string ex = Path.GetExtension(FileUpload1.FileName);
                string fnwe = Path.GetFileNameWithoutExtension(FileUpload1.FileName);
                string guid = Guid.NewGuid().ToString();
                string acfn = fnwe + "_" + guid + ex;
                if (ex == ".jpg" || ex == ".jpeg" || ex == ".png" || ex == ".gif")
                {
                    photoPath = "~/candidatePhoto/" + acfn;
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
            string candidateId = keyGenerator.GetUniqueId(7);
            string password = keyGenerator.GetPassword(7);

            int g = databaseOperations.registerCandidate(name, dob, sex, partyId, email, promises, candidateId, password, photoPath, cons);

            if (g != 0)
            {
                FileUpload1.SaveAs(Server.MapPath(photoPath));
                uploadMsg.Text = "File uploaded";
                Panel1.Enabled = false;

                successfulRegMsg.Text = "Your details have been sent for verification... A mail containing your candidate id and password will be sent to you after verification.";


            }
        }
    }

    protected void partyListValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string cons = ConsList.SelectedValue;
        int partyId = int.Parse(partyList.SelectedItem.Value);
        if (databaseOperations.validateVacancy(cons, partyId)==false)
        {
            args.IsValid = false;
        }
    }
}