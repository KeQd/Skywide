using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using Skywide.Data;
using Microsoft.AspNetCore.Authentication.Cookies;

var builder = WebApplication.CreateBuilder(args);

// Dodaj us�ug� MVC i baz� danych
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseNpgsql(builder.Configuration.GetConnectionString("DefaultConnection")));

// Konfiguracja autentykacji
builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.LoginPath = "/Login"; // �cie�ka do logowania
        options.AccessDeniedPath = "/AccessDenied"; // �cie�ka dost�pu, je�li u�ytkownik nie ma uprawnie�
    });

// Us�ugi MVC
builder.Services.AddControllersWithViews();

var app = builder.Build();

// Sprawdzenie �rodowiska
if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}
else
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();

// Autentykacja i autoryzacja
app.UseAuthentication();
app.UseAuthorization();

// Mapowanie routingu
app.MapControllerRoute(
    name: "login",
    pattern: "{controller=Login}/{action=Login}/{id?}");

app.MapControllerRoute(
    name: "login_post",
    pattern: "{controller=Login}/{action=LoginIntoHome}");

app.MapControllerRoute(
    name: "register",
    pattern: "{controller=Register}/{action=Register}/{id?}");

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Index}/{action=Index}/{id?}");

app.MapControllerRoute(
    name: "NewPost",
    pattern: "{controller=CreateNewPost}/{action=CreateNewPost}/{category?}");

app.MapControllerRoute(
    name: "NewCategory",
    pattern: "{controller=CreateNewCategory}/{action=CreateNewCategory}/{id?}");

// Uruchom aplikacj�
app.Run();
