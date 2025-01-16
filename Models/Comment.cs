using System;
using Microsoft.Extensions.Hosting;

namespace Skywide.Models
{
    public class Comment
    {
        public int CommentId { get; set; }
        public int PostId { get; set; }  // Klucz obcy do Post
        public int UserId { get; set; }  // Klucz obcy do User
        public string Content { get; set; }
        public DateTime DateCreated { get; set; } = DateTime.Now;

        // Nawigacja do postu, do którego komentarz należy
        public Post Post { get; set; }

        // Nawigacja do użytkownika, który napisał komentarz
        public User User { get; set; }
    }
}
