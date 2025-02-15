using Skywide.Models;

namespace Skywide.Models
{
    public class IndexViewModel
    {

        public int UserID { get; set; }
        public string Username { get; set; }
        public List<PostViewModel> Posts { get; set; }
        public List<CategoryViewModel> Categories { get; set; }
        public IndexViewModel(int userID, string username, List<PostViewModel> posts, List<CategoryViewModel> categories)
        {
            UserID = userID;
            Username = username;
            Posts = posts;
            Categories = categories;
        }
    }
}