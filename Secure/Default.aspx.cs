/*
 * Phong Huynh - 810194340, hnhp0025
 * Web Application Development
 * Midterm Project
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // Page Load Complete: Sets Heading in master file
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_heading = "Home Admin";
        Master.pp_masterTitle = "Phong's Restaurant - Home";
    }


}