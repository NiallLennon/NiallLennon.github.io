using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BusinessService.Startup))]
namespace BusinessService
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
            app.MapSignalR();
        }
    }
}
