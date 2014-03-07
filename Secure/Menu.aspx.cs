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

using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

public partial class Menu : System.Web.UI.Page
{
    private string _conn = WebConfigurationManager.ConnectionStrings["hnhp0025DBConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        // Fill datatable with menu table from the database
        // disconnected model
        if (Session["sortmenu"] == null)
        {
            SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM menu", _conn);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Session["sortmenu"] = dt.DefaultView;
        }

        if (!IsPostBack)
        {
            _subBind();
        }

    }

    // Page Load Complete: Sets Heading in master file
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_heading = "View Menu Admin";
        Master.pp_masterTitle = "Phong's Restaurant - View Menu";
    }

    // Sorts column selected
    protected void subSort(object sender, GridViewSortEventArgs e)
    {
        DataView dv = (DataView)Session["sortmenu"];
        dv.Sort = e.SortExpression;
        _subBind();
    }

    // Binds gridview to data table within the session
    private void _subBind()
    {
        grv_menu.DataSource = Session["sortmenu"];
        grv_menu.DataBind();
    }

    // Search: searches through the table for inputted search and binds to the gridview
    // disconnected model
    protected void subSearch(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        string sqlquery = "";

        if (ddl_search.SelectedValue.ToString() == "Food")
        {
            sqlquery = "SELECT * FROM menu WHERE food LIKE '%" + txt_search.Text + "%'";
        }

        else if (ddl_search.SelectedValue.ToString() == "Description")
        {
            sqlquery = "SELECT * FROM menu WHERE description LIKE '%" + txt_search.Text + "%'";
        }

        else
        {
            sqlquery = "SELECT * FROM menu WHERE price LIKE '%" + Int32.Parse(txt_search.Text) + "%'";
        }

        SqlDataAdapter sda = new SqlDataAdapter(sqlquery, _conn);
        sda.Fill(dt);
        grv_menu.DataSource = dt;
        grv_menu.DataBind();
    }

}