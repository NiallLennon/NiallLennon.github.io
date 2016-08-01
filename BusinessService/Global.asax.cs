using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Data.Entity;
using BusinessService.Models;

namespace BusinessService
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Initialize the product database. This initializes the database model and is run when the Application_start method runs. 
            Database.SetInitializer(new ProductDatabaseInitializer());
        }
    }
}

//In the Global.asax file, you add code that initializes the model.
