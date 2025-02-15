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
            if (string.IsNullOrEmpty(userIDCookie) || !int.TryParse(userIDCookie, out int userID))
            {
                return RedirectToAction("Login", "Login");
            }

            var user = await _context.Users.FirstOrDefaultAsync(u => u.UserID == userID);

            var userSubscriptions = await _context.Subscriptions
                .Where(s => s.UserID == userID)
                .Select(s => s.CategoryID)
                .ToListAsync();

            var posts = await _context.Posts
                .Where(p => userSubscriptions.Contains(p.CategoryID))
                .OrderByDescending(p => p.DateCreated)
                .Take(10)
                .Select(p => new PostViewModel
                (
                    p.PostID,
                    p.Title,
                    p.Content.Substring(0, Math.Min(p.Content.Length, 20)) + "...",
                    p.Category.Name
                ))
                .ToListAsync();

            var categories = await _context.Categories
                .OrderByDescending(c => c.DateCreated)
                .Take(5)
                .Select(c => new CategoryViewModel
                (
                    c.CategoryID,
                    c.Name,
                    c.Description,
                    c.Slug
                ))
                .ToListAsync();

            var model = new IndexViewModel
            (
                userID,
                user.Username,
                posts,
                categories
            );

            return View(new IndexViewModel(userID, user.Username, posts, categories));
        }
    }
}
