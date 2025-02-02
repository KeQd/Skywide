using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace Skywide.Models
{
    public class Post
    {
        public int PostID { get; set; }

        public int UserID { get; set; }

        public string Title { get; set; } = string.Empty;

        public string Content { get; set; } = string.Empty;

        public DateTime DateCreated { get; set; } = DateTime.Now;

        public int CategoryID { get; set; }

        public string Slug { get; set; } = string.Empty;

        // Nawigacja do użytkownika, który utworzył post
        public User User { get; set; } = new User();

        public Post() { }

        public Post(string title, string content, int userId, int categoryId)
        {
            Title = title;
            Content = content;
            UserID = userId;
            CategoryID = categoryId;
            DateCreated = DateTime.UtcNow;
            Slug = GenerateSlug(title);
        }

        private string GenerateSlug(string title)
        {
            return title.ToLower().Replace(" ", "-");  // Przykład prostego slug-a
        }
    }
}
