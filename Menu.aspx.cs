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

public partial class Menu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }

    // Page Load Complete: Sets Heading in master file
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_heading = "Menu";
        Master.pp_masterTitle = "Phong's Restaurant - Menu";
    }

    // More Details Button Click
    protected void grv_menu_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "MoreDetail")
        {
            img_chicken.Visible = false;
            img_steak.Visible = false;
            img_pork.Visible = false;

            // Gets index of selected row
            int currentRowIndex = Int32.Parse(e.CommandArgument.ToString());

            // Turn on visibility of second details table
            lbl_details.Visible = true;
            grv_desc.Visible = true;

            // Display the correct row  by using the selected row index
            foreach (GridViewRow row in grv_desc.Rows)
            {
                row.Visible = row.RowIndex.Equals(currentRowIndex);
            }

            if (currentRowIndex == 0)
            {
                img_chicken.Visible = true;
            }

            else if (currentRowIndex == 1)
            {
                img_steak.Visible = true;
            }

            else if (currentRowIndex == 2)
            {
                img_pork.Visible = true;
            }



        }
    }

}