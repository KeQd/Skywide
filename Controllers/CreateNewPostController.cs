using Microsoft.AspNetCore.Mvc;
using Skywide.Models;

namespace Skywide.Controllers
{
    public class CreateNewPostController : Controller
    {
        [HttpGet]
        public IActionResult CreateNewPost()
        {
            var category = new CategoryViewModel(1, "Category 1");
            var model = new CreateNewPostViewModel("Title", "Content", 1);
            model.Categories.Add(category); // Dodajemy kategorię do listy kategorii

            return View(model);
        }
    }

}
