using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;



    public class CustomerList
    {
        private List<Customer> customerList;

        public CustomerList()
        {
            customerList = new List<Customer>();
        }

        //Returns count of number of Customers in the List
        public int Count
        {
            get { return customerList.Count; }
        }

        //Gets or sets the customer at the specified index
        public Customer this[int index]
        {
            get { return customerList[index]; }
        }

        //Gets the customer with the specified name
        public Customer this[string name]
        {
            get
            {
                foreach (Customer c in customerList)
                    if (c.Name == name) return c;
                return null;
            }
        }

        //Gets list of customers from session state. Creates a new session 
        //state item if one doesnt exist.
        public static CustomerList GetCustomers()
        {
            CustomerList custList = (CustomerList)HttpContext.Current.Session["ContactList"];
            if (custList == null)
                HttpContext.Current.Session["ContactList"] = new CustomerList();
            return (CustomerList)HttpContext.Current.Session["ContactList"];
        }

        //Add a customer to the list of customers
        public void AddItem(Customer customer)
        {
            Customer cust = new Customer();
            cust = customer;
            customerList.Add(cust);
        }

        //Removes customer at the specified index from the list of customer
        public void RemoveAt(int index)
        {
            customerList.RemoveAt(index);
        }

        //Clears the list of customers
        public void Clear()
        {
            customerList.Clear();
        }
    }

