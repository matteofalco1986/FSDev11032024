using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Metadata.Edm;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Pizzeria.Models;

namespace Pizzeria.Controllers
{
    public class AuthController : Controller
    {
        DBContext db = new DBContext();
        // GET: Auth
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(User user)
        {
            var loggedUser = db.Users.Where(u => u.Username == user.Username && u.Password == user.Password).FirstOrDefault();
            if (loggedUser == null)
            {
                TempData["ErrorLogin"] = true;
                return RedirectToAction("Login", "Auth");
            }
            FormsAuthentication.SetAuthCookie(loggedUser.UserId.ToString(), true);
            return RedirectToAction("Index", "Home");
        }

        [Authorize]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login", "Auth");
        }

        [HttpGet]
        public ActionResult SignUp()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult SignUp([Bind(Include = "Username, Password")] User user)
        {
            var registeredUser = db.Users.Where(u => u.Username == user.Username).FirstOrDefault();
            if (registeredUser != null)
            {
                TempData["ErrorSignUp"] = true;
                return RedirectToAction("SignUp", "Auth");
            }
            // Aggiungere utente al database
            {
                if (ModelState.IsValid)
                {
                    db.Users.Add(user);
                    db.SaveChanges();
                    return RedirectToAction("Login", "Auth");
                }
                return View(user);
            }
        }
    }
}