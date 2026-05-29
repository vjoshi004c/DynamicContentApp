using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Abstractions;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewEngines;
using Microsoft.AspNetCore.Mvc.ViewFeatures;

namespace DynamicContentApp.Service
{
    public class ViewRenderService : IViewRenderService
    {
        private readonly IRazorViewEngine _viewEngine;
        private readonly ITempDataProvider _tempDataProvider;
        private readonly IServiceProvider _serviceProvider;

        public ViewRenderService(
            IRazorViewEngine viewEngine,
            ITempDataProvider tempDataProvider,
            IServiceProvider serviceProvider)
        {
            _viewEngine = viewEngine;
            _tempDataProvider = tempDataProvider;
            _serviceProvider = serviceProvider;
        }

        public async Task<string> RenderToStringAsync(string viewName, object model)
        {
            // 1. Create a dummy ActionContext
            var httpContext = new DefaultHttpContext { RequestServices = _serviceProvider };
            var actionContext = new ActionContext(httpContext, new RouteData(), new ActionDescriptor());

            // 2. Find the View
            var viewResult = _viewEngine.FindView(actionContext, viewName, isMainPage: false);

            if (!viewResult.Success)
            {
                // Try searching by path if explicit name fails
                viewResult = _viewEngine.GetView(executingFilePath: null, viewPath: viewName, isMainPage: false);

                if (!viewResult.Success)
                {
                    throw new FileNotFoundException($"Could not find view: {viewName}");
                }
            }

            // 3. Prepare View Data and Temp Data dictionaries
            var viewData = new ViewDataDictionary(new EmptyModelMetadataProvider(), new ModelStateDictionary())
            {
                Model = model
            };
            
            var tempData = new TempDataDictionary(actionContext.HttpContext, _tempDataProvider);

            // 4. Render the view into a StringWriter
            using var sw = new StringWriter();
            var viewContext = new ViewContext(
                actionContext,
                viewResult.View,
                viewData,
                tempData,
                sw,
                new HtmlHelperOptions()
            );

            await viewResult.View.RenderAsync(viewContext);
            return sw.ToString();
        }

        public async Task<string> RenderViewToStringAsync(Controller controller, ViewResult viewResult)
        {
            var viewEngine = controller.HttpContext.RequestServices.GetService(typeof(ICompositeViewEngine)) as ICompositeViewEngine;
            string viewName = string.IsNullOrEmpty(viewResult.ViewName) ? controller.ControllerContext.ActionDescriptor.ActionName : viewResult.ViewName;

            // Find the view (checks both full paths and standard action directories)
            if (viewEngine != null)
            {
                var viewEngineResult = viewEngine.GetView(executingFilePath: null, viewPath: viewName, isMainPage: true);
                if (!viewEngineResult.Success)
                {
                    viewEngineResult = viewEngine.FindView(controller.ControllerContext, viewName, isMainPage: true);
                }

                if (!viewEngineResult.Success)
                {
                    throw new FileNotFoundException($"The view '{viewName}' could not be found.");
                }

                using (var writer = new StringWriter())
                {
                    var viewContext = new ViewContext(
                        controller.ControllerContext,
                        viewEngineResult.View,
                        new ViewDataDictionary(controller.ViewData) { Model = viewResult.Model },
                        //new TempDataDictionary(controller.HttpContext, controller.TempData),
                        controller.TempData,
                        writer,
                        new HtmlHelperOptions()
                    );

                    await viewEngineResult.View.RenderAsync(viewContext);
                    return writer.GetStringBuilder().ToString();
                }
                
            }
            return string.Empty;
        }
    }
}
