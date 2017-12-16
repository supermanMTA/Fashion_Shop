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
    public class CartController : Controller
    {
        //
        // GET: /Cart/

        private const string CartSession = "CartSession";

        public ActionResult Index()
        {
            var cart = (Cart)Session[Common.Session.CART_SESSION];

            var list = new List<CartItem>();

            if (cart != null)
            {
                list = cart.Lines.ToList();
                ViewBag.TongTien = cart.ComputeTotalValue();
            }

            return View(list);
        }
        public JsonResult AddItem(int Id)
        {
            string url = "/Home/Index";
            try
            {
                url = System.Web.HttpContext.Current.Request.UrlReferrer.ToString();
            }
            catch { }
            var product = new ProductF().GetProductDetail(Id);
            if(product.soLuong==0) return Json(new
            {
                status = false
            });

            var cart = (Cart)Session[Common.Session.CART_SESSION];

            if (cart != null)
            {
                cart.AddItem(product, 1);
                //Gán vào session
                Session[Common.Session.CART_SESSION] = cart;
            }
            else
            {
                //tạo mới đối tượng cart item
                cart = new Cart();
                cart.AddItem(product, 1);
                //Gán vào session
                Session[Common.Session.CART_SESSION] = cart;
            }
            return Json(new
            {
                status = true
            });

        }
        //
        [HttpPost]
        public ActionResult UpdateCart(int Id, FormCollection fr)
        {

            var product = new ProductF().GetProductDetail(Id);

            var cart = (Cart)Session[Common.Session.CART_SESSION];

            if (cart != null)
            {
                int NewQuantity = int.Parse(fr["txtQuantity"].ToString());
                if(NewQuantity >= product.soLuong) {ModelState.AddModelError("", "Không đủ số lượng"); return RedirectToAction("Index", "Cart"); }
                else {
                    cart.UpdateItem(product, NewQuantity);
                    // Gán vào session
                    Session[Common.Session.CART_SESSION] = cart;
                }
                
                
            }
            else
            {
                //tạo mới đối tượng cart item
                cart = new Cart();
                cart.AddItem(product, 1);
                //Gán vào session
                Session[Common.Session.CART_SESSION] = cart;
               
            }
            return RedirectToAction("Index");
        }
        [HttpPost]
        // GET: /Cart/Details/5
        public JsonResult RemoveLine(int Id)
        {

            var product = new ProductF().FindEntity(Id);

            var cart = (Cart)Session[Common.Session.CART_SESSION];

                cart.RemoveLine(product);
                //Gán vào session
                Session[Common.Session.CART_SESSION] = cart;
                return Json(new
                {
                    status = true
                });            
        }

        public ActionResult Clear()
        {
            var cart = (Cart)Session[Common.Session.CART_SESSION];
            cart.Clear();
            Session[Common.Session.CART_SESSION] = cart;
            return RedirectToAction("Index");
        }
        
        [HttpGet]
        public ActionResult Payment()
        {
            var cart = (Cart)Session[Common.Session.CART_SESSION];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = cart.Lines.ToList();
            }
            return View(list);
        }
       
        [HttpPost]
       
        public JsonResult Payment(string shipName, string mobile, string address, string email,double tongtien)
        {
            var order = new Order();
            order.OrderDate = DateTime.Now;
            order.Address = address;
            order.Phone = mobile;
            order.Receiver = shipName;
            order.Email = email;
            order.Amount = tongtien;
            MyContext context = new MyContext();
            Account acc = (Account)Session[Common.Session.USER_SESSION];            
            order.Customer = acc.UserName;
            order.TinhTrang = 0;
            try
            {
                var id = new OrderF().Insert(order);

                var cart = (Cart)Session[Common.Session.CART_SESSION];

                var detailDao = new OrderDetailF();
                
                foreach (var item in cart.Lines)
                {
                    var orderDetail = new OrderDetail();
                    orderDetail.IdProduct = item.Sanpham.maSanPham;
                    orderDetail.IdOrder = id;                   
                    orderDetail.Quantity = item.Quantity;
                    orderDetail.Amount = item.Sanpham.giaSanPham*item.Quantity;
                    detailDao.Insert(orderDetail);


                    var sp = context.Products.Find(item.Sanpham.maSanPham);
                    sp.Quantity -= item.Quantity;
                    context.SaveChanges();     
                                 
                }
                Session[Common.Session.CART_SESSION] = null;
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
           // return RedirectToAction("Index", "Home");
        }
        //

    
    }
}
