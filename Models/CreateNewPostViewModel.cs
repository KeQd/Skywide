namespace Skywide.Models
{
    public class CreateNewPostViewModel
    {
        public string Title { get; set; }
        public string Content { get; set; } 
        public int CategoryID { get; set; }
        public List<CategoryViewModel> Categories { get; set; }

        public CreateNewPostViewModel(string title, string content, int categoryID)
        {
            Title = title;
            Content = content;
            CategoryID = categoryID;    
            Categories = new List<CategoryViewModel>();
        }
    }

    public class CategoryViewModel
    {
        public int CategoryID { get; set; }
        public string Name { get; set; }

        public CategoryViewModel(int categoryId, string name)
        {
            CategoryID = categoryId;
            Name = name;
        }
    }
}
