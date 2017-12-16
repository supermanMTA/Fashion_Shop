using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shop_Fashion.Models.Entities;
namespace Shop_Fashion.Models.DAL
{
    public class GroupF
    {
        private MyContext context;

        public GroupF()
        {
            context = new MyContext();
        }

        // Trả về toàn bộ dữ liệu
        public IQueryable<Group> Groups
        {
            get { return context.Groups; }
        }

        // Trả về một đối tượng  khi biết Khóa
        public Group FindEntity(int Id)
        {
            Group dbEntry = context.Groups.Find(Id);
            return dbEntry;
        }

        // Thêm một đối tượng
        public int Insert(Group model)
        {
            Group dbEntry = context.Groups.Find(model.Id);

            if (dbEntry != null)
            {
                return -1;
            }
            context.Groups.Add(model);

            context.SaveChanges();

            return model.Id;
        }

        // Sửa một đối tượng
        public bool Update(Group model)
        {
            Group dbEntry = context.Groups.Find(model.Id);
            //   LoaiBanDoc dbEntry = context.LoaiBanDocs.
            //  Where(x => x.LoaiBanDoc1 = model.LoaiBanDoc1).FirstOrDefault();
            if (dbEntry == null)
            {
                return false;
            }
            

            // Sửa các trường khác cũng như vậy
            context.SaveChanges();

            return true;
        }

        // Xóa một đối tượng
        public bool Delete(string MaSP)
        {
            Group dbEntry = context.Groups.Find(MaSP);
            if (dbEntry == null)
            {
                return false;
            }
            context.Groups.Remove(dbEntry);

            context.SaveChanges();
            return true;
        }
    }
}