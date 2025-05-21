using Microsoft.AspNetCore.Mvc;

namespace Skywide.Controllers
{
	public class AccountController : Controller
	{
		[HttpPost]
		public IActionResult Logout()
		{
			HttpContext.Session.Clear();
			return RedirectToAction("Login", "Login");
		}
	}
}