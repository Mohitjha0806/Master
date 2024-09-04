using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSignup_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }



    protected void btnRegister_Click(object sender, EventArgs e)
    {
        LoginContainer.Visible = false;
        SignupContainer.Visible = true;
    }


    protected void btnHaveAccount_Click(object sender, EventArgs e)
    {
        LoginContainer.Visible = true;
        SignupContainer.Visible = false;
    }


}