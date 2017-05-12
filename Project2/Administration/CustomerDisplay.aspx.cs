
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project2
{
    public partial class CustomerDisplay : System.Web.UI.Page
    {
        private Customer selectedCustomer;

        protected void Page_Load(object sender, EventArgs e)
        {
            //bind drop-down list on first load
            if (!IsPostBack) customerName.DataBind();

            //get and show customer on every load
            var sb = new StringBuilder();
            selectedCustomer = this.GetSelectedCustomer();

            //concatenate address
            sb.Append(selectedCustomer.Address).AppendLine();
            lblAddress.Text = sb.ToString();

            var sb2 = new StringBuilder();
            sb2.Append(selectedCustomer.City).Append(", ").Append(selectedCustomer.State).Append(" ").Append(selectedCustomer.Zip);

            lblCity.Text = sb2.ToString();
            lblEmail.Text = selectedCustomer.Email;
            lblPhone.Text = selectedCustomer.Phone;


        }

        private Customer GetSelectedCustomer()
        {
            DataView customerTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);

            customerTable.RowFilter = "CustomerID = '" + customerName.SelectedValue + "'";
            DataRowView row = customerTable[0];

            //create a new customer Object and load with data
            Customer customer = new Customer();
            customer.CustomerID = row["CustomerID"].ToString();
            customer.Name = row["Name"].ToString();
            customer.Address = row["Address"].ToString();
            customer.City = row["City"].ToString();
            customer.State = row["State"].ToString();
            customer.Zip = row["ZipCode"].ToString();
            customer.Phone = row["Phone"].ToString();
            customer.Email = row["Email"].ToString();
            return customer;

        }

        protected void btnAddContact_Click(object sender, EventArgs e)
        {


            //get customer from session and selected customer from list
            CustomerList custList = CustomerList.GetCustomers();
            Customer customer = custList[selectedCustomer.Name];

            if (customer == null)
            {
                custList.AddItem(selectedCustomer);
                Response.Redirect("/Administration/ContactList", false);
            }
            else
            {
                lblDuplicateCust.Text = "Customer Already Exists in List!";
            }





        }
    } 
}