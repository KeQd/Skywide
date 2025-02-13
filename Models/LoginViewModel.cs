namespace Skywide.Models
{
    public class LoginViewModel
    {
        public string Username { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;

        public LoginViewModel() { }

        public LoginViewModel(string username, string password)
        {
            Username = username;
            Password = password;
        }
    }
}
