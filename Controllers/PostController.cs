using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Skywide.Data;

public class PostController : Controller
{
	private readonly ApplicationDbContext _context;

	public PostController(ApplicationDbContext context)
	{
		_context = context;
	}

	[HttpGet]
	public IActionResult PostPage()
	{
		return View();
	}
}
