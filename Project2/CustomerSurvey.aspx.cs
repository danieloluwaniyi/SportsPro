using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project2
{
    public partial class CustomerSurvey : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            customerID.Focus();
            //lstIncident.Items.Clear();
        }

        protected void btnGetIncidents_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)// If the Page is Valid, enable controls
            {
                lstIncident.Focus();
                lstIncident.Items.Clear();
                this.GetSelectedIncident();
                if (lstIncident.Items.Count > 1)
                {
                    lstIncident.Enabled = true;
                    rdioContact.Enabled = true;
                    rdioEfficiency.Enabled = true;
                    rdioResolution.Enabled = true;
                    txtComments.Enabled = true;
                    rdioResponse.Enabled = true;
                    CheckBox1.Enabled = true;
                    btnSubmit.Enabled = true;
                    lblValid.Visible = false;
                    lstIncident.SelectedIndex = 1;
                }
                else
                {
                    lstIncident.Enabled = false;
                    rdioContact.Enabled = false;
                    rdioEfficiency.Enabled = false;
                    rdioResolution.Enabled = false;
                    txtComments.Enabled = false;
                    rdioResponse.Enabled = false;
                    CheckBox1.Enabled = false;
                    lblValid.Visible = true;
                    //btnSubmit.Enabled = false;
                }
            }

        }

        private void GetSelectedIncident()
        {
            DataView incidentTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            incidentTable.RowFilter = "DateClosed is NOT NULL and CustomerID ='" + customerID.Text + "'";

            Incident incident = new Incident();

            lstIncident.Items.Add(new ListItem("--Select an Incident--", null));
            foreach (DataRowView incidentRows in incidentTable)
            {
                DataRowView row = incidentTable[0];
                incident.CustomerID = Convert.ToInt32(incidentRows["CustomerID"]);
                incident.IncidentID = Convert.ToInt32(incidentRows["IncidentID"]);
                incident.ProductCode = incidentRows["ProductCode"].ToString();
                incident.TechEfficiency = Convert.ToInt32(incidentRows["TechID"]);
                incident.Title = incidentRows["Title"].ToString();
                incident.DateClosed = incidentRows["DateClosed"].ToString();
                incident.DateOpened = incidentRows["DateOpened"].ToString();

                lstIncident.Items.Add(incident.CustomerIncidentDisplay());
            }


        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Survey survey = new Survey();
                survey.CustomerID = Convert.ToInt32(customerID.Text.ToString());
                survey.IncidentID = Convert.ToInt32(lstIncident.SelectedIndex);
                survey.ResponseTime = Convert.ToInt32(rdioResponse.SelectedValue);
                survey.TechEfficiency = Convert.ToInt32(rdioEfficiency.SelectedValue);
                survey.Resolution = Convert.ToInt32(rdioResolution.SelectedValue);
                survey.Comments = txtComments.Text;

                bool contactMethod;
                if (CheckBox1.Checked)
                {
                    contactMethod = true;
                }
                else
                {
                    contactMethod = false;
                }

                Session.Add("SessionContact", contactMethod);
                Response.Redirect("/SurveyComplete");
            }

        }
    } 
}