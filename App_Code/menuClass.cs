/*
 * Phong Huynh - 810194340, hnhp0025
 * Web Application Development
 * Final Project
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for menuClass
/// </summary>
public class menuClass
{
	private static readonly string _connString;

	static menuClass()
	{
        _connString = WebConfigurationManager.ConnectionStrings["hnhp0025DBConnectionString"].ConnectionString;
	}

    // Create properties to bind values
    private Int32 _menuID;
    public Int32 MenuID
    {
        get { return _menuID; }
        set { _menuID = value; }
    }

    private string _menuFood;
    public string MenuFood
    {
        get { return _menuFood; }
        set { _menuFood = value; }
    }

    private string _menuDesc;
    public string MenuDescription
    {
        get { return _menuDesc; }
        set { _menuDesc = value; }
    }

    private decimal _menuPrice;
    public decimal MenuPrice
    {
        get { return _menuPrice; }
        set { _menuPrice = value; }
    }

    //connected model
    // Retrieves values from database table and passes values into properties. Stores values in a list and returns
    public List<menuClass> getMenu()
    {
        List<menuClass> allMenu = new List<menuClass>();
        SqlConnection conn = new SqlConnection(_connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM menu", conn);
        try
        {
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            // dr.read reads each row until there are none left
            while (dr.Read())
            {
                menuClass objMenu = new menuClass();
                objMenu.MenuID = Convert.ToInt32(dr["id"].ToString());
                objMenu.MenuFood = (string)dr["Food"];
                objMenu.MenuDescription = (string)dr["Description"];
                objMenu.MenuPrice = Convert.ToDecimal(dr["Price"].ToString());
                allMenu.Add(objMenu);
            }
            return allMenu;
        }
        catch (Exception err)
        {
            allMenu.Clear();
            menuClass objMenu = new menuClass();
            objMenu.MenuFood = "Server Error (DB): " + err.Message.ToString();
            allMenu.Add(objMenu);
            return allMenu;
        }
        finally
        {
            conn.Close();
        }
    }

    public List<menuClass> getMenuByID(int id)
    {
        List<menuClass> allProducts = new List<menuClass>();
        SqlConnection conn = new SqlConnection(_connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM menu WHERE id=" + id, conn);
        try
        {
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                menuClass objMenu = new menuClass();
                objMenu.MenuID = Convert.ToInt32(dr["id"].ToString());
                objMenu.MenuFood = (string)dr["Food"];
                objMenu.MenuDescription = (string)dr["Description"];
                objMenu.MenuPrice = Convert.ToDecimal(dr["Price"].ToString());
                allProducts.Add(objMenu);
            }
            return allProducts;
        }
        catch (Exception err)
        {
            allProducts.Clear();
            menuClass objMenu = new menuClass();
            objMenu.MenuFood = "Server Error (DB): " + err.Message.ToString();
            allProducts.Add(objMenu);
            return allProducts;
        }
        finally
        {
            conn.Close();
        }

    }

    // inserts values into database
    public string insertMenu()
    {
        SqlConnection conn = new SqlConnection(_connString);
        string dbCommand = "INSERT INTO menu (Food, Description, Price) VALUES (@menuFood, @menuDesc, @menuPrice)";
        SqlCommand cmd = new SqlCommand(dbCommand, conn);
        // Set sql parameters
        cmd.Parameters.AddWithValue("@menuFood", MenuFood);
        cmd.Parameters.AddWithValue("@menuDesc", MenuDescription);
        cmd.Parameters.AddWithValue("@menuPrice", MenuPrice);
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
    public string updateMenu()
    {
        SqlConnection conn = new SqlConnection(_connString);
        string dbCommand = "UPDATE menu SET Food=@menuFood, Description=@menuDesc, Price=@menuPrice WHERE id = @parID";
        SqlCommand cmd = new SqlCommand(dbCommand, conn);
        cmd.Parameters.AddWithValue("@menuFood", MenuFood);
        cmd.Parameters.AddWithValue("@menuDesc", MenuDescription);
        cmd.Parameters.AddWithValue("@menuPrice", MenuPrice);
        cmd.Parameters.AddWithValue("@parID", MenuID);
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
    public string deleteMenu()
    {
        SqlConnection conn = new SqlConnection(_connString);
        string dbCommand = "DELETE FROM menu WHERE id = @parID";
        SqlCommand cmd = new SqlCommand(dbCommand, conn);
        cmd.Parameters.AddWithValue("@parID", MenuID);
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