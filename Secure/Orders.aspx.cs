/*
 * Phong Huynh - 810194340, hnhp0025
 * Web Application Development
 * Final Project
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            _subBind();
        }
    }


    // Page Load Complete: Sets Heading in master file
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_heading = "Orders Admin";
        Master.pp_masterTitle = "Phong's Restaurant - Orders";
    }

    // Subroutine to bind gridview
    private void _subBind()
    {
        ordersClass objOrders = new ordersClass();
        grv_orders.DataSource = objOrders.getOrders();
        grv_orders.DataBind();

    }

    // Makes fields editable on gridview
    protected void EditOrders(object sender, GridViewEditEventArgs e)
    {
        grv_orders.EditIndex = e.NewEditIndex;
        _subBind();
    }

    // Cancel Edit: changes editable fields back
    protected void CancelEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grv_orders.EditIndex = -1;
        _subBind();
    }

    // Update orders: updates the selected orders row
    protected void UpdateOrders(object sender, GridViewUpdateEventArgs e)
    {
        ordersClass objOrders = new ordersClass();
        objOrders.OrdersID = Int32.Parse(((Label)grv_orders.Rows[e.RowIndex].FindControl("lbl_ID")).Text);
        objOrders.OrdersName = ((TextBox)grv_orders.Rows[e.RowIndex].FindControl("txt_nameU")).Text;
        objOrders.OrdersNumber = ((TextBox)grv_orders.Rows[e.RowIndex].FindControl("txt_numberU")).Text;
        objOrders.OrdersFood = ((TextBox)grv_orders.Rows[e.RowIndex].FindControl("txt_foodU")).Text;
        objOrders.OrdersFoodquantity = Int32.Parse(((TextBox)grv_orders.Rows[e.RowIndex].FindControl("txt_foodquantityU")).Text);
        objOrders.OrdersDrink = ((TextBox)grv_orders.Rows[e.RowIndex].FindControl("txt_drinkU")).Text;
        objOrders.OrdersDrinkquantity = Int32.Parse(((TextBox)grv_orders.Rows[e.RowIndex].FindControl("txt_drinkquantityU")).Text);
        objOrders.OrdersSauce = Int32.Parse(((TextBox)grv_orders.Rows[e.RowIndex].FindControl("txt_sauceU")).Text);
        objOrders.OrdersAddress = ((TextBox)grv_orders.Rows[e.RowIndex].FindControl("txt_addressU")).Text;
        lbl_msg.Text = objOrders.updateOrders();
        grv_orders.EditIndex = -1;
        _subBind();
    }

    // Delete selected orders row
    protected void DeleteOrders(object sender, EventArgs e)
    {
        LinkButton lnkDelete = (LinkButton)sender;

        ordersClass objOrders = new ordersClass();
        objOrders.OrdersID = Int32.Parse(lnkDelete.CommandArgument);
        lbl_msg.Text = objOrders.deleteOrders();
        _subBind();
    }

    // Insert new order
    protected void InsertOrders(object sender, EventArgs e)
    {
        ordersClass objOrders = new ordersClass();
        objOrders.OrdersName = txt_nameI.Text.ToString();
        objOrders.OrdersNumber = txt_numberI.Text.ToString();
        objOrders.OrdersFood = txt_foodI.Text.ToString();
        objOrders.OrdersFoodquantity = Int32.Parse(txt_foodquantityI.Text.ToString());
        objOrders.OrdersDrink = txt_drinkI.Text.ToString();
        objOrders.OrdersDrinkquantity = Int32.Parse(txt_drinkquantityI.Text.ToString());
        objOrders.OrdersSauce = Int32.Parse(txt_sauceI.Text.ToString());
        objOrders.OrdersAddress = txt_addressI.Text.ToString();
        lbl_msg.Text = objOrders.insertOrders();
        _subBind();

    }

    // Clears insert text boxes
    protected void Cancel(object sender, EventArgs e)
    {
        txt_nameI.Text = "";
        txt_numberI.Text = "";
        txt_foodI.Text = "";
        txt_foodquantityI.Text = "";
        txt_drinkI.Text = "";
        txt_drinkquantityI.Text = "";
        txt_sauceI.Text = "";
        txt_addressI.Text = "";
    }

}