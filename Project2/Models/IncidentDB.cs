using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Project2.Models
{
    [DataObject]
    public class IncidentDB
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IEnumerable GetOpenTechIncidents(int techID)
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            string sel =
                "SELECT Incidents.DateOpened, Customers.Name AS Customer, Products.Name AS Product FROM Incidents "
                +"INNER JOIN Customers ON Incidents.CustomerID = Customers.CustomerID INNER JOIN "
                +"Products ON Incidents.ProductCode = Products.ProductCode WHERE(Incidents.TechID = @TechID)";

            SqlCommand cmd = new SqlCommand(sel, con);
            cmd.Parameters.AddWithValue("@TechID", techID);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            return rdr;
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings[
                "ConnectionString"].ConnectionString;
        }
    }

}