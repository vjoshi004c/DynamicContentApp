namespace DynamicContentApp.Models
{
    public class DynamicContentModel
    {
        public string? PageUrl { get; set; }
        public string? PageContent { get; set; }
    }

    public class ContentTreeModel
    {
        public string? ParentSchemaName { get; set; }
        public string? ParentSchemaID { get; set; }
        public string? ChildSchemaName { get; set; }
        public string? ChildSchemaID { get; set; }
    }
}
