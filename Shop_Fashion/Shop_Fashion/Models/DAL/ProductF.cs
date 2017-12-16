using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shop_Fashion.Models.Entities;
using Shop_Fashion.ViewModel;
using PagedList;
namespace Shop_Fashion.Models.DAL
{
    public class ProductF
    {
        private MyContext context;

        public ProductF()
        {
            context = new MyContext();
        }

        // Trả về toàn bộ dữ liệu
        public IQueryable<Product> Products
        {
            get { return context.Products; }
        }
        public IQueryable<Product> ProductSell
        {
            get { return context.Products.Where(p => p.Status == true); }
        }
        // Trả về một đối tượng  khi biết Khóa
        public Product FindEntity(int Id)
        {
            Product dbEntry = context.Products.Find(Id);
            return dbEntry;
        }
        public ProductViewDetailModel GetProductDetail(int id)
        {
            var model = from a in context.Products
                        where a.Id == id
                        select new ProductViewDetailModel
                        {
                            maSanPham = a.Id,
                            tenSanPham = a.Name,
                            giaSanPham = (double)(a.UnitPrice > a.SaleOff ? a.SaleOff : a.UnitPrice),
                            mauSac = a.Color,
                            soLuong = (int)a.Quantity,
                            ngayTao = (DateTime)a.DateProduct,
                            urlAnh = a.Image,
                            size = a.Size,
                            moTa = a.Description,
                            NameSupplier = context.Suppliers.Where(p => p.Id == a.IdSuppnier).FirstOrDefault().Name,
                            ReviewProduct = context.Reviews.Where(p => p.ProductID == id).ToList(),
                           // Recommended = context.Products.Where(p => p.IdCategories == a.IdCategories).ToList()
                        };
            return model.FirstOrDefault();
        }
      
        // Thêm một đối tượng
        public bool Insert(Product model)
        {
            Product dbEntry = context.Products.Find(model.Id);

            if (dbEntry != null)
            {
                return false;
            }
            context.Products.Add(model);
            context.SaveChanges();

            return true;
        }

        // Sửa một đối tượng
        public bool Update(Product model)
        {
            Product dbEntry = context.Products.Find(model.Id);
            //   LoaiBanDoc dbEntry = context.LoaiBanDocs.
            //  Where(x => x.LoaiBanDoc1 = model.LoaiBanDoc1).FirstOrDefault();
            if (dbEntry == null)
            {
                return false;
            }
            dbEntry.Id = model.Id;
            dbEntry.Name = model.Name;
            dbEntry.Description = model.Description;
            dbEntry.UnitPrice = model.UnitPrice;
            dbEntry.Image = model.Image;
            dbEntry.DateProduct = model.DateProduct;
            dbEntry.IdCategories = model.IdCategories;
            dbEntry.IdSuppnier = model.IdSuppnier;
            dbEntry.Color = model.Color;
            dbEntry.Size = model.Size;
            dbEntry.Quantity = model.Quantity;
            // Sửa các trường khác cũng như vậy
            context.SaveChanges();

            return true;
        }

        // Xóa một đối tượng
        public bool Delete(string ID)
        {
            Product dbEntry = context.Products.Find(ID);
            if (dbEntry == null)
            {
                return false;
            }
            context.Products.Remove(dbEntry);

            context.SaveChanges();
            return true;
        }
       public HomeViewModel Get()
        {
            HomeViewModel model = new HomeViewModel();
            model.SPM = context.Products.OrderByDescending(p => p.DateProduct).Take(10).ToList();
            model.SPKM = context.Products.OrderByDescending(p => ((double)p.SaleOff / p.UnitPrice)).Take(10).ToList();
            
            return model;
        }
    }
}