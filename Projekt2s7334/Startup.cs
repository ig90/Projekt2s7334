using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Projekt2s7334.Startup))]
namespace Projekt2s7334
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
