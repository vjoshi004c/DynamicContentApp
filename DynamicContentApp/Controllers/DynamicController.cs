using DynamicContentApp.Models;
using DynamicContentApp.Service;
using Microsoft.AspNetCore.Components.Routing;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ViewEngines;
using Microsoft.Extensions.Logging;
using System.Diagnostics;
using System.Xml.Linq;

namespace DynamicContentApp.Controllers
{
    public class ControllerDynamicController : BaseController
    {
        private readonly ILogger<BaseController> _logger;
        private readonly string _mode;

        private readonly IViewRenderService _viewRenderService;
        private readonly IControllerRenderService _controllerRenderService;
        //public ProductController()
        //{
        //    _mode = "start";
        //}
        public ControllerDynamicController(ILogger<BaseController> logger, IViewRenderService viewRenderService) : base(logger , viewRenderService)
        {
            _logger = logger;
            _viewRenderService = viewRenderService;
          
        }
        public ControllerDynamicController(IViewRenderService viewRenderService) : base( viewRenderService)
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
       
        public async Task<IActionResult> ControllerDynamicContent(string areaName, string areaEndpoint, string areaEndpointDataType, string areaHttpMethod, string areaEndpointRequestData)
        {

            ControllerDynamicContent controllerDynamicContent = new ControllerDynamicContent();
            controllerDynamicContent.AreaName = areaName;
            controllerDynamicContent.AreaEndpoint = areaEndpoint;
            controllerDynamicContent.AreaEndpointDataType = areaEndpointDataType;
            controllerDynamicContent.AreaHttpMethod = areaHttpMethod;
            controllerDynamicContent.AreaEndpointRequestData = areaEndpointRequestData;
    
            return View("~/Views/Dynamic/ControllerDynamicContent.cshtml", controllerDynamicContent, dynamicallyRender :true);

          
        }
      

        //[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
