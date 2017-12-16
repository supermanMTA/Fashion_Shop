using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shop_Fashion.Models.Entities;
namespace Shop_Fashion.Models.DAL
{
    public class ContactF
    {
        private MyContext context;

        public ContactF()
        {
            context = new MyContext();
        }

        // Trả về toàn bộ dữ liệu
        public IQueryable<Contact> Contacts
        {
            get { return context.Contacts; }
        }

        // Trả về một đối tượng  khi biết Khóa
        public Contact FindEntity(string Id)
        {
            Contact dbEntry = context.Contacts.Find(Id);
            return dbEntry;
        }

        // Thêm một đối tượng
        public int Insert(Contact model)
        {
            Contact dbEntry = context.Contacts.Find(model.ID);

            if (dbEntry != null)
            {
                return -1;
            }
            context.Contacts.Add(model);

            context.SaveChanges();

            return model.ID;
        }
    }
}