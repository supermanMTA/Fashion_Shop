using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shop_Fashion.ViewModel;
namespace Shop_Fashion.ViewModel
{
    public class FeaturedProducts
    {
        public int Id { get; set; }

        
        public string Name { get; set; }

       
        public string UnitBrief { get; set; }

        public double? UnitPrice { get; set; }

        
        public string Image { get; set; }

        
        public DateTime? DateProduct { get; set; }

        public int? IdCategories { get; set; }

        public int? IdSuppnier { get; set; }

       
        public string Color { get; set; }

        
        public string Size { get; set; }

        public int? Quantity { get; set; }

        public double? SaleOff { get; set; }
        public double Amount { get; set; }
    }
}