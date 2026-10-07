using DynamicContentApp.Models;
using DynamicContentApp.Service;
using DynamicContentApp.Session;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using System;
using System.Diagnostics;
using System.IO;
using System.Reflection.Metadata;
using System.Threading.Tasks;
using System.Xml.Linq;


namespace DynamicContentApp.Controllers
{
    public class LoginController : Controller
    {
        private readonly ILogger<BaseController> _logger;
        private readonly IViewRenderService _viewRenderService;
        private readonly IControllerRenderService _controllerRenderService;
        private readonly SystemConfigOptions _options;
        private readonly ICMSService _cmsService;
        private readonly IConfiguration _configuration;
        // Update this string with your actual application database connection parameters
        //private readonly string _connectionString = "Server=YOUR_SERVER;Database=YOUR_DB;Trusted_Connection=True;";
        //private string _connectionString = "Data Source=SQL1026;Initial Catalog=TestDCA;TrustServerCertificate=True;User ID=sa;Password=Wstinol1";
        private string _connectionString = string.Empty;
        public LoginController(ILogger<BaseController> logger, IOptions<SystemConfigOptions> options, IConfiguration configuration) 
        {
            _logger = logger;
            _configuration = configuration;
            _connectionString= _configuration["ConnectionStrings:DefaultConnection"];
        }


       
            [HttpPost]
        public IActionResult Validate([FromBody]  UserModel usermodel)
        {
           

            try
            {
                if (usermodel.Username.ToUpper() == "ADMIN" && usermodel.Password.ToUpper() == "VPM031207")
                //if(username='ADMIN' & password='vpm031207')
                {

                    usermodel.IsAuthorized = true;
                    usermodel.IsAdmin = true;

                    HttpContext.Session.SetObject("CurrentUser", usermodel);
                    var user = HttpContext.Session.GetObject<UserModel>("CurrentUser");

                    if (user == null)
                    {
                        // Session expired or user not logged in
                        return RedirectToAction("Login");
                    }
                    return Ok(true);
                }

                else if (usermodel.Username.ToUpper() == "DUMMY" && usermodel.Password.ToUpper() == "DUMMY")
                //if(username='ADMIN' & password='vpm031207')
                {

                    usermodel.IsAuthorized = true;
                    usermodel.IsAdmin = false;
                    HttpContext.Session.SetObject("CurrentUser", usermodel);
                    var user = HttpContext.Session.GetObject<UserModel>("CurrentUser");
                    if (user == null)
                    {
                        // Session expired or user not logged in
                        return RedirectToAction("Login");
                    }
                    return Ok(true);
                }
                else
                {
                    usermodel.IsAuthorized = false;
                    usermodel.IsAdmin = false;
                    HttpContext.Session.Remove("CurrentUser");
                    HttpContext.Session.Clear();
                    return Ok(false);
                }

            }
            catch (Exception ex)
            {
                return Ok(false);
            }
        }
    }
}
