using System.Web;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Skywide.Data;
using Skywide.Models;
using Skywide.Utils;

namespace Skywide.Controllers
{
    public class CreateNewPostController : Controller
    {

        private readonly ApplicationDbContext _context;

        public CreateNewPostController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult CreateNewPost(string category)
        {
			var userIDNullable = HttpContext.Session.GetInt32("UserID");
			if (userIDNullable == null)
			{
				return RedirectToAction("Login", "Login");
			}
			int userID = userIDNullable.Value;

			var model = new CreateNewPostViewModel
			{
				CategoryName = category
			};
			return View(model);
        }

        [HttpGet("api/categories/autocomplete")]
        public async Task<IActionResult> Autocomplete(string query)
        {
            if (string.IsNullOrWhiteSpace(query))
            {
                return BadRequest("Query cannot be empty.");
            }
			var lowerQuery = query.ToLower();

			var categories = await _context.Categories
				.Where(c => c.Name.ToLower().Contains(lowerQuery))
				.Select(c => new { c.Name })
                .ToListAsync();

            return Ok(categories);
        }


        [HttpPost]
        public async Task<IActionResult> Share(CreateNewPostViewModel model)
        {
			var userIDNullable = HttpContext.Session.GetInt32("UserID");
			if (userIDNullable == null)
			{
				return RedirectToAction("Login", "Login");
			}
			int userID = userIDNullable.Value;

			var user = await _context.Users.FirstOrDefaultAsync(u => u.UserID == userID);

            if (user == null)
            {
                return RedirectToAction("Login", "Login");
            }

            //Walidacja pol
            if (string.IsNullOrEmpty(model.CategoryName))
            {
                ModelState.AddModelError("CategoryError", "Category is required.");
            }
            if (string.IsNullOrEmpty(model.Title))
            {
                ModelState.AddModelError("TitleError", "Title is required.");
            }
            if (string.IsNullOrEmpty(model.Content))
            {
                ModelState.AddModelError("ContentError", "Content is required.");
            }
            if (!ModelState.IsValid)
            {
                return View("CreateNewPost", model);
            }

            var category = await _context.Categories
                .FirstOrDefaultAsync(c => c.Name == model.CategoryName);

            if (category == null)
            {
                ModelState.AddModelError("CategoryError", "Category does not exist.");
                return View("CreateNewPost", model);
            }

            var formattedContent = model.Content
                .Replace(Environment.NewLine, "<br />");

            string title_of_post = model.Title;

			if (_context.Posts.Any(p => p.Title == model.Title))
            {
				title_of_post = model.Title + _context.Posts.Max(p => p.PostID + 1).ToString();

			};

			string Slug = SlugGenerator.GenerateSlug(title_of_post);

			var newPost = new Post(
                userID: user.UserID,
                title: model.Title,
                content: formattedContent,
                categoryID: category.CategoryID,
                slug: Slug
            );

            _context.Posts.Add(newPost);
            await _context.SaveChangesAsync();

            return RedirectToAction("Index", "Index");
        }
    }
}
