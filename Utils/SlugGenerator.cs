using System;
using System.Globalization;
using System.Text;
using System.Text.RegularExpressions;

namespace Skywide.Utils
{
    public class SlugGenerator
    {
        public static string GenerateSlug(string name)
        {
            if (string.IsNullOrWhiteSpace(name))
                return string.Empty;

            // Zamiana na małe litery
            string slug = name.ToLowerInvariant();

            // Usunięcie znaków diakrytycznych (np. ąćęłńóś -> acelnos)
            slug = RemoveDiacritics(slug);

            // Zamiana wszystkich znaków nienumerycznych i nieliterowych na spację
            slug = Regex.Replace(slug, @"[^a-z0-9\s-]", "");

            // Zamiana wielokrotnych spacji i myślników na pojedynczy myślnik
            slug = Regex.Replace(slug, @"\s+", "-").Trim('-');

            return slug;
        }

        private static string RemoveDiacritics(string text)
        {
            var normalizedString = text.Normalize(NormalizationForm.FormD);
            var stringBuilder = new StringBuilder();

            foreach (var c in normalizedString)
            {
                var unicodeCategory = CharUnicodeInfo.GetUnicodeCategory(c);
                if (unicodeCategory != UnicodeCategory.NonSpacingMark)
                {
                    stringBuilder.Append(c);
                }
            }

            return stringBuilder.ToString().Normalize(NormalizationForm.FormC);
        }

    }
}

//string categoryName = "Kuchnia Świata";
//string slug = SlugGenerator.GenerateSlug(categoryName);
//Console.WriteLine(slug);