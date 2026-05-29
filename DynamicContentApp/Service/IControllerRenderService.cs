
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
namespace DynamicContentApp.Service
{
    public interface IControllerRenderService
    {
        
        Task<string> InvokeDynamicController(string controllerName, string actionName, object[] parameters = null);
    }
}
