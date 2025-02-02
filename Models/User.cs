using System;
using System.Collections.Generic;

namespace Skywide.Models
{
    public class User
    {
        public int UserID { get; set; }

        public string Rights { get; set; } = string.Empty;

        public string Username { get; set; } = string.Empty;

        public string Email { get; set; } = string.Empty;

        public string PasswordHash { get; set; } = string.Empty;

        public DateTime DateCreated { get; set; } = DateTime.Now;

        // Nawigacja do postów
        public ICollection<Post> Posts { get; set; } = new List<Post>();

        public User() { }

        public User(string rights, string username, string email, string passwordHash)
        {
            Rights = rights;
            Username = username;
            Email = email;
            PasswordHash = passwordHash;
        }
    }
}
