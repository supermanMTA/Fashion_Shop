namespace Shop_Fashion.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Group")]
    public partial class Group
    {
        public int Id { get; set; }

        [StringLength(250)]
        public string Name { get; set; }
    }
}
