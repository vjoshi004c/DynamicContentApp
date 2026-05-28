using DynamicContentApp.Models;
using DynamicContentApp.Service;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Diagnostics;
using System.Xml.Linq;

namespace DynamicContentApp.Controllers
{
    public class ProductController : Controller
    {
        private readonly ILogger<ProductController> _logger;
        private readonly string _mode;

        private readonly IViewRenderService _viewRenderService;
        
        public ProductController()
        {
            _mode = "start";
        }
        public ProductController(ILogger<ProductController> logger, IViewRenderService viewRenderService)
        {
            _logger = logger;
            _viewRenderService = viewRenderService;
        }
        public ProductController( IViewRenderService viewRenderService)
        {
          
            _viewRenderService = viewRenderService;
        }
        public IActionResult Index()
        {
            return View();
        }

        //public IActionResult Privacy()
        //{
        //    return View();
        //}
        public async Task<IActionResult> Privacy()
        {

            HomeViewModel HomeViewModel = new HomeViewModel();
            HomeViewModel.ReWriteUrl = "rewriteurl";
            HomeViewModel.BrowserUrl = "browserurl";

            //ViewResult viewResult= View("~/Views/Product/Privacy.cshtml", HomeViewModel);


            string html = await _viewRenderService.RenderToStringAsync("~/Views/Product/Privacy.cshtml", HomeViewModel);
            //string html = await _viewRenderService.RenderToStringAsync(viewResult.ViewName, viewResult.Model);
            //return View(html);
            return View((object)html);
            // return View( HomeViewModel);
        }
        
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
