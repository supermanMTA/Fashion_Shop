using PagedList;
using Shop_Fashion.Models.Entities;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList.Mvc;
using Shop_Fashion.Models.DAL;
using Shop_Fashion.Models.Security;
namespace Shop_Fashion.Areas.Admin.Controllers
{
    public class QuanLyThuongHieuController : Controller
    {
        // GET: Admin/QuanLyThuongHieu
        MyContext db = new MyContext();
        [CustomAuthorizeAttribute(Roles = "Admin")]
        public ActionResult ThuongHieu()
        {
            var model = db.Suppliers.ToList();//.OrderBy(n => n.Id).ToPagedList(page, pageSize);
            return View(model);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        public ActionResult ThemTH()
        {
            var TH = new Supplier();
            return View(TH);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        [HttpPost]

        public ActionResult ThemTH(Supplier S)
        {
            if (ModelState.IsValid)
            {
                var dao = new SupplierF();
                S.Id = -1;
                bool id = dao.Insert(S);
                if (id)
                {
                    return RedirectToAction("ThuongHieu", "QuanLyThuongHieu");
                }
                else
                {
                    ModelState.AddModelError("", "Them loại không thành công");
                }
            }
            var model = db.Suppliers.ToList();
            return View("ThuongHieu", model);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        public ActionResult ChinhsuaTH(int id)
        {
            var list = db.Suppliers.ToList();
            var TH = list.SingleOrDefault(x => x.Id == id);
            return View(TH);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        [HttpPost]

        public ActionResult ChinhsuaTH(Supplier S)
        {
            if (ModelState.IsValid)
            {
                var dao = new SupplierF();

                bool id = dao.Update(S);
                if (id)
                {
                    return RedirectToAction("ThuongHieu");
                }
                else
                {
                    ModelState.AddModelError("", "Them loại không thành công");
                }
            }
            var model = db.Suppliers.ToList();
            return View("ThuongHieu", model);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        public ActionResult XoaTH(int id)
        {
            var TH = new SupplierF();
            TH.Delete(id);
            var model = db.Suppliers.ToList();
            return View("ThuongHieu", model);
        }
    }
}