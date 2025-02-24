using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Skywide.Data;
using Skywide.Models;

namespace Skywide.Controllers
{
    public class LoginController : Controller
    {
        private readonly ApplicationDbContext _context;

        public LoginController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Login()
        {
			HttpContext.Session.Remove("Username");
			HttpContext.Session.Remove("UserID");

			var model = new LoginViewModel("admin", "admin");

            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> LoginIntoHome(LoginViewModel model)
        {
            // Walidacja nazwy użytkownika
            if (string.IsNullOrEmpty(model.Username))
            {
                ModelState.AddModelError("Username", "Username is required.");
            }

            // Walidacja hasła
            if (string.IsNullOrEmpty(model.Password))
            {
                ModelState.AddModelError("Password", "Password is required.");
            }

            if (!ModelState.IsValid)
            {
                return View("Login", model);
            }

            var existingUser = await _context.Users
                .FirstOrDefaultAsync(u => u.Username == model.Username);

            // Walidacja podanych danych
            if (existingUser == null || !BCrypt.Net.BCrypt.Verify(model.Password, existingUser.PasswordHash))
            {
                ViewData["GeneralError"] = "Username or Password is incorrect";
                return View("Login", model);
            }

			// Zapisz dane użytkownika w ciasteczku
			HttpContext.Session.SetString("Username", existingUser.Username);
			HttpContext.Session.SetInt32("UserID", existingUser.UserID);

			return RedirectToAction("Index", "Index");
        }
    }
}