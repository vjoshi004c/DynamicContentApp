namespace DynamicContentApp.Models
{
    public class PageItemMasterDetailsModel
    {
        public string? AssetItemID { get; set; }
        public string? ItemName { get; set; }

        public string? ItemPath { get; set; }

        public string? SchemaID { get; set; }

        public bool? IsPageItem { get; set; }
        public string? MasterPageLayoutPath { get; set; }

       

    }
    public class AssetItemFieldDetailsModel
    {
        public string? AssetItemID { get; set; }
        public string? AssetSchemaID { get; set; }

        public string? AssetFieldName { get; set; }

        public string? AssetFieldID { get; set; }

        public string? AssetFieldValue { get; set; }
        



    }
    public class AssetItemComponentDetailsModel
    {
        public string? ComponentID { get; set; }
        public string? AssetItemID { get; set; }

        public string? ComponentPath { get; set; }

        public string? LinkedAssetItem { get; set; }

        public string? PlaceholderPath { get; set; }




    }

}
    
    
