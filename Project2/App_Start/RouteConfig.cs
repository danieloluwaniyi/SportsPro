using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace Project2
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Temporary;
            routes.EnableFriendlyUrls(settings);

            //map static routes
            routes.MapPageRoute("TechSupportUpdateIncidents","TechSupport/IncidentUpdate", "~/IncidentUpdate.aspx");
            routes.MapPageRoute("TechSupportDisplayIncidents", "TechSupport/CustomerIncidentDisplay", "~/CustomerIncidentDisplay.aspx");

            routes.MapPageRoute("CustomerSupportRegisterProducts", "CustomerSupport/ProductRegistration", "~/ProductRegistration.aspx");
            routes.MapPageRoute("CustomerSupportCompleteSurvey", "CustomerSupport/CustomerSurvey", "~/CustomerSurvey.aspx");
        }
    }
}
