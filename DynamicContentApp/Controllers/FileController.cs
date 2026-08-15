using DynamicContentApp.Models;
using DynamicContentApp.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using System;
using System.Diagnostics;
using System.IO;
using System.Threading.Tasks;
using System.Xml.Linq;


namespace DynamicContentApp.Controllers
{
    public class FileController : Controller
    {
        private readonly ILogger<BaseController> _logger;
        private readonly IViewRenderService _viewRenderService;
        private readonly IControllerRenderService _controllerRenderService;
        private readonly SystemConfigOptions _options;
        private readonly ICMSService _cmsService;
        private readonly IConfiguration _configuration;
        // Update this string with your actual application database connection parameters
        //private readonly string _connectionString = "Server=YOUR_SERVER;Database=YOUR_DB;Trusted_Connection=True;";
        //private string _connectionString = "Data Source=SQL1026;Initial Catalog=TestDCA;TrustServerCertificate=True;User ID=sa;Password=Wstinol1";
        private string _connectionString = string.Empty;
        public FileController(ILogger<BaseController> logger, IOptions<SystemConfigOptions> options, IConfiguration configuration) 
        {
            _logger = logger;
            _configuration = configuration;
            _connectionString= _configuration["ConnectionStrings:DefaultConnection"];
        }
        [HttpPost]
        public async Task<IActionResult> UploadAndSave(IFormFile uploadedFile)
        {
            if (uploadedFile == null || uploadedFile.Length == 0)
            {
                return Json(new { message = "No file data received." });
            }

            try
            {
                // 1. Read file info and convert content to a byte array 
                string fileName = Path.GetFileName(uploadedFile.FileName);
                string contentType = uploadedFile.ContentType;
                byte[] fileData;

                using (var targetMemoryStream = new MemoryStream())
                {
                    await uploadedFile.CopyToAsync(targetMemoryStream);
                    fileData = targetMemoryStream.ToArray();
                }

                // 2. Perform parameterized SQL command execution to save records safely
                string query = "INSERT INTO AssetMediaUploadedFiles (FileName, ContentType, FileData) VALUES (@FileName, @ContentType, @FileData)";

                using (SqlConnection connection = new SqlConnection(_connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@FileName", fileName);
                        command.Parameters.AddWithValue("@ContentType", contentType);
                        command.Parameters.AddWithValue("@FileData", fileData); // Maps directly to VARBINARY(MAX)

                        await connection.OpenAsync();
                        await command.ExecuteNonQueryAsync();
                    }
                }

                return Json(new { message = "File successfully uploaded and saved into the database!" });
            }
            catch (Exception ex)
            {
                return Json(new { message = $"Server error processing file: {ex.Message}" });
            }
        }
    }
}
