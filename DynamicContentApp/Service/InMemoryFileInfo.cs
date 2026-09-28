using Microsoft.Extensions.FileProviders;
using System.IO;
using System.Text;

namespace DynamicContentApp.Service
{
    public class InMemoryFileInfo : IFileInfo
    {
        private readonly byte[] _content;

        public InMemoryFileInfo(string content, string name)
        {
            _content = Encoding.UTF8.GetBytes(content);
            Name = name;
        }

        public bool Exists => true;
        public long Length => _content.Length;
        public string PhysicalPath => null; // Crucial: forces runtime to read the stream instead
        public string Name { get; }
        public DateTimeOffset LastModified => DateTimeOffset.UtcNow;
        public bool IsDirectory => false;

        public Stream CreateReadStream() => new MemoryStream(_content);
    }
}
