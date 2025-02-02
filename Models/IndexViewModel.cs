using Skywide.Models;

namespace Skywide.Models
{
    public class IndexViewModel
    {

        public int UserId { get; set; }
        public string Username { get; set; }
        public List<Post> Posts { get; set; } = new List<Post>();
        public IndexViewModel(int userId, string username, List<Post> posts)
        {
            UserId = userId;
            Username = username;
            Posts = posts;
        }
    }
}