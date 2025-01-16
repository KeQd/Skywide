namespace Skywide.Models
{
    public class Comment
    {
        public int CommentID { get; set; }
        public int PostID { get; set; }  // Odwołanie do posta
        public int UserID { get; set; }  // Odwołanie do użytkownika, który dodał komentarz
        public string Content { get; set; }
        public DateTime DateCreated { get; set; } = DateTime.Now;

        // Nawigacja do posta
        public Post Post { get; set; }
        // Nawigacja do użytkownika
        public User User { get; set; }
    }
}
