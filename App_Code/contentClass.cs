using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for contentClass
/// </summary>
public class contentClass
{
    private static readonly string _connString;

    static contentClass()
	{
        _connString = WebConfigurationManager.ConnectionStrings["hnhp0025DBConnectionString"].ConnectionString;
	}

    // Create properties to bind values
    private Int32 _contentID;
    public Int32 ContentID
    {
        get { return _contentID; }
        set { _contentID = value; }
    }

    private string _contentPage;
    public string ContentPage
    {
        get { return _contentPage; }
        set { _contentPage = value; }
    }

    private string _contentText;
    public string ContentText
    {
        get { return _contentText; }
        set { _contentText = value; }
    }

    //connected model
    // Retrieves values from database table and passes values into properties. Stores values in a list and returns
    public List<contentClass> getContent()
    {
        List<contentClass> allContent = new List<contentClass>();
        SqlConnection conn = new SqlConnection(_connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM contenttext", conn);
        try
        {
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            // dr.read reads each row until there are none left
            while (dr.Read())
            {
                contentClass objContent = new contentClass();
                objContent.ContentID = Convert.ToInt32(dr["id"].ToString());
                objContent.ContentPage = (string)dr["page"];
                objContent.ContentText = (string)dr["text"];
                allContent.Add(objContent);
            }
            return allContent;
        }
        catch (Exception err)
        {
            allContent.Clear();
            contentClass objContent = new contentClass();
            objContent.ContentPage = "Server Error (DB): " + err.Message.ToString();
            allContent.Add(objContent);
            return allContent;
        }
        finally
        {
            conn.Close();
        }
    }

    

    // inserts values into database
    public string insertContent()
    {
        SqlConnection conn = new SqlConnection(_connString);
        string dbCommand = "INSERT INTO contenttext (page, text) VALUES (@contentPage, @contentText)";
        SqlCommand cmd = new SqlCommand(dbCommand, conn);
        // Set sql parameters
        cmd.Parameters.AddWithValue("@contentPage", ContentPage);
        cmd.Parameters.AddWithValue("@contentText", ContentText);
        try
        {
            conn.Open();
            int num = cmd.ExecuteNonQuery();
            return _checkSuccess(num);
        }
        catch (Exception err)
        {
            return "Server Error (DB): " + err.Message.ToString();
        }
        finally
        {
            conn.Close();
        }

    }

    
    // update database values
    public string updateContent()
    {
        SqlConnection conn = new SqlConnection(_connString);
        string dbCommand = "UPDATE contenttext SET page=@contentPage, text=@contentText WHERE id = @parID";
        SqlCommand cmd = new SqlCommand(dbCommand, conn);
        // Set sql parameters
        cmd.Parameters.AddWithValue("@contentPage", ContentPage);
        cmd.Parameters.AddWithValue("@contentText", ContentText);
        cmd.Parameters.AddWithValue("@parID", ContentID);
        try
        {
            conn.Open();
            int num = cmd.ExecuteNonQuery();
            return _checkSuccess(num);
        }
        catch (Exception err)
        {
            return "Server Error (DB): " + err.Message.ToString();
        }
        finally
        {
            conn.Close();
        }
    }

    
    // delete database row
    public string deleteContent()
    {
        SqlConnection conn = new SqlConnection(_connString);
        string dbCommand = "DELETE FROM contenttext WHERE id = @parID";
        SqlCommand cmd = new SqlCommand(dbCommand, conn);
        cmd.Parameters.AddWithValue("@parID", ContentID);
        try
        {
            conn.Open();
            int num = cmd.ExecuteNonQuery();
            return _checkSuccess(num);
        }
        catch (Exception err)
        {
            return "Server Error (DB): " + err.Message.ToString();
        }
        finally
        {
            conn.Close();
        }
    }
    

    // Checks if the database query was successful and returns a message
    private string _checkSuccess(int value)
    {
        string msg;
        if (value == 1)
        {
            msg = "<span style='color:green;'> Success</span>";
        }
        else
        {
            msg = "<span style='color:red;'> Failed</span>";
        }
        return msg;
    }
}