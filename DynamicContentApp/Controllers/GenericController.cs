using DynamicContentApp.DataLayer;
using DynamicContentApp.JSON;
using DynamicContentApp.Models;
using DynamicContentApp.Service;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR.Protocol;
using Microsoft.Extensions.Options;
using System.Collections.Generic;
using System.Diagnostics;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace DynamicContentApp.Controllers
{
    public class GenericController : BaseController
    {
        private readonly ILogger<BaseController> _logger;
        private readonly IViewRenderService _viewRenderService;
        private readonly IControllerRenderService _controllerRenderService;
        private readonly SystemConfigOptions _options;
        private readonly ICMSService _cmsService;
        public GenericController(ILogger<BaseController> logger, IViewRenderService viewRenderService, IControllerRenderService controllerRenderService, IOptions<SystemConfigOptions> options, ICMSService cmsService) :base(logger, viewRenderService, controllerRenderService)
        {
            _logger = logger;
            _viewRenderService = viewRenderService;
            _controllerRenderService = controllerRenderService;
            _options = options.Value;
            _cmsService = cmsService;
        }

        [HttpGet]
        public async Task<IActionResult> Start()
        {

            string fullBrowserUrl, fullUrl;
            GetBrowserAndInternalPageUrl(out fullBrowserUrl, out fullUrl);
            HomeViewModel HomeViewModel = new HomeViewModel();
            HomeViewModel.BrowserUrl = fullBrowserUrl;
            HomeViewModel.ReWriteUrl = fullUrl;

            ViewData["SelectedLayout"] = "_MasterLayout";

            if (_options.ApplicationMode.ToUpper() == ApplicationMode.CONTENT_DELIVERY.ToString())
            {
                _cmsService.IfModeIsContentDelivery(HomeViewModel);
            }
            if (_options.ApplicationMode.ToUpper() == ApplicationMode.CONTENT_MANAGEMENT.ToString())
            {
                int PageItemID = 0;
                if (!String.IsNullOrEmpty(HttpContext.Request.Query["ID"]))
                {
                    string project = HttpContext.Request.Query["ID"].ToString();
                    if (project == "2") { PageItemID = 2; }
                    else if (project == "1") { PageItemID = 1; }
                    else if (project == "3") { PageItemID = 3; }
                    else { PageItemID = 1; }
                }
                else
                {
                    PageItemID = 1;
                }
                await _cmsService.IfModeIsContentManagement(HomeViewModel, false, PageItemID );
            }

            if (String.IsNullOrEmpty(HomeViewModel.ViewContent))
            {
                HomeViewModel.ErrorContent = "<div style=\"color:Red\"> <h4> Requested page " + HomeViewModel.BrowserUrl + " not available" + "<h4><div>";
                await _cmsService.IfModeIsContentManagement(HomeViewModel, true, 3);

            }

            return View(HomeViewModel);
        }

        private void GetBrowserAndInternalPageUrl(out string fullBrowserUrl, out string fullUrl)
        {
            string scheme = HttpContext.Request.Scheme;
            string host = HttpContext.Request.Host.Value;
            string? rawTarget = HttpContext.Features.Get<IHttpRequestFeature>()?.RawTarget;
            fullBrowserUrl = $"{scheme}://{host}{rawTarget}";
            //var fullUrl = $"{Request.Scheme}://{Request.Host}{Request.PathBase}{Request.Path}{Request.QueryString}";
            fullUrl = Request.GetDisplayUrl();
        }

        //private async Task IfModeIsContentManagement(HomeViewModel HomeViewModel, bool isContentDeliveryError, int PageItemID)
        //{

        //    //ViewData["SelectedLayout"] = "_MasterLayout";

        //    PageItemModel PageItemModel = new PageItemModel();
        //    if (isContentDeliveryError)
        //    {
        //        PageItemModel = MockData.GeneratePageItemModel(3);
        //    }
        //    else
        //    {
        //        if (!String.IsNullOrEmpty(HttpContext.Request.Query["ID"]))
        //        {
        //            string project = HttpContext.Request.Query["ID"].ToString();
        //            if (project == "2") { PageItemModel = MockData.GeneratePageItemModel(2); }
        //            else if (project == "1") { PageItemModel = MockData.GeneratePageItemModel(1); }
        //            else if (project == "3") { PageItemModel = MockData.GeneratePageItemModel(3); }
        //            else { PageItemModel = MockData.GeneratePageItemModel(Convert.ToInt32(1)); }
        //        }
        //        else
        //        {
        //            PageItemModel = MockData.GeneratePageItemModel(Convert.ToInt32(1));
        //        }
        //    }

        //    //******************* For serialize or de-serialize json 
        //    //string jsonString = JsonConversion.SerializeJson(PageItemModel);
        //    //PageItemModel PageItemModel2  = JsonConversion.DeserializeHugeJson(jsonString);
        //    //*************

        //    // PageItemModel PageItemModel = MockData.GeneratePageItemModel(1);

        //    StringBuilder htmlContentMaster = new StringBuilder(await _viewRenderService.RenderToStringAsync(PageItemModel.MasterLayoutPath, HomeViewModel));

        //    List<ComponenetDetailsModel> ComponenetDetailsModel = PageItemModel.ComponenetDetails;

        //    List<PageSectionContent> PageSectionContent = new List<PageSectionContent>();

        //    foreach (var item in ComponenetDetailsModel)
        //    {
        //        if (item.Component.ComponentType == ComponentTypeEnum.ViewRendering)
        //        {
        //            string htmlContent = await _viewRenderService.RenderToStringAsync(item.Component.ComponentItemPath, HomeViewModel);
        //            Utility.AddOnPlaceholderCollection(PageSectionContent, item, htmlContent);

        //        }
        //        if (item.Component.ComponentType == ComponentTypeEnum.ControllerRendering)
        //        {
        //            Task<String> htmlContent = _controllerRenderService.InvokeDynamicController(item.Component.ControllerName, item.Component.ControllerAction, null);
        //            string resulthtml = await htmlContent;
        //            Utility.AddOnPlaceholderCollection(PageSectionContent, item, resulthtml);
        //        }
        //    }
        //    foreach (var itempsc in PageSectionContent)
        //    {
        //        htmlContentMaster.Replace(itempsc.PlaceholderName, itempsc.HtmlContent);
        //    }
        //    HomeViewModel.ViewContent = htmlContentMaster.ToString();
        //    if (!isContentDeliveryError)
        //    {
        //        _cmsService.SavePageEntireHtmlInDatabase(HomeViewModel);
        //    }

        //}

        //private void IfModeIsContentDelivery(HomeViewModel HomeViewModel)
        //{
        //        DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            
        //        List<DynamicContentModel> DynamicContentlist = dynamicContentDAL.GetPageContent(!String.IsNullOrEmpty(HomeViewModel.BrowserUrl) ? HomeViewModel.BrowserUrl:string.Empty  );
        //        if (DynamicContentlist != null && DynamicContentlist.Count > 0)
        //        {
        //            HomeViewModel.ViewContent = DynamicContentlist[0].PageContent;
        //        }
        //}

        //private  void SavePageEntireHtmlInDatabase(HomeViewModel HomeViewModel)
        //{
        //    DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
        //    List<DynamicContentModel> DynamicContentlist = dynamicContentDAL.GetPageContent(HomeViewModel.BrowserUrl);
        //    if (DynamicContentlist != null && DynamicContentlist.Count == 0)
        //    {
        //        dynamicContentDAL.InsertPageContent(HomeViewModel.BrowserUrl, HomeViewModel.ViewContent);
        //    }
        //    else
        //    {
        //        dynamicContentDAL.UpdatePageContent(HomeViewModel.BrowserUrl, HomeViewModel.ViewContent);
        //    }
        //}
    }
}
