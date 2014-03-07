/*
 * Phong Huynh - 810194340, hnhp0025
 * Web Application Development
 * Final Project
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// Summary description for contactClass
/// </summary>
public class contactClass
{
	private static readonly string _connString;

    static contactClass()
	{
        _connString = WebConfigurationManager.ConnectionStrings["hnhp0025DBConnectionString"].ConnectionString;
	}

    // Create properties to bind values
    private Int32 _contactID;
    public Int32 ContactID
    {
        get { return _contactID; }
        set { _contactID = value; }
    }

    private string _contactfname;
    public string ContactFname
    {
        get { return _contactfname; }
        set { _contactfname = value; }
    }

    private string _contactlname;
    public string ContactLname
    {
        get { return _contactlname; }
        set { _contactlname = value; }
    }

    private string _contactEmail;
    public string ContactEmail
    {
        get { return _contactEmail; }
        set { _contactEmail = value; }
    }

    private string _contactMessage;
    public string ContactMessage
    {
        get { return _contactMessage; }
        set { _contactMessage = value; }
    }


    //connected model
    // Retrieves values from database table and passes values into properties. Stores values in a list and returns
    public List<contactClass> getContact()
    {
        List<contactClass> allContact = new List<contactClass>();
        SqlConnection conn = new SqlConnection(_connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM contact", conn);
        try
        {
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            // dr.read reads each row until there are none left
            while (dr.Read())
            {
                contactClass objContact = new contactClass();
                objContact.ContactID = Convert.ToInt32(dr["id"].ToString());
                objContact.ContactFname = (string)dr["fname"];
                objContact.ContactLname = (string)dr["lname"];
                objContact.ContactEmail = (string)dr["email"];
                objContact.ContactMessage = (string)dr["message"];
                allContact.Add(objContact);
            }
            return allContact;
        }
        catch (Exception err)
        {
            allContact.Clear();
            contactClass objContact = new contactClass();
            objContact.ContactFname = "Server Error (DB): " + err.Message.ToString();
            allContact.Add(objContact);
            return allContact;
        }
        finally
        {
            conn.Close();
        }
    }

    // inserts values into database
    public string insertContact()
    {
        SqlConnection conn = new SqlConnection(_connString);
        string dbCommand = "INSERT INTO contact (fname, lname, email, message) VALUES (@contactFname, @contactLname, @contactEmail, @contactMessage)";
        SqlCommand cmd = new SqlCommand(dbCommand, conn);
        // Set sql parameters
        cmd.Parameters.AddWithValue("@contactFname", ContactFname);
        cmd.Parameters.AddWithValue("@contactLname", ContactLname);
        cmd.Parameters.AddWithValue("@contactEmail", ContactEmail);
        cmd.Parameters.AddWithValue("@contactMessage", ContactMessage);
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
    public string updateContact()
    {
        SqlConnection conn = new SqlConnection(_connString);
        string dbCommand = "UPDATE contact SET fname=@contactFname, lname=@contactLname, email=@contactEmail, message=@contactMessage WHERE id = @parID";
        SqlCommand cmd = new SqlCommand(dbCommand, conn);
        cmd.Parameters.AddWithValue("@contactFname", ContactFname);
        cmd.Parameters.AddWithValue("@contactLname", ContactLname);
        cmd.Parameters.AddWithValue("@contactEmail", ContactEmail);
        cmd.Parameters.AddWithValue("@contactMessage", ContactMessage);
        cmd.Parameters.AddWithValue("@parID", ContactID);
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
    public string deleteContact()
    {
        SqlConnection conn = new SqlConnection(_connString);
        string dbCommand = "DELETE FROM contact WHERE id = @parID";
        SqlCommand cmd = new SqlCommand(dbCommand, conn);
        cmd.Parameters.AddWithValue("@parID", ContactID);
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