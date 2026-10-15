using DynamicContentApp.DataLayer;
using DynamicContentApp.JSON;
using DynamicContentApp.Models;
using DynamicContentApp.Service;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR.Protocol;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Options;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;
using System.Diagnostics;
using System.Dynamic;
using System.Reflection;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;

namespace DynamicContentApp.Controllers
{
    public class DuplicateController : BaseController
    {
        private readonly ILogger<BaseController> _logger;
        private readonly IViewRenderService _viewRenderService;
        private readonly IControllerRenderService _controllerRenderService;
        private readonly SystemConfigOptions _options;
        private readonly ICMSService _cmsService;

        private readonly IConfiguration _configuration;
        private string _connectionString = "";
        public DuplicateController(ILogger<BaseController> logger, IViewRenderService viewRenderService, IControllerRenderService controllerRenderService, IOptions<SystemConfigOptions> options, ICMSService cmsService, IConfiguration configuration) : base(logger, viewRenderService, controllerRenderService)
        {
            _logger = logger;
            _viewRenderService = viewRenderService;
            _controllerRenderService = controllerRenderService;
            _options = options.Value;
            _cmsService = cmsService;
            _configuration = configuration;
            _connectionString = _configuration["ConnectionStrings:DefaultConnection"];
        }
       


        [HttpGet]
        public IActionResult DuplicateAssetItem(string AssetItemId, bool IsDuplicateSubitems)
        {

            try
            {
                DynamicContentDAL dynamicContentDAL = new DynamicContentDAL(_logger, _configuration);

                bool isInsertSuccess = dynamicContentDAL.InsertAssetInDuplicate(AssetItemId, IsDuplicateSubitems);

                if (IsDuplicateSubitems == true)
                {
                    List<DuplicateChildrenItem> publishChildrenItem = dynamicContentDAL.GetChildrenItemsToDuplicate(AssetItemId);

                    //bool isInsertSuccess = false;

                    if (publishChildrenItem != null && publishChildrenItem.Count > 0)
                    {
                        foreach (DuplicateChildrenItem item in publishChildrenItem)
                        {

                            string AssetChildItemID = item.ID;
                            isInsertSuccess = dynamicContentDAL.InsertAssetInDuplicate(AssetChildItemID, IsDuplicateSubitems);
                        }

                    }
                  
                }
                return Ok(true);
            }
            catch (Exception ex)
            {
                return Ok(false);
            }

        }


    }
}
