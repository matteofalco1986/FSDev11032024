namespace Pizzeria.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Order
    {
        [Key]
        
        public int OrderId { get; set; }

        [Required]
        public int GoodId { get; set; }

        [Required]
        public int UserId { get; set; }

        public int? Quantity { get; set; }

        [StringLength(255)]
        public string DeliveryAddress { get; set; }

        [StringLength(255)]
        public string Notes { get; set; }

        public DateTime? Date { get; set; }

        public virtual Good Good { get; set; }

        public virtual User User { get; set; }
    }
}
