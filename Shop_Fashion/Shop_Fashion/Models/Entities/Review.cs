namespace Shop_Fashion.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Review
    {
        public int ID { get; set; }

        public int? ProductID { get; set; }

        [StringLength(50)]
        public string Username { get; set; }

        [StringLength(200)]
        public string Status { get; set; }

        [Column(TypeName = "date")]
        public DateTime? date { get; set; }
    }
}
