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

		public async Task<IActionResult> Index(int page = 1)
		{
			var userIDNullable = HttpContext.Session.GetInt32("UserID");
			if (userIDNullable == null)
			{
				return RedirectToAction("Login", "Login");
			}
			int userID = userIDNullable.Value;

			var user = await _context.Users.FirstOrDefaultAsync(u => u.UserID == userID);

			var userSubscriptions = await _context.Subscriptions
				.Where(s => s.UserID == userID)
				.Select(s => s.CategoryID)
				.ToListAsync();

			int pageSize = 10;
			var postsQuery = _context.Posts
				.Include(p => p.Category) // Zaladowanie kategorii
				.Include(p => p.Owner) // Zaladowanie wlasciciela posta
				.Where(p => userSubscriptions.Contains(p.CategoryID));

			var posts = await postsQuery
				.OrderByDescending(p => p.DateCreated)
				.Skip((page - 1) * pageSize)
				.Take(pageSize)
				.Select(p => new PostViewModel
				(
					p.PostID,
					p.Title,
					p.Content.Substring(0, Math.Min(p.Content.Length, 200)) + (p.Content.Length > 200 ? "..." : ""),
					p.Category.Name,
					p.Slug,
					p.Owner, // Przypisanie wlasciciela posta
					user,
					p.Category
				))
				.ToListAsync();

			var categories = await _context.Categories
				.OrderByDescending(c => c.DateCreated)
				.Take(5)
				.ToListAsync();

			var categoryViewModels = new List<CategoryViewModel>();

			foreach (var category in categories)
			{
				var author = await _context.Users.FirstOrDefaultAsync(u => u.UserID == category.UserID);

				var categoryViewModel = new CategoryViewModel
				(
					category.CategoryID,
					category.Name,
					category.Description,
					author.Username,
					category.Slug
				);

				categoryViewModels.Add(categoryViewModel);
			}

			var model = new IndexViewModel
			(
				userID,
				user.Username,
				posts,
				categoryViewModels
			);

			ViewData["CurrentView"] = "Index";

			if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
			{
				return PartialView("_PostsPartial", posts);
			}

			return View(model);
		}

		[HttpGet("api/categories/autocomplete-search")]
		public async Task<IActionResult> AutocompleteSearch(string query)
		{
			if (string.IsNullOrWhiteSpace(query))
			{
				return BadRequest("Query cannot be empty.");
			}

			var lowerQuery = query.ToLower();

			var categories = await _context.Categories
				.Where(c => c.Name.ToLower().Contains(lowerQuery))
				.Select(c => new { c.Name, c.Slug })
				.ToListAsync();

			return Ok(categories);
		}

		[HttpPost]
		[Route("Index/DeletePost")]
		public async Task<IActionResult> DeletePost(int postID)
		{
			var post = await _context.Posts
				.Where(p => p.PostID == postID)
				.FirstOrDefaultAsync();

			if (post == null)
			{
				return NotFound();
			}

			_context.Posts.Remove(post);
			await _context.SaveChangesAsync();

			return RedirectToAction("Index");
		}
	}
}
