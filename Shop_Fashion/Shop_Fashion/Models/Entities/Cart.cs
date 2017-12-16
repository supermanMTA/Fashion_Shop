using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Shop_Fashion.ViewModel;
namespace Shop_Fashion.Models.Entities
{
    [Serializable]
    public class CartItem
    {
        public ProductViewDetailModel  Sanpham { get; set; }
        public int Quantity { set; get; }
    }
    public class Cart
    {
        private List<CartItem> lineCollection = new List<CartItem>();
        public void AddItem(ProductViewDetailModel sp, int quantity)
        {
            CartItem line = lineCollection
                .Where(p => p.Sanpham.maSanPham == sp.maSanPham)
                .FirstOrDefault();

            if (line == null)
            {
                lineCollection.Add(new CartItem
                {
                    Sanpham = sp,
                    Quantity = quantity
                });
            }
            else
            {
                line.Quantity += quantity;
                if (line.Quantity <= 0)
                {
                    lineCollection.RemoveAll(l => l.Sanpham.maSanPham == sp.maSanPham);
                }
            }
        }
        public void UpdateItem(ProductViewDetailModel sp, int quantity)
        {
            CartItem line = lineCollection
                .Where(p => p.Sanpham.maSanPham == sp.maSanPham)
                .FirstOrDefault();

            if (line != null)
            {
                if (quantity > 0)
                {
                    line.Quantity = quantity;
                }
                else
                {
                    lineCollection.RemoveAll(l => l.Sanpham.maSanPham == sp.maSanPham);
                }
            }
        }
        public void RemoveLine(Product sp)
        {
            lineCollection.RemoveAll(l => l.Sanpham.maSanPham == sp.Id);
        }
        public double? ComputeTotalValue()
        {
            return lineCollection.Sum(e => e.Sanpham.giaSanPham * e.Quantity);

        }
        public int? ComputeTotalProduct()
        {
            return lineCollection.Sum(e => e.Quantity);

        }
        public void Clear()
        {
            lineCollection.Clear();
        }
        public IEnumerable<CartItem> Lines
        {
            get { return lineCollection; }
        }
    }
}