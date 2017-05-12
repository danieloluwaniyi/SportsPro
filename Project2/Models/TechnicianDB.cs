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
    public class TechnicianDB
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static IEnumerable GetAllTechnicians()
        {
            List<Technician> techList = new List<Technician>();
            string sel =
                "SELECT TechID, Name, Email, Phone FROM Technicians " +
                "ORDER BY Name";
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand(sel, con))
                {
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    Technician technician;
                    while (rdr.Read())
                    {
                        technician = new Technician();
                        technician.TechID = rdr["TechID"].ToString();
                        technician.Name = rdr["Name"].ToString();
                        technician.Email = rdr["Email"].ToString();
                        technician.Phone = rdr["Phone"].ToString();
                        techList.Add(technician);
                    }
                    rdr.Close();
                }
            }

            return techList;

            
          
        }

        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }
    }
}