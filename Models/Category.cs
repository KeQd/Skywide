﻿namespace Skywide.Models
{
    public class Category
    {
        public int CategoryId { get; set; }
        public string Name { get; set; }  
        public string Description { get; set; }  
        public DateTime DateCreated { get; set; }
        public string Slug { get; set; }

        public Category()
        {
            Name = string.Empty;
            Description = string.Empty;
            Slug = string.Empty;
        }
    }

}
