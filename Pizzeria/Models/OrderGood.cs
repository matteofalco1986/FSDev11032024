using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Pizzeria.Models
{
    public class OrderGood
    {
        [Key, Column(Order = 1)]
        public int OrderId { get; set; }
        public Order Order { get; set; }

        [Key, Column(Order = 2)]
        public int GoodId { get; set; }
        public Good Good { get; set; }
        public int Quantity { get; set; }
    }
}