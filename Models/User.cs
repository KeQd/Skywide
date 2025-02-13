using System;
using System.Collections.Generic;

namespace Skywide.Models;

public partial class User
{
    public int UserID { get; set; }

    public string Rights { get; set; } = null!;

    public string Username { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string PasswordHash { get; set; } = null!;

    public DateTime DateCreated { get; set; } = DateTime.UtcNow;

    public virtual ICollection<Comment> Comments { get; set; } = new List<Comment>();

    public virtual ICollection<Post> Posts { get; set; } = new List<Post>();

    public User(string rights, string username, string email, string passwordHash)
    {
        Rights = rights;
        Username = username;
        Email = email;
        PasswordHash = passwordHash;
    }
}
