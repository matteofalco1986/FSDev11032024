namespace Pizzeria.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Diagnostics.Eventing.Reader;


    public partial class Good
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Good()
        {
            this.Orders = new HashSet<Order>();
        }

        [Key]
        public int GoodId { get; set; }

        [Display(Name = "Nome Pizza")]
        [Required]
        [StringLength(50)]
        public string Name { get; set; }

        [Display(Name = "Immagine")]
        [StringLength(255)]
        public string Image { get; set; }

        [Display(Name = "Prezzo")]
        [Required]
        [Column(TypeName = "money")]
        public decimal Price { get; set; }

        [Display(Name = "Ingredienti")]
        [Required]
        [StringLength(2500)]
        public string Ingredients { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
