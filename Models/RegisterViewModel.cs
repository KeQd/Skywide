﻿using System.ComponentModel.DataAnnotations;

namespace Skywide.Models
{
    public class RegisterViewModel
    {
        public string Username { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public RegisterViewModel() { }
    }

}