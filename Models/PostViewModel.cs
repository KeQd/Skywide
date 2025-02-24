namespace Skywide.Models
{
    public class PostViewModel
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string ShortContent { get; set; }
        public string CategoryName { get; set; }
		public string Slug { get; set; }
        public User Owner { get; set; }
		public User Logged { get; set; }
		public Category Category { get; set; }

		public PostViewModel(int id, string title, string shortContent, string categoryName, string slug, User owner, User logged, Category category)
        {
            ID = id;
            Title = title;
            ShortContent = shortContent;
            CategoryName = categoryName;
			Slug = slug;
            Owner = owner;
			Logged = logged;
			Category = category;
		}
    }
}