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
            var userIDCookie = Request.Cookies["UserID"];
            if (string.IsNullOrEmpty(userIDCookie))
            {
                return RedirectToAction("Login", "Login");
            }
            var model = new CreateNewCategoryViewModel();
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> NewCategory(CreateNewCategoryViewModel model)
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
            if (string.IsNullOrEmpty(model.Name))
            {
                ModelState.AddModelError("NameError", "Name for new category is required.");
            }
            if (string.IsNullOrEmpty(model.Description))
            {
                ModelState.AddModelError("DescriptionError", "Description is required.");
            }
            if (!ModelState.IsValid)
            {
                return View("CreateNewCategory", model);
            }

            string Slug = SlugGenerator.GenerateSlug(model.Name);

            var newCategory = new Category(
                name: model.Name,
                description: model.Description,
                slug: Slug,
                userID: user.UserID
            );

            _context.Categories.Add(newCategory);
            await _context.SaveChangesAsync();

            return RedirectToAction("Index", "Index");
        }
    }
}
