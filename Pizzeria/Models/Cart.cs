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
        public static Dictionary<int, int> ShoppingCartDictionary { get; set; } = new Dictionary<int, int>();
        public static int LoggedInUserId { get; set; } = 0;

        public static void PopulateDictionary()
        {
            ShoppingCartDictionary.Clear();
            foreach (var item in ShoppingCart)
            {
                if (!ShoppingCartDictionary.ContainsKey(item.GoodId))
                {
                    ShoppingCartDictionary.Add(item.GoodId, 1);
                }
                else
                {
                    ShoppingCartDictionary[item.GoodId]++;
                }
            }
        }

        public static void ClearAll()
        {
            ShoppingCartDictionary.Clear();
            ShoppingCart.Clear();
        }
    }
}