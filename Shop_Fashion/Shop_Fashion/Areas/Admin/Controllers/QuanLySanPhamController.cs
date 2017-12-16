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
    public class QuanLySanPhamController : Controller
    {
        // GET: Admin/QuanLySanPham
        MyContext db = new MyContext();
        [CustomAuthorizeAttribute(Roles = "Admin")]
        public ActionResult Index()
        {
            return View();
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        public ActionResult Loai()
        {
            ViewBag.Nhom = db.Groups.ToList();
            var L = db.Categories.ToList();
            return View(L);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        [HttpGet]
        public ActionResult ThemNhom()
        {

            return View();
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        [HttpPost]
        public ActionResult ThemNhom(Group G)
        {
            if (ModelState.IsValid)
            {
                var dao = new GroupF();
                int id = dao.Insert(G);
                if (id > 0)
                {
                    return RedirectToAction("Loai", "QuanLySanPham");
                }
                else
                {
                    ModelState.AddModelError("", "Them loại không thành công");
                }
            }
            ViewBag.Nhom = db.Groups.ToList();

            var L = db.Categories.ToList();
            return View("Loai", L);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        [HttpGet]
        public ActionResult ChinhSuaNhom(int id)
        {
            var Nhom = db.Groups.ToList();
            var item = Nhom.SingleOrDefault(x => x.Id == id);
            return View(item);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        [HttpPost]
        public ActionResult ChinhSuaNhom(Group G)
        {

            if (ModelState.IsValid)
            {
                var dao = new GroupF();
                bool id = dao.Update(G);
                if (id == true)
                {
                    return RedirectToAction("Loai", "QuanLySanPham");
                }
                else
                {
                    ModelState.AddModelError("", "Them loại không thành công");
                }
            }
            return View("Loai");
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        public ActionResult ChiTietLoai(int id)
        {
            var P = db.Products.ToList();
            var Pd = P.Where(x => x.IdCategories.Equals(id));
            var a = db.Suppliers.ToList();
            ViewBag.nsx = a;

            ViewBag.l = db.Categories.Where(x => x.Id.Equals(id)).FirstOrDefault();

            return View(Pd);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        [HttpGet]
        public ActionResult ThemLoai(int id)
        {
            var G = db.Groups.ToList();
            ViewBag.Nh = G.SingleOrDefault(x => x.Id == id);

            var Loai = new Category();
            Loai.IdGroup = id;
            return View(Loai);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        [HttpPost]
        public ActionResult ThemLoai(Category Cate)
        {
            if (ModelState.IsValid)
            {
                var dao = new CategoryF();
                Cate.Id = -1;
                bool id = dao.Insert(Cate);
                if (id)
                {
                    return RedirectToAction("Loai", "QuanLySanPham");
                }
                else
                {
                    ModelState.AddModelError("", "Them loại không thành công");
                }
            }
            ViewBag.Nhom = db.Groups.ToList();
            var L = db.Categories.ToList();
            return View("Loai", L);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]

        [HttpGet]
        public ActionResult ChinhSuaLoai(int id)
        {
            var Loai = db.Categories.ToList();
            var item = Loai.SingleOrDefault(x => x.Id == id);
            return View(item);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        [HttpPost]
        public ActionResult ChinhSuaLoai(Category Cate)
        {

            if (ModelState.IsValid)
            {
                var dao = new CategoryF();
                bool id = dao.Update(Cate);
                if (id == true)
                {
                    return RedirectToAction("Loai", "QuanLySanPham");
                }
                else
                {
                    ModelState.AddModelError("", "Them loại không thành công");
                }
            }
            return View("Loai");
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        public ActionResult ThemSP(int id)
        {

            ViewBag.IdSupplier = db.Suppliers.ToList();
            var G = db.Categories.ToList();
            ViewBag.Nh = G.SingleOrDefault(x => x.Id == id);
            var sp = new Product();
            //Loai.IdGroup = id;
            return View(sp);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        [HttpPost]
        public ActionResult ThemSP(Product Pro)
        {
            ViewBag.IdSupplier = new SelectList(db.Suppliers.ToList().OrderBy(n => n.Id), "Id", "Name");

            if (ModelState.IsValid)
            {
                var dao = new ProductF();
                Pro.Id = -1;
                bool id = dao.Insert(Pro);
                if (id)
                {
                    return RedirectToAction("ChiTietLoai", "QuanLySanPham", new { id = Pro.IdCategories });
                }
                else
                {
                    ModelState.AddModelError("", "Them loại không thành công");
                }
            }
            ViewBag.l = db.Categories.Where(x => x.Id.Equals(Pro.IdCategories)).FirstOrDefault();
            return View("ChiTietLoai");
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        [HttpGet]
        public ActionResult ChinhSuaSP(int id)
        {
            ViewBag.IdSupplier = db.Suppliers.ToList();
            ViewBag.IdCategories = db.Categories.ToList();
            var G = db.Categories.ToList();
            ViewBag.Nh = G.SingleOrDefault(x => x.Id == id);
            var Pro = db.Products.ToList();
            var item = Pro.SingleOrDefault(x => x.Id == id);
            return View(item);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        [HttpPost]
        public ActionResult ChinhSuaSP(Product Pro)
        {
            if (ModelState.IsValid)
            {
                var dao = new ProductF();
                bool id = dao.Update(Pro);
                if (id)
                {
                    return RedirectToAction("ChiTietLoai", "QuanLySanPham", new { id = Pro.IdCategories });
                }
                else
                {
                    ModelState.AddModelError("", "Không thành công");
                }
            }
            ViewBag.l = db.Categories.Where(x => x.Id.Equals(Pro.IdCategories)).FirstOrDefault();
            return View("ChiTietLoai");
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        public ActionResult ChiTietSP(int id)
        {
            var a = db.Suppliers.ToList();
            ViewBag.nsx = a;
            var b = db.Categories.ToList();
            ViewBag.l = b;
            var G = db.Categories.ToList();
            ViewBag.Nh = G.SingleOrDefault(x => x.Id == id);
            var Pro = db.Products.ToList();
            var item = Pro.SingleOrDefault(x => x.Id == id);
            return View(item);

        }
    }
}