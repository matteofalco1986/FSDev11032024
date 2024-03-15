using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.Mvc;
using Pizzeria.Migrations;
using Pizzeria.Models;

namespace Pizzeria.Controllers
{
    public class CartController : Controller
    {
        private DBContext db = new DBContext();

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
            Cart.PopulateDictionary();
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

        [HttpGet]
        [Authorize(Roles = "user")]
        public ActionResult Checkout()
        {
            ViewBag.ShoppingCartCheckout = Cart.ShoppingCartDictionary;
            return View();
        }

        [HttpPost]
        [Authorize(Roles = "user")]
        [ValidateAntiForgeryToken]
        public ActionResult Checkout(Order order)
        {
            if (ModelState.IsValid)
            {
                // Aggiungere ordine
                db.Orders.Add(order);
                foreach(var pair in Cart.ShoppingCartDictionary)
                {
                    var orderGoodsToAdd = new OrderGood()
                    {
                        OrderId = Convert.ToInt32(order.OrderId),
                        GoodId = Convert.ToInt32(pair.Key),
                        Quantity = Convert.ToInt32(pair.Value)
                    };
                    db.OrderGoods.Add(orderGoodsToAdd);
                }
                db.SaveChanges();

                // Svuotare carrello e dizionario
                Cart.ClearAll();
                return RedirectToAction("Thanks", "Home");
            }

            return View(order);
        }
    }
}