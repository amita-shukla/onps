using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ResultPanel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminUsername"] == null)
            Response.Redirect("~/Login.aspx");
        
    }
    protected void CalcResBtn_Click(object sender, EventArgs e)
    {
        foreach (ListItem con in ConsList.Items)
        {
            if (con.Selected)
            {
                DataTable dt = databaseOperations.findWinner(con.Text);
                if (dt.Rows.Count ==1)//no tie
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        /*
                        SqlDataSource1.UpdateParameters["cons"].DefaultValue = dr["constituency"].ToString();
                        SqlDataSource1.UpdateParameters["wCand"].DefaultValue = dr["name"].ToString();
                        SqlDataSource1.UpdateParameters["winP"].DefaultValue = dr["partyName"].ToString(); */
                        string cons = dr["constituency"].ToString();
                        string candName = dr["name"].ToString();
                        string partyName = dr["partyName"].ToString();
                        int votes = int.Parse(dr["totalVotes"].ToString());
                        int secondHighestVotes = databaseOperations.findSecondHighest(con.Value);
                        int voteDiff = votes - secondHighestVotes;
                        //SqlDataSource1.UpdateParameters["nov"].DefaultValue = voteDiff.ToString();
                        //SqlDataSource1.Update();
                        databaseOperations.setResult(cons, candName,partyName,voteDiff);
                        GridView1.DataSource = SqlDataSource2;
                        GridView1.DataBind();
                    }
                }
                else
                { 
                    //TestLbl.Text="No Data Found";
                }
            }
        }
    }
    protected void UploadResBtn_Click(object sender, EventArgs e)
    {
        int g = 0;
        foreach (ListItem con in ConsList.Items)
        {
            if (con.Selected)
            {
                string cons = con.Text;
               g= databaseOperations.uploadResult(con.Text);
            }
        }
        if (g != 0)
            MsgLabel.Text = "Result uploaded";
        else
            MsgLabel.Text = "Please select a constituency";
    }
}