using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shop_Fashion.Models.Entities;
namespace Shop_Fashion.Models.DAL
{
    public class SupplierF
    {
        private MyContext context;

        public SupplierF()
        {
            context = new MyContext();
        }

        // Trả về toàn bộ dữ liệu
        public IQueryable<Supplier> Suppliers
        {
            get { return context.Suppliers; }
        }

        // Trả về một đối tượng  khi biết Khóa
        public Supplier FindEntity(int Id)
        {
            Supplier dbEntry = context.Suppliers.Find(Id);
            return dbEntry;
        }

        // Thêm một đối tượng
        public bool Insert(Supplier model)
        {
            Supplier dbEntry = context.Suppliers.Find(model.Id);

            if (dbEntry != null)
            {
                return false;
            }
            context.Suppliers.Add(model);

            context.SaveChanges();

            return true;
        }

        // Sửa một đối tượng
        public bool Update(Supplier model)
        {
            Supplier dbEntry = context.Suppliers.Find(model.Id);
            //   LoaiBanDoc dbEntry = context.LoaiBanDocs.
            //  Where(x => x.LoaiBanDoc1 = model.LoaiBanDoc1).FirstOrDefault();
            if (dbEntry == null)
            {
                return false;
            }
            dbEntry.Id = model.Id;
            dbEntry.Name = model.Name;
            dbEntry.Logo = model.Logo;
            dbEntry.Phone = model.Phone;
            dbEntry.Email = model.Email;
            // Sửa các trường khác cũng như vậy
            context.SaveChanges();

            return true;
        }

        // Xóa một đối tượng
        public bool Delete(int id)
        {
            Supplier dbEntry = context.Suppliers.Find(id);
            if (dbEntry == null)
            {
                return false;
            }
            context.Suppliers.Remove(dbEntry);

            context.SaveChanges();
            return true;
        }
    }
}