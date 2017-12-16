using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shop_Fashion.Models.Entities;
namespace Shop_Fashion.ViewModel
{
    public class HomeViewModel
    {
        public List<Product> SPKM = new List<Product>();
        public List<Product> SPM = new List<Product>();
        public List<FeaturedProducts> SPNB = new List<FeaturedProducts>();
    }
    
}