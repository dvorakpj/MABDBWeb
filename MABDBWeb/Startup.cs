using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MABDBWeb.Startup))]
namespace MABDBWeb
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
