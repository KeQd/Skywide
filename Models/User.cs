using System;

namespace Skywide.Models
{
    public class User
    {
        public int UserID { get; set; }
        public string? Rights { get; set; }
        public string? Username { get; set; }
        public string? Email { get; set; }
        public string? PasswordHash { get; set; }
        public DateTime DateCreated { get; set; } = DateTime.Now;
    }
}