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

            // Zamiana na male litery
            string slug = name.ToLowerInvariant();

            // Usuniecie znakow diakrytycznych
            slug = RemoveDiacritics(slug);

            // Zamiana wszystkich znakow nienumerycznych i nieliterowych na spację
            slug = Regex.Replace(slug, @"[^a-z0-9\s-]", "");

            // Zamiana wielokrotnych spacji i myslnikow na pojedynczy myslnik
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