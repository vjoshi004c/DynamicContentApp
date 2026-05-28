using DynamicContentApp.Service;

namespace DynamicContentApp.Models
{
    public static class Utility
    {
        

        public static void AddOnPlaceholderCollection(List<PageSectionContent> PageSectionContent, ComponenetDetailsModel item, string htmlContent)
        {
            if (PageSectionContent.Count == 0)
            {
                PageSectionContent pageSectionContent = new PageSectionContent();
                pageSectionContent.PlaceholderName = item.Placeholder.PlaceholderName;
                pageSectionContent.HtmlContent = htmlContent;
                PageSectionContent.Add(pageSectionContent);
                return;

            }
            bool isItemExiseted = false;
            foreach (var itempsc in PageSectionContent)
            {
                if (itempsc.PlaceholderName == item.Placeholder.PlaceholderName)
                {
                    isItemExiseted = true;
                }
            }
            if (!isItemExiseted)
            //if (itempsc.PlaceholderName != item.Placeholder.PlaceholderName)
            {
                PageSectionContent pageSectionContent = new PageSectionContent();
                pageSectionContent.PlaceholderName = item.Placeholder.PlaceholderName;
                pageSectionContent.HtmlContent = htmlContent;
                PageSectionContent.Add(pageSectionContent);
                return;
            }
            else
            {
                foreach (var itempsc in PageSectionContent)
                {
                    if (itempsc.PlaceholderName == item.Placeholder.PlaceholderName)
                    {
                        itempsc.HtmlContent = itempsc.HtmlContent + htmlContent;
                        return;
                    }
                }


            }


        }

    }
}
