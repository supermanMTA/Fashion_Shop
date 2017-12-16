using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shop_Fashion.Models.Entities;
namespace Shop_Fashion.Models.DAL
{
    public class ReviewF
    {
        private MyContext context;

        public ReviewF()
        {
            context = new MyContext();
        }

        // Trả về toàn bộ dữ liệu
        public IQueryable<Review> Reviews
        {
            get { return context.Reviews; }
        }
      
        // Trả về một đối tượng  khi biết Khóa
        public Review FindEntity(int Id)
        {
            Review dbEntry = context.Reviews.Find(Id);
            return dbEntry;
        }

        // Thêm một đối tượng
        public bool Insert(Review model)
        {
            Review dbEntry = context.Reviews.Find(model.ID);

            if (dbEntry != null)
            {
                return false;
            }
            context.Reviews.Add(model);

            context.SaveChanges();

            return true;
        }

        // Sửa một đối tượng
        public bool Update(Review model)
        {
            Review dbEntry = context.Reviews.Find(model.ID);
            //   LoaiBanDoc dbEntry = context.LoaiBanDocs.
            //  Where(x => x.LoaiBanDoc1 = model.LoaiBanDoc1).FirstOrDefault();
            if (dbEntry == null)
            {
                return false;
            }
            dbEntry.date = model.date;
            dbEntry.ProductID = model.ProductID;
            dbEntry.Status = model.Status;



            // Sửa các trường khác cũng như vậy
            context.SaveChanges();

            return true;
        }

        // Xóa một đối tượng
        public bool Delete(string MaSP)
        {
            Review dbEntry = context.Reviews.Find(MaSP);
            if (dbEntry == null)
            {
                return false;
            }
            context.Reviews.Remove(dbEntry);

            context.SaveChanges();
            return true;
        }
    }
}