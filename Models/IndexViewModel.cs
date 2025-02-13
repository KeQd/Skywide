using Skywide.Models;

namespace Skywide.Models
{
    public class IndexViewModel
    {

        public int UserID { get; set; }
        public string Username { get; set; }
        public List<Post> Posts { get; set; } = new List<Post>();
        public IndexViewModel(int userID, string username, List<Post> posts)
        {
            UserID = userID;
            Username = username;
            Posts = posts;
        }
    }
}