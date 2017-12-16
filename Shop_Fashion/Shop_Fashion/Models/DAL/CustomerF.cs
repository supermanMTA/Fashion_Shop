using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shop_Fashion.Models.Entities;
namespace Shop_Fashion.Models.DAL
{
    public class CustomerF
    {
        private MyContext context;
        public Account Login(string id, string pass)
        {
            var result = context.Customers.Where(a => a.Username.Equals(id) &&
                                                       a.Password.Equals(pass)).FirstOrDefault();
            Account t = null;
            if (result != null)
            {
                t = new Account();
                t.UserName = result.Username;
                t.Password = result.Password;
                t.FullName = result.FullName;
                t.Roles = (from a in context.Roles
                           join b in context.UserInRoles
                           on a.ID equals b.IDRole
                           where (a.Name != null && b.UserName.Equals(id))
                           select a.Name).ToList();
            }
            return t;
            
        }
        public CustomerF()
        {
            context = new MyContext();
        }

        // Trả về toàn bộ dữ liệu
        public IQueryable<Customer> Customers
        {
            get { return context.Customers; }
        }

        // Trả về một đối tượng  khi biết Khóa
        public Customer FindEntity(string username)
        {
            Customer dbEntry = context.Customers.Find(username);
            return dbEntry;
        }

        // Thêm một đối tượng
        public bool Insert(Customer model)
        {
            Customer dbEntry = context.Customers.Find(model.Username);

            if (dbEntry != null)
            {
                return false;
            }
            context.Customers.Add(model);

            context.SaveChanges();

            return true;
        }

        // Sửa một đối tượng
        public bool Update(Customer model)
        {
            Customer dbEntry = context.Customers.Find(model.Username);
            //   LoaiBanDoc dbEntry = context.LoaiBanDocs.
            //  Where(x => x.LoaiBanDoc1 = model.LoaiBanDoc1).FirstOrDefault();
            if (dbEntry == null)
            {
                return false;
            }
            dbEntry.Username = model.Username;
            dbEntry.Address = model.Address;
            dbEntry.Email = model.Email;
            dbEntry.FullName = model.FullName;
            dbEntry.Password = model.Password;
            dbEntry.Phone = model.Phone;
            // Sửa các trường khác cũng như vậy
            context.SaveChanges();

            return true;
        }

        // Xóa một đối tượng
        public bool Delete(string MaSP)
        {
            Customer dbEntry = context.Customers.Find(MaSP);
            if (dbEntry == null)
            {
                return false;
            }
            context.Customers.Remove(dbEntry);

            context.SaveChanges();
            return true;
        }
    }
}