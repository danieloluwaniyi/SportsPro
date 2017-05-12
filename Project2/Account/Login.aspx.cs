using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Project2.Models;

namespace Project2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

                if (IsValid)
                {
                    // Validate the user password
                    var manager = new UserManager();
                    ApplicationUser user = manager.Find(UserName.Text, Password.Text);
                    if (user != null)
                    {
                        IdentityHelper.SignIn(manager, user, false);
                      
                        IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                    }
                    else
                    {
                        FailureText.Text = "Invalid username or password.";
                        ErrorMessage.Visible = true;
                    }
                }

       
        }
    }
}