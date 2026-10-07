using Microsoft.AspNetCore.Http;
using System.Text.Json;
namespace DynamicContentApp.Session
{
    public static class SessionExtensions
    {
        // Serialize object to JSON string and save to session
        public static void SetObject<T>(this ISession session, string key, T value)
        {
            session.SetString(key, JsonSerializer.Serialize(value));
        }

        // Retrieve JSON string from session and deserialize back to object
        public static T? GetObject<T>(this ISession session, string key)
        {
            var value = session.GetString(key);
            return value == null ? default : JsonSerializer.Deserialize<T>(value);
        }
    }
}
