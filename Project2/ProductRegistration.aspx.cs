using Project2.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project2
{
    public partial class ProductRegistration : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListItem productItem = new ListItem("--Select a product--", "None");
                ddlProducts.Items.Add(productItem);
            }
        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["CustomerID"].DefaultValue = txtCustID.Text;
            SqlDataSource1.InsertParameters["ProductCode"].DefaultValue = ddlProducts.SelectedValue;
            SqlDataSource1.InsertParameters["RegistrationDate"].DefaultValue = DateTime.Today.ToShortDateString();

            try
            {
                SqlDataSource1.Insert();
                Email.sendProductRegistrationEmail(txtCustID.Text, ddlProducts.Text);
                txtCustID.Text = "";
                lblCust.Text = "";
                ddlProducts.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                Session["Exception"] = ex;
                Session["Page"] = "~/ProductRegistration.aspx";
                Response.Redirect("~/ErrorMessage.aspx");
            }
            finally
            {
                btnRegister.Enabled = false;
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DataView customer = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            args.IsValid = false;
            if (customer.Count != 0)
            {
                args.IsValid = true;
                DataRowView row = customer[0];
                lblCust.Text = row["Name"].ToString();
                btnRegister.Enabled = true;
            }
            else
            {
                lblCust.Text = "";
                btnRegister.Enabled = false;
            }

        }
    }
}