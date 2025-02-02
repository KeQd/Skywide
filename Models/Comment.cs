using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Skywide.Models
{
    public class Comment
    {
        public int CommentID { get; set; }

        // Klucz obcy do posta
        [ForeignKey("Post")]
        public int PostId { get; set; }

        // Klucz obcy do użytkownika
        [ForeignKey("User")]
        public int UserId { get; set; }

        // Treść komentarza
        public string Content { get; set; } = string.Empty;

        // Data utworzenia komentarza
        public DateTime DateCreated { get; set; } = DateTime.Now;

        // Nawigacja do posta
        public Post Post { get; set; } = new Post();

        // Nawigacja do użytkownika
        public User User { get; set; } = new User();

        // Konstruktor
        public Comment() { }

        public Comment(int postId, int userId, string content)
        {
            PostId = postId;
            UserId = userId;
            Content = content;
        }
    }
}
