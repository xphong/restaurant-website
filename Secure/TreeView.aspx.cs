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
    }

     // Page Load Complete: Sets Heading in master file
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_heading = "TreeView";
        Master.pp_masterTitle = "Phong Huynh - TreeView of Sitemap";
    }
}