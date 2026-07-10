using DynamicContentApp.Controllers;
using DynamicContentApp.DataLayer;
using DynamicContentApp.DataLayer;
using DynamicContentApp.JSON;
using DynamicContentApp.Models;
using DynamicContentApp.Models;
using DynamicContentApp.Service;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR.Protocol;
using Microsoft.Extensions.Options;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;
using System.Diagnostics;
using System.Dynamic;
using System.Dynamic;
using System.Reflection;
using System.Text;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Xml.Linq;
using static System.Net.Mime.MediaTypeNames;
//using static System.Runtime.InteropServices.JavaScript.JSType;

namespace DynamicContentApp.Service
{
    public class CMSServiceDynamic : ICMSService
    {
        private readonly IControllerRenderService _controllerRenderService;
        private readonly ILogger<HomeController> _logger;
        private readonly IViewRenderService _viewRenderService;
        public CMSServiceDynamic(ILogger<HomeController> logger, IViewRenderService viewRenderService, IControllerRenderService controllerRenderService)
        {
            _logger = logger;
            _viewRenderService = viewRenderService;
            _controllerRenderService = controllerRenderService;
        }
        private void GetAssetData(string AssetItemPath, StringBuilder JsonDataSB, string Area)
        {
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            List<PageItemMasterDetailsModel> PageItemMasterDetails = dynamicContentDAL.GetPageItemMasterDetails(AssetItemPath);
            if (PageItemMasterDetails != null && PageItemMasterDetails.Count > 0)
            {

                List<AssetItemFieldDetailsModel> AssetItemFieldDetails = dynamicContentDAL.GetAssetItemFieldDetails(AssetItemPath);
                if (AssetItemFieldDetails != null && AssetItemFieldDetails.Count > 0)
                {
                    // JsonDataSB.Append("\"" + Area + "\"" + ":" + "{");
                    foreach (var AssetItemFieldDetail in AssetItemFieldDetails)
                    {
                        JsonDataSB.Append("\"" + AssetItemFieldDetail.AssetFieldName + "\"" + ":" + "\"" + AssetItemFieldDetail.AssetFieldValue + "\",");
                    }
                    //JsonDataSB.Append("\"field\":\"none\"},");
                }

            }
        }
        public dynamic JsonToModel(string AssetItemPath)
        {

            //string AssetItemPath = "/UniversalCMS/Content/ArticleSite";
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            StringBuilder JsonDataSB = new StringBuilder();
            JsonDataSB.Append("{");


            List<PageItemMasterDetailsModel> PageItemMasterDetails = dynamicContentDAL.GetPageItemMasterDetails(AssetItemPath);
            if (PageItemMasterDetails != null && PageItemMasterDetails.Count > 0)
            {

                foreach (var PageItemMasterDetail in PageItemMasterDetails)
                {
                    JsonDataSB.Append("\"AssetItemID\"" + ":" + "\"" + PageItemMasterDetail.AssetItemID + "\",");
                    JsonDataSB.Append("\"IsPageItem\"" + ":" + "\"" + PageItemMasterDetail.IsPageItem + "\",");
                    JsonDataSB.Append("\"MasterPageLayoutPath\"" + ":" + "\"" + PageItemMasterDetail.MasterPageLayoutPath + "\",");
                    if (PageItemMasterDetail != null && PageItemMasterDetail.MasterPageLayoutPath != string.Empty)
                    {
                        GetAssetData(PageItemMasterDetail.MasterPageLayoutPath, JsonDataSB, "MasterPageLayout");
                    }

                    JsonDataSB.Append("\"SchemaID\"" + ":" + "\"" + PageItemMasterDetail.SchemaID + "\",");
                    JsonDataSB.Append("\"ItemName\"" + ":" + "\"" + PageItemMasterDetail.ItemName + "\",");
                    JsonDataSB.Append("\"ItemPath\"" + ":" + "\"" + PageItemMasterDetail.ItemPath + "\",");
                }

            }
            List<AssetItemFieldDetailsModel> AssetItemFieldDetails = dynamicContentDAL.GetAssetItemFieldDetails(AssetItemPath);
            if (AssetItemFieldDetails != null && AssetItemFieldDetails.Count > 0)
            {
                JsonDataSB.Append("\"" + "AssetFields" + "\"" + ":" + "{");
                foreach (var AssetItemFieldDetail in AssetItemFieldDetails)
                {
                    JsonDataSB.Append("\"" + AssetItemFieldDetail.AssetFieldName + "\"" + ":" + "\"" + AssetItemFieldDetail.AssetFieldValue + "\",");
                }
                JsonDataSB.Append("\"field\":\"none\"},");
            }

            List<AssetItemComponentDetailsModel> AssetItemComponentDetails = dynamicContentDAL.GetAssetItemComponentDetails(AssetItemPath);
            if (AssetItemComponentDetails != null && AssetItemComponentDetails.Count > 0)
            {
                JsonDataSB.Append("\"" + "ComponentPresentations" + "\"" + ":" + "[");
                foreach (var AssetItemComponentDetail in AssetItemComponentDetails)
                {
                    JsonDataSB.Append("{");
                    JsonDataSB.Append("\"" + "ComponentPath" + "\"" + ":" + "\"" + AssetItemComponentDetail.ComponentPath + "\",");
                    if (AssetItemComponentDetail != null && AssetItemComponentDetail.ComponentPath != string.Empty)
                    {
                        GetAssetData(AssetItemComponentDetail.ComponentPath, JsonDataSB, "ComponentFields");
                    }
                    JsonDataSB.Append("\"" + "LinkedAssetItem" + "\"" + ":" + "\"" + AssetItemComponentDetail.LinkedAssetItem + "\",");
                    if (AssetItemComponentDetail != null && AssetItemComponentDetail.LinkedAssetItem != string.Empty)
                    {
                        GetAssetData(AssetItemComponentDetail.LinkedAssetItem, JsonDataSB, "LinkedItemFields");
                    }
                    JsonDataSB.Append("\"" + "PlaceholderPath" + "\"" + ":" + "\"" + AssetItemComponentDetail.PlaceholderPath + "\",");
                    if (AssetItemComponentDetail != null && AssetItemComponentDetail.PlaceholderPath != string.Empty)
                    {
                        GetAssetData(AssetItemComponentDetail.PlaceholderPath, JsonDataSB, "PlaceholderFields");
                    }
                    JsonDataSB.Append("\"field\":\"none\"},");
                }
                JsonDataSB.Append("{}]");


            }
            JsonDataSB.Append("}");

            string JsonData = JsonDataSB.ToString();

            dynamic dynamicObjectN = JObject.Parse(JsonData);

            dynamic dynamicObject = JsonSerializer.Deserialize<ExpandoObject>(JsonData);

            dynamic dynamicObject1 = JsonSerializer.Deserialize<dynamic>(JsonData);

            // string json = "{ 'Name': 'John Doe', 'Age': 30, 'Address': { 'City': 'New York' } }";
            string SquidGame = @"
                                {
                                    ""Name"": ""Squid Game"",
                                    ""Genre"": ""Thriller"",
                                    ""Rating"": {
                                        ""Imdb"": 8.1,
                                        ""Rotten Tomatoes"": 0.94
                                    },
                                    ""Year"": 2021,
                                    ""Stars"": [""Lee Jung-jae"", ""Park Hae-soo""],
                                    ""Language"": ""Korean"",
                                    ""Budget"": ""$21.4 million""
                                }";

            // Deserialize into a dynamic object
            //var jsonString = MovieStats.SquidGame;
            //var dynamicObject = JsonSerializer.Deserialize<dynamic>(SquidGame);

            // dynamic dynamicObject = JsonSerializer.Deserialize<ExpandoObject>(SquidGame);
            // Directly access properties
            // string name = Convert.ToString(dynamicObject.Name);
            // string Genre = Convert.ToString(dynamicObject.Genre);
            //string Imdb = Convert.ToString(dynamicObject.Rating.Imdb);

            //Console.WriteLine($"{name} ({age}) lives in {city}.");
            return dynamicObjectN;

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


            dynamic dynamicObject = JsonToModel(HomeViewModel.BrowserUrl.Replace("http://localhost:5287", ""));


            string assetItemId = dynamicObject.AssetItemID;
            // string AssetItemID = dynamicObject.GetProperty("AssetItemID").GetString();
            dynamic AssetFieldsModel = dynamicObject.AssetFields;
            string Title = AssetFieldsModel.Title;
            string ArticleShortDescription = AssetFieldsModel.ArticleShortDescription;
            string assetID = dynamicObject.AssetItemID;
            // string Title = AssetFieldsElement.GetProperty("Title").GetString();
            string masterlayoutpath = dynamicObject.MasterPageLayoutPath;
            string MasterPageLayout = dynamicObject.MasterLayout;
            
            string IsPageItem = dynamicObject.IsPageItem;
            foreach ( var node in dynamicObject.ComponentPresentations)
                {
                string ComponentPath = node.ComponentPath;
                }

            StringBuilder htmlContentMaster = new StringBuilder(await _viewRenderService.RenderToStringAsync(MasterPageLayout, AssetFieldsModel));

            //List<ComponenetDetailsModel> ComponenetDetailsModel = PageItemModel.ComponenetDetails;

            List<PageSectionContent> PageSectionContent = new List<PageSectionContent>();

            foreach (var node in dynamicObject.ComponentPresentations)
            {
                if (node.ViewPath !=  null && node.ViewPath!= string.Empty)
                {
                    string viewpath = node.ViewPath;
                    string htmlContent = await _viewRenderService.RenderToStringAsync(viewpath, node);
                   // Utility.AddOnPlaceholderCollection(PageSectionContent, item, htmlContent);
                    Utility.AddOnPlaceholderCollectionDynamic(PageSectionContent, node, htmlContent);
                    

                }
                if (node.ControllerName !=  null && node.ControllerName!= string.Empty)
                {

                    string controllername = node.ControllerName;
                    string controlleraction = node.ControllerAction;

                    Task<String> htmlContent = _controllerRenderService.InvokeDynamicController(controllername, controlleraction, null);
                    string resulthtml = await htmlContent;
                   // Utility.AddOnPlaceholderCollection(PageSectionContent, item, resulthtml);
                    Utility.AddOnPlaceholderCollectionDynamic(PageSectionContent, node, resulthtml);
                    
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
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();

            List<DynamicContentModel> DynamicContentlist = dynamicContentDAL.GetPageContent(!String.IsNullOrEmpty(HomeViewModel.BrowserUrl) ? HomeViewModel.BrowserUrl : string.Empty);
            if (DynamicContentlist != null && DynamicContentlist.Count > 0)
            {
                HomeViewModel.ViewContent = DynamicContentlist[0].PageContent;
            }
        }
        public void SavePageEntireHtmlInDatabase(HomeViewModel HomeViewModel)
        {
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            List<DynamicContentModel> DynamicContentlist = dynamicContentDAL.GetPageContent(HomeViewModel.BrowserUrl);
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
