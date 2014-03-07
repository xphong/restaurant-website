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
/// Summary description for ordersClass
/// </summary>
public class ordersClass
{
	private static readonly string _connString;

    static ordersClass()
	{
        _connString = WebConfigurationManager.ConnectionStrings["hnhp0025DBConnectionString"].ConnectionString;
	}

    // Create properties to bind values
    private Int32 _ordersID;
    public Int32 OrdersID
    {
        get { return _ordersID; }
        set { _ordersID = value; }
    }

    private string _ordersName;
    public string OrdersName
    {
        get { return _ordersName; }
        set { _ordersName = value; }
    }

    private string _ordersNumber;
    public string OrdersNumber
    {
        get { return _ordersNumber; }
        set { _ordersNumber = value; }
    }

    private string _ordersFood;
    public string OrdersFood
    {
        get { return _ordersFood; }
        set { _ordersFood = value; }
    }

    private decimal _ordersFoodquantity;
    public decimal OrdersFoodquantity
    {
        get { return _ordersFoodquantity; }
        set { _ordersFoodquantity = value; }
    }

    private string _ordersDrink;
    public string OrdersDrink
    {
        get { return _ordersDrink; }
        set { _ordersDrink = value; }
    }

    private decimal _ordersDrinkquantity;
    public decimal OrdersDrinkquantity
    {
        get { return _ordersDrinkquantity; }
        set { _ordersDrinkquantity = value; }
    }

    private decimal _ordersSauce;
    public decimal OrdersSauce
    {
        get { return _ordersSauce; }
        set { _ordersSauce = value; }
    }

    private string _ordersAddress;
    public string OrdersAddress
    {
        get { return _ordersAddress; }
        set { _ordersAddress = value; }
    }


    //connected model
    // Retrieves values from database table and passes values into properties. Stores values in a list and returns
    public List<ordersClass> getOrders()
    {
        List<ordersClass> allOrders = new List<ordersClass>();
        SqlConnection conn = new SqlConnection(_connString);
        SqlCommand cmd = new SqlCommand("SELECT * FROM orders", conn);
        try
        {
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            // dr.read reads each row until there are none left
            while (dr.Read())
            {
                ordersClass objOrders = new ordersClass();
                objOrders.OrdersID = Convert.ToInt32(dr["id"].ToString());
                objOrders.OrdersName = (string)dr["name"];
                objOrders.OrdersNumber = (string)dr["number"];
                objOrders.OrdersFood = (string)dr["food"];
                objOrders.OrdersFoodquantity = Convert.ToInt32(dr["foodquantity"].ToString());
                objOrders.OrdersDrink = (string)dr["drink"];
                objOrders.OrdersDrinkquantity = Convert.ToInt32(dr["drinkquantity"].ToString());
                objOrders.OrdersSauce = Convert.ToInt32(dr["sauce"].ToString());
                objOrders.OrdersAddress = (string)dr["address"];
                allOrders.Add(objOrders);
            }
            return allOrders;
        }
        catch (Exception err)
        {
            allOrders.Clear();
            ordersClass objOrders = new ordersClass();
            objOrders.OrdersName = "Server Error (DB): " + err.Message.ToString();
            allOrders.Add(objOrders);
            return allOrders;
        }
        finally
        {
            conn.Close();
        }
    }

    // inserts values into database
    public string insertOrders()
    {
        SqlConnection conn = new SqlConnection(_connString);
        string dbCommand = "INSERT INTO orders (name, number, food, foodquantity, drink, drinkquantity, sauce, address) VALUES (@ordersName, @ordersNumber, @ordersFood, @ordersFoodquantity, @ordersDrink, @ordersDrinkquantity, @ordersSauce, @ordersAddress)";
        SqlCommand cmd = new SqlCommand(dbCommand, conn);
        // Set sql parameters
        cmd.Parameters.AddWithValue("@ordersName", OrdersName);
        cmd.Parameters.AddWithValue("@ordersNumber", OrdersNumber);
        cmd.Parameters.AddWithValue("@ordersFood", OrdersFood);
        cmd.Parameters.AddWithValue("@ordersFoodquantity", OrdersFoodquantity);
        cmd.Parameters.AddWithValue("@ordersDrink", OrdersDrink);
        cmd.Parameters.AddWithValue("@ordersDrinkquantity", OrdersDrinkquantity);
        cmd.Parameters.AddWithValue("@ordersSauce", OrdersSauce);
        cmd.Parameters.AddWithValue("@ordersAddress", OrdersAddress);
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
    public string updateOrders()
    {
        SqlConnection conn = new SqlConnection(_connString);
        string dbCommand = "UPDATE orders SET name=@ordersName, number=@ordersNumber, food=@ordersFood, foodquantity=@ordersFoodquantity, drink=@ordersDrink, drinkquantity=@ordersDrinkquantity, sauce=@ordersSauce, address=@ordersAddress  WHERE id = @parID";
        SqlCommand cmd = new SqlCommand(dbCommand, conn);
        cmd.Parameters.AddWithValue("@ordersName", OrdersName);
        cmd.Parameters.AddWithValue("@ordersNumber", OrdersNumber);
        cmd.Parameters.AddWithValue("@ordersFood", OrdersFood);
        cmd.Parameters.AddWithValue("@ordersFoodquantity", OrdersFoodquantity);
        cmd.Parameters.AddWithValue("@ordersDrink", OrdersDrink);
        cmd.Parameters.AddWithValue("@ordersDrinkquantity", OrdersDrinkquantity);
        cmd.Parameters.AddWithValue("@ordersSauce", OrdersSauce);
        cmd.Parameters.AddWithValue("@ordersAddress", OrdersAddress);
        cmd.Parameters.AddWithValue("@parID", OrdersID);
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
    public string deleteOrders()
    {
        SqlConnection conn = new SqlConnection(_connString);
        string dbCommand = "DELETE FROM orders WHERE id = @parID";
        SqlCommand cmd = new SqlCommand(dbCommand, conn);
        cmd.Parameters.AddWithValue("@parID", OrdersID);
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