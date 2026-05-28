
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
namespace DynamicContentApp.Service
{
    public interface IViewRenderService
    {
        Task<string> RenderToStringAsync(string viewName, object model);
        Task<string> RenderViewToStringAsync(Controller controller, ViewResult viewResult);
    }
}
