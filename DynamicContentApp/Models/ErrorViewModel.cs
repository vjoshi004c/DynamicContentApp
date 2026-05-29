namespace DynamicContentApp.Models
{
    public class ErrorViewModel
    {
        public string? RequestId { get; set; }

        public bool ShowRequestId => !string.IsNullOrEmpty(RequestId);
    }

    public class HomeViewModel
    {
        public string? BrowserUrl { get; set; }
        public string? ReWriteUrl { get; set; }

        public string? ViewContent { get; set; }

        public string?ErrorContent { get; set; }


    }

    public class PageItemModel
    {
        public string? PageItemID { get; set; }
        public string? PageItemPath { get; set; }
        public string? PageItemSchemaID { get; set; }
        public string? MasterLayoutPath { get; set; }

        public List<ComponenetDetailsModel>? ComponenetDetails{ get; set; }

        public List<PlaceholderModel>? PlaceholderDetails { get; set; }

    }

    public class ComponenetDetailsModel
    {
        public ComponentModel? Component { get; set; }
        public PlaceholderModel? Placeholder { get; set; }

    }

    public class ComponentModel
    {
        public string? ComponentID { get; set; }
        public string? ComponentItemID { get; set; }
        public string? ComponentSchemaID { get; set; }
        public string? ComponentItemPath { get; set; }
        public ComponentTypeEnum ComponentType { get; set; }
        public string? ControllerName { get; set; }
        public string? ControllerAction { get; set; }

    }

    public class PlaceholderModel
    {
        public string? PlaceholderID { get; set; }
        public string? PlaceholderName { get; set; }
        public string? PlaceholderPath { get; set; }
       
    }

    public class PageSectionContent
    {
        public string? PlaceholderName { get; set; }
        public string? HtmlContent { get; set; }
       

    }
    public enum ComponentTypeEnum
    {
        ViewRendering,    // 0
        ControllerRendering // 1
       
    }

    public enum ApplicationMode
    {
        CONTENT_MANAGEMENT,    // 0
        CONTENT_DELIVERY // 1

    }
    public class SystemConfigOptions
    {
        public const string SystemConfig = "SystemConfig";
        public string ApplicationMode { get; set; } = "";
       
    }

}
