using DynamicContentApp.Service;

namespace DynamicContentApp.Models
{
    public static class MockData
    {
        public static PageItemModel GeneratePageItemModel()
        {


            PageItemModel PageItemModel1 = new PageItemModel();

            PageItemModel1.PageItemID = "1";
            PageItemModel1.PageItemPath = "";
            PageItemModel1.PageItemSchemaID = "";
            PageItemModel1.MasterLayoutPath = "~/Views/Shared/_MasterLayout.cshtml";
            PageItemModel1.ComponenetDetails = new List<ComponenetDetailsModel>();

            PageItemModel1.PlaceholderDetails = null;
            PlaceholderModel Placeholders1 = new PlaceholderModel();
            PlaceholderModel Placeholders2 = new PlaceholderModel();
            PlaceholderModel Placeholders3 = new PlaceholderModel();
            Placeholders1.PlaceholderName = "[[PLACEHOLDER_HEADER]]";
            Placeholders2.PlaceholderName = "[[PLACEHOLDER_CONTENTBODY]]";
            Placeholders3.PlaceholderName = "[[PLACEHOLDER_FOOTER]]";
            List<PlaceholderModel> placeholderlist = new List<PlaceholderModel>();
            placeholderlist.Add(Placeholders1);
            placeholderlist.Add(Placeholders2);
            placeholderlist.Add(Placeholders3);

            ComponentModel component1 = new ComponentModel();
            component1.ComponentType = ComponentTypeEnum.ViewRendering;
            component1.ComponentItemPath = "~/Views/Components/Header.cshtml";
            PlaceholderModel placeholder1 = new PlaceholderModel();
            placeholder1.PlaceholderName = "[[PLACEHOLDER_HEADER]]";

            ComponenetDetailsModel ComponenetDetailsModel1 = new ComponenetDetailsModel();
            ComponenetDetailsModel1.Placeholder = placeholder1;
            ComponenetDetailsModel1.Component = component1;
            PageItemModel1.ComponenetDetails.Add(ComponenetDetailsModel1);


            ComponentModel component2 = new ComponentModel();
            component2.ComponentType = ComponentTypeEnum.ViewRendering;
            component2.ComponentItemPath = "~/Views/Components/ContentBody.cshtml";
            PlaceholderModel placeholder2 = new PlaceholderModel();
            placeholder2.PlaceholderName = "[[PLACEHOLDER_CONTENTBODY]]";
            // PageItemModel1.ComponenetDetails = new List<ComponenetDetailsModel>();
            ComponenetDetailsModel ComponenetDetailsModel2 = new ComponenetDetailsModel();
            ComponenetDetailsModel2.Placeholder = placeholder2;
            ComponenetDetailsModel2.Component = component2;
            PageItemModel1.ComponenetDetails.Add(ComponenetDetailsModel2);


            ComponentModel component3 = new ComponentModel();
            component3.ComponentType = ComponentTypeEnum.ViewRendering;
            component3.ComponentItemPath = "~/Views/Components/Footer.cshtml";
            PlaceholderModel placeholder3 = new PlaceholderModel();
            placeholder3.PlaceholderName = "[[PLACEHOLDER_FOOTER]]";
            // PageItemModel1.ComponenetDetails = new List<ComponenetDetailsModel>();
            ComponenetDetailsModel ComponenetDetailsModel3 = new ComponenetDetailsModel();
            ComponenetDetailsModel3.Placeholder = placeholder3;
            ComponenetDetailsModel3.Component = component3;
            PageItemModel1.ComponenetDetails.Add(ComponenetDetailsModel3);

            ComponentModel component4 = new ComponentModel();
            component4.ComponentType = ComponentTypeEnum.ControllerRendering;
            component4.ControllerName = "Product";
            component4.ControllerAction = "Privacy";
            component4.ComponentItemPath = "";
            PlaceholderModel placeholder4 = new PlaceholderModel();
            placeholder4.PlaceholderName = "[[PLACEHOLDER_FOOTER]]";
            // PageItemModel1.ComponenetDetails = new List<ComponenetDetailsModel>();
            ComponenetDetailsModel ComponenetDetailsModel4 = new ComponenetDetailsModel();
            ComponenetDetailsModel4.Placeholder = placeholder4;
            ComponenetDetailsModel4.Component = component4;
            PageItemModel1.ComponenetDetails.Add(ComponenetDetailsModel4);


            return PageItemModel1;
        }

       

    }
}
