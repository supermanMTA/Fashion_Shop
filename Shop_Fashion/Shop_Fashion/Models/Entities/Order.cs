namespace Shop_Fashion.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Order
    {
        public int Id { get; set; }

        [StringLength(50)]
        public string Customer { get; set; }

        [Column(TypeName = "date")]
        public DateTime? OrderDate { get; set; }

        [StringLength(50)]
        public string Receiver { get; set; }

        [StringLength(250)]
        public string Address { get; set; }

        public double? Amount { get; set; }

        [StringLength(50)]
        public string Phone { get; set; }

        [StringLength(250)]
        public string Email { get; set; }

        public int? TinhTrang { get; set; }
    }
}
