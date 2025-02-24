namespace Skywide.Models
{
	public class PostPageViewModel
	{
		public int UserID { get; set; }
		public string Username { get; set; }
		public Post Post { get; set; }
		public List<Comment> Comments { get; set; } = new List<Comment>();
		public PostPageViewModel(int userID, string username, Post post, List<Comment> comments)
		{
			UserID = userID;
			Username = username;
			Post = post;
			Comments = comments ?? new List<Comment>();
		}
	}
}