using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shop_Fashion.Models.DAL;
using Shop_Fashion.Models.Entities;
namespace Shop_Fashion.Controllers
{
    public class OrderController : Controller
    {
        // GET: Order
        MyContext context = new MyContext();
        public ActionResult Index()
        {
            
            var acc = (Shop_Fashion.Models.Entities.Account)Session[Shop_Fashion.Common.Session.USER_SESSION];
            var model = context.Orders.Where(p => p.Customer == acc.UserName).OrderBy(p=>p.TinhTrang).ToList();
            return View( model);
        }
       public ActionResult Details(int id,int Status)
        {

            var model = new OrderF().GetByID(id);
            ViewBag.status = Status;
            ViewBag.Thanhtien = context.Orders.Find(id).Amount;
            ViewBag.ID = id;
            return View(model);
        }
        [HttpPost]
        public JsonResult Remove(int id)
        {
            try
            {
                var order = context.Orders.Find(id);
                order.TinhTrang = 2;
                context.SaveChanges();
                return Json(new
                {
                    status = true
                });
            }
            catch
            {
                return Json(new
                {
                    status = false
                });
            }
        }
    }
}