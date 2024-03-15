using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pizzeria.Models
{
    public static class Cart
    {
        public static List<Good> ShoppingCart { get; set; } = new List<Good>();
        public static double Total { get; set; } = 0;
    }
}