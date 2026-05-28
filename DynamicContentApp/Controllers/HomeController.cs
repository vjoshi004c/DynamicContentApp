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
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IViewRenderService _viewRenderService;
        private readonly IControllerRenderService _controllerRenderService;
        public HomeController(ILogger<HomeController> logger, IViewRenderService viewRenderService, IControllerRenderService controllerRenderService)
        {
            _logger = logger;
            _viewRenderService = viewRenderService;
            _controllerRenderService = controllerRenderService;
        }

        //public async Task<string> InvokeDynamicController(string controllerName, string actionName, object[] parameters = null)
        //{
        //    string fullHtmlRendering = string.Empty;
        //    // 1. Find the Controller Type (assuming it ends with "Controller")
        //    var controllerType = Assembly.GetExecutingAssembly().GetTypes()
        //        .FirstOrDefault(t => t.Name.Equals(controllerName + "Controller", StringComparison.OrdinalIgnoreCase));

        //    if (controllerType != null)
        //    {
        //        // 2. Create instance (use your DI container if necessary)
        //        var controllerInstance = Activator.CreateInstance(controllerType, _viewRenderService);


        //        // 3. Get the Action Method
        //        var methodInfo = controllerType.GetMethod(actionName,
        //            BindingFlags.Public | BindingFlags.Instance | BindingFlags.IgnoreCase);

        //        if (methodInfo != null)
        //        {
        //            // 4. Invoke the method
        //            var result = methodInfo.Invoke(controllerInstance, parameters);
        //            //string htmldata = ((Microsoft.AspNetCore.Mvc.ViewResult)(Microsoft.AspNetCore.Mvc.ActionResult(result).Result)).ViewName;
        //            //string htmlData = ((ViewResult)(new System.Threading.Tasks.SystemThreadingTasks_FutureDebugView<Microsoft.AspNetCore.Mvc.IActionResult>(result).Result)).ViewName;

        //            //Microsoft.AspNetCore.Mvc.ViewResult viewResultFinal = new ViewResult();

        //            // ((Microsoft.AspNetCore.Mvc.ViewResult)(new System.Threading.Tasks<Microsoft.AspNetCore.Mvc.IActionResult>(result).Result)).ViewName;


        //            if (result is Task<IActionResult> viewResult)

        //            // if (result is ViewResult viewResult)
        //            {
        //                var htmlfinal = ((Microsoft.AspNetCore.Mvc.ViewResult)viewResult.Result).Model;
        //                if (htmlfinal != null && htmlfinal.ToString() != string.Empty)
        //                {
        //                    fullHtmlRendering = htmlfinal.ToString();
        //                }

        //                // string htmlfinal = ((Microsoft.AspNetCore.Mvc.ViewResult)viewResult.Result)).Model;


        //                // string htmlfinal = viewResult.Model.ToString();
        //                // string html = await _viewRenderService.RenderToStringAsync(viewResult.ViewName, viewResult.ViewData.Model);
        //                // Pass the rendered HTML to string
        //                //if (controllerInstance != null)
        //                //{
        //                //     html = await _viewRenderService.RenderViewToStringAsync((Controller)controllerInstance, viewResult);
        //                //}
        //            }


        //        }

        //    }
        //    return fullHtmlRendering;
        //}
        
        [HttpGet]
        public async Task<IActionResult> Index()
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

            PageItemModel PageItemModel = MockData.GeneratePageItemModel();

            StringBuilder htmlContentMaster = new StringBuilder(await _viewRenderService.RenderToStringAsync(PageItemModel.MasterLayoutPath, HomeViewModel));

            List<ComponenetDetailsModel> ComponenetDetailsModel = PageItemModel.ComponenetDetails;

            List<PageSectionContent> PageSectionContent = new List<PageSectionContent>();

            foreach (var item in ComponenetDetailsModel)
            {
                if (item.Component.ComponentType == ComponentTypeEnum.ViewRendering)
                {
                    string htmlContent = await _viewRenderService.RenderToStringAsync(item.Component.ComponentItemPath, HomeViewModel);
                    //htmlContentMaster.Replace(item.Placeholder.PlaceholderName, htmlContent);
                    Utility.AddOnPlaceholderCollection(PageSectionContent, item, htmlContent);

                }
                if (item.Component.ComponentType == ComponentTypeEnum.ControllerRendering)
                {
                    Task<String> htmlContent = _controllerRenderService.InvokeDynamicController(item.Component.ControllerName, item.Component.ControllerAction, null);
                    string resulthtml = await htmlContent;
                    // htmlContentMaster.Replace(item.Placeholder.PlaceholderName, resulthtml);
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

        //private static void AddOnPlaceholderCollection(List<PageSectionContent> PageSectionContent, ComponenetDetailsModel item, string htmlContent)
        //{
        //    if (PageSectionContent.Count == 0)
        //    {
        //        PageSectionContent pageSectionContent = new PageSectionContent();
        //        pageSectionContent.PlaceholderName = item.Placeholder.PlaceholderName;
        //        pageSectionContent.HtmlContent = htmlContent;
        //        PageSectionContent.Add(pageSectionContent);
        //        return;

        //    }
        //    bool isItemExiseted = false;
        //    foreach (var itempsc in PageSectionContent)
        //    {
        //        if (itempsc.PlaceholderName == item.Placeholder.PlaceholderName)
        //        {
        //            isItemExiseted = true;
        //        }
        //    }
        //    if(!isItemExiseted)
        //    //if (itempsc.PlaceholderName != item.Placeholder.PlaceholderName)
        //    {
        //        PageSectionContent pageSectionContent = new PageSectionContent();
        //        pageSectionContent.PlaceholderName = item.Placeholder.PlaceholderName;
        //        pageSectionContent.HtmlContent = htmlContent;
        //        PageSectionContent.Add(pageSectionContent);
        //        return;
        //    }
        //    else
        //    {
        //        foreach (var itempsc in PageSectionContent)
        //        {
        //            if (itempsc.PlaceholderName == item.Placeholder.PlaceholderName)
        //            {
        //                itempsc.HtmlContent = itempsc.HtmlContent + htmlContent;
        //                return;
        //            }
        //        }
               
               
        //    }
           
            
        //}

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        //public PageItemModel GeneratePageItemModel()
        //{
          

        //    PageItemModel PageItemModel1 = new PageItemModel();

        //    PageItemModel1.PageItemID = "1";
        //    PageItemModel1.PageItemPath = "";
        //    PageItemModel1.PageItemSchemaID = "";
        //    PageItemModel1.MasterLayoutPath = "~/Views/Shared/_MasterLayout.cshtml";
        //    PageItemModel1.ComponenetDetails = new List<ComponenetDetailsModel>();

        //    PageItemModel1.PlaceholderDetails = null;
        //    PlaceholderModel Placeholders1 = new PlaceholderModel();
        //    PlaceholderModel Placeholders2 = new PlaceholderModel();
        //    PlaceholderModel Placeholders3 = new PlaceholderModel();
        //    Placeholders1.PlaceholderName = "[[PLACEHOLDER_HEADER]]";
        //    Placeholders2.PlaceholderName = "[[PLACEHOLDER_CONTENTBODY]]";
        //    Placeholders3.PlaceholderName = "[[PLACEHOLDER_FOOTER]]";
        //    List<PlaceholderModel> placeholderlist = new List<PlaceholderModel>();
        //    placeholderlist.Add(Placeholders1);
        //    placeholderlist.Add(Placeholders2);
        //    placeholderlist.Add(Placeholders3);

        //    ComponentModel component1 = new ComponentModel();
        //    component1.ComponentType = ComponentTypeEnum.ViewRendering;
        //    component1.ComponentItemPath = "~/Views/Components/Header.cshtml";
        //    PlaceholderModel placeholder1 = new PlaceholderModel();
        //    placeholder1.PlaceholderName = "[[PLACEHOLDER_HEADER]]";
           
        //    ComponenetDetailsModel ComponenetDetailsModel1 = new ComponenetDetailsModel();
        //    ComponenetDetailsModel1.Placeholder = placeholder1;
        //    ComponenetDetailsModel1.Component = component1;
        //    PageItemModel1.ComponenetDetails.Add(ComponenetDetailsModel1);


        //    ComponentModel component2 = new ComponentModel();
        //    component2.ComponentType = ComponentTypeEnum.ViewRendering;
        //    component2.ComponentItemPath = "~/Views/Components/ContentBody.cshtml";
        //    PlaceholderModel placeholder2 = new PlaceholderModel();
        //    placeholder2.PlaceholderName = "[[PLACEHOLDER_CONTENTBODY]]";
        //   // PageItemModel1.ComponenetDetails = new List<ComponenetDetailsModel>();
        //    ComponenetDetailsModel ComponenetDetailsModel2 = new ComponenetDetailsModel();
        //    ComponenetDetailsModel2.Placeholder = placeholder2;
        //    ComponenetDetailsModel2.Component = component2;
        //    PageItemModel1.ComponenetDetails.Add(ComponenetDetailsModel2);


        //    ComponentModel component3 = new ComponentModel();
        //    component3.ComponentType = ComponentTypeEnum.ViewRendering;
        //    component3.ComponentItemPath = "~/Views/Components/Footer.cshtml";
        //    PlaceholderModel placeholder3 = new PlaceholderModel();
        //    placeholder3.PlaceholderName = "[[PLACEHOLDER_FOOTER]]";
        //    // PageItemModel1.ComponenetDetails = new List<ComponenetDetailsModel>();
        //    ComponenetDetailsModel ComponenetDetailsModel3 = new ComponenetDetailsModel();
        //    ComponenetDetailsModel3.Placeholder = placeholder3;
        //    ComponenetDetailsModel3.Component = component3;
        //    PageItemModel1.ComponenetDetails.Add(ComponenetDetailsModel3);

        //    ComponentModel component4 = new ComponentModel();
        //    component4.ComponentType = ComponentTypeEnum.ControllerRendering;
        //    component4.ControllerName = "Product";
        //    component4.ControllerAction = "Privacy";
        //    component4.ComponentItemPath = "";
        //    PlaceholderModel placeholder4 = new PlaceholderModel();
        //    placeholder4.PlaceholderName = "[[PLACEHOLDER_FOOTER]]";
        //    // PageItemModel1.ComponenetDetails = new List<ComponenetDetailsModel>();
        //    ComponenetDetailsModel ComponenetDetailsModel4 = new ComponenetDetailsModel();
        //    ComponenetDetailsModel4.Placeholder = placeholder4;
        //    ComponenetDetailsModel4.Component = component4;
        //    PageItemModel1.ComponenetDetails.Add(ComponenetDetailsModel4);


        //    return PageItemModel1;
        //}

    }
}
