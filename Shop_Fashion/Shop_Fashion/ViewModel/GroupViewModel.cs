using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shop_Fashion.Models.Entities;
namespace Shop_Fashion.ViewModel
{
    public class GroupViewModel
    {
        public GroupViewModel()
        {

        }
        public List<Group> ListGroup { get; set; }
        public List<Category> ListCategory { get; set; }
        public List<Supplier> ListSupplier { get; set; }
    }
}