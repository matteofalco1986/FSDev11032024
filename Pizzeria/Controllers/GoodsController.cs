using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Pizzeria.Models;

namespace Pizzeria.Controllers
{
    [Authorize]
    public class GoodsController : Controller
    {
        private DBContext db = new DBContext();

        // GET

        [HttpGet]
        [Authorize(Roles = "admin")]
        public ActionResult Index()
        {
            return View(db.Goods.ToList());
        }

        [HttpGet]
        [Authorize(Roles = "admin")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Good good = db.Goods.Find(id);
            if (good == null)
            {
                return HttpNotFound();
            }
            return View(good);
        }

        // CREATE

        [HttpGet]
        [Authorize(Roles = "admin")]
        public ActionResult Create()
        {
            return View();
        }


        [HttpPost]
        [Authorize(Roles = "admin")]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "GoodId,Name,Image,Price,Ingredients")] Good good)
        {
            if (ModelState.IsValid)
            {
                db.Goods.Add(good);
                db.SaveChanges();
                return RedirectToAction("Index", "Goods");
            }

            return View(good);
        }

        // EDIT

        [HttpGet]
        [Authorize(Roles = "admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Good good = db.Goods.Find(id);
            if (good == null)
            {
                return HttpNotFound();
            }
            return View(good);
        }

        [HttpPost]
        [Authorize(Roles = "admin")]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "GoodId,Name,Image,Price,Ingredients")] Good good)
        {
            if (ModelState.IsValid)
            {
                db.Entry(good).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(good);
        }


        // DELETE

        [HttpGet]
        [Authorize(Roles = "admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Good good = db.Goods.Find(id);
            if (good == null)
            {
                return HttpNotFound();
            }
            return View(good);
        }

        [HttpPost, ActionName("Delete")]
        [Authorize(Roles = "admin")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Good good = db.Goods.Find(id);
            db.Goods.Remove(good);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET USER

        [HttpGet]
        public ActionResult Menu()
        {
            return View(db.Goods.ToList());
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }



    }
}
