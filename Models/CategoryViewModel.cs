namespace Skywide.Models
{
    public class CategoryViewModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
		public string AuthorName { get; set; }
		public string Slug { get; set; }
		public CategoryViewModel(int id, string name, string description,string authorName, string slug)
        {
            ID = id;
            Name = name;
            Description = description;
            AuthorName = authorName;
            Slug = slug;
		}
    } 
}