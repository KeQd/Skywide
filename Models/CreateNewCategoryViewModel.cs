namespace Skywide.Models
{
    public class CreateNewCategoryViewModel
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public CreateNewCategoryViewModel() { }
        public CreateNewCategoryViewModel(string name, string description)
        {
            Name = name;
            Description = description;
        }
    }
}