namespace Skywide.Models
{
	public class PostPageViewModel
	{
		public string Username { get; set; }
		public string CategoryID { get; set; }
		public List<Post> Posts { get; set; }
		public List<Comment> Comments { get; set; }
		public PostPageViewModel(string username, string categoryID, List<Post> posts, List<Comment> comments)
		{
			Username = username;
			CategoryID = categoryID;
			Posts = posts;
			Comments = comments;
		}
	}
}