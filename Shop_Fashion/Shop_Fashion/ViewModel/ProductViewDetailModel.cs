using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shop_Fashion.Models.Entities;
namespace Shop_Fashion.ViewModel
{
    public class ProductViewDetailModel
    {
        public ProductViewDetailModel()
        {

        }
        public int maSanPham { get; set; }
        public string moTa { get; set; }
        public double giaSanPham { get; set; }     
        public string mauSac { get; set; }
        public string urlAnh { get; set; }
        public DateTime ngayTao { get; set; }
        public string tenSanPham { get; set; }
        public string size { get; set; }
        public int soLuong { get; set; }
        public string NameSupplier{set;get;}

        public List<Review> ReviewProduct { set; get; }
       // public List<Product> Recommended { get; set; }
    }
}
    
