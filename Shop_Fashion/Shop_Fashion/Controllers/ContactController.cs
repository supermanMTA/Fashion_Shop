using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Shop_Fashion.Models.Entities;
using Shop_Fashion.Models.DAL;
using Shop_Fashion.Models.Security;
namespace Shop_Fashion.Controllers
{
    public class ContactController : Controller
    {
        // GET: Contact
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult About()
        {
            return View();
        }
        [CustomAuthorizeAttribute(Roles = "User")]
        [HttpPost]
        public ActionResult contact(string Name, string Email, string Message)
        {
            Contact contact = new Contact();
            contact.Name = Name;
            contact.Message = Message;
            contact.Email = Message;
            try
            {
                var id = new ContactF().Insert(contact);
                return View("Home/Index");
            }
            catch
            {
                ModelState.AddModelError("", "Lỗi");
                return View("Index", "Contact");
            }
            // return View("Index","Home");
        }
    }
}