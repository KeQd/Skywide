using System.Text.RegularExpressions;
using Azure.Core;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Skywide.Data;
using Skywide.Models;
using Skywide.Utils;

namespace Skywide.Controllers
{
    public class CreateNewCategoryController : Controller
    {
        private readonly ApplicationDbContext _context;

        public CreateNewCategoryController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult CreateNewCategory()
        {
			var userIDNullable = HttpContext.Session.GetInt32("UserID");
			if (userIDNullable == null)
			{
				return RedirectToAction("Login", "Login");
			}
			int userID = userIDNullable.Value;

			var model = new CreateNewCategoryViewModel();
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> NewCategory(CreateNewCategoryViewModel model)
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
            if (string.IsNullOrEmpty(model.Name)) ModelState.AddModelError("NameError", "Name for new category is required.");
            else if(_context.Categories.Any(c => c.Name == model.Name)) ModelState.AddModelError("NameError", "A category with this name already exists..");

			if (string.IsNullOrEmpty(model.Description)) ModelState.AddModelError("DescriptionError", "Description is required.");

            if (!ModelState.IsValid)return View("CreateNewCategory", model);

            string Slug = SlugGenerator.GenerateSlug(model.Name);

            var formattedDescription = model.Description
                .Replace(Environment.NewLine, "<br />");

			var newCategory = new Category(
                name: model.Name,
                description: formattedDescription,
                slug: Slug,
                userID: user.UserID
            );

            _context.Categories.Add(newCategory);
            await _context.SaveChangesAsync();

            return RedirectToAction("Index", "Index");
        }
    }
}