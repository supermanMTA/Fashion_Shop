using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Shop_Fashion.Models.Entities
{
    public class Account
    {
        public string UserName { set; get; }
        public string Password { set; get; }
        public string FullName { set; get; }
        public List<string> Roles { get; set; }

    }
}