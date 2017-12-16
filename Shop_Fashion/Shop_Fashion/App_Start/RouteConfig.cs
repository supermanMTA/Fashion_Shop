using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Shop_Fashion
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Home",
                url: "trang-chu",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Shop_Fashion.Controllers" }
            );

           
            routes.MapRoute(
               name: "Add Cart",
               url: "gio-hang",
               defaults: new { controller = "Cart", action = "Index", id = UrlParameter.Optional },
               namespaces: new[] { "Shop_Fashion.Controllers" }
           );

            routes.MapRoute(
              name: "Order",
              url: "don-hang",
              defaults: new { controller = "Order", action = "Index", id = UrlParameter.Optional },
              namespaces: new[] { "Shop_Fashion.Controllers" }
          );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] {"Shop_Fashion.Controllers"}
            );
        }
    }
}
