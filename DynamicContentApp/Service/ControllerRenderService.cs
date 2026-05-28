using DynamicContentApp.Controllers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Abstractions;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewEngines;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using System.Reflection;

namespace DynamicContentApp.Service
{
    public class ControllerRenderService : IControllerRenderService
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IViewRenderService _viewRenderService;
        public ControllerRenderService(ILogger<HomeController> logger, IViewRenderService viewRenderService)
        {
            _logger = logger;
            _viewRenderService = viewRenderService;
        }

        public async Task<string> InvokeDynamicController(string controllerName, string actionName, object[] parameters = null)
        {
            string fullHtmlRendering = string.Empty;
            // 1. Find the Controller Type (assuming it ends with "Controller")
            var controllerType = Assembly.GetExecutingAssembly().GetTypes()
                .FirstOrDefault(t => t.Name.Equals(controllerName + "Controller", StringComparison.OrdinalIgnoreCase));

            if (controllerType != null)
            {
                // 2. Create instance (use your DI container if necessary)
                var controllerInstance = Activator.CreateInstance(controllerType, _viewRenderService);


                // 3. Get the Action Method
                var methodInfo = controllerType.GetMethod(actionName,
                    BindingFlags.Public | BindingFlags.Instance | BindingFlags.IgnoreCase);

                if (methodInfo != null)
                {
                    // 4. Invoke the method
                    var result = methodInfo.Invoke(controllerInstance, parameters);
                    //string htmldata = ((Microsoft.AspNetCore.Mvc.ViewResult)(Microsoft.AspNetCore.Mvc.ActionResult(result).Result)).ViewName;
                    //string htmlData = ((ViewResult)(new System.Threading.Tasks.SystemThreadingTasks_FutureDebugView<Microsoft.AspNetCore.Mvc.IActionResult>(result).Result)).ViewName;

                    //Microsoft.AspNetCore.Mvc.ViewResult viewResultFinal = new ViewResult();

                    // ((Microsoft.AspNetCore.Mvc.ViewResult)(new System.Threading.Tasks<Microsoft.AspNetCore.Mvc.IActionResult>(result).Result)).ViewName;


                    if (result is Task<IActionResult> viewResult)

                    // if (result is ViewResult viewResult)
                    {
                        var htmlfinal = ((Microsoft.AspNetCore.Mvc.ViewResult)viewResult.Result).Model;
                        if (htmlfinal != null && htmlfinal.ToString() != string.Empty)
                        {
                            fullHtmlRendering = htmlfinal.ToString();
                        }

                        // string htmlfinal = ((Microsoft.AspNetCore.Mvc.ViewResult)viewResult.Result)).Model;


                        // string htmlfinal = viewResult.Model.ToString();
                        // string html = await _viewRenderService.RenderToStringAsync(viewResult.ViewName, viewResult.ViewData.Model);
                        // Pass the rendered HTML to string
                        //if (controllerInstance != null)
                        //{
                        //     html = await _viewRenderService.RenderViewToStringAsync((Controller)controllerInstance, viewResult);
                        //}
                    }


                }

            }
            return fullHtmlRendering;
        }
    }
}
