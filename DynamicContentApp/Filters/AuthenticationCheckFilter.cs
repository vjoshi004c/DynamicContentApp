using DynamicContentApp.Models;
using DynamicContentApp.Session;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
namespace DynamicContentApp.Filters
{
    public class AuthenticationCheckFilter : ActionFilterAttribute
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        public AuthenticationCheckFilter(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }
        public override void OnActionExecuting(ActionExecutingContext context)
        {


            var _httpContext = _httpContextAccessor.HttpContext;
            if (_httpContext != null && _httpContext.Session != null &&_httpContext.Session.GetObject<UserModel>("CurrentUser") != null)
            { 
                UserModel user = _httpContext.Session.GetObject<UserModel>("CurrentUser");



            if (user != null && user.IsAdmin == false)
            {
                context.Result = new UnauthorizedObjectResult(new { message = "Permission denied: The user ["+ user.Username + "] does not have permission to delete selected item." });
                return;
            }
        }


            // var httpContext = context.HttpContext;
            // UserModel user = httpContext.Session.GetObject<UserModel>("CurrentUser");

            //if (httpContext.Session.GetObject<UserModel>("CurrentUser") != null)
            //{
            //    context.Result = new UnauthorizedResult();
            //}

            // Retrieve a value from session
            // var userId = context.HttpContext.Session.GetString("UserId");

            // var sessionJson  = _httpContextAccessor.HttpContext.Session.GetString("CurrentUser");

            //  var sessionJson = HttpContextAccessor.HttpContext?.Session.GetString("CurrentUser");
            //UserModel user = sessionJson != null ? System.Text.Json.JsonSerializer.Deserialize<UserModel>(sessionJson) : null;

            // Check if session data is missing or invalid
            //if (string.IsNullOrEmpty(userId))
            //{
            //    // Return 'false' behavior: e.g., Unauthorized (401) or Redirect
            //    context.Result = new UnauthorizedObjectResult(new { message = "Permission denied: The user does not have permission to delete messages." });
            //    return;
            //}

            // If valid, the pipeline continues to the controller action
            base.OnActionExecuting(context);
        }

        public void OnActionExecuted(ActionExecutedContext context)
        {
            // Logic for after the action executes
        }
    }
}
