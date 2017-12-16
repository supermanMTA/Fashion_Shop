namespace Shop_Fashion.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Category
    {
        public int Id { get; set; }

        [StringLength(250)]
        public string Name { get; set; }

        public int? IdGroup { get; set; }

        public bool Status { get; set; }
    }
}
