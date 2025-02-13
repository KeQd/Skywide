using System;
using System.Collections.Generic;

namespace Skywide.Models;

public partial class Comment
{
    public int CommentID { get; set; }

    public int? PostID { get; set; }

    public int? UserID { get; set; }

    public string Content { get; set; } = null!;

    public DateTime? DateCreated { get; set; }

    public virtual Post? Post { get; set; }

    public virtual User? User { get; set; }
}
