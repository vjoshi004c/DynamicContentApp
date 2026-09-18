using DynamicContentApp.Controllers;
using DynamicContentApp.DataLayer;
using DynamicContentApp.Models;
using Microsoft.Extensions.Options;
using System.Text;

namespace DynamicContentApp.Service
{
    public class CMSService : ICMSService
    {
        private readonly IControllerRenderService _controllerRenderService;
        private readonly ILogger<HomeController> _logger;
        private readonly IViewRenderService _viewRenderService;
        private readonly IConfiguration _configuration;

        private readonly SystemConfigOptions _options;
        public CMSService(ILogger<HomeController> logger, IViewRenderService viewRenderService, IControllerRenderService controllerRenderService, IOptions<SystemConfigOptions> options,  IConfiguration configuration)
        {
            _logger = logger;
            _viewRenderService = viewRenderService;
            _controllerRenderService = controllerRenderService;
            _options = options.Value;
            _configuration = configuration;
        }
        public async Task IfModeIsContentManagement(HomeViewModel HomeViewModel, bool isContentDeliveryError, int PageItemID)
        {

            //ViewData["SelectedLayout"] = "_MasterLayout";

            PageItemModel PageItemModel = new PageItemModel();
            if (isContentDeliveryError)
            {
                PageItemModel = MockData.GeneratePageItemModel(3);
            }
            else
            {
                if (!String.IsNullOrEmpty(PageItemID.ToString()))
                {
                    string project = PageItemID.ToString();
                    if (project == "2") { PageItemModel = MockData.GeneratePageItemModel(2); }
                    else if (project == "1") { PageItemModel = MockData.GeneratePageItemModel(1); }
                    else if (project == "3") { PageItemModel = MockData.GeneratePageItemModel(3); }
                    else { PageItemModel = MockData.GeneratePageItemModel(Convert.ToInt32(1)); }
                }
                else
                {
                    PageItemModel = MockData.GeneratePageItemModel(Convert.ToInt32(1));
                }
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
            if (!isContentDeliveryError)
            {
                SavePageEntireHtmlInDatabase(HomeViewModel);
            }

        }
        public void IfModeIsContentDelivery(HomeViewModel HomeViewModel)
        {
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL(_logger, _configuration);

           
            List<PublishQueue> PublishQueuelist = dynamicContentDAL.GetAssetInPublishQueue(HomeViewModel.BrowserInternalAssetPath);
            if (PublishQueuelist != null && PublishQueuelist.Count == 0)
            {

                List<DynamicContentModel> DynamicContentlist = dynamicContentDAL.GetPageContent(!String.IsNullOrEmpty(HomeViewModel.BrowserInternalAssetPath) ? HomeViewModel.BrowserInternalAssetPath : string.Empty);

                if (DynamicContentlist != null && DynamicContentlist.Count== 0)
                {
                    //string PublishAssetPagePath = PublishQueuelist[0].PublishAssetPagePath;
                    HomeViewModel.BrowserUrl = HomeViewModel.BrowserInternalAssetPath;
                    CMSServiceDynamic CMSServiceDynamic = new CMSServiceDynamic(null, _viewRenderService, _controllerRenderService, _options, _configuration);
                    CMSServiceDynamic.IfModeIsContentManagement(HomeViewModel, false, 3);
                }
                List<DynamicContentModel> DynamicContentlistNew = dynamicContentDAL.GetPageContent(!String.IsNullOrEmpty(HomeViewModel.BrowserInternalAssetPath) ? HomeViewModel.BrowserInternalAssetPath : string.Empty);
                if (DynamicContentlistNew != null && DynamicContentlistNew.Count > 0)
                {
                    HomeViewModel.ViewContent = DynamicContentlistNew[0].PageContent;
                }

            }
            else
            {
               string PublishAssetPagePath= PublishQueuelist[0].PublishAssetPagePath;
                HomeViewModel.BrowserUrl = PublishAssetPagePath;

                CMSServiceDynamic CMSServiceDynamic = new CMSServiceDynamic(null, _viewRenderService, _controllerRenderService, _options, _configuration);

                 CMSServiceDynamic.IfModeIsContentManagement(HomeViewModel, false, 3);

            }


        }
        public void SavePageEntireHtmlInDatabase(HomeViewModel HomeViewModel)
        {

            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL(_logger, _configuration);
            List<DynamicContentModel> DynamicContentlist = dynamicContentDAL.GetPageContent(HomeViewModel.BrowserInternalAssetPath);
            if (DynamicContentlist != null && DynamicContentlist.Count == 0)
            {
                dynamicContentDAL.InsertPageContent(HomeViewModel.BrowserUrl, HomeViewModel.ViewContent);
            }
            else
            {
                dynamicContentDAL.UpdatePageContent(HomeViewModel.BrowserUrl, HomeViewModel.ViewContent);
            }
        }
    }
}
