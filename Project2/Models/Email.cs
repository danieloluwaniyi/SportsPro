using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;


namespace Project2.Models
{
    public class Email
    {
        public static void sendProductRegistrationEmail(string customerID, string productName)

        {
            string email = getEmail(customerID);
            //string email = "dmlrlwny@gmail.com";
            MailMessage msg = new MailMessage("recruitmentapp2017@gmail.com", email, "Product registration",
                "Thank you for registering " + productName + " with us. You will be notified of any future updates.\n\nThe Sports Pro Team");

            SmtpClient client = new SmtpClient("smtp.gmail.com");
           
            client.Credentials = new System.Net.NetworkCredential()
            {
                UserName = "recruitmentapp2017@gmail.com",
                Password = "!RecruitmentApp17"
            };
            client.EnableSsl = true;//using https:// instead of http:
            client.Send(msg);
        }

        private static string getEmail(string customerID)
        {
            Customer customer = new Customer();
            string retVal = "anne@murach.com";

            string sql = "SELECT * FROM customers WHERE CustomerID = " + customerID;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings[
                "ConnectionString"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        retVal = dr["Email"].ToString();

                    }
                    dr.Close();
                }
            }
            return retVal;
        }

    }
}