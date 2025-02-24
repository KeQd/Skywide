using Microsoft.AspNetCore.Mvc;
using Skywide.Data;
using Skywide.Models;
using Microsoft.EntityFrameworkCore;
using Skywide.Views.Shared;

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
		public async Task<IActionResult> CategoryPage(string slug, int page = 1)
		{

			var userIDNullable = HttpContext.Session.GetInt32("UserID");
			if (userIDNullable == null)
			{
				return RedirectToAction("Login", "Login");
			}
			int userID = userIDNullable.Value;

			var user = await _context.Users.FirstOrDefaultAsync(u => u.UserID == userID);

			var category = await _context.Categories
				.Where(c => c.Slug == slug)
				.FirstOrDefaultAsync();

			if (category == null)
			{
				return NotFound();
			}

			bool isSubscribed = await _context.Subscriptions.AnyAsync(s => s.UserID == userID && s.CategoryID == category.CategoryID);

			// Pobieranie postów związanych z tą kategorią, z paginacją
			int pageSize = 10;
			var posts = await _context.Posts
			.Where(p => p.CategoryID == category.CategoryID)
			.OrderByDescending(p => p.DateCreated)
			.Skip((page - 1) * pageSize)
			.Take(pageSize)
			.ToListAsync();

			

			// Pobieramy autorów na podstawie UserID z postów
			var postViewModels = new List<PostViewModel>();

			foreach (var post in posts)
			{
				var postOwner = await _context.Users.FirstOrDefaultAsync(u => u.UserID == post.UserID);

				var postViewModel = new PostViewModel
				(
					post.PostID,
					post.Title,
					post.Content.Length > 200 ? post.Content.Substring(0, 200) + "..." : post.Content,
					post.Category.Name,
					post.Slug,
					postOwner,
					user,
					category
				);

				postViewModels.Add(postViewModel);
			}

			ViewData["AuthorName"] = user.Username;
			ViewData["CategoryOwnerID"] = category.UserID;
			ViewData["CurrentView"] = "Category";
			ViewData["slug"] = slug;

			if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
			{
				return PartialView("_PostsPartial", postViewModels);
			}

			var model = new CategoryPageViewModel(user.Username, category, isSubscribed, postViewModels);
			return View(model);

		}

		[HttpPost]
		public async Task<IActionResult> Subscribe(int categoryID)
		{
			var userIDNullable = HttpContext.Session.GetInt32("UserID");
			if (userIDNullable == null)
			{
				return RedirectToAction("Login", "Login");
			}
			int userID = userIDNullable.Value;

			var subscription = new Subscription(userID, categoryID);

			_context.Subscriptions.Add(subscription);
			await _context.SaveChangesAsync();

			return RedirectToAction("CategoryPage", new { slug = _context.Categories.Find(categoryID)?.Slug });
		}

		[HttpPost]
		public async Task<IActionResult> Unsubscribe(int categoryID)
		{
			var userIDNullable = HttpContext.Session.GetInt32("UserID");
			if (userIDNullable == null)
			{
				return RedirectToAction("Login", "Login");
			}
			int userID = userIDNullable.Value;

			var subscription = await _context.Subscriptions
				.FirstOrDefaultAsync(s => s.UserID == userID && s.CategoryID == categoryID);

			if (subscription != null)
			{
				_context.Subscriptions.Remove(subscription);
				await _context.SaveChangesAsync();
			}

			return RedirectToAction("CategoryPage", new { slug = _context.Categories.Find(categoryID)?.Slug });
		}

		[HttpPost]
		[Route("Category/DeletePost")]
		public async Task<IActionResult> DeletePost(int postID, string slug)
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

			return RedirectToAction("CategoryPage", new { slug = slug });
		}


	}
}
