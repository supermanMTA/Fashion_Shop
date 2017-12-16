using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shop_Fashion.Models.DAL;
using Shop_Fashion.Models.Entities;
namespace Shop_Fashion.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/LoginAdmin
        public ActionResult Index()
        {
            string url = null;
            try
            {
                url = System.Web.HttpContext.Current.Request.UrlReferrer.ToString();
            }
            catch { }
            ViewBag.ReturnURL = url;
            //ViewBag.ReturnURL = ReturnUrl;
            return View();

        }
        // GET: /Login/       
        public ActionResult ActionLogin(string user, string pass, string ReturnURL)
        {
            ViewBag.Login = true;

            if (String.IsNullOrEmpty(user))
            {
                ModelState.AddModelError("", "Chưa nhập tên đăng nhập");
                return View("Index");
            }
            if (String.IsNullOrEmpty(pass))
            {
                ModelState.AddModelError("", "Chưa nhập mật khẩu");
                return View("Index");
            }
            var acc = new CustomerF().Login(user, pass);

            if (acc == null)
            {
                ModelState.AddModelError("", "Người dùng không tồn tại");
                return View("Index");
            }
            else
            {
                MyContext context = new MyContext();
                var ac = context.UserInRoles.Where(p => p.UserName == acc.UserName & p.Status == true).FirstOrDefault();
                if (ac != null) {
                    Session[Common.Session.USER_SESSION] = acc;
                    if (string.IsNullOrEmpty(ReturnURL))
                    {
                        return RedirectToAction("DonHang", "QuanLyDonHang");
                    }
                    return Redirect(ReturnURL);
                }
                else { return RedirectToAction("Index","Login"); }
                    
            }
        }
        public ActionResult Logout()
        {
            Session[Common.Session.USER_SESSION] = null;
            return RedirectToAction("Index", "Login");
        }
    }
}