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
        public IActionResult CreateNewPost()
        {
            var userIDCookie = Request.Cookies["UserID"];
            if (string.IsNullOrEmpty(userIDCookie))
            {
                return RedirectToAction("Login", "Login");
            }
            var model = new CreateNewPostViewModel();
            return View(model);
        }

        [HttpGet("api/categories/autocomplete")]
        public async Task<IActionResult> Autocomplete(string query)
        {
            if (string.IsNullOrWhiteSpace(query))
            {
                return BadRequest("Query cannot be empty.");
            }

            var categories = await _context.Categories
                .Where(c => c.Name.Contains(query))
                .Select(c => new { c.Name })
                .ToListAsync();

            return Ok(categories);
        }


        [HttpPost]
        public async Task<IActionResult> Share(CreateNewPostViewModel model)
        {
            var userIDCookie = Request.Cookies["UserID"];
            if (string.IsNullOrEmpty(userIDCookie) || !int.TryParse(userIDCookie, out int userID))
            {
                return RedirectToAction("Login", "Login");
            }
            var user = await _context.Users.FirstOrDefaultAsync(u => u.UserID == userID);

            if (user == null)
            {
                return RedirectToAction("Login", "Login");
            }

            //Walidacja pól
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

            string Slug = SlugGenerator.GenerateSlug(model.Title);

            var newPost = new Post(
                userID: user.UserID,
                title: model.Title,
                content: model.Content,
                categoryID: category.CategoryID,
                slug: Slug
            );

            _context.Posts.Add(newPost);
            await _context.SaveChangesAsync();

            return RedirectToAction("Index", "Index");
        }
    }

}
