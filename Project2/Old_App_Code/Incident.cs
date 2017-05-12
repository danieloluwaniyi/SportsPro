using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

    public class Incident
    {
        public int CustomerID { get; set; }
        public int IncidentID { get; set; }
        public int ResponseTime { get; set; }
        public int TechEfficiency { get; set; }
        public int Resolution { get; set; }
        public string Comments { get; set; }
        public string ProductCode { get; set; }
        public bool Contact { get; set; }
        public string ContactBy { get; set; }
        public string DateClosed { get; set; }
        public string DateOpened { get; set; }
        public string Title { get; set; }
        public string CustomerIncidentDisplay()
        {

            string displayString = string.Format("Incident for product {0} closed {1}({2})",
                this.ProductCode,
                this.DateClosed,
                this.Title);
            return displayString;
        }
    }
