using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for databaseOperations
/// </summary>
public class databaseOperations
{
    static string con_string= WebConfigurationManager.ConnectionStrings["ONPSConnectionString"].ConnectionString;
	public databaseOperations()
	{
         //con_string = WebConfigurationManager.ConnectionStrings["ONPSConnectionString"].ConnectionString;
	}

    public static int RegisterVoter(string name, string dob, string sex, string fname,string pob, string address,string email, string phno, string photopath, string voterId, string password)
    {
        string qry = "insert into Voter(name,dob,sex,fname,pob,address,emailId,phoneNo,photopath,voterId,password) values(@name, @dob, @sex, @fname,@pob,@address, @email, @phno, @photopath,@voterId, @password)";
        SqlConnection con = new SqlConnection(con_string);
        SqlCommand cmd = new SqlCommand(qry, con);

        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@dob",dob);
        cmd.Parameters.AddWithValue("@sex", sex);
        cmd.Parameters.AddWithValue("@fname", fname);
        cmd.Parameters.AddWithValue("@pob", pob);
        cmd.Parameters.AddWithValue("@address", address);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@phno", phno);
        cmd.Parameters.AddWithValue("@photopath", photopath);
        cmd.Parameters.AddWithValue("@voterId", voterId);
        cmd.Parameters.AddWithValue("@password", password);
        con.Open();
        int g = cmd.ExecuteNonQuery();
        con.Close();
        return g;

    }

    public static bool authenticateAdmin(string username, string password)
    {
        SqlConnection con = new SqlConnection(con_string);
        string qry = "select * from adminAuthenticate";
        SqlCommand cmd = new SqlCommand(qry, con);
        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            while (rd.Read())
            {
                if (rd["adminUserName"].ToString().Equals(username) && rd["adminPassword"].ToString().Equals(password))
                {
                    return true;
                }
            }
        }
        con.Close();
        return false;
    }

    public static int pendingRequests()
    {
        SqlConnection con = new SqlConnection(con_string);
        string qryCount = "select count(*) from Voter where status='pending'";
        SqlCommand cmd = new SqlCommand(qryCount, con);
        con.Open();
        int g = (int)cmd.ExecuteScalar(); 
        con.Close();
        return g;
    }

    public static int pendingCandidateRequests()
    {
        SqlConnection con = new SqlConnection(con_string);
        string qryCount = "select count(*) from candidates where status='pending'";
        SqlCommand cmd = new SqlCommand(qryCount, con);
        con.Open();
        int g = (int)cmd.ExecuteScalar();
        con.Close();
        return g;
    }

    public static bool authenticateVoter(string username, string password)
    {
        SqlConnection con = new SqlConnection(con_string);
        string qry = "select voterid, password from Voter";
        SqlCommand cmd = new SqlCommand(qry, con);
        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            while (rd.Read())
            {
                if (rd["voterid"].ToString().Equals(username) && rd["password"].ToString().Equals(password))
                {
                    return true;
                }
            }
        }
        con.Close();
        return false;
    }

    public static bool authenticateCandidate(string username, string password)
    {
        SqlConnection con = new SqlConnection(con_string);
        string qry = "select candidateID, password from candidates";
        SqlCommand cmd = new SqlCommand(qry, con);
        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            while (rd.Read())
            {
                if (rd["candidateID"].ToString().Equals(username) && rd["password"].ToString().Equals(password))
                {
                    return true;
                }
            }
        }
        con.Close();
        return false;
    }

    public static string checkStatus(string voterId)
    {
        String status = null;
        SqlConnection con = new SqlConnection(con_string);
        string qry = "select status from Voter where voterid=@voterid";
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@voterid", voterId);
        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            while (rd.Read())
            {
                status=rd["status"].ToString();
            }
        }
        con.Close();
        return status;
    }

    public static int registerParty(string pName, string symPath)
    {
        string qry = "insert into partyDetails(partyName, partySymbol) values(@pName,@symPath)";
        SqlConnection con = new SqlConnection(con_string);
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@pName", pName);
        cmd.Parameters.AddWithValue("@symPath",symPath);
        con.Open();
        int g = cmd.ExecuteNonQuery();
        con.Close();
        return g;
    }

    public static int registerCandidate(string name, string dob, string sex, int partyId,string email, string promises, string candidateId, string pass,string photoPath, string cons)
    { 
        string qry="insert into candidates(name, dob, sex, promises,partyId, email, candidateID, password, photopath, constituency) values(@name,@dob,@sex,@promises,@partyId,@email,@candId,@pass,@photoPath,@cons)";
        SqlConnection con = new SqlConnection(con_string);
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@name",name);
        cmd.Parameters.AddWithValue("@dob",dob);
        cmd.Parameters.AddWithValue("@sex",sex);
        cmd.Parameters.AddWithValue("@partyId",partyId);
        cmd.Parameters.AddWithValue("@email", email);
        cmd.Parameters.AddWithValue("@promises",promises);
        cmd.Parameters.AddWithValue("@candId", candidateId);
        cmd.Parameters.AddWithValue("@pass", pass);
        cmd.Parameters.AddWithValue("@photoPath", photoPath);
        cmd.Parameters.AddWithValue("@cons", cons);
        con.Open();
        int g = cmd.ExecuteNonQuery();
        con.Close();
        return g;
    }

    public static bool validateVacancy(string cons, int partyId)
    {
        SqlConnection con = new SqlConnection(con_string);
        string qry = "select constituency, partyId from candidates";
        SqlCommand cmd = new SqlCommand(qry, con);
        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            while (rd.Read())
            {
                if ((rd["constituency"].ToString().Equals(cons)) && (int.Parse(rd["partyId"].ToString())==partyId))
                {
                    return false;
                }
            }
        }
        con.Close();
        return true;
    }

    public static string voterCons(string voterId)
    {
        string cons = null;
        SqlConnection con = new SqlConnection(con_string);
        string qry = "select pob from Voter where voterId=@voterId";
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@voterId",voterId);
        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            while (rd.Read())
            {
                cons = rd["pob"].ToString();
            }
        }
        con.Close();
        return cons;
    }

    public static int setElection(string eDate, string cons)
    {
        string qry = "insert into electionDetails(date, constituency) values(@eDate, @cons)";
        SqlConnection con = new SqlConnection(con_string);
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@eDate",eDate);
        cmd.Parameters.AddWithValue("@cons", cons);
        con.Open();
        int g = cmd.ExecuteNonQuery();
        con.Close();
        return g;
    }

    public static string eDate(string cons)
    {
        string date = null;
        SqlConnection con = new SqlConnection(con_string);
        string qry = "select date from electionDetails where constituency=@cons";
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@cons", cons);
        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            while (rd.Read())
            {
                date = rd["date"].ToString();
            }
        }
        con.Close();
        return date;
    }

    public static int changeVoterPassword(string newPass, string voterId)
    {
        SqlConnection con = new SqlConnection(con_string);
        string qry = "update Voter set password=@newPass where voterid=@voterid";
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@newPass", newPass);
        cmd.Parameters.AddWithValue("@voterid", voterId);
        con.Open();
        int g=cmd.ExecuteNonQuery();
        con.Close();
        return g;
    }
    
    public static DataTable candidateDetails(string candId)
    {
        //SqlConnection con = new SqlConnection(con_string);
        string qry = "SELECT DISTINCT p.partyName, p.partySymbol, c.name, c.sex, c.dob, c.email, c.photopath, c.constituency,c.promises FROM candidates AS c JOIN partyDetails AS p ON c.partyId = p.partyId WHERE c.candidateID="+candId;
        SqlDataAdapter ad = new SqlDataAdapter(qry, con_string);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;

    }

    public static int askQuestion(string question, string askedTo)
    {
        string qry = "insert into questions(question, askedTo) values(@ques, @askedTo)";
        SqlConnection con = new SqlConnection(con_string);
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@ques", question);
        cmd.Parameters.AddWithValue("@askedTo", askedTo);
        con.Open();
        int g=cmd.ExecuteNonQuery();
        con.Close();
        return g;
    }

    public static bool hasVoted(string voterId)
    {
        SqlConnection con = new SqlConnection(con_string);
        string qry = "select hasVoted from Voter where voterId=@voterId";
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@voterID",voterId);
        con.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            while (rd.Read())
            {
                if (rd["hasVoted"].ToString().Equals("yes"))
                     return true;
                
            }
        }
        con.Close();
        return false;
    }

    public static void markVoted(string voterId)
    {
        SqlConnection con = new SqlConnection(con_string);
        string qry = "update Voter set hasVoted='yes' where voterid=@voterid";
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@voterid", voterId);
        con.Open();
        int g = cmd.ExecuteNonQuery();
        con.Close();
        
    }

    public static int addPromise(string candId, string promise)
    {
        SqlConnection con = new SqlConnection(con_string);
        string qry = "update candidates set promises+=@promise where candidateID=@candId";
        SqlCommand cmd = new SqlCommand(qry, con);
        string promiseString = "," + promise;
        cmd.Parameters.AddWithValue("@promise",promiseString);
        cmd.Parameters.AddWithValue("@candId",candId);
        con.Open();
        int g = cmd.ExecuteNonQuery();
        con.Close();
        return g;
    }

    public static DataTable findWinner(string constituency)
    {
        string qry = "select c.constituency, c.name, p.partyName,c.totalVotes from candidates AS c JOIN partyDetails as p ON c.partyId=p.partyId where totalVotes=(select MAX(totalVotes) from candidates where constituency='" + constituency + "')";
        SqlDataAdapter ad = new SqlDataAdapter(qry, con_string);
        DataTable dt = new DataTable();
        ad.Fill(dt);
        return dt;
    }

    public static int findSecondHighest(string constituency)
    {
        string qry = "select MAX(totalVotes) AS SecondHighest from candidates where totalVotes<(select MAX(totalVotes) from candidates where constituency=@cons)";
        SqlConnection con = new SqlConnection(con_string);
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@cons", constituency);
        con.Open();
        int g = (int)cmd.ExecuteScalar();
        con.Close();
        return g;
    }

    public static int setResult(string constituency, string winningCandidate, string winningParty, int numberOfVotes)
    {
        SqlConnection con = new SqlConnection(con_string);
        string qry = "update electionDetails set winningCandidate=@wCand, winningParty=@winP, numberOfVotes=@nov where constituency=@cons";
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@wCand",winningCandidate);
        cmd.Parameters.AddWithValue("@winP",winningParty);
        cmd.Parameters.AddWithValue("@nov",numberOfVotes);
        cmd.Parameters.AddWithValue("@cons",constituency);
        con.Open();
        int g = cmd.ExecuteNonQuery();
        con.Close();
        return g;
    }

    public static int uploadResult(string cons)
    {
        SqlConnection con = new SqlConnection(con_string);
        string qry = "update electionDetails set upload='yes' where constituency=@cons";
        SqlCommand cmd = new SqlCommand(qry, con);
        cmd.Parameters.AddWithValue("@cons", cons);
        con.Open();
        int g=cmd.ExecuteNonQuery();
        con.Close();
        return g;
        
    }
}