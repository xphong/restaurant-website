using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Secure_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // Page Load Complete: Sets Heading in master file
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_heading = "Login";
        Master.pp_masterTitle = "Phong's Restaurant - Login";
    }


    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string username = Login1.UserName;
        string password = Login1.Password;
        e.Authenticated = FormsAuthentication.Authenticate(username, password);
    }
}