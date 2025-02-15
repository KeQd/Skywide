namespace Skywide.Models
{
    public class CategoryViewModel
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Slug { get; set; }
		public CategoryViewModel(int id, string name, string description, string slug)
        {
            ID = id;
            Name = name;
            Description = description;
            Slug = slug;
		}
    } 
}
