using DynamicContentApp.DataLayer;
using DynamicContentApp.JSON;
using DynamicContentApp.Models;
using DynamicContentApp.Service;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR.Protocol;
using Microsoft.Extensions.Logging;
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
        private readonly IConfiguration _configuration;
        public GenericController(ILogger<BaseController> logger, IViewRenderService viewRenderService, IControllerRenderService controllerRenderService, IOptions<SystemConfigOptions> options, ICMSService cmsService, IConfiguration configuration) :base(logger, viewRenderService, controllerRenderService)
        {
            _logger = logger;
            _viewRenderService = viewRenderService;
            _controllerRenderService = controllerRenderService;
            _options = options.Value;
            _cmsService = cmsService;
            _configuration = configuration;
        }

        [HttpGet]
        public async Task<IActionResult> Start()
        {
            List<WebSiteModel> WebSiteModels;
            HomeViewModel HomeViewModel;

            string fullBrowserUrl, fullUrl;
            GetBrowserAndInternalPageUrl(out fullBrowserUrl, out fullUrl);
            HomeViewModel = new HomeViewModel();
            HomeViewModel.BrowserUrl = fullBrowserUrl;
            HomeViewModel.ReWriteUrl = fullUrl;

             WebSiteModels =GetWebsiteCollection();
            //ViewData["SelectedLayout"] = "_MasterLayout";

            string urlString = HomeViewModel.BrowserUrl;
            Uri uri = new Uri(urlString);
            string protocol = uri.Scheme;       // "https"
            string hostname = uri.Host;         // "api.example.com"
            string restPath = uri.AbsolutePath; // "/v1/users/profile"
            string query = uri.Query;
            int port = uri.Port;
            string fullhostname = string.Empty;
            if (port > 0)
            {
                fullhostname = protocol + "://" + hostname + ":" + port.ToString();
            }

            if (_options.ApplicationMode.ToUpper() == ApplicationMode.CONTENT_DELIVERY.ToString())
            {
                string newUrl = string.Empty;
                string newInternalAssetPath = string.Empty;
                foreach (var item in WebSiteModels)
                {
                    if (fullhostname.ToLower() == item.HostName.ToLower())
                    {
                        if (restPath != string.Empty  )
                        {
                            if (restPath != "/")
                            {
                                newUrl = item.HostName.ToLower() + item.RootItem + restPath;
                                newInternalAssetPath= item.RootItem + restPath;
                            }
                            else
                            {
                                newUrl = item.HostName.ToLower() + item.RootItem + item.StartItem;
                                newInternalAssetPath = item.RootItem + item.StartItem;
                            }
                        }
                        else
                        {
                            newUrl = item.HostName.ToLower() +item.RootItem+ item.StartItem;
                            newInternalAssetPath = item.RootItem + item.StartItem;
                        }

                        if (query != string.Empty)
                        {
                            newUrl = newUrl + query;
                        }
                    }
                    HomeViewModel.BrowserUrl = newUrl;
                    HomeViewModel.BrowserInternalAssetPath = newInternalAssetPath;
                }

                _cmsService.IfModeIsContentDelivery(HomeViewModel);
            }
            if (_options.ApplicationMode.ToUpper() == ApplicationMode.CONTENT_MANAGEMENT.ToString())
            {

                urlString=  urlString.Replace(fullhostname, "");
                HomeViewModel.BrowserUrl = urlString;

                HomeViewModel.BrowserInternalAssetPath = urlString;

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
                // await _cmsService.IfModeIsContentManagement(HomeViewModel, false, PageItemID );
                CMSServiceDynamic CMSServiceDynamic = new CMSServiceDynamic(null, _viewRenderService, _controllerRenderService, _options, _configuration);

                await CMSServiceDynamic.IfModeIsContentManagement(HomeViewModel, false, PageItemID);
            }

            if (String.IsNullOrEmpty(HomeViewModel.ViewContent))
            {
                HomeViewModel.ErrorContent = "<div style=\"color:Red\"> <h4> Requested page " + HomeViewModel.BrowserUrl + " not available" + "<h4><div>";
                await _cmsService.IfModeIsContentManagement(HomeViewModel, true, 3);

            }

            return View(HomeViewModel);
        }

        private List<WebSiteModel> GetWebsiteCollection()
        {
            List<WebSiteModel>  WebSiteModels = new List<WebSiteModel>();
            WebSiteModel websiteModel1 = new WebSiteModel();
            websiteModel1.ID = "1";
            websiteModel1.HostName = "http://localhost:5287";
            websiteModel1.RootItem = "/UniversalCMS/Content/ArticleSite";
            websiteModel1.StartItem = "";
            websiteModel1.Language = "en-US";
            WebSiteModels.Add(websiteModel1);

            WebSiteModel websiteModel2 = new WebSiteModel();
            websiteModel2.ID = "1";
            websiteModel2.HostName = "http://localhost:5287_1";
            websiteModel2.RootItem = "/UniversalCMS/Content/ProductSite";
            websiteModel2.StartItem = "";
            websiteModel2.Language = "en-US";
            WebSiteModels.Add(websiteModel2);

            

            return WebSiteModels;
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
