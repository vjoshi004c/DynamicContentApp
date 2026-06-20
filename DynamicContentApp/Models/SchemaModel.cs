namespace DynamicContentApp.Models
{
    public class ContentItemModel
    {
        public string? ID { get; set; }
        public string? SchemaName { get; set; }

        public string? SchemaPath { get; set; }

        public string? ParentID { get; set; }
        
        public bool? IsPageItem { get; set; }
        public string? SchemaID { get; set; }

        public string? MasterPageLayoutPathaPath { get; set; }

        public string? AssetTypeID { get; set; }

        public string? AssetItemTreeeID { get; set; }

    }
    public class SchemaModel
    {
        public string? ID { get; set; }
        public string? SchemaName { get; set; }

        public string? SchemaPath { get; set; }

        public string? ParentID { get; set; }
        public List<SchemaFields>? SchemaFields { get; set; }

        public string? AssetTypeID { get; set; }

        public string? AssetItemSchema { get; set; }
        public string? AssetItemTreeeID { get; set; }




    }

    public class SchemaDeleteModel
    {
        public bool? Status { get; set; }
        public string? Error { get; set; }

        public string? Message { get; set; }

    }

    public class SchemaInsertModel
    {
        public bool? Status { get; set; }
        public string? NewSchemaId { get; set; }
        public string? Error { get; set; }

        public string? Message { get; set; }

    }

    public class SchemaFieldType
    {
        public string? ID { get; set; }
        public string? FieldName { get; set; }

        public string? FieldType { get; set; }



    }

    public class SchemaFields
    {
        public string? ID { get; set; }
        public string? SchemaID { get; set; }

        public SchemaFieldsType? SchemaFieldType{ get; set; }

        public string? FieldData { get; set; }
        public string? FieldName { get; set; }


    }

    public class SchemaFieldsType
    {
        public string? ID { get; set; }
        public string? FieldName { get; set; }

        public string? FieldType { get; set; }

       


    }

}
