namespace Shop_Fashion.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OrderDetail")]
    public partial class OrderDetail
    {
        public int Id { get; set; }

        public int? IdProduct { get; set; }

        public int? IdOrder { get; set; }

        public int? Quantity { get; set; }

        public double? Amount { get; set; }
    }
}
