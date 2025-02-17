namespace Skywide.Models
{
    public class PostViewModel
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string ShortContent { get; set; }
        public string CategoryName { get; set; }
        public string Slug { get; set; }

        public PostViewModel(int id, string title, string shortContent, string categoryName, string slug)
        {
            ID = id;
            Title = title;
            ShortContent = shortContent;
            CategoryName = categoryName;
            Slug = slug;
        }
    }
}