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

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    // Sitemap button redirects to treeview page
    protected void subTreeView(object sender, EventArgs e)
    {
        Response.Redirect("TreeView.aspx");
    }


    // Master properties and variables
    private string _heading = "Default Heading from master page";
    public string pp_heading
    {
        get{ return _heading; }
        set { _heading = value; }
    }

    private string _title = "Master page title";
    public string pp_masterTitle
    {
        get { return _title; }
        set { _title = value; }
    }


}
