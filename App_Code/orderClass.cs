/*
 * Phong Huynh - 810194340, hnhp0025
 * Web Application Development
 * Project Part 2
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;

/// <summary>
/// Summary description for orderClass
/// Variables, subroutines, and functions for order form
/// </summary>
public class orderClass
{
    // Constant variables used for default prices that will not change
    private const double DRINK = 1.99;
    private const double CHICKEN = 14.99;
    private const double STEAK = 19.99;
    private const double PORK = 9.99;
    private const double TAX = 1.15;
    private const double SAUCE = 0.99;
    private const double DELIVERY = 4.99;

    // SQL Connection String
    private string _connString = WebConfigurationManager.ConnectionStrings["hnhp0025DBConnectionString"].ConnectionString;



    // Variables and properties for properties in order form
    private string _name;
    public string orderName
    {
        get { return _name; }
        set { _name = value; }
    }

    private string _number;
    public string orderNumber
    {
        get { return _number; }
        set { _number = value; }
    }

    private string _food;
    public string orderFood
    {
        get { return _food; }
        set { _food = value; }
    }

    private int _foodquantity;
    public int orderFoodQuantity
    {
        get { return _foodquantity; }
        set { _foodquantity = value; }
    }

    private string _drink;
    public string orderDrink
    {
        get { return _drink; }
        set { _drink = value; }
    }

    private int _drinkquantity;
    public int orderDrinkQuantity
    {
        get { return _drinkquantity; }
        set { _drinkquantity = value; }
    }

    private int _saucecheck;
    public int orderSauce
    {
        get { return _saucecheck; }
        set { _saucecheck = value; }
    }

    private string _address;
    public string orderAddress
    {
        get { return _address; }
        set { _address = value; }
    }

    private int _addresscheck;
    public int orderAddresscheck
    {
        get { return _addresscheck; }
        set { _addresscheck = value; }
    }

     
    private double _foodprice;
    private double _drinkprice;
    private double _price;
    




    // Constructor
	public orderClass()
	{
        _name = "Default Name";
        _number = "123-456-3789";
	}

    // Calculates the price
    public void calculatePrice()
    {
        _drinkprice = DRINK*_drinkquantity;

        if (_food == "Chicken")
            _foodprice += CHICKEN*_foodquantity;

        else if (_food == "Steak")
            _foodprice += STEAK * _foodquantity;

        else if (_food == "Pork")
            _foodprice += PORK * _foodquantity;

        // Checks if user wants extra sauce and charges for it
        if (_saucecheck == 1)
            _price += SAUCE;

        _price += _foodprice + _drinkprice;

    }

    // Forms the receipts and returns in a string and inserts user's information into orders table
    public string getReceipt()
    {
        //* Independent Initiative: Insert using ADO.NET *****************************************************************************************
        string insertDB;
        string result = "";
        // SQL Query to insert into orders table
        insertDB = "INSERT INTO orders (";
        insertDB += "name, number, food, foodquantity, drink, drinkquantity, sauce, address) ";
        insertDB += "VALUES (";
        insertDB += "@name, @number, @food, @foodquantity, @drink, @drinkquantity, @sauce, @address) ";
        
        // Create Connection
        SqlConnection conn = new SqlConnection(_connString);
        SqlCommand cmd = new SqlCommand(insertDB, conn);

        // Determine values to add
        cmd.Parameters.AddWithValue("@name", _name);
        cmd.Parameters.AddWithValue("@number", _number);
        cmd.Parameters.AddWithValue("@food", _food);
        cmd.Parameters.AddWithValue("@foodquantity", _foodquantity);
        cmd.Parameters.AddWithValue("@drink", _drink);
        cmd.Parameters.AddWithValue("@drinkquantity", _drinkquantity);
        cmd.Parameters.AddWithValue("@sauce", _saucecheck);
        cmd.Parameters.AddWithValue("@address", _address);

        int added = 0;

        // Insert into orders table
        try
        {
            // Open Connection
            conn.Open();
            // Execute Query
            added = cmd.ExecuteNonQuery();
            // Output message
            result = "Order inserted into database.";
        }
        catch (Exception err)
        {
            // Error message if insert does not work
            result = "Error inserting record. ";
            result += err.Message;
        }
        finally
        {
            // Close Connection
            conn.Close();
        }

        // checks if user selected delivery and charges for it, also displays the address on receipt
        if (_addresscheck == 1)
        {
            return "<br /><h2>receipt: </h2> <br /> Thanks for ordering!<br /><br /> Name: " + _name + "<br /> Phone Number: " + _number +
                "<br /> Address: " + _address + "<br /> Food: " + _food + "<br /> Drink: " + _drink +
                "<br /><br /> Food Price: $" + _foodprice + "<br /> Drink Price: $" + _drinkprice + 
               "<br /> Price: $" + _price + "<br /> Delivery Charge: $" + DELIVERY +  "<br /><br /> Total Price: $" + Math.Round((_price + DELIVERY) * TAX,2) +
               "<br /> <br /> " + result;
        }

        else
        {
            return "<br /><h2>receipt: </h2> <br /> Thanks for ordering!<br /><br /> Name: " + _name + "<br /> Phone Number: " + _number +
                 "<br /> Food: " + _food + "<br /> Drink: " + _drink +
                 "<br /><br /> Food Price: $" + _foodprice + "<br /> Drink Price: $" + _drinkprice + 
                "<br /> Price: $" + _price + "<br /><br /> Total Price: $" + Math.Round(_price * TAX, 2) +
                "<br /> <br /> " + result; 
        }

    }

}