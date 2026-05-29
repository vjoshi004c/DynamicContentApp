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
    public class BaseController : Controller
    {
        private readonly ILogger<BaseController>? _logger;
        private readonly IViewRenderService? _viewRenderService;
        private readonly IControllerRenderService? _controllerRenderService;
        public BaseController(ILogger<BaseController> logger, IViewRenderService viewRenderService, IControllerRenderService controllerRenderService)
        {
            _logger = logger;
            _viewRenderService = viewRenderService;
            _controllerRenderService = controllerRenderService;
        }
        public BaseController(ILogger<BaseController> logger, IViewRenderService viewRenderService)
        {
            _logger = logger;
            _viewRenderService = viewRenderService;
            
        }
        public BaseController( IViewRenderService viewRenderService)
        {
          
            _viewRenderService = viewRenderService;

        }
        /// <returns>The created <see cref="ViewResult"/> object for the response.</returns>
        [NonAction]

        public virtual ViewResult View(string? viewName, object? model, bool? dynamicallyRender)
        {
           string html = string.Empty;
            if (dynamicallyRender == true)
            {
                 html = _viewRenderService.RenderToStringAsync(viewName, model).Result;
            }
            ViewData.Model = (object)html;

            return new ViewResult()
            {
                ViewName = viewName,
                ViewData = ViewData,
                TempData = TempData
            };
        }

    }
}
