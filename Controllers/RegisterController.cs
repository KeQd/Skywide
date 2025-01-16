using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Skywide.Data;
using Skywide.Models;
using System.Text.RegularExpressions;

public class RegisterController : Controller
{
    private readonly ApplicationDbContext _context;

    public RegisterController(ApplicationDbContext context)
    {
        _context = context;
    }

    [HttpGet]
    public IActionResult Register()
    {
        var model = new RegisterViewModel
        {
            Username = "",
            Email = "",
            PasswordHash = ""
        };

        return View(model);
    }

    [HttpPost]
    public async Task<IActionResult> CreateNewAccount(RegisterViewModel model)
    {

        // Walidacja nazwy użytkownika
        var existingUsername = await _context.Users
            .FirstOrDefaultAsync(u => u.Username == model.Username);

        string namePattern = @"^[a-zA-Z0-9]{3,10}$";

        if (string.IsNullOrEmpty(model.Username))
        {
            ModelState.AddModelError("Username", "Username is required.");
        }
        else if (existingUsername != null)
        {
            ModelState.AddModelError("Username", "Username is already taken.");
        }
        else if (!Regex.IsMatch(model.Username, namePattern))
        {

            ModelState.AddModelError("Username", "Username must be between 3 and 10 characters long and contain only letters and numbers.");
        }

        // Walidacja adresu email

        if (string.IsNullOrEmpty(model.Email))
        {
            ModelState.AddModelError("Email", "Email is required.");
        }
        else
        {
            var emailLowerCase = model.Email.ToLower();  

            var existingEmail = await _context.Users
                .FirstOrDefaultAsync(u => u.Email.ToLower() == emailLowerCase);

            if (existingEmail != null)
            {
                ModelState.AddModelError("Email", "Email is already taken.");
            }
        }

        //Walidacja hasła

        string passwordPattern = @"^.{5,}$";

        if (string.IsNullOrEmpty(model.PasswordHash))
        {
            ModelState.AddModelError("Password", "Password is required.");
        }
        else if(!Regex.IsMatch(model.PasswordHash, passwordPattern))
        {
            ModelState.AddModelError("Password", "Password must have atleast 5 characters");
        }

        if (!ModelState.IsValid)
        {
            return View("Register", model);
        }



        var newUser = new User
        {
            Username = model.Username,
            Rights = "user",
            Email = model.Email.ToLower(),
            PasswordHash = BCrypt.Net.BCrypt.HashPassword(model.PasswordHash), 
            DateCreated = DateTime.UtcNow
        };

        
        _context.Users.Add(newUser);
        await _context.SaveChangesAsync();

        return RedirectToAction("Login", "Login");
    }
}
