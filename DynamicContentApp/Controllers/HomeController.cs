using DynamicContentApp.JSON;
using DynamicContentApp.Models;
using DynamicContentApp.Service;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.SignalR.Protocol;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Options;
using System.Collections.Generic;
using System.Diagnostics;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;
using System;
using System.Data.SqlClient;


namespace DynamicContentApp.Controllers
{
    public class HomeController : BaseController
    {
        private readonly ILogger<BaseController> _logger;
        private readonly IViewRenderService _viewRenderService;
        private readonly IControllerRenderService _controllerRenderService;
        private readonly SystemConfigOptions _options;

        private readonly IConfiguration _configuration;

        private string ConnenctionString = string.Empty;
        public HomeController(ILogger<BaseController> logger, IViewRenderService viewRenderService, IControllerRenderService controllerRenderService, IOptions<SystemConfigOptions> options, IConfiguration configuration) :base(logger, viewRenderService, controllerRenderService)
        {
            _logger = logger;
            _viewRenderService = viewRenderService;
            _controllerRenderService = controllerRenderService;
            _options = options.Value;
            _configuration = configuration;
            ConnenctionString = _configuration["ConnectionStrings:DefaultConnection"];
        }
        public IActionResult Error()
        {
            return View("~/Views/Product/ContentBody.cshtml");
        }
        public IActionResult RenderMedia()
        {
            ViewData["CurrnetDomainUrl"] = _options.CurrnetDomainUrl; //"http://localhost:5287";
            ViewData["SelectedLayout"] = "_MasterpMediaLayout";

            string assetItemID = Request.Query["assetItemID"];
            string assetItemFieldID = Request.Query["assetItemFieldID"];
            string schemaFieldID = Request.Query["schemaFieldID"];
            try
            {
                ImageModel image = null;

                using (var conn = new SqlConnection(ConnenctionString))
                using (var cmd = new SqlCommand("SELECT FileName, ContentType, FileData FROM AssetMediaUploadedFiles WHERE assetItemID = @assetItemID AND assetItemFieldID = @assetItemFieldID AND schemaFieldID = @schemaFieldID", conn))
                {
                    cmd.Parameters.AddWithValue("@assetItemID", assetItemID);
                    cmd.Parameters.AddWithValue("@assetItemFieldID", assetItemFieldID);
                    cmd.Parameters.AddWithValue("@schemaFieldID", schemaFieldID);
                    conn.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            image = new ImageModel
                            {
                                FileName = reader["FileName"].ToString(),
                                ContentType = reader["ContentType"].ToString(),
                                Data = reader["FileData"] as byte[]
                            };
                        }
                    }
                }

                if (image == null || image.Data == null)
                    return null;
                //return HttpNotFound("Image not found.");

                return File(image.Data, image.ContentType);
            }
            catch (Exception ex)
            {
                // Log error in production
               // return new HttpStatusCodeResult(500, "Internal server error: " + ex.Message);
                return null;
            }
            //return View("~/Views/Home/RenderMedia.cshtml");
        }
        public IActionResult Login()
        {
            ViewData["CurrnetDomainUrl"] = _options.CurrnetDomainUrl; //"http://localhost:5287";
            ViewData["SelectedLayout"] = "_MasterLoginDesktop";
            return View("~/Views/Home/Login.cshtml");
        }
        public IActionResult Desktop()
        {
            ViewData["CurrnetDomainUrl"] = _options.CurrnetDomainUrl; //"http://localhost:5287";
            ViewData["SelectedLayout"] = "_MasterLoginDesktop";
            return View("~/Views/Home/Desktop.cshtml");
        }

        public IActionResult DesktopMain()
        {
            ViewData["CurrnetDomainUrl"] = _options.CurrnetDomainUrl; //"http://localhost:5287";
            ViewData["SelectedLayout"] = "_MasterLoginDesktop";
            return View("~/Views/Home/DesktopMain.cshtml");
        }


        public IActionResult Privacy()
        {
            return View();
        }
        public IActionResult ContactUs()
        {
            return View();
        }
        public IActionResult AboutUs()
        {
            return View();
        }
        //[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        //public IActionResult Error()
        //{
        //    return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        //}


    }
    public class ImageModel
    {
        public int Id { get; set; }
        public string FileName { get; set; }
        public string ContentType { get; set; }
        public byte[] Data { get; set; }
    }
}
