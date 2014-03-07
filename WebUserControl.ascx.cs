using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Set default gender
        rbl_gender.SelectedIndex = 0;
    }

    protected void subSubmit(object sender, EventArgs e)
    {
        // Output registration message
        lbl_output.Text = "Thanks for signing up " + txt_fname.Text + ". We will email you at " + txt_email.Text + " whenever coupons are available.";
    }
}