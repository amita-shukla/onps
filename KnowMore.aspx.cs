using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class KnowMore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string partySymb = null;
        string promises = null;
        string dob = null;
        string photopath = null;
        DataTable dt = databaseOperations.candidateDetails(Request.QueryString["candId"]);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                NameLbl.Text = dr["name"].ToString();
                dob = dr["dob"].ToString();
                PartyLbl.Text = dr["partyName"].ToString();
                EmailLbl.Text = dr["email"].ToString();
                ConsLbl.Text = dr["constituency"].ToString();
                promises = dr["promises"].ToString();
                photopath = dr["photopath"].ToString();
                partySymb = dr["partySymbol"].ToString();
                string[] promise = promises.Split(',');
                foreach (string p in promise)
                {
                    if (p.Equals(""))
                    { }
                    else
                    {
                        PromiseList.Items.Add(p);
                    }
                }
                int presentYear = DateTime.Today.Year;
                int birthYear = Convert.ToDateTime(dob).Year;
                int age = presentYear - birthYear;
                AgeLbl.Text = age.ToString();
                photoImg.ImageUrl = photopath;
                PartySymbLbl.ImageUrl = partySymb;
                SexLbl.Text = dr["sex"].ToString();
            }
            
        }
        else
        {
            Response.Write("No data found");
        }
        
    }
}