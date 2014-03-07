/*
 * Phong Huynh - 810194340, hnhp0025
 * Web Application Development
 * Project Part 2
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Set default for radio button list
        // If the page does not post back then set it to Coca Cola
        if (!IsPostBack)
            rbl_drinks.SelectedIndex = 0;
    }

    // Page Load Complete: Sets Heading in master file
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_heading = "Order Form";
        Master.pp_masterTitle = "Phong's Restaurant - Order Online";
    }

    protected void subOption(object sender, EventArgs e)
    {
        // If delivery option is selected, then make delivery address input visible
        if (ddl_option.SelectedIndex == 1)
        {
            lbl_address.Visible = true;
            txt_address.Visible = true;
            txt_address.Text = "";
        }

        else
        {
            lbl_address.Visible = false;
            txt_address.Visible = false;
        }

    }


    // Submit Button: creates instance of order class, sets values, calculates price, and outputs the receipt
    protected void subSubmit(object sender, EventArgs e)
    {
        // Order Class created
        orderClass objOrder = new orderClass();

        // Set according values
        objOrder.orderName = txt_name.Text.ToString();
        objOrder.orderNumber = txt_number.Text.ToString();
        objOrder.orderFood = ddl_food.SelectedValue.ToString();
        objOrder.orderDrink = rbl_drinks.SelectedValue.ToString();
        objOrder.orderDrinkQuantity = Convert.ToInt32(txt_quantitydrink.Text);
        objOrder.orderFoodQuantity = Convert.ToInt32(txt_quantityfood.Text);
        objOrder.orderAddress = txt_address.Text.ToString();

        // Checks if extra sauce is checked
        if (cbx_sauce.Checked == true)
        {
            objOrder.orderSauce = 1;
        }

        // Checks for delivery address
        if (ddl_option.SelectedIndex == 1)
        {
            objOrder.orderAddresscheck = 1;
        }
        
        // Calculate price
        objOrder.calculatePrice();

        // Output receipt
        lbl_output.Text = objOrder.getReceipt();
    }

    // Clear Button: clears the form
    protected void subClear(object sender, EventArgs e)
    {
        lbl_output.Text = "";
        txt_name.Text = "";
        txt_number.Text = "";
        ddl_food.SelectedIndex = 0;
        txt_quantityfood.Text = "1";
        rbl_drinks.SelectedIndex = 0;
        txt_quantitydrink.Text = "1";
        cbx_sauce.Checked = false;
        txt_address.Text = "";
    }
}