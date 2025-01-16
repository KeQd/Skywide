using Skywide.Models;

namespace Skywide.Models
{
    public class IndexViewModel
    {
        // Lista postów do wyświetlenia
        public List<Post> Posts { get; set; }

        // Dane zalogowanego użytkownika (opcjonalnie)
        public string Username { get; set; }
        public int UserId { get; set; }
    }
}