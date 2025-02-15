using Microsoft.AspNetCore.Mvc;
using Skywide.Data;
using Skywide.Models;
using Microsoft.EntityFrameworkCore;

namespace Skywide.Controllers
{
	public class CategoryController : Controller
	{
		private readonly ApplicationDbContext _context;

		public CategoryController(ApplicationDbContext context)
		{
			_context = context;
		}

		[HttpGet]
		public async Task<IActionResult> CategoryPage(string slug)
		{

			var userIDCookie = Request.Cookies["UserID"];
			if (string.IsNullOrEmpty(userIDCookie) || !int.TryParse(userIDCookie, out int userID))
			{
				return RedirectToAction("Login", "Login");
			}

			var user = await _context.Users.FirstOrDefaultAsync(u => u.UserID == userID);

			var category = await _context.Categories
				.Where(c => c.Slug == slug)
				.FirstOrDefaultAsync();

			// Jeśli kategoria nie istnieje, przekieruj do strony 404
			if (category == null)
			{
				return NotFound();
			}

			// Pobieranie postów związanych z tą kategorią
			var posts = await _context.Posts
				.Where(p => p.CategoryID == category.CategoryID)
				.OrderByDescending(p => p.DateCreated)
				.ToListAsync();

			var postViewModels = posts.Select(p => new PostViewModel
			(
				p.PostID,
				p.Title,
				p.Content.Substring(0, 20),
				p.Category.Name
			)).ToList();

			var model = new CategoryPageViewModel(user.Username, category, postViewModels);

			return View(model);
		}
	}
}
