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
        public string? SchemaPath { get; set; }
        public string? ParentSchemaID { get; set; }
        public string? ChildSchemaName { get; set; }
        public string? ChildSchemaID { get; set; }
    }

    public class PublishQueue
    {
        public string? ID { get; set; }
        public string? PublishAssetID { get; set; }
        public string? PublishAssetPath { get; set; }
        public string? PublishAssetPageID { get; set; }
        public string? PublishAssetPagePath { get; set; }
    }

    public class AssertFieldsModel
    {
        public string? SchemaFieldID { get; set; }
        public string? SchemaParentID { get; set; }
        public string? SchemaFieldName { get; set; }
        public string? SchemaFieldType { get; set; }
        public string? AssetItemID { get; set; }
        public string? AssetSchemaID { get; set; }
        public string? AssetFieldID { get; set; }
        public string? AssetFieldValue { get; set; }
    }
}
