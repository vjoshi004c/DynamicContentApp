using DynamicContentApp.Models;
using DynamicContentApp.Service;
using Microsoft.AspNetCore.Rewrite;
using Microsoft.Extensions.Options;

var builder = WebApplication.CreateBuilder(args);


var connectionString = builder.Configuration.GetConnectionString("DefaultConnection") ?? throw new InvalidOperationException("Connection string 'DefaultConnection' not found.");
builder.Services.Configure<SystemConfigOptions>(builder.Configuration.GetSection(SystemConfigOptions.SystemConfig));

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddScoped<IViewRenderService, ViewRenderService>();
builder.Services.AddScoped<IControllerRenderService, ControllerRenderService>();



var app = builder.Build();
// 1. Create a rewrite options object
var options = new RewriteOptions();

// 2. Add a custom rule to exclude static files and rewrite the rest
options.Add(context =>
{
    var request = context.HttpContext.Request;
    var path = request.Path.Value;

    // Check if the path looks like a static file (contains a file extension)
    bool isStaticFile = !string.IsNullOrEmpty(path) && path.Contains('.');

    // If it's not a static file, rewrite internally to your generic endpoint
    if (!isStaticFile)
    {
        context.HttpContext.Request.Path = "/Generic/Start";
    }

    context.Result = RuleResult.SkipRemainingRules;
});

// 3. Register the rewriting middleware
app.UseRewriter(options);



// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}

//app.Use(async (context, next) =>
//{
//    var url = context.Request.Path.Value;


//    if (url.Contains("/home/privacy"))
//    {

//        context.Request.Path = "/home/index";
//    }

//    await next();
//});
app.UseStaticFiles();

app.UseRouting();


app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
