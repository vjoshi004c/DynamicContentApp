USE [TestDCA_V3]
GO
/****** Object:  Table [dbo].[AssetFieldsType]    Script Date: 10/14/2026 1:57:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetFieldsType](
	[ID] [varchar](100) NOT NULL,
	[FieldName] [varchar](max) NULL,
	[FieldType] [varchar](100) NULL,
	[FieldCategory] [varchar](100) NULL,
 CONSTRAINT [PK_AssetFields] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'0101616E-6830-4C65-95E1-1E72F2C6D222', N'ViewRender', N'VIEW_RENDER', N'LAYOUT_ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'0E6A14C7-B8EB-4042-AC5A-450DCE5B3FFA', N'MultiList', N'MULTILIST', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', N'MultilineText', N'MULTILINE_TEXT', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', N'SimpleText', N'SIMPLLE_TEXT', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'1F7EBB17-2EA3-4F44-9713-F514D1CB19F8', N'SchemaFolder', N'SCHEMA_FOLDER', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'2D341268-A28F-47A7-8970-8933EC515336', N'MediaFolder', N'MEDIA_FOLDER', N'MEDIA_ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'34D2C7F4-6845-49FD-B5B2-830E43BED729', N'FormFolder', N'FORM_FOLDER', N'FORM_ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'38DA65EB-C0F8-4467-B196-2728393BF5BE', N'File', N'FILE', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'395A153E-1967-490C-B293-42824E754DAF', N'Link', N'LINK', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'47573A35-BF6D-4AC7-BF4E-13CFBDADA2E3', N'Site', N'SITE', N'SITE_ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'574F5063-25EE-4A17-BCFE-9D9DFFF4D17C', N'Placeholder', N'PLACEHOLDER', N'LAYOUT_ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', N'ContentItem', N'CONTENT_ITEM', N'ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'5CE9E74B-B79B-421C-A346-00DFA1410D76', N'Date', N'DATE', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'69596F18-F516-4367-8526-E555D066C65E', N'PageRender', N'PAGE_RENDER', N'LAYOUT_ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'83E496BA-B047-4742-9F74-F7DADC4449D7', N'MediaFileItem', N'MEDIA_FILE_ITEM', N'MEDIA_ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69', N'Schema', N'SCHEMA', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'8C9068B2-9562-4757-947F-C6DA3389D13F', N'ControllerRender', N'CONTROLLER_RENDER', N'LAYOUT_ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'919175D2-D5D6-4BAB-B213-655E40E29FB0', N'Dropdown', N'DROPDOWN', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'A96C5435-E99E-4D9A-BAF1-D9B105A4E843', N'SiteFolder', N'SITE_FOLDER', N'SITE_ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'A9F7BBE1-2FEA-40D4-BC43-0A0C2E20C824', N'Image', N'IMAGE', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'B39AC555-FD24-4E60-911C-8504FB0721B3', N'Folder', N'FOLDER', N'ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'C669F6B8-16C3-4650-923A-2E22103C336E', N'Form', N'FORM', N'FORM_ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'DC218D8D-1F5C-4C94-AF79-A90B75097EB1', N'Checkbox', N'CHECKBOX', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'E07A9DCD-D00E-42AE-A23F-3CD047F939E4', N'MediaImageItem', N'MEDIA_IMAGE_ITEM', N'MEDIA_ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'E19765AD-A559-40F0-837A-132841CAD972', N'HTMLText', N'HTML_TEXT', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'F68F4270-2631-4C21-BEF0-3334B6DEB417', N'Model', N'MODEL', N'LAYOUT_ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'FA1FEA75-9ACB-4095-8EC0-7DA5814F84BA', N'LayoutFolder', N'LAYOUT_FOLDER', N'LAYOUT_ENTITYTYPE')
GO
ALTER TABLE [dbo].[AssetFieldsType] ADD  CONSTRAINT [DF_AssetFields_ID]  DEFAULT (newid()) FOR [ID]
GO
