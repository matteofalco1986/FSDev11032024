using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.Mvc;
using Pizzeria.Models;

namespace Pizzeria.Controllers
{
    public class CartController : Controller
    {
        [HttpPost]
        [Authorize(Roles = "user")]
        [ValidateAntiForgeryToken]
        public ActionResult AddToCart(Good good)
        {
            if (ModelState.IsValid)
            {
                Cart.ShoppingCart.Add(good);
                Cart.Total += Convert.ToDouble(good.Price);
                return RedirectToAction("Menu", "Goods");
            }
            return RedirectToAction("Menu", "Goods");
        }


        [HttpGet]
        [Authorize(Roles = "user")]
        public ActionResult Index()
        {
            return View();
        }


        [HttpGet]
        public ActionResult DeleteItem()
        {
            return RedirectToAction("Index", "Cart");
        }

        [HttpPost]
        [Authorize(Roles = "user")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteItem(int? GoodId)
        {
            foreach (var item in Cart.ShoppingCart)
            {
                if (item.GoodId == GoodId)
                {
                    Cart.ShoppingCart.Remove(item);
                    Cart.Total -= Convert.ToDouble(item.Price);
                    return RedirectToAction("Index", "Cart");
                }
            }
            return RedirectToAction("Index", "Cart");

        }

        public ActionResult Checkout()
        {
            return View(Cart.ShoppingCart);
        }
    }
}