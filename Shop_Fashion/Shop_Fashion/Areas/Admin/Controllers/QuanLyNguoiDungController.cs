using Shop_Fashion.Models.Entities;
using Shop_Fashion.Models.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shop_Fashion.Models.Security;
namespace Shop_Fashion.Areas.Admin.Controllers
{
    public class QuanLyNguoiDungController : Controller
    {
        // GET: Admin/QuanLyNguoiDung
        MyContext db = new MyContext();
        public ActionResult Index()
        {
            return View();
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        public ActionResult DanhSachAD()
        {
            var U = db.UserInRoles.ToList();
            var list = U.Where(a => a.IDRole.Equals(1));

            return View(list);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        public ActionResult ChiTietAD(string user)
        {
            var U = db.Customers.ToList();
            var item = U.Where(a => a.Username.Equals(user)).FirstOrDefault();

            return View(item);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        public ActionResult DanhSachUser()
        {
            var U = db.UserInRoles.ToList();
            var list = U.Where(a => a.IDRole.Equals(2));
            ViewBag.list = list;
            var Cus = db.Customers.ToList();
            List<Customer> lists = new List<Customer>();
            foreach (var item in list)
            {
                lists.Add(Cus.Where(x => x.Username.Equals(item.UserName)).FirstOrDefault());
            }
            return View(lists);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        public ActionResult ChiTietUser(string user)
        {
            var U = db.Customers.ToList();
            var item = U.Where(a => a.Username.Equals(user)).FirstOrDefault();

            return View(item);
        }


        [HttpGet]
        public ActionResult ChinhSuaAD(string user)
        {
            var U = db.UserInRoles.ToList();
            var User = U.Where(a => a.IDRole.Equals(1));
            var item = User.SingleOrDefault(x => x.UserName == user);
            return View(item);
        }

        [HttpPost]
        public ActionResult ChinhSuaAD(UserInRole Cus)
        {

            if (ModelState.IsValid)
            {
                var dao = new UserInRoleF();
                bool id = dao.Update(Cus);
                if (id == true)
                {
                    return RedirectToAction("DanhSachAD", "QuanLyNguoiDung");
                }
                else
                {
                    ModelState.AddModelError("", "Them loại không thành công");
                }
            }
            var U = db.UserInRoles.ToList();
            var list = U.Where(a => a.IDRole.Equals(1));

            return View("DanhSachAD", list);
        }
        [HttpGet]
        public ActionResult ChinhSuaChiTietAD(string user)
        {
            var Cus = db.Customers.ToList();
            var item = Cus.SingleOrDefault(x => x.Username == user);
            return View(item);
        }
        [HttpPost]
        public ActionResult ChinhSuaChiTietAD(Customer Cus)
        {

            if (ModelState.IsValid)
            {
                var dao = new CustomerF();
                bool id = dao.Update(Cus);
                if (id == true)
                {
                    return RedirectToAction("DanhSachAD", "QuanLyNguoiDung");
                }
                else
                {
                    ModelState.AddModelError("", "Them loại không thành công");
                }
            }
            var U = db.UserInRoles.ToList();
            var list = U.Where(a => a.IDRole.Equals(1));


            return View("DanhSachAD", list);
        }
    }
}