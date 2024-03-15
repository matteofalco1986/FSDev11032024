namespace Pizzeria.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Diagnostics.Eventing.Reader;

    public partial class Order
    {

        public Order()
        {
            this.Goods = new HashSet<Good>();
            this.Evaso = false;
        }

        [Key]
        [Required]      
        public int OrderId { get; set; }

        [Required(ErrorMessage = "Campo obbligatorio")]
        public int UserId { get; set; }

        [Display(Name = "Indirizzo di consegna")]
        [Required(ErrorMessage = "Campo obbligatorio")]
        [StringLength(255)]
        public string DeliveryAddress { get; set; }

        [Display(Name = "Note per la pizzeria")]
        [Required(ErrorMessage = "Campo obbligatorio")]
        [StringLength(255)]
        public string Notes { get; set; }

        [Display(Name = "Data")]
        [DataType(DataType.DateTime)]
        public DateTime? Date { get; set; }
        
        public bool Evaso {  get; set; }

        public User User { get; set; }
        public virtual ICollection<Good> Goods { get; set; }


    }
}
