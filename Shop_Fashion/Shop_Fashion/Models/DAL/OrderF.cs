using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shop_Fashion.Models.Entities;
using Shop_Fashion.ViewModel;
namespace Shop_Fashion.Models.DAL
{
    public class OrderF
    {
        private MyContext context;

        public OrderF()
        {
            context = new MyContext();
        }

        // Trả về toàn bộ dữ liệu
        public IQueryable<Order> Orders
        {
            get { return context.Orders; }
        }

        // Trả về một đối tượng  khi biết Khóa
        public Order FindEntity(string Id)
        {
            Order dbEntry = context.Orders.Find(Id);
            return dbEntry;
        }
        public List<OrderViewModel> GetByID(int ID)
        {
            var model = (
                     from dt in context.OrderDetails.Where(p => p.IdOrder == ID).ToList()
                     from pd in context.Products.Where(p => p.Id == dt.IdProduct).ToList()
                     select new OrderViewModel
                     {
                         tenSP = pd.Name,
                         gia = (double)pd.UnitPrice,
                         SL =(int) dt.Quantity,
                         Thanhtien =(double) dt.Amount,
                     }
                 ).ToList();

           

            return model;

        }
        //// Thêm một đối tượng
        public int Insert(Order model)
        {
            Order dbEntry = context.Orders.Find(model.Id);

            if (dbEntry != null)
            {
                return -1;
            }
            context.Orders.Add(model);

            context.SaveChanges();

            return model.Id;
        }

        // Sửa một đối tượng
        public bool Update(Order model)
        {
            Order dbEntry = context.Orders.Find(model.Id);
            //   LoaiBanDoc dbEntry = context.LoaiBanDocs.
            //  Where(x => x.LoaiBanDoc1 = model.LoaiBanDoc1).FirstOrDefault();
            if (dbEntry == null)
            {
                return false;
            }
            dbEntry.Id = model.Id;
            dbEntry.Address = model.Address;
            dbEntry.Amount = model.Amount;
            dbEntry.Email = model.Email;

            dbEntry.Customer = model.Customer;
            dbEntry.OrderDate = model.OrderDate;
            dbEntry.Phone = model.Phone;
            dbEntry.Receiver = model.Receiver;

            // Sửa các trường khác cũng như vậy
            context.SaveChanges();

            return true;
        }

        // Xóa một đối tượng
        public bool Delete(int id)
        {
            Order dbEntry = context.Orders.Find(id);
            if (dbEntry == null)
            {
                return false;
            }
            context.Orders.Remove(dbEntry);

            context.SaveChanges();
            return true;
        }
    }
}