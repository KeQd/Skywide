using System;
using System.Collections.Generic;

namespace Skywide.Models;

public partial class Comment
{
    public int CommentID { get; set; }

    public int PostID { get; set; }

    public int UserID { get; set; }

    public string Content { get; set; }

    public DateTime DateCreated { get; set; } = DateTime.UtcNow;

	public virtual Post? Post { get; set; }

    public virtual User? User { get; set; }

	public Comment() { }
	public Comment(int postID, int userID, string content)
    {
        PostID = postID;
        UserID = userID;
        Content = content;
    }
}