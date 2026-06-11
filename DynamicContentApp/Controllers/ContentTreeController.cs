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
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
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
