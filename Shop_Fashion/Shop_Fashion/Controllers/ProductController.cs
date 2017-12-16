using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using Shop_Fashion.Models.DAL;
using Shop_Fashion.Models.Entities;
using Shop_Fashion.Models.Security;

namespace Shop_Fashion.Controllers
{ 
    public class ProductController : Controller
    {
        
    
        // GET: Product
        public ActionResult Index(int? GroupID,int? CategoryID,int? SupplierID, string  search, int? page, int? NumberPage)
        {
          //  service.ListAll(
            List<Product> model = new ProductF().ProductSell.ToList();
            ViewBag.category = CategoryID;
            ViewBag.Supplier = SupplierID;
            ViewBag.group = GroupID;
            ViewBag.numberpage = NumberPage;
            ViewBag.search = search;
            
            if (CategoryID != null)
            {
                model = model.Where(p=> p.IdCategories == CategoryID).ToList();
                Category category = new CategoryF().FindEntity(CategoryID.GetValueOrDefault(0));
                ViewBag.Parent = category.Name;
                ViewBag.ID = CategoryID;
               
            }
            if (SupplierID != null)
            {
                model = model.Where(p => p.IdSuppnier == SupplierID).ToList();
                Supplier supplier = new SupplierF().FindEntity(SupplierID.GetValueOrDefault(0));
                ViewBag.Parent = supplier.Name;
                ViewBag.ID = SupplierID;
               
            }
            if (GroupID != null)
            {
                List<Category> category = new CategoryF().Categorys.Where(p => p.IdGroup == GroupID).ToList();
                List<Product> product = new ProductF().ProductSell.ToList();
                model.Clear();              
                foreach (var item in product)
                {
                    if (category.Exists(x => x.Id == item.IdCategories))
                    {
                        model.Add(new ProductF().FindEntity(item.Id));
                    }
                }

                ViewBag.Parent  = new GroupF().FindEntity((int)GroupID).Name;
                ViewBag.ID = GroupID;
               
            }
            if (search != null)
            {
                 model = new ProductF().Products.Where(p => p.Name.Contains(search)).ToList();
                //model = client.ListAll().Where(p => p.Name.Contains(search)).ToList();
            }
            return View(model.ToPagedList(page?? 1,NumberPage?? 6));
        }
  
        public ActionResult Productdetail(int id)
        {
            var model = new ProductF().GetProductDetail(id);
            return View(model);
        }
       
        [CustomAuthorizeAttribute(Roles = "User")]
        [HttpPost]
        public ActionResult AddReview(string Status,int IdProduct)
        {
            Review re = new Review();
            re.Status = Status;
            Account acc = (Account)Session[Common.Session.USER_SESSION];
            re.Username = acc.UserName;
            re.ProductID = IdProduct;
            re.date = DateTime.Now;
            try
            {
                var id = new ReviewF().Insert(re);              
                var model  = new ProductF().GetProductDetail(IdProduct);
                return View("Productdetail",model);
            }
            catch { }
            return View("Index","Home");
        }
        
    }
}