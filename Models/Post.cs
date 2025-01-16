namespace Skywide.Models
{
    public class Post
    {
        public int PostID { get; set; }
        public int UserID { get; set; }  // Odwołanie do użytkownika, który utworzył post
        public string Title { get; set; }
        public string Content { get; set; }
        public DateTime DateCreated { get; set; } = DateTime.Now;

        // Nawigacja do użytkownika, który utworzył post
        public User User { get; set; }
    }
}
