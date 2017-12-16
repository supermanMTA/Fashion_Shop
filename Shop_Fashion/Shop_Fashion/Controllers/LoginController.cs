using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Text.RegularExpressions;
using Shop_Fashion.Models.Entities;
using Shop_Fashion.Models.DAL;
namespace Shop_Fashion.Controllers
{
    public class LoginController : Controller
    {
        public CustomerF customerF = new CustomerF();
        //
        // GET: /Login/
        
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
        public ActionResult ActionLogin(string user,string pass, string ReturnURL )
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
            var acc = new CustomerF().Login(user,pass);
            if (acc == null)
            {
                ModelState.AddModelError("", "Người dùng không tồn tại");
                return View("Index");
            }
            else
            {               
                Session[Common.Session.USER_SESSION] = acc;
                if(string.IsNullOrEmpty(ReturnURL))
                {
                    return RedirectToAction("Index", "Home");
                }
                return Redirect(ReturnURL);
            }
        }
        public ActionResult Logout()
        {
            Session[Common.Session.USER_SESSION] = null;
            return RedirectToAction("Index", "Home");
        }

        [HttpPost]
        public ActionResult Register(Customer model, string RePassword)
        {
            ViewBag.register = true;
            if (string.IsNullOrWhiteSpace(model.Email))
            {
                ModelState.AddModelError("", "Bạn chưa nhập email");
                return View("Index", model);
            }

            if (Regex.Match(model.Email, @"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)").Success == false)
            {
                ModelState.AddModelError("", "Email của bạn không hợp lệ");
                return View("Index", model);
            }

            if (string.IsNullOrWhiteSpace(model.FullName))
            {
                ModelState.AddModelError("", "Bạn chưa điền tên");
                return View("Index", model);
            }

            if (string.IsNullOrWhiteSpace(model.Password))
            {
                ModelState.AddModelError("", "Bạn chưa nhập mật khẩu");
                return View("Index", model);
            }

            if (RePassword.Equals(model.Password) == false)
            {
                ModelState.AddModelError("", "Mật khẩu không khớp");
                return View("Index", model);
            }

            if (string.IsNullOrWhiteSpace(model.Phone))
            {
                ModelState.AddModelError("", "Bạn chưa nhập số điện thoại");
                return View("Index", model);
            }

            if (Regex.Match(model.Phone, @"^[0-9]{10,13}$").Success == false)
            {
                ModelState.AddModelError("", "Số điện thoại không hợp lệ");
                return View("Index", model);
            }

            if (string.IsNullOrWhiteSpace(model.Address))
            {
                ModelState.AddModelError("", "Bạn chưa nhập địa chỉ");
                return View("Index", model);
            }

            if (customerF.FindEntity(model.Username) != null)
            {
                ModelState.AddModelError("", "Tài khoản đã tồn tại");
                return View("Index", model);
            }
            customerF.Insert(model);
            //  helper.UserInRoleF.Insert(model.Email, 2);
            ModelState.AddModelError("", "Đã đăng ký thành công");
            return View("Index", model);

        }
 
	}
}