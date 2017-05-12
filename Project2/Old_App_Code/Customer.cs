using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace Project2
{
    public class Customer
    {
        public String CustomerID { get; set; }

        public String Name { get; set; }

        public String Address { get; set; }

        public String City { get; set; }

        public String State { get; set; }
        public String Zip { get; set; }
        public String Phone { get; set; }
        public String Email { get; set; }

        public string Display()
        {
            string displayString = string.Format("{0}: {1}; {2}",
                this.Name,
                this.Phone,
                this.Email);
            return displayString;
        }
    }

}