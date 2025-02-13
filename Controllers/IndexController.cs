using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Skywide.Data;
using Skywide.Models;

namespace Skywide.Controllers
{
    public class IndexController : Controller
    {
        private readonly ApplicationDbContext _context;

        public IndexController(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            var userIDCookie = Request.Cookies["UserID"];

            if (string.IsNullOrEmpty(userIDCookie))
            {
                // Jeśli ciasteczko UserId jest puste, przekieruj na stronę logowania
                return RedirectToAction("Login", "Login");
            }

            // Przekształcenie wartości ciasteczka na int
            if (int.TryParse(userIDCookie, out int userId))
            {
                // Pobranie użytkownika na podstawie UserId
                var user = await _context.Users.FirstOrDefaultAsync(u => u.UserID == userId);

                if (user != null)
                {
                    // Pobranie postów użytkownika
                    var posts = await _context.Posts.Where(p => p.UserID == userId).ToListAsync();

                    var model = new IndexViewModel(user.UserID, user.Username, posts);

                    return View(model);
                }
            }

            return RedirectToAction("Login", "Login");
        }
    }
}
