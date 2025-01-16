using Microsoft.EntityFrameworkCore;
using Skywide.Models;

namespace Skywide.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }

        // DbSet dla tabeli Users
        public DbSet<User> Users { get; set; }

        // DbSet dla tabeli Posts
        public DbSet<Post> Posts { get; set; }

        // DbSet dla tabeli Comments (jeśli ją tworzysz)
        public DbSet<Comment> Comments { get; set; }
    }
}
