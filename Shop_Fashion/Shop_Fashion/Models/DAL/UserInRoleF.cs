using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shop_Fashion.Models.Entities;
namespace Shop_Fashion.Models.DAL
{
    public class UserInRoleF
    {
        private MyContext context;

        public UserInRoleF()
        {
            context = new MyContext();
        }

        // Trả về toàn bộ dữ liệu
        public IQueryable<UserInRole> UseInRolies
        {
            get { return context.UserInRoles; }
        }

        // Trả về một đối tượng  khi biết Khóa
        public UserInRole FindEntity(int Id)
        {
            UserInRole dbEntry = context.UserInRoles.Find(Id);
            return dbEntry;
        }

        // Thêm một đối tượng
        public bool Insert(UserInRole model)
        {
            UserInRole dbEntry = context.UserInRoles.Find(model.ID);

            if (dbEntry != null)
            {
                return false;
            }
            context.UserInRoles.Add(model);

            context.SaveChanges();

            return true;
        }

        // Sửa một đối tượng
        public bool Update(UserInRole model)
        {
            UserInRole dbEntry = context.UserInRoles.Find(model.ID);
            //   LoaiBanDoc dbEntry = context.LoaiBanDocs.
            //  Where(x => x.LoaiBanDoc1 = model.LoaiBanDoc1).FirstOrDefault();
            if (dbEntry == null)
            {
                return false;
            }
            dbEntry.ID = model.ID;
            dbEntry.UserName = model.UserName;
            dbEntry.IDRole = model.IDRole;
            dbEntry.Status = model.Status;

            // Sửa các trường khác cũng như vậy
            context.SaveChanges();

            return true;
        }

        // Xóa một đối tượng
        public bool Delete(string MaSP)
        {
            UserInRole dbEntry = context.UserInRoles.Find(MaSP);
            if (dbEntry == null)
            {
                return false;
            }
            context.UserInRoles.Remove(dbEntry);

            context.SaveChanges();
            return true;
        }
    }
}