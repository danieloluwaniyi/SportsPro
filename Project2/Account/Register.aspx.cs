using System;
using System.Linq;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;


namespace Project2
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            var userStore = new UserStore<IdentityUser>();
            var manager = new UserManager<IdentityUser>(userStore);

            

            //registration result

            var user = new IdentityUser()
            {
                UserName = UserName.Text
            };

            IdentityResult result = manager.Create(user, Password.Text);

            if (result.Succeeded)
            {
                ErrorMessage.Text = string.Format("User {0} has been successfully registered!", user.UserName);
            }
            else
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }

        }
    }
}