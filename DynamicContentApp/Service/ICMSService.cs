
using DynamicContentApp.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
namespace DynamicContentApp.Service
{
    public interface ICMSService
    {
         Task IfModeIsContentManagement(HomeViewModel HomeViewModel, bool isContentDeliveryError, int PageItemID);
        void IfModeIsContentDelivery(HomeViewModel HomeViewModel);
        void SavePageEntireHtmlInDatabase(HomeViewModel HomeViewModel);
    }
}
