using System.Web;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Skywide.Data;
using Skywide.Models;

namespace Skywide.Controllers
{
	public class PostController : Controller
	{

		private readonly ApplicationDbContext _context;

		public PostController(ApplicationDbContext context)
		{
			_context = context;
		}

		[HttpGet]
		public async Task<IActionResult> PostPage(string slug)
		{

			if (string.IsNullOrEmpty(slug))
			{
				return BadRequest("Incorrect slug.");
			}

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

			ViewData["UserID"] = user.UserID;

			var post = await _context.Posts
				.Where(p => p.Slug == slug)
				.FirstOrDefaultAsync();
			if (post == null)
			{
				return NotFound(); // Jeśli post nie istnieje, zwróć 404
			}

			ViewData["PostOwnerID"] = post.UserID;

			var comments = await _context.Comments
				.Where(c => c.PostID == post.PostID)
				.Include(c => c.User)
				.ToListAsync();

			var model = new PostPageViewModel(user.UserID, user.Username, post, comments);


			return View(model);
		}

		[HttpPost]
		public async Task<IActionResult> NewComment(string CommentText, int postID)
		{
			var userIDNullable = HttpContext.Session.GetInt32("UserID");
			if (userIDNullable == null)
			{
				return RedirectToAction("Login", "Login");
			}
			int userID = userIDNullable.Value;

			var user = await _context.Users.FindAsync(userID);
			if (user == null)
			{
				return RedirectToAction("Login", "Login");
			}

			if (string.IsNullOrWhiteSpace(CommentText))
			{
				return BadRequest("Comment cannot be empty.");
			}

			var formattedContent = HttpUtility.HtmlEncode(CommentText)
								.Replace(" ", "&nbsp;")
								.Replace(Environment.NewLine, "<br />");

			var newComment = new Comment(postID, userID, formattedContent);	

			_context.Comments.Add(newComment);
			await _context.SaveChangesAsync();

			return RedirectToAction("PostPage", new { slug = _context.Posts.FirstOrDefault(p => p.PostID == postID)?.Slug });
		}

		[HttpPost]
		public async Task<IActionResult> DeleteComment(int commentID, int postID)
		{
			var comment = await _context.Comments
				.Include(c => c.Post)
				.FirstOrDefaultAsync(c => c.CommentID == commentID);

			if (comment == null)
			{
				return NotFound();
			}

			var post = await _context.Posts
				.Where(p => p.PostID == postID)
				.FirstOrDefaultAsync();

			if (post == null)
			{
				return NotFound();
			}

			// Usuwanie komentarza
			_context.Comments.Remove(comment);
			await _context.SaveChangesAsync();

			return RedirectToAction("PostPage", new { slug = post.Slug });
		}



	}
}
