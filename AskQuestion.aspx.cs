using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AskQuestion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["VoterID"] == null)
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void PostQuesBtn_Click(object sender, EventArgs e)
    {
        string question = QuesTxtBox.Text;
        int g=0;
        foreach (GridViewRow gr in GridView1.Rows)
        {
                CheckBox rb = (CheckBox)gr.Cells[0].Controls[1];
                object ob = GridView1.DataKeys[gr.RowIndex].Value;
                string candId = ob.ToString();
                if (rb.Checked)
                {
                    g = databaseOperations.askQuestion(question, candId);
                }
        }

        if (g != 0)
        {
            MsgLbl.Text = "Your Question has been successfully posted";
            QuesTxtBox.Text = " ";
            
            
        }
        /*
        foreach (ListItem x in CandList.Items)
        {
            if (x.Selected)
               g=databaseOperations.askQuestion(question, x.Value);
        }
        
         */       
    }
         
}