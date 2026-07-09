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
                if (item.Placeholder != null)
                {
                    pageSectionContent.PlaceholderName = item.Placeholder.PlaceholderName;
                }
                pageSectionContent.HtmlContent = htmlContent;
                PageSectionContent.Add(pageSectionContent);
                return;

            }
            bool isItemExiseted = false;
            foreach (var itempsc in PageSectionContent)
            {
                if (item.Placeholder != null)
                {
                    if (itempsc.PlaceholderName == item.Placeholder.PlaceholderName)
                    {
                        isItemExiseted = true;
                    }
                }
            }
            if (!isItemExiseted)
            //if (itempsc.PlaceholderName != item.Placeholder.PlaceholderName)
            {
                PageSectionContent pageSectionContent = new PageSectionContent();
                if (item.Placeholder != null)
                {
                    pageSectionContent.PlaceholderName = item.Placeholder.PlaceholderName;
                }
                pageSectionContent.HtmlContent = htmlContent;
                PageSectionContent.Add(pageSectionContent);
                return;
            }
            else
            {
                foreach (var itempsc in PageSectionContent)
                {
                    if (item.Placeholder != null)
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

        public static void AddOnPlaceholderCollectionDynamic(List<PageSectionContent> PageSectionContent, dynamic item, string htmlContent)
        {
            if (PageSectionContent.Count == 0)
            {
                PageSectionContent pageSectionContent = new PageSectionContent();
                if (item.PlaceholderName != null)
                {
                    pageSectionContent.PlaceholderName = item.PlaceholderName.ToString();
                }
                pageSectionContent.HtmlContent = htmlContent;
                PageSectionContent.Add(pageSectionContent);
                return;

            }
            bool isItemExiseted = false;
            foreach (var itempsc in PageSectionContent)
            {
                if (item.PlaceholderName != null)
                {
                    if (itempsc.PlaceholderName == item.PlaceholderName.ToString())
                    {
                        isItemExiseted = true;
                    }
                }
            }
            if (!isItemExiseted)
            //if (itempsc.PlaceholderName != item.Placeholder.PlaceholderName)
            {
                PageSectionContent pageSectionContent = new PageSectionContent();
                if (item.PlaceholderName != null)
                {
                    pageSectionContent.PlaceholderName = item.PlaceholderName.ToString();
                }
                pageSectionContent.HtmlContent = htmlContent;
                PageSectionContent.Add(pageSectionContent);
                return;
            }
            else
            {
                foreach (var itempsc in PageSectionContent)
                {
                    if (item.PlaceholderName != null)
                    {
                        if (itempsc.PlaceholderName == item.PlaceholderName.ToString())
                        {
                            itempsc.HtmlContent = itempsc.HtmlContent + htmlContent;
                            return;
                        }
                    }
                }


            }


        }
    }
}
