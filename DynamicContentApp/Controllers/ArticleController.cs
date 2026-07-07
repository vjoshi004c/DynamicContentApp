using DynamicContentApp.Models;
using DynamicContentApp.Service;
using Microsoft.AspNetCore.Components.Routing;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ViewEngines;
using Microsoft.Extensions.Logging;
using System.Diagnostics;
using System.Xml.Linq;

namespace DynamicContentApp.Controllers
{
    public class ArticleController : BaseController
    {
        private readonly ILogger<BaseController> _logger;
        private readonly string _mode;

        private readonly IViewRenderService _viewRenderService;
        private readonly IControllerRenderService _controllerRenderService;
        //public ProductController()
        //{
        //    _mode = "start";
        //}
        public ArticleController(ILogger<BaseController> logger, IViewRenderService viewRenderService) : base(logger , viewRenderService)
        {
            _logger = logger;
            _viewRenderService = viewRenderService;
          
        }
        public ArticleController(IViewRenderService viewRenderService) : base( viewRenderService)
        {

            _viewRenderService = viewRenderService;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Catalog()
        {
            return View();
        }
        public async Task<IActionResult> ContentBody()
        {

            HomeViewModel HomeViewModel = new HomeViewModel();
            HomeViewModel.ReWriteUrl = "rewriteurl";
            HomeViewModel.BrowserUrl = "browserurl";
            return View("~/Views/Components/ArticleContent.cshtml", HomeViewModel, dynamicallyRender :true);

          
        }
        
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
