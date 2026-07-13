using DynamicContentApp.JSON;
using DynamicContentApp.Models;
using DynamicContentApp.Service;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR.Protocol;
using System.Collections.Generic;
using System.Diagnostics;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace DynamicContentApp.Controllers
{
    public class HomeController : BaseController
    {
        private readonly ILogger<BaseController> _logger;
        private readonly IViewRenderService _viewRenderService;
        private readonly IControllerRenderService _controllerRenderService;
        public HomeController(ILogger<BaseController> logger, IViewRenderService viewRenderService, IControllerRenderService controllerRenderService):base(logger, viewRenderService, controllerRenderService)
        {
            _logger = logger;
            _viewRenderService = viewRenderService;
            _controllerRenderService = controllerRenderService;
        }
        public IActionResult Error()
        {
            return View("~/Views/Product/ContentBody.cshtml");
        }

        public IActionResult Login()
        {
            ViewData["SelectedLayout"] = "_MasterLoginDesktop";
            return View("~/Views/Home/Login.cshtml");
        }
        public IActionResult Desktop()
        {
            ViewData["SelectedLayout"] = "_MasterLoginDesktop";
            return View("~/Views/Home/Desktop.cshtml");
        }

        public IActionResult DesktopMain()
        {
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
}
