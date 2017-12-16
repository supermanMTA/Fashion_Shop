using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shop_Fashion.Models.Entities;
namespace Shop_Fashion.Models.DAL
{
    public class OrderDetailF
    {
        private MyContext context;

        public OrderDetailF()
        {
            context = new MyContext();
        }

        // Trả về toàn bộ dữ liệu
        public IQueryable<OrderDetail> OrderDetails
        {
            get { return context.OrderDetails; }
        }

        // Trả về một đối tượng  khi biết Khóa
        public OrderDetail FindEntity(string Id)
        {
            OrderDetail dbEntry = context.OrderDetails.Find(Id);
            return dbEntry;
        }

        // Thêm một đối tượng
        public bool Insert(OrderDetail model)
        {
            OrderDetail dbEntry = context.OrderDetails.Find(model.Id);

            if (dbEntry != null)
            {
                return false;
            }
            context.OrderDetails.Add(model);

            context.SaveChanges();

            return true;
        }

        // Sửa một đối tượng
        public bool Update(OrderDetail model)
        {
            OrderDetail dbEntry = context.OrderDetails.Find(model.Id);
            //   LoaiBanDoc dbEntry = context.LoaiBanDocs.
            //  Where(x => x.LoaiBanDoc1 = model.LoaiBanDoc1).FirstOrDefault();
            if (dbEntry == null)
            {
                return false;
            }
            dbEntry.Id = model.Id;
            dbEntry.Amount = model.Amount;
            dbEntry.IdOrder = model.IdOrder;
            dbEntry.IdProduct = model.IdProduct;
            dbEntry.Quantity = model.Quantity;
            // Sửa các trường khác cũng như vậy
            context.SaveChanges();

            return true;
        }

        // Xóa một đối tượng
        public bool Delete(string MaSP)
        {
            OrderDetail dbEntry = context.OrderDetails.Find(MaSP);
            if (dbEntry == null)
            {
                return false;
            }
            context.OrderDetails.Remove(dbEntry);

            context.SaveChanges();
            return true;
        }
    }
}