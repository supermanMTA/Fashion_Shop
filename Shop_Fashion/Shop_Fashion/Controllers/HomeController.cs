using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shop_Fashion.Models.DAL;
using Shop_Fashion.Models.Entities;
using Shop_Fashion.ViewModel;
using Shop_Fashion.Models.Security;


namespace Shop_Fashion.Controllers
{
    public class HomeController : Controller
    {      
        // GET: /Home/
        public ActionResult Index()
        {
            var model = new ProductF().Get();
            return View(model);
        }
        public ActionResult HeaderMenu()
        {
            var model = new CategoryF().ListCategory();
            return PartialView("_PartialHeader", model);
        }
        public ActionResult FooterMenu()
        {
            var model = new CategoryF().ListCategory();
            return PartialView("_PartialFooter", model);
        }
        public ActionResult LeftMenu()
        {
            var model = new CategoryF().ListCategory();
            return PartialView("_PartialMenu", model);
        }
        public ActionResult Search(string search)
        {
            MyContext db = new MyContext();
            var model = db.Products.Where(p => p.Name.Contains(search)).ToList();
            return View(model);
        }
        
       
    }
}