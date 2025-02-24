namespace Skywide.Models
{
	public class CategoryPageViewModel
	{
		public string Username { get; set; }
		public Category Category { get; set; }
		public bool IsSubscribed { get; set; }
		public List<PostViewModel> Posts { get; set; }
		public CategoryPageViewModel(string username, Category category, bool isSubscribed, List<PostViewModel> posts)
		{
			Username = username;
			Category = category;
			IsSubscribed = isSubscribed;
			Posts = posts;
		}
	}
}
