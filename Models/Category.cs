using System;
using System.Collections.Generic;

namespace Skywide.Models;

public partial class Category
{
    public int CategoryID { get; set; }

    public string Name { get; set; } = null!;

    public string Description { get; set; }

    public DateTime DateCreated { get; set; } = DateTime.UtcNow;

    public string Slug { get; set; }

    public int UserID { get; set; }
    public List<Subscription> Subscribers { get; set; }
    public virtual ICollection<Post> Posts { get; set; } = new List<Post>();

    public Category(string name, string description, string slug, int userID)
    {
        Name = name;
        Description = description;
        Slug = slug;
        UserID = userID;
    }
}
