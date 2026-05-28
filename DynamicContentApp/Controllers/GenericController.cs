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
    public class GenericController : BaseController
    {
        private readonly ILogger<BaseController> _logger;
        private readonly IViewRenderService _viewRenderService;
        private readonly IControllerRenderService _controllerRenderService;
        public GenericController(ILogger<BaseController> logger, IViewRenderService viewRenderService, IControllerRenderService controllerRenderService):base(logger, viewRenderService, controllerRenderService)
        {
            _logger = logger;
            _viewRenderService = viewRenderService;
            _controllerRenderService = controllerRenderService;
        }

        [HttpGet]
        public async Task<IActionResult> Start()
        {

            ViewData["SelectedLayout"] = "_MasterLayout";

            string scheme = HttpContext.Request.Scheme;
            string host = HttpContext.Request.Host.Value;
            string? rawTarget = HttpContext.Features.Get<IHttpRequestFeature>()?.RawTarget;

            string fullBrowserUrl = $"{scheme}://{host}{rawTarget}";

            //var fullUrl = $"{Request.Scheme}://{Request.Host}{Request.PathBase}{Request.Path}{Request.QueryString}";
            var fullUrl = Request.GetDisplayUrl();
            HomeViewModel HomeViewModel = new HomeViewModel();

            HomeViewModel.BrowserUrl = fullBrowserUrl;
            HomeViewModel.ReWriteUrl = fullUrl;
            PageItemModel PageItemModel = new PageItemModel();
            if (! String.IsNullOrEmpty(HttpContext.Request.Query["ID"]))
            {
                string project = HttpContext.Request.Query["ID"].ToString();
                if (project == "2") { PageItemModel = MockData.GeneratePageItemModel(2); }
                else if (project == "1") {  PageItemModel = MockData.GeneratePageItemModel(1); }
                else {  PageItemModel = MockData.GeneratePageItemModel(Convert.ToInt32(1)); }
            }
            else
            {
                PageItemModel = MockData.GeneratePageItemModel(Convert.ToInt32(1));
            }

            //******************* For serialize or de-serialize json 
            //string jsonString = JsonConversion.SerializeJson(PageItemModel);
            //PageItemModel PageItemModel2  = JsonConversion.DeserializeHugeJson(jsonString);
            //*************

            // PageItemModel PageItemModel = MockData.GeneratePageItemModel(1);

            StringBuilder htmlContentMaster = new StringBuilder(await _viewRenderService.RenderToStringAsync(PageItemModel.MasterLayoutPath, HomeViewModel));

            List<ComponenetDetailsModel> ComponenetDetailsModel = PageItemModel.ComponenetDetails;

            List<PageSectionContent> PageSectionContent = new List<PageSectionContent>();

            foreach (var item in ComponenetDetailsModel)
            {
                if (item.Component.ComponentType == ComponentTypeEnum.ViewRendering)
                {
                    string htmlContent = await _viewRenderService.RenderToStringAsync(item.Component.ComponentItemPath, HomeViewModel);
                    Utility.AddOnPlaceholderCollection(PageSectionContent, item, htmlContent);

                }
                if (item.Component.ComponentType == ComponentTypeEnum.ControllerRendering)
                {
                    Task<String> htmlContent = _controllerRenderService.InvokeDynamicController(item.Component.ControllerName, item.Component.ControllerAction, null);
                    string resulthtml = await htmlContent;
                    Utility.AddOnPlaceholderCollection(PageSectionContent, item, resulthtml);
                }
            }
            foreach (var itempsc in PageSectionContent)
            {
                htmlContentMaster.Replace(itempsc.PlaceholderName, itempsc.HtmlContent);
            }
            HomeViewModel.ViewContent = htmlContentMaster.ToString();
            return View(HomeViewModel);
        }

        

        


    }
}
