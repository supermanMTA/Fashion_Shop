using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shop_Fashion.Models.Entities;
using Shop_Fashion.ViewModel;

namespace Shop_Fashion.Models.DAL
{
    public class CategoryF
    {
        private MyContext context;

        public CategoryF()
        {
            context = new MyContext();
        }

        // Trả về toàn bộ dữ liệu
        public IQueryable<Category> Categorys
        {
            get { return context.Categories; }
        }
        public GroupViewModel ListCategory()
        {            
            var model1 = new GroupViewModel();
            model1.ListGroup = context.Groups.ToList();
            model1.ListCategory = context.Categories.ToList();
            model1.ListSupplier = context.Suppliers.ToList();
            return model1;
        }
        // Trả về một đối tượng  khi biết Khóa
        public Category FindEntity(int Id)
        {
            Category dbEntry = context.Categories.Find(Id);
            return dbEntry;
        }

        // Thêm một đối tượng
        public bool Insert(Category model)
        {
            Category dbEntry = context.Categories.Find(model.Id);

            if (dbEntry != null)
            {
                return false;
            }
            context.Categories.Add(model);

            context.SaveChanges();

            return true;
        }

        // Sửa một đối tượng
        public bool Update(Category model)
        {
            Category dbEntry = context.Categories.Find(model.Id);
            //   LoaiBanDoc dbEntry = context.LoaiBanDocs.
            //  Where(x => x.LoaiBanDoc1 = model.LoaiBanDoc1).FirstOrDefault();
            if (dbEntry == null)
            {
                return false;
            }
            dbEntry.Id = model.Id;
            dbEntry.Name = model.Name;
            dbEntry.IdGroup = model.IdGroup;


            // Sửa các trường khác cũng như vậy
            context.SaveChanges();

            return true;
        }

        // Xóa một đối tượng
        public bool Delete(string MaSP)
        {
            Category dbEntry = context.Categories.Find(MaSP);
            if (dbEntry == null)
            {
                return false;
            }
            context.Categories.Remove(dbEntry);

            context.SaveChanges();
            return true;
        }
    }
}