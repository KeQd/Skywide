namespace Skywide.Models
{
    public class CreateNewPostViewModel
    {
        public string CategoryName { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public CreateNewPostViewModel() { }
        public CreateNewPostViewModel(string categoryName, string title, string content)
        {
            CategoryName = categoryName;
            Title = title;
            Content = content;    
        }
    }

}