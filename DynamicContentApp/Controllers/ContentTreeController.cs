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
using System.Dynamic;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;
using System.Text.Json;
using Newtonsoft.Json.Linq;

namespace DynamicContentApp.Controllers
{
    public class ContentTreeController : BaseController
    {
        private readonly ILogger<BaseController> _logger;
        private readonly IViewRenderService _viewRenderService;
        private readonly IControllerRenderService _controllerRenderService;
        private readonly SystemConfigOptions _options;
        private readonly ICMSService _cmsService;
        public ContentTreeController(ILogger<BaseController> logger, IViewRenderService viewRenderService, IControllerRenderService controllerRenderService, IOptions<SystemConfigOptions> options, ICMSService cmsService) :base(logger, viewRenderService, controllerRenderService)
        {
            _logger = logger;
            _viewRenderService = viewRenderService;
            _controllerRenderService = controllerRenderService;
            _options = options.Value;
            _cmsService = cmsService;
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
                        JsonDataSB.Append("\""+ AssetItemFieldDetail.AssetFieldName + "\"" + ":" + "\"" + AssetItemFieldDetail.AssetFieldValue + "\",");
                    }
                    //JsonDataSB.Append("\"field\":\"none\"},");
                }

            }
        }


       
        [HttpGet]
        public IActionResult JsonToModel()
        {

            string AssetItemPath = "/UniversalCMS/Content/ArticleSite";
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            StringBuilder JsonDataSB = new StringBuilder();
            JsonDataSB.Append("{");


            List<PageItemMasterDetailsModel> PageItemMasterDetails = dynamicContentDAL.GetPageItemMasterDetails(AssetItemPath);
            if (PageItemMasterDetails != null && PageItemMasterDetails.Count > 0)
            {
                
                foreach (var PageItemMasterDetail in PageItemMasterDetails)
                {
                    JsonDataSB.Append("\"AssetItemID\"" +":"+ "\""+ PageItemMasterDetail.AssetItemID +"\",");
                    JsonDataSB.Append("\"IsPageItem\"" + ":" + "\"" + PageItemMasterDetail.IsPageItem + "\",");
                    JsonDataSB.Append("\"MasterPageLayoutPath\"" + ":" + "\"" + PageItemMasterDetail.MasterPageLayoutPath + "\",");
                    JsonDataSB.Append("\"SchemaID\"" + ":" + "\"" + PageItemMasterDetail.SchemaID + "\",");
                    JsonDataSB.Append("\"ItemName\"" + ":" + "\"" + PageItemMasterDetail.ItemName + "\",");
                    JsonDataSB.Append("\"ItemPath\"" + ":" + "\"" + PageItemMasterDetail.ItemPath + "\",");
                }
               
            }
            List<AssetItemFieldDetailsModel> AssetItemFieldDetails = dynamicContentDAL.GetAssetItemFieldDetails(AssetItemPath);
            if (AssetItemFieldDetails != null && AssetItemFieldDetails.Count >0)
            {
                JsonDataSB.Append("\"" + "AssetFields" + "\"" + ":" + "{");
                foreach (var AssetItemFieldDetail in AssetItemFieldDetails)
                {
                    JsonDataSB.Append("\""+ AssetItemFieldDetail .AssetFieldName+ "\"" + ":" + "\"" + AssetItemFieldDetail.AssetFieldValue + "\",");
                }
                JsonDataSB.Append("\"field\":\"none\"},");
            }
           
            List<AssetItemComponentDetailsModel> AssetItemComponentDetails = dynamicContentDAL.GetAssetItemComponentDetails(AssetItemPath);
            if (AssetItemComponentDetails != null && AssetItemComponentDetails.Count >0)
            {
                JsonDataSB.Append("\"" + "ComponentPresentations" + "\"" + ":" + "[");
                foreach (var AssetItemComponentDetail in AssetItemComponentDetails)
                {
                    JsonDataSB.Append( "{");
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

            dynamic dynamicObjectN= JObject.Parse(JsonData);

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
            return View(dynamicObjectN);
            
        }
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public IActionResult GetAssetComponentDetails(string AssetItemComponentID, string AssetItemID)
        {

            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            List<AssetComponentModel> ContentTreeModellist = dynamicContentDAL.GetAssetComponentDetails( AssetItemComponentID,  AssetItemID);
            if (ContentTreeModellist != null && ContentTreeModellist.Count == 0)
            {

            }
            return Ok(ContentTreeModellist);
        }
        public IActionResult SaveAssetComponentDetails(string AssetItemComponentID,string AssetItemID, string ComponentPath, string LinkedAssetItem, string PlaceholderPath)
        {
            ;
            List<ContentTreeModel> ContentTreeModellist = new List<ContentTreeModel>();
            //AssetItemComponentID = string.Empty;
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            bool isInsertSuccess = dynamicContentDAL.SaveAssetComponentDetails(AssetItemComponentID,  AssetItemID,  ComponentPath,  LinkedAssetItem,  PlaceholderPath);
            if (isInsertSuccess) { return Ok(true);  }
            else { return Ok(false); }
        }
        [HttpGet]
        public IActionResult DeleteAssetComponentDetails(string AssetItemComponentID )
        {
            List<ContentTreeModel> ContentTreeModellist = new List<ContentTreeModel>();
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            SchemaDeleteModel SchemaDeleteModel = dynamicContentDAL.DeleteAssetComponentDetails(AssetItemComponentID);
            return Ok(SchemaDeleteModel);
          
        }

        [HttpGet]
        public IActionResult GetAssetMasterLayoutDetails( string AssetItemID)
        {

            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            List<AssetMasterLayoutModel> ContentTreeModellist = dynamicContentDAL.GetAssetMasterLayoutDetails( AssetItemID);
            if (ContentTreeModellist != null && ContentTreeModellist.Count == 0)
            {

            }
            return Ok(ContentTreeModellist);
        }
        public IActionResult SaveAssetMasterLayoutDetails(string AssetItemID, bool IsItemPageType, string MasterpagePath)
        {
            ;
            List<ContentTreeModel> ContentTreeModellist = new List<ContentTreeModel>();
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            bool isInsertSuccess = dynamicContentDAL.SaveAssetMasterLayoutDetails( AssetItemID,  IsItemPageType,  MasterpagePath);

            if (isInsertSuccess) { return Ok(true); }
            else  { return Ok(false);  }
        }
        [HttpPost]
        //[HttpGet("Index/{SchemaID}")]
        public IActionResult SaveAssetFieldsData([FromBody] List<AssetFieldsDataModel> AssetFieldsData)
        {
            SchemaInsertModel SchemaInsertModel = new SchemaInsertModel();
            string isInsertSuccess = string.Empty;
            try
            {
                if (AssetFieldsData == null || AssetFieldsData.Count == 0)
                {
                    return Ok(false);
                }
                foreach (var AssetFieldsItem in AssetFieldsData)
                {
                    string AssetItemID = AssetFieldsItem.AssetItemID;
                    string AssetItemSchemaID = AssetFieldsItem.AssetItemSchemaID;
                    string SchemaFieldID = AssetFieldsItem.SchemaFieldID;
                    string AssetFieldID = AssetFieldsItem.AssetFieldID;
                    string AssetFieldValue = AssetFieldsItem.AssetFieldValue;
                    DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
                     isInsertSuccess = dynamicContentDAL.SaveAssetFields(AssetItemID, AssetItemSchemaID, "", SchemaFieldID, AssetFieldID, AssetFieldValue);
                }
                return Ok(true);
                //if (isInsertSuccess != string.Empty)
                //{
                //    SchemaInsertModel.NewSchemaId = isInsertSuccess;
                //    SchemaInsertModel.Status = true;

                //    return Ok(SchemaInsertModel);
                //}
                //else
                //{
                //    SchemaInsertModel.NewSchemaId = string.Empty;
                //    SchemaInsertModel.Status = true;
                //    return Ok(SchemaInsertModel);
                //}
            }
            catch (Exception ex)
            {
                return Ok(false);
            }


        }
        //[HttpGet("Index/{SchemaID}")]
        public  IActionResult GetChildSchema(string SchemaID)
        {
            if (String.IsNullOrEmpty(SchemaID))
            {
                SchemaID = "4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE";
            }
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            List<ContentTreeModel> ContentTreeModellist = dynamicContentDAL.GetContentTreeItems(SchemaID);
            if (ContentTreeModellist != null && ContentTreeModellist.Count == 0)
            {
               
            }
            return Ok(ContentTreeModellist);
        }
        [HttpGet]
        //[HttpGet("Index/{SchemaID}")]
        public IActionResult GetAssetItemDetails(string AssetItemID, string AssetItemSchemaID, string AssetItemTreeeID, string SchemaFieldID, string AssetFieldID, string AssetFieldValue)
        {
            
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            List<AssertFieldsModel> ContentTreeModellist = dynamicContentDAL.GetAssetItemDetails(AssetItemID,  AssetItemSchemaID,  AssetItemTreeeID,  SchemaFieldID,  AssetFieldID,  AssetFieldValue);
            if (ContentTreeModellist != null && ContentTreeModellist.Count == 0)
            {

            }
            return Ok(ContentTreeModellist);
        }

        [HttpGet]
        //[HttpGet("Index/{SchemaID}")]
        public IActionResult SaveSchema( string SchemaName, string SchemaPath, string SchemaParent, string AssetTypeID)
        {
            SchemaInsertModel SchemaInsertModel = new SchemaInsertModel();
            List<ContentTreeModel> ContentTreeModellist = new List<ContentTreeModel>();
            //if (String.IsNullOrEmpty(SchemaID))
            //{
            //    SchemaID = "4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE";
            //}
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
           string  isInsertSuccess = dynamicContentDAL.InsertSchema( SchemaName,  SchemaPath,  SchemaParent, AssetTypeID);
            //if (ContentTreeModellist != null && ContentTreeModellist.Count == 0)
            //{

            //}
            if (isInsertSuccess!= string.Empty)
            {
                SchemaInsertModel.NewSchemaId = isInsertSuccess;
                SchemaInsertModel.Status = true;
              
                return Ok(SchemaInsertModel);
            }
            else
            {
                SchemaInsertModel.NewSchemaId = string.Empty;
                SchemaInsertModel.Status = true;
                return Ok(SchemaInsertModel);
            }
        }

       
        public IActionResult SaveSchemaField(string SchemaID, string SchemaName, string SchemaFieldType)
        {
            ;
            List<ContentTreeModel> ContentTreeModellist = new List<ContentTreeModel>();
            //if (String.IsNullOrEmpty(SchemaID))
            //{
            //    SchemaID = "4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE";
            //}
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            bool isInsertSuccess = dynamicContentDAL.InsertSchemaField(SchemaID, SchemaName, SchemaFieldType);
            //if (ContentTreeModellist != null && ContentTreeModellist.Count == 0)
            //{

            //}
            if (isInsertSuccess)
            {
                return Ok(true);
            }
            else
            {
                return Ok(false);
            }
        }


        [HttpGet]
        //[HttpGet("Index/{SchemaID}")]
        public IActionResult UpdateSchema(string SchemaID,  string SchemaName, string SchemaPath, string SchemaParent, string AssetTypeID)
        {
            List<ContentTreeModel> ContentTreeModellist = new List<ContentTreeModel>();
            //if (String.IsNullOrEmpty(SchemaID))
            //{
            //    SchemaID = "4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE";
            //}
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            bool isInsertSuccess = dynamicContentDAL.UpdateSchema(SchemaID ,SchemaName, SchemaPath, SchemaParent,  AssetTypeID);
            //if (ContentTreeModellist != null && ContentTreeModellist.Count == 0)
            //{

            //}
            if (isInsertSuccess)
            {
                return Ok(true);
            }
            else
            {
                return Ok(false);
            }
        }

        [HttpGet]
        //[HttpGet("Index/{SchemaID}")]
        public IActionResult UpdateAssetItemSchema(string SchemaID, string SchemaName, string SchemaPath, string SchemaParent, string AssetTypeID, string AssetItemSchema, string AssetItemSchemaMapped)
        {
            List<ContentTreeModel> ContentTreeModellist = new List<ContentTreeModel>();
            //if (String.IsNullOrEmpty(SchemaID))
            //{
            //    SchemaID = "4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE";
            //}
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            bool isInsertSuccess = dynamicContentDAL.UpdateAssetItemSchema(SchemaID, SchemaName, SchemaPath, SchemaParent, AssetTypeID, AssetItemSchema, AssetItemSchemaMapped);
            //if (ContentTreeModellist != null && ContentTreeModellist.Count == 0)
            //{

            //}
            if (isInsertSuccess)
            {
                return Ok(true);
            }
            else
            {
                return Ok(false);
            }
        }

        public IActionResult InsertAssetItemSchema(string SchemaName, string SchemaPath, string SchemaParent, string AssetTypeID, string AssetItemSchema, string AssetItemSchemaMapped)
        {
            List<ContentTreeModel> ContentTreeModellist = new List<ContentTreeModel>();
            //if (String.IsNullOrEmpty(SchemaID))
            //{
            //    SchemaID = "4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE";
            //}
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            bool isInsertSuccess = dynamicContentDAL.InsertAssetItemSchema(SchemaName, SchemaPath, SchemaParent, AssetTypeID,  AssetItemSchema, AssetItemSchemaMapped);
            //if (ContentTreeModellist != null && ContentTreeModellist.Count == 0)
            //{

            //}
            if (isInsertSuccess)
            {
                return Ok(true);
            }
            else
            {
                return Ok(false);
            }
        }

        [HttpGet]
        //[HttpGet("Index/{SchemaID}")]
        public IActionResult DeleteSchema(string SchemaID)
        {
            List<ContentTreeModel> ContentTreeModellist = new List<ContentTreeModel>();
            //if (String.IsNullOrEmpty(SchemaID))
            //{
            //    SchemaID = "4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE";
            //}
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            //bool isInsertSuccess = dynamicContentDAL.DeleteSchema(SchemaID);

            SchemaDeleteModel SchemaDeleteModel  = dynamicContentDAL.DeleteSchema(SchemaID);
            //if (ContentTreeModellist != null && ContentTreeModellist.Count == 0)
            //{

            //}
            return Ok(SchemaDeleteModel);
            //if (isInsertSuccess)
            //{
            //    return Ok(true);
            //}
            //else
            //{
            //    return Ok(false);
            //}
        }




        [HttpGet]
        //[HttpGet("Index/{SchemaID}")]
        public IActionResult GetSchema(string SchemaID)
        {

           // string SchemaID = "4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE";

            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            List<SchemaModel> SchemaModellist = dynamicContentDAL.GetSchema(SchemaID);
            string AssetItemPath = string.Empty;
            string AssetItemID = string.Empty;
            if (SchemaModellist != null && SchemaModellist.Count > 0)
            {
                foreach (SchemaModel item in SchemaModellist)
                {
                    AssetItemPath = item.SchemaPath;
                    AssetItemID = item.ID;
                }

            }
            if (AssetItemPath != string.Empty && AssetItemID != string.Empty)
            {
                bool updateStatus = dynamicContentDAL.UpdateAssetItemPath(AssetItemID, AssetItemPath);
            }

            return Ok(SchemaModellist);
        }

        [HttpGet]
        //[HttpGet("Index/{SchemaID}")]
        public IActionResult GetFieldType()
        {

            // string SchemaID = "4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE";

            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            List<SchemaFieldType> SchemaFieldTypeList = dynamicContentDAL.GetFieldType();
            if (SchemaFieldTypeList != null && SchemaFieldTypeList.Count == 0)
            {

            }
            return Ok(SchemaFieldTypeList);
        }
        


        [HttpGet]
        //[HttpGet("Index/{SchemaID}")]
        public IActionResult GetRootNode()
        {

            string SchemaID = "4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE";

            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            List<ContentTreeModel> ContentTreeModellist = dynamicContentDAL.GetContentTreeItems(SchemaID);
            if (ContentTreeModellist != null && ContentTreeModellist.Count == 0)
            {

            }
            return Ok(ContentTreeModellist);
        }

        [HttpGet]
        //[HttpGet("GetJson/{SchemaID}")]
        public JsonResult GetJson(string SchemaID)
        {
            if (String.IsNullOrEmpty(SchemaID))
            {
                SchemaID = "4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE";
            }
            DynamicContentDAL dynamicContentDAL = new DynamicContentDAL();
            List<ContentTreeModel> ContentTreeModellist = dynamicContentDAL.GetContentTreeItems(SchemaID);
            if (ContentTreeModellist != null && ContentTreeModellist.Count == 0)
            {

            }
           
            return Json(ContentTreeModellist);
        }

    }
}
