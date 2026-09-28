using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.Primitives;
using System.Collections.Concurrent;

namespace DynamicContentApp.Service
{
    public class InMemoryFileProvider : IFileProvider
    {
        private readonly ConcurrentDictionary<string, string> _templates = new();

        public void AddTemplate(string path, string content) => _templates[path] = content;

        public IFileInfo GetFileInfo(string subpath)
        {
            if (_templates.TryGetValue(subpath, out var content))
            {
                return new InMemoryFileInfo(content, subpath);
            }
            return new NotFoundFileInfo(subpath);
        }

        public IDirectoryContents GetDirectoryContents(string subpath) => NotFoundDirectoryContents.Singleton;
        public IChangeToken Watch(string filter) => NullChangeToken.Singleton;
    }
}
