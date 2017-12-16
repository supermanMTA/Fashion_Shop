namespace Shop_Fashion.Models.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("UserInRole")]
    public partial class UserInRole
    {
        public int ID { get; set; }

     
      
        [StringLength(50)]
        public string UserName { get; set; }

      
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IDRole { get; set; }

        public bool Status { get; set; }
    }
}
