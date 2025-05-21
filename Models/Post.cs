using System;
using System.Collections.Generic;

namespace Skywide.Models;

public partial class Post
{
    public int PostID { get; set; }

    public int UserID { get; set; }

    public string Title { get; set; }

    public string Content { get; set; }

    public DateTime DateCreated { get; set; } = DateTime.UtcNow;

    public int CategoryID { get; set; }

    public string Slug { get; set; }

    public virtual Category Category { get; set; }

    public virtual ICollection<Comment> Comments { get; set; } = new List<Comment>();

    public virtual User Owner { get; set; }

    public Post(int userID, string title, string content, int categoryID, string slug)
    {
        UserID = userID;
        Title = title;
        Content = content;
        CategoryID = categoryID;
        Slug = slug;
    }
}