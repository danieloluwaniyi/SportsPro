using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Project2
{
    public partial class ContactList : System.Web.UI.Page
    {
        private CustomerList custList;
        protected void Page_Load(object sender, EventArgs e)
        {
            custList = CustomerList.GetCustomers();
            if (!IsPostBack)
                this.DisplayCustomer();
        }

        private void DisplayCustomer()
        {
            lstCustomer.Items.Clear();
            Customer customer;
            for (int i = 0; i < custList.Count; i++)
            {
                customer = custList[i];
                lstCustomer.Items.Add(customer.Display());
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if (custList.Count > 0)
            {
                if (lstCustomer.SelectedIndex > -1)
                {
                    custList.RemoveAt(lstCustomer.SelectedIndex);
                    this.DisplayCustomer();

                }
                else
                {
                    lblMessage.Text = "Please select the customer you want to remove";
                }
            }
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            if (custList.Count > 0)
            {
                custList.Clear();
                lstCustomer.Items.Clear();
            }
        }
    } 
}