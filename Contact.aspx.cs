using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // Page Load Complete: Sets Heading in master file
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_heading = "Contact";
        Master.pp_masterTitle = "Phong's Restaurant - Contact";
    }

    // Submit Button: inserts users information and message into contact table, outputs a message to the user
    protected void subSubmit(object sender, EventArgs e)
    {
        lbl_output.Text = "Message Sent.";
    }
}