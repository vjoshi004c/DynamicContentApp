namespace DynamicContentApp.Models
{
   
        public class SchemaModel
        {
            public string? ID { get; set; }
            public string? SchemaName { get; set; }

            public string? SchemaPath { get; set; }

            public string? ParentID { get; set; }
            public List<SchemaFields>? SchemaFields{ get; set; }


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
