
using DynamicContentApp.Models;
using System.IO;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.IO;
namespace DynamicContentApp.JSON
{
    public static class JsonConversion
    {
        public static async Task<PageItemModel> DeserializeHugeJsonAsync(string hugeJsonString)
        {
            // Convert string to stream without creating a giant byte array
            byte[] byteArray = Encoding.UTF8.GetBytes(hugeJsonString);
            using MemoryStream stream = new MemoryStream(byteArray);

            // Deserialize directly from the stream
            PageItemModel model = await JsonSerializer.DeserializeAsync<PageItemModel>(stream);
            return model;
        }
        public static PageItemModel DeserializeHugeJson(string hugeJsonString)
        {
            // Convert string to stream without creating a giant byte array
            byte[] byteArray = Encoding.UTF8.GetBytes(hugeJsonString);
            using MemoryStream stream = new MemoryStream(byteArray);

            // Deserialize directly from the stream
            PageItemModel model =  JsonSerializer.Deserialize<PageItemModel>(stream);
            return model;
        }
        public static string SerializeJson(PageItemModel model)
        {
            var options = new JsonSerializerOptions
            {
                WriteIndented = true, // Adds line breaks and spacing
               // PropertyNamingPolicy = JsonNamingPolicy.CamelCase // Converts properties to camelCase
            };

            return  JsonSerializer.Serialize(model, options);
            
        }
    }
}
