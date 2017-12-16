using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shop_Fashion.Models.DAL;
using Shop_Fashion.Models.Entities;
using Shop_Fashion.Models.Security;
namespace Shop_Fashion.Areas.Admin.Controllers
{
    public class QuanLyDonHangController : Controller
    {
        // GET: Admin/QuanLyDonHang
        MyContext db = new MyContext();
        [CustomAuthorizeAttribute(Roles = "Admin")]
        public ActionResult Index()
        {
            return View();
        }
        [CustomAuthorize(Roles = "Admin")]
        public ActionResult DonHang()
        {
            var D = db.Orders.ToList();
            return View(D);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        public ActionResult ChiTietDH(int id)
        {
            var D = db.OrderDetails.ToList();


            var pro = D.Where(x => x.IdOrder.Equals(id));
            double? tien = 0;
            foreach (var i in pro)
            {
                tien = tien + i.Amount;
            }
            ViewBag.tien = tien;
            var HD = db.Orders.Where(x => x.Id.Equals(id)).FirstOrDefault();
            ViewBag.HD = HD.Id;



            var a = db.Products.ToList();
            ViewBag.Pd = a;

            return View(pro);
        }

    }
}