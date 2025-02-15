namespace Skywide.Models
{
    public class PostViewModel
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string ShortContent { get; set; }
        public string CategoryName { get; set; }

        public PostViewModel(int id, string title, string shortContent, string categoryName)
        {
            ID = id;
            Title = title;
            ShortContent = shortContent;
            CategoryName = categoryName;
        }
    }
}