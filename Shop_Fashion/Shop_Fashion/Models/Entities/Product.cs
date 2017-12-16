namespace Shop_Fashion.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        public int Id { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        [StringLength(3000)]
        public string Description { get; set; }

        public double? UnitPrice { get; set; }

        [StringLength(250)]
        public string Image { get; set; }

        [Column(TypeName = "date")]
        public DateTime? DateProduct { get; set; }

        public int? IdCategories { get; set; }

        public int? IdSuppnier { get; set; }

        [StringLength(50)]
        public string Color { get; set; }

        [StringLength(10)]
        public string Size { get; set; }

        public int? Quantity { get; set; }

        public double? SaleOff { get; set; }

        public bool Status { get; set; }
    }
}
