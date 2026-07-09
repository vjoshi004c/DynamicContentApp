USE [TestDCA]
GO
/****** Object:  Table [dbo].[AssetFieldsType]    Script Date: 7/9/2026 3:50:45 PM ******/
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
/****** Object:  Table [dbo].[AssetItem]    Script Date: 7/9/2026 3:50:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetItem](
	[ID] [varchar](100) NOT NULL,
	[ItemName] [varchar](100) NULL,
	[ItemPath] [varchar](100) NULL,
	[SchemaID] [varchar](100) NULL,
	[IsPageItem] [bit] NULL,
	[MasterPageLayoutPath] [varchar](100) NULL,
	[ParentID] [varchar](100) NULL,
	[AssetType] [varchar](100) NULL,
	[AssetItemSchemaMapped] [varchar](100) NULL,
 CONSTRAINT [PK_AssetItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetItemFields]    Script Date: 7/9/2026 3:50:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetItemFields](
	[ID] [varchar](100) NOT NULL,
	[AssetFieldID] [varchar](100) NULL,
	[AssetFieldValue] [varchar](max) NULL,
	[AssetSchemaID] [varchar](max) NULL,
	[AssetItemID] [varchar](100) NULL,
 CONSTRAINT [PK_AssetItemFields] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetItemLayout]    Script Date: 7/9/2026 3:50:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetItemLayout](
	[ID] [varchar](100) NOT NULL,
	[AssetItemID] [varchar](100) NULL,
	[MasterLayoutPath] [varchar](500) NULL,
	[MasterLayoutAssetItemID] [varchar](100) NULL,
 CONSTRAINT [PK_AssetItemLayout] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetSchema]    Script Date: 7/9/2026 3:50:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetSchema](
	[ID] [varchar](100) NOT NULL,
	[SchemaName] [varchar](max) NULL,
	[SchemaPath] [varchar](max) NULL,
	[ParentID] [varchar](100) NULL,
	[AssetTypeID] [varchar](100) NULL,
 CONSTRAINT [PK_AssetSchema] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssetSchemaFields]    Script Date: 7/9/2026 3:50:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssetSchemaFields](
	[ID] [varchar](100) NOT NULL,
	[SchemaID] [varchar](100) NULL,
	[FieldTypeID] [varchar](100) NULL,
	[FieldData] [nvarchar](max) NULL,
	[FieldName] [varchar](100) NULL,
 CONSTRAINT [PK_AssetSchemaFields] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComponentPresentation]    Script Date: 7/9/2026 3:50:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponentPresentation](
	[ID] [varchar](100) NOT NULL,
	[AssetItemID] [varchar](100) NULL,
	[ComponentPath] [varchar](500) NULL,
	[LinkedAssetItem] [varchar](500) NULL,
	[PlaceholderPath] [varchar](500) NULL,
 CONSTRAINT [PK_AssetItemComponents] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageContent]    Script Date: 7/9/2026 3:50:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageContent](
	[PageUrl] [varchar](max) NULL,
	[PageContent] [nvarchar](max) NULL,
	[PageUpdatedDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagePresentation]    Script Date: 7/9/2026 3:50:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagePresentation](
	[ID] [varchar](100) NOT NULL,
	[Name] [varchar](100) NULL,
	[AssetItemID] [varchar](100) NULL,
	[ComponentID] [varchar](100) NULL,
	[ComponentAssetID] [varchar](100) NULL,
	[PlaceholderID] [varchar](100) NULL,
	[AssetModelName] [varchar](100) NULL,
 CONSTRAINT [PK_PagePresentation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'0101616E-6830-4C65-95E1-1E72F2C6D222', N'ViewRender', N'VIEW_RENDER', N'ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'0E6A14C7-B8EB-4042-AC5A-450DCE5B3FFA', N'MultiList', N'MULTILIST', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', N'MultilineText', N'MULTILINE_TEXT', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', N'SimpleText', N'SIMPLLE_TEXT', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'395A153E-1967-490C-B293-42824E754DAF', N'Link', N'LINK', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'574F5063-25EE-4A17-BCFE-9D9DFFF4D17C', N'Placeholder', N'PLACEHOLDER', N'ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', N'ContentItem', N'CONTENT_ITEM', N'ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'5CE9E74B-B79B-421C-A346-00DFA1410D76', N'Date', N'DATE', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'69596F18-F516-4367-8526-E555D066C65E', N'PageRender', N'PAGE_RENDER', N'ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'83E496BA-B047-4742-9F74-F7DADC4449D7', N'MediaFileItem', N'MEDIA_FILE_ITEM', N'ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69', N'Schema', N'SCHEMA', N'ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'8C9068B2-9562-4757-947F-C6DA3389D13F', N'ControllerRender', N'CONTROLLER_RENDER', N'ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'919175D2-D5D6-4BAB-B213-655E40E29FB0', N'Dropdown', N'DROPDOWN', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'A9F7BBE1-2FEA-40D4-BC43-0A0C2E20C824', N'Image', N'IMAGE', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'B39AC555-FD24-4E60-911C-8504FB0721B3', N'Folder', N'FOLDER', N'ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'DC218D8D-1F5C-4C94-AF79-A90B75097EB1', N'Checkbox', N'CHECKBOX', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'E07A9DCD-D00E-42AE-A23F-3CD047F939E4', N'MediaImageItem', N'MEDIA_IMAGE_ITEM', N'ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'E19765AD-A559-40F0-837A-132841CAD972', N'HTMLText', N'HTML_TEXT', N'DATATYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'F68F4270-2631-4C21-BEF0-3334B6DEB417', N'Model', N'MODEL', N'ENTITYTYPE')
GO
INSERT [dbo].[AssetFieldsType] ([ID], [FieldName], [FieldType], [FieldCategory]) VALUES (N'FC80D56A-8CCE-4617-BF9E-FF80B178F75A', N'Language', N'LANGUAGE', N'ENTITYTYPE')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'0EF047BE-60AD-44B8-A143-95606FED7873', N'Footer', N'/Content/MySite/Data/Footer', N'608AD90B-52F0-451A-8FE8-DB284ED0E3E4', 0, N'', NULL, NULL, NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'1463A115-AC27-4E46-B240-6F786478EF05', N'Footer', N'/UniversalCMS/Content/SharedData/Article/Footer', N'CBF23F60-D5DF-461C-A589-011650C698C3', 0, N'', N'53F5627D-6E7A-4C2F-BB70-2101D43B352D', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', N'EB17A358-C1C5-4981-8E2D-DAF837FF819C')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'1909CDAC-1FCC-4309-8409-83EAEB5703CD', N'TopContent', N'/Content/MySite/Data/TopContent', N'A6676449-07F1-4DEA-B456-6D4BE646E351', 0, N'', NULL, NULL, NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'20AAA705-042D-4924-9B0B-4854480FA837', N'Test6000', N'', N'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D', 0, N'', N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'2131E493-0560-42A8-8DD0-BE728255B8C0', N'TestVivek', N'', N'{24EEE53B-5962-4442-ABC4-DB813DBE1B92}', 0, N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', N'EEC88B58-1FD0-4314-A3A0-39F3284230E6', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'2B267251-6EF8-4AFC-8BAF-5FCD48515A24', N'Child111', N'/Main/Content/Home/Child111', N'24EEE53B-5962-4442-ABC4-DB813DBE1B92', 0, N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', N'24EEE53B-5962-4442-ABC4-DB813DBE1B92', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'2CFAEE82-CEE4-43AF-9532-13E5A8518399', N'Header', N'/UniversalCMS/Layout/PlaceholderTemplate/Header', N'3B0DDBDC-D160-42DC-845A-045F26A2A494', 0, N'', N'8CEE3BBE-195F-416A-A204-1B15BE16AD66', N'574F5063-25EE-4A17-BCFE-9D9DFFF4D17C', N'98765071-870F-4D6E-9C2B-7B4289CFD876')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'3569D3B1-7099-4EEB-AA25-518BDE35198E', N'test8000', N'', N'24EEE53B-5962-4442-ABC4-DB813DBE1B92', 0, N'', N'24EEE53B-5962-4442-ABC4-DB813DBE1B92', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'37219233-15C1-4C5C-A5BE-C328B97FBCFC', N'ContentBody', N'/UniversalCMS/Layout/PlaceholderTemplate/ContentBody', N'3B0DDBDC-D160-42DC-845A-045F26A2A494', 0, N'', N'8CEE3BBE-195F-416A-A204-1B15BE16AD66', N'574F5063-25EE-4A17-BCFE-9D9DFFF4D17C', N'D45238F6-473B-4C54-AC4B-EC7DAD072A48')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'37E80E99-15E0-4373-92DB-8FD292482270', N'ArticleContent', N'/UniversalCMS/Layout/Rendering/Controller/ArticleContent', N'F3D00719-3736-4B63-83B6-5C9C865ECCBC', 0, N'', N'9BBCD847-8AF5-4333-8553-29DD646C4D00', N'8C9068B2-9562-4757-947F-C6DA3389D13F', N'4FEDA711-509E-440E-AF6E-6D1DAD72A974')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'387643AB-C341-4AAB-B11E-28F2EEE55815', N'MasterLayout', N'', N'3A448922-1720-4101-AE3B-CCD87ADF7497', 0, N'', N'2EB94A78-CC78-4C33-84EA-C2B583A9C8BD', N'69596F18-F516-4367-8526-E555D066C65E', N'DF6A2409-C2CF-4FA6-BF2F-B898D42DFA79')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'3941B0BB-F2FD-483A-81EE-C73117F8C1F9', N'FirstAssetItem', N'/Content/MySite/Data/FirstAssetItem', N'E9E34FBE-0F61-4B16-BA71-E938365FBA61', 1, N'/Content/Layout/FirstMaster', NULL, NULL, NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'473805E7-F323-4F31-907A-4EA6C1624860', N'Child111', N'/Main/Content/Home/Child111', N'24EEE53B-5962-4442-ABC4-DB813DBE1B92', 0, N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', N'24EEE53B-5962-4442-ABC4-DB813DBE1B92', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'4C1BD6CB-F29E-4CDD-8511-AE299AF579CE', N'Test9000', N'', N'24EEE53B-5962-4442-ABC4-DB813DBE1B92', 0, N'', N'24EEE53B-5962-4442-ABC4-DB813DBE1B92', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', N'')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'5305C451-C5C3-4D7B-A6A8-59C1E087D096', N'ProductSite', N'/Main/Content/ArticleSecond', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', 0, N'', N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', N'4BCC7DD0-034B-4594-8D92-97BFDB139FB4')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'563E6793-D429-4E7F-925D-F849446DFFC8', N'CHILD100', N'', N'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D', 0, N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', N'EEC88B58-1FD0-4314-A3A0-39F3284230E6', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'5BE0C000-4491-46EE-8FEF-C49F3B681B79', N'ArticleFooter', N'/UniversalCMS/Layout/Rendering/View/ArticleFooter', N'2DAAE96B-2437-4FF8-9F0C-EB2ED14A14F5', 0, N'', N'CC7CDD08-B9EC-463D-A11E-C1BA7BC447C7', N'0101616E-6830-4C65-95E1-1E72F2C6D222', N'84F99E9C-5E63-43AB-9AD5-2E7565D93974')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'6294DEAF-E99D-4079-AAE1-874E49F78B71', N'AssetForth', N'/UniversalCMS/Content/AssetForth', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', 0, N'', N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', N'126C4635-4E82-45C4-ABF0-1E05D71C5BA0')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'72D1B838-C0DE-4F64-A98C-449D9ECBC3C1', N'TestCMS', N'', N'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D', 0, N'', N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'7A393EDB-3242-4313-B6B7-E824CE7EFDE8', N'ContentBody', N'/UniversalCMS/Content/SharedData/Article/ContentBody', N'4E281921-EC0B-4563-80D2-828C38FDF250', 0, N'', N'53F5627D-6E7A-4C2F-BB70-2101D43B352D', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', N'EF9F4297-0129-407C-AF31-F6736C7F1C1B')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'8199CDFA-4CB2-4161-A6FD-13AF190D6250', N'AssetJune22nd', N'', N'24EEE53B-5962-4442-ABC4-DB813DBE1B92', 0, N'', N'24EEE53B-5962-4442-ABC4-DB813DBE1B92', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', N'EC2606D9-6D67-45BA-9B0A-EE5E9C76ED7D')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'81C34F25-09AA-4338-BB5A-5EDA26FAAA', N'child555', N'/Main/Content/Home/Child111/child 22/child333', N'81C34F25-09AA-4338-BB5A-5EDA26FCDEA6', 0, N'', N'EEC88B58-1FD0-4314-A3A0-39F3284230E6', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'84467608-7F71-4F2B-B2FB-8E2EA5FEFE64', N'Footer', N'/UniversalCMS/Layout/PlaceholderTemplate/Footer', N'3B0DDBDC-D160-42DC-845A-045F26A2A494', 0, N'', N'8CEE3BBE-195F-416A-A204-1B15BE16AD66', N'574F5063-25EE-4A17-BCFE-9D9DFFF4D17C', N'2AF482AE-C5D8-4D07-9F4A-010699A6BDC8')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'8C5E84A6-0EF1-4E65-81FD-8169A007A17B', N'ArticleHeader', N'/UniversalCMS/Layout/Rendering/View/ArticleHeader', N'2DAAE96B-2437-4FF8-9F0C-EB2ED14A14F5', 0, N'', N'CC7CDD08-B9EC-463D-A11E-C1BA7BC447C7', N'0101616E-6830-4C65-95E1-1E72F2C6D222', N'1EBD80F3-0504-46D4-A5BA-C00BEE6F178A')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'8E2734E3-D658-4A70-B9F6-213C283F996A', N'MasterArticleLayout', N'/UniversalCMS/Layout/PageTemplate/MasterArticleLayout', N'3A448922-1720-4101-AE3B-CCD87ADF7497', 0, N'', N'2EB94A78-CC78-4C33-84EA-C2B583A9C8BD', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', N'E9E34FBE-0F61-4B16-BA71-E938365FBA61')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'946B5619-6418-422E-93E0-2FF267B78149', N'Test2000', N'', N'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D', 0, N'', N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D', N'SecondtAssetItem', N'/Content/MySite/Data/SecondAssetItem', N'EB60F493-F53B-4388-B17E-B3D1A3A0456E', 1, N'/Content/Layout/SecondMaster', NULL, NULL, NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'982C5020-54F1-4DA3-84AD-74BE7BAEE4DF', N'ArticleSite', N'/UniversalCMS/Content/ArticleSite', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', 1, N'/UniversalCMS/Layout/PageTemplate/MasterArticleLayout', N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', N'8144904A-FC80-49CE-AE62-CD89753D106D')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'9AA185C3-CC75-4D64-A335-C51C10FC3A96', N'Header', N'/Content/MySite/Data/Header', N'710FBE40-8EBD-4FDE-BA99-282501FA809A', 0, N'', NULL, NULL, NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'9E1E4DB3-4662-4381-ACDF-8FCC3839D327', N'ContentTop', N'/Main/Layout/PlaceholderTemplate/ContentTop', N'BD1A5331-37E8-416E-A429-113B3F72CB89', 0, N'', N'8CEE3BBE-195F-416A-A204-1B15BE16AD66', N'574F5063-25EE-4A17-BCFE-9D9DFFF4D17C', N'40243409-86FE-488D-885B-F5573BF13884')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'A4ACBA09-4F35-4334-8135-AC9AF2F304A3', N'TestJoshi', N'/Main/Content/TestJoshi', N'{24EEE53B-5962-4442-ABC4-DB813DBE1B92}', 0, N'', N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'A4BB63BD-4D32-42E4-AB49-B6DCB34EFD28', N'test7000', N'', N'24EEE53B-5962-4442-ABC4-DB813DBE1B92', 0, N'', N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'A6E23920-EE29-4B81-9F9C-C9EBDAFC369A', N'Content', N'/Main/Content', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', 0, N'', N'4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE', N'B39AC555-FD24-4E60-911C-8504FB0721B3', N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'A92B3F2F-DAB8-4511-AA21-D5BF31492A7D', N'Content', N'/Main/Content', N'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D', 0, N'', N'4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE', N'B39AC555-FD24-4E60-911C-8504FB0721B3', NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'AD4A9404-87A3-46FA-94FE-F2978214C328', N'MiddleContent', N'/Content/MySite/Data/MiddleContent', N'74826E3E-C2EA-45DC-A328-43F115F45161', 0, N'', NULL, NULL, NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'B6965FB9-B28D-4F4A-942F-1E34A8E24D84', N'MainNagivation', N'/Content/MySite/Data/MainNagivation', N'A23BE558-72E9-4326-B2C7-BC5C99F38B34', 0, N'', NULL, NULL, NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'B748B64E-89DB-45BE-8DAA-3FB6EE2EDC69', N'BottomContent', N'/Content/MySite/Data/BottomContent', N'608AD90B-52F0-451A-8FE8-DB284ED0E3E4', 0, N'', NULL, NULL, NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'B981B5A7-9FBC-4A58-A96C-7D458BBA3E39', N'BlogSite', N'/Main/Content/Article Third', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', 0, N'', N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', N'BFA8AC35-63C1-4FC1-8A3F-4A536E77B47D')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'BE1ABA7D-53C0-4C83-9D7D-44B9760A0FD9', N'MasterProductLayout', N'/Main/Layout/PageTemplate/MasterProduct', N'3A448922-1720-4101-AE3B-CCD87ADF7497', 0, N'', N'2EB94A78-CC78-4C33-84EA-C2B583A9C8BD', N'0', N'EB60F493-F53B-4388-B17E-B3D1A3A0456E')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'CBEF84A1-D812-4C34-962C-F385FF1E6567', N'ContentBottom', N'/Main/Layout/PlaceholderTemplate/ContentBootom', N'BD1A5331-37E8-416E-A429-113B3F72CB89', 0, N'', N'8CEE3BBE-195F-416A-A204-1B15BE16AD66', N'574F5063-25EE-4A17-BCFE-9D9DFFF4D17C', N'D2845137-E036-4536-8AE1-88733E3B3E8E')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'CDA55FED-1F77-4400-B134-2C5FF9133663', N'Test3000', N'', N'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D', 0, N'', N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'D4B2F644-4889-42A3-BA51-8579D5C11E1F', N'ContentMiddle', N'/Main/Layout/PlaceholderTemplate/ContentMiddle', N'BD1A5331-37E8-416E-A429-113B3F72CB89', 0, N'', N'8CEE3BBE-195F-416A-A204-1B15BE16AD66', N'574F5063-25EE-4A17-BCFE-9D9DFFF4D17C', N'C06D2B89-2780-48A2-B2F8-7EEEE5C4A895')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'E175791F-51B4-42DB-B343-F335C52B15FE', N'CHILD10001', N'', N'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D', 0, N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', N'81C34F25-09AA-4338-BB5A-5EDA26FCDEA6', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', NULL)
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'E1CF2C50-2CE0-4737-9A3C-27E45A2D2851', N'ContentMiddle', N'/Main/Layout/PlaceholderTemplate/ContentMiddle', N'BD1A5331-37E8-416E-A429-113B3F72CB89', 0, N'', N'8CEE3BBE-195F-416A-A204-1B15BE16AD66', N'0', N'C06D2B89-2780-48A2-B2F8-7EEEE5C4A895')
GO
INSERT [dbo].[AssetItem] ([ID], [ItemName], [ItemPath], [SchemaID], [IsPageItem], [MasterPageLayoutPath], [ParentID], [AssetType], [AssetItemSchemaMapped]) VALUES (N'F642B56C-0E5D-44BE-88BF-A2661D910D46', N'Header', N'/UniversalCMS/Content/SharedData/Article/Header', N'A49C6831-B51F-46E8-86D6-74C399AFD1C5', 0, N'', N'53F5627D-6E7A-4C2F-BB70-2101D43B352D', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE', N'2BAEBCD9-4B91-4139-8345-06CA3B63C5F2')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'0198C8E4-AE21-4A60-8FDB-236CB724E043', N'FC5BFA3B-F1A4-4088-897E-75A8088DFE4F', N'~/Views/Components/ArticleFooter.cshtml', N'2DAAE96B-2437-4FF8-9F0C-EB2ED14A14F5', N'5BE0C000-4491-46EE-8FEF-C49F3B681B79')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'039520A9-6E8A-4E73-BCFC-E86AFE79F9DD', N'BCD3A6D9-B995-43B4-8E06-05C42441737D', N'It is related to main content of footer like privacy , copy right details', N'CBF23F60-D5DF-461C-A589-011650C698C3', N'1463A115-AC27-4E46-B240-6F786478EF05')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'040608A8-7319-4FF3-901F-22C7511C9A29', N'FC5BFA3B-F1A4-4088-897E-75A8088DFE4F', N'~/Views/Components/ArticleHeader.cshtml', N'2DAAE96B-2437-4FF8-9F0C-EB2ED14A14F5', N'8C5E84A6-0EF1-4E65-81FD-8169A007A17B')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'0E7EE010-C792-4043-B8B3-077F1DC92A39', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', N'Test data SecondAssetItem', N'E9E34FBE-0F61-4B16-BA71-E938365FBA61', N'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'18ADBE6B-5D28-435C-A0F0-2C1B98DE7055', N'ADCA78F3-1E1D-41CA-89A1-0020A4438158', N'', N'3A448922-1720-4101-AE3B-CCD87ADF7497', N'8E2734E3-D658-4A70-B9F6-213C283F996A')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'28C3BBE6-88DC-45A8-AE51-4FA9D1F0A01A', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', N'Test data MiddleContent', N'88FDCEF5-EAAB-4349-93BE-08DCC3E7765D', N'AD4A9404-87A3-46FA-94FE-F2978214C328')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'31526BFD-37C2-407C-9B38-2FEADCC0BD1D', N'CAFCCA7C-020C-456E-936B-8AE465DAD6CB', N'ContentBody', N'F3D00719-3736-4B63-83B6-5C9C865ECCBC', N'37E80E99-15E0-4373-92DB-8FD292482270')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'3372B209-D04A-41C8-A45B-0226E4C88477', N'E19765AD-A559-40F0-837A-132841CAD972', N'Test data MiddleContent', N'88FDCEF5-EAAB-4349-93BE-08DCC3E7765D', N'AD4A9404-87A3-46FA-94FE-F2978214C328')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'34FFAF09-F6B0-4447-B65C-BFB2228AD2EE', N'E19765AD-A559-40F0-837A-132841CAD972', N'Test data Header', N'74826E3E-C2EA-45DC-A328-43F115F45161', N'9AA185C3-CC75-4D64-A335-C51C10FC3A96')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'36430B0C-E1A1-41BA-B1EE-546738109351', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', N'Test data Header', N'74826E3E-C2EA-45DC-A328-43F115F45161', N'9AA185C3-CC75-4D64-A335-C51C10FC3A96')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'4B38322B-1415-4703-9F9D-F48AA690CDCE', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', N'Test data Header', N'74826E3E-C2EA-45DC-A328-43F115F45161', N'9AA185C3-CC75-4D64-A335-C51C10FC3A96')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'51D92894-E709-4E0D-8DD4-A2082097F171', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', N'Test data Footer', N'710FBE40-8EBD-4FDE-BA99-282501FA809A', N'0EF047BE-60AD-44B8-A143-95606FED7873')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'51FD88BA-6AB5-4761-AE47-3FCE9A89F51F', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', N'Test data MiddleContent', N'88FDCEF5-EAAB-4349-93BE-08DCC3E7765D', N'AD4A9404-87A3-46FA-94FE-F2978214C328')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'52793A1C-8797-4BB6-AA8E-780B749009A6', N'E19765AD-A559-40F0-837A-132841CAD972', N'Test data SecondAssetItem', N'E9E34FBE-0F61-4B16-BA71-E938365FBA61', N'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'57255BD0-0675-480E-BD15-5F294B0B4BE9', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', N'Test data FirstAssetItem', N'E9E34FBE-0F61-4B16-BA71-E938365FBA61', N'3941B0BB-F2FD-483A-81EE-C73117F8C1F9')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'65A14975-1E04-4254-BEE1-2DDF21FF6551', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', N'Test data Footer', N'710FBE40-8EBD-4FDE-BA99-282501FA809A', N'0EF047BE-60AD-44B8-A143-95606FED7873')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'791CDB7A-F219-410B-A2C8-DA6672B14A5B', N'D7C89C93-63D3-4078-A2A3-D5D5A3C91716', N'Article Content data', N'4E281921-EC0B-4563-80D2-828C38FDF250', N'7A393EDB-3242-4313-B6B7-E824CE7EFDE8')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'79E65938-986F-4D23-A9F8-454C5AEC0600', N'B3DBD35E-10C2-4370-B2BC-F40AE781DC57', N'[[PLACEHOLDER_HEADER]]', N'3B0DDBDC-D160-42DC-845A-045F26A2A494', N'2CFAEE82-CEE4-43AF-9532-13E5A8518399')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'81383BD4-FD90-4F2B-AAF7-3A395E5070A9', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', N'Test data FirstAssetItem', N'E9E34FBE-0F61-4B16-BA71-E938365FBA61', N'3941B0BB-F2FD-483A-81EE-C73117F8C1F9')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'815A20DD-9B67-437F-A909-0BD2F1CFB4F9', N'30A81E22-6712-4717-A3FF-1ADB7D7792F1', N'Article second of ucms', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', N'5305C451-C5C3-4D7B-A6A8-59C1E087D096')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'8E2C4131-4B76-48B0-BCA0-B5A763446747', N'5049C391-3811-44CF-B537-9643E3AA38C3', N'', N'3A448922-1720-4101-AE3B-CCD87ADF7497', N'8E2734E3-D658-4A70-B9F6-213C283F996A')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'9450226D-24E0-4C25-90CA-BCB16801416C', N'30A81E22-6712-4717-A3FF-1ADB7D7792F1', N'CMS ARTICLE FIRST111111', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', N'982C5020-54F1-4DA3-84AD-74BE7BAEE4DF')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'9894ED70-8DB5-46D2-B74D-257C1FAF7B8E', N'F935C03F-B4A7-46D2-84F6-627E1D8B64F1', N'Sub heading of article content data', N'4E281921-EC0B-4563-80D2-828C38FDF250', N'7A393EDB-3242-4313-B6B7-E824CE7EFDE8')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'A2DCCA9C-493C-4033-916A-C3D7A148778A', N'E19765AD-A559-40F0-837A-132841CAD972', N'Test data MainNagivation', N'A6676449-07F1-4DEA-B456-6D4BE646E351', N'B6965FB9-B28D-4F4A-942F-1E34A8E24D84')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'A4094C0A-2DAD-46B3-BCA3-292A47EB7F39', N'147430C6-719E-4C1E-83C3-0D038B5F2DC9', N'Article second shot descriptin- related to univesal cms content tree', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', N'5305C451-C5C3-4D7B-A6A8-59C1E087D096')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'AA9A8A97-EBFB-444F-BF21-E5D326929E91', N'147430C6-719E-4C1E-83C3-0D038B5F2DC9', N'Article shot description of third article ....', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', N'B981B5A7-9FBC-4A58-A96C-7D458BBA3E39')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'AB5F9368-E30D-4AE6-8787-E5A933D8D391', N'E19765AD-A559-40F0-837A-132841CAD972', N'Test dataFooter', N'710FBE40-8EBD-4FDE-BA99-282501FA809A', N'0EF047BE-60AD-44B8-A143-95606FED7873')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'AB8C88BD-4374-4971-BFD7-9F66CC6483B6', N'B3DBD35E-10C2-4370-B2BC-F40AE781DC57', N'[[PLACEHOLDER_FOOTER]]', N'3B0DDBDC-D160-42DC-845A-045F26A2A494', N'84467608-7F71-4F2B-B2FB-8E2EA5FEFE64')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'BC1CCFC6-4CD5-4002-B97F-4E633135DFE7', N'A52161CC-8F4B-488C-9647-D6D12B6F0270', N'It is related to view header details of article ', N'A49C6831-B51F-46E8-86D6-74C399AFD1C5', N'F642B56C-0E5D-44BE-88BF-A2661D910D46')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'BD58E376-2146-475D-B0C3-38866D77785A', N'63CAFB53-3D4F-473B-A66A-E03D5E718127', N'It is related to main contain of selected article ', N'4E281921-EC0B-4563-80D2-828C38FDF250', N'7A393EDB-3242-4313-B6B7-E824CE7EFDE8')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'BDAF714B-EAEE-46B7-B348-AC5A3F21BD9B', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', N'Test data BottomContent', N'608AD90B-52F0-451A-8FE8-DB284ED0E3E4', N'B748B64E-89DB-45BE-8DAA-3FB6EE2EDC69')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'BF41BAF7-3980-4281-82EE-BC9B711D056B', N'700C1D4A-A73B-45AE-83BF-F3D3F3D60FFF', N'~/Views/Shared/_MasterLayout.cshtml', N'3A448922-1720-4101-AE3B-CCD87ADF7497', N'8E2734E3-D658-4A70-B9F6-213C283F996A')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'BFB80792-DD8E-40C8-978B-E3B8055B2B2D', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', N'Test data MainNagivation', N'A6676449-07F1-4DEA-B456-6D4BE646E351', N'B6965FB9-B28D-4F4A-942F-1E34A8E24D84')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'C04721B7-B0A8-4444-A115-EC71D5F8CAD3', N'00BEF808-AFF0-4489-853F-2BF65705C300', N'Article content heading ', N'4E281921-EC0B-4563-80D2-828C38FDF250', N'7A393EDB-3242-4313-B6B7-E824CE7EFDE8')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'C16AA0A9-BF05-4BDD-9E91-D92C25F3B5C1', N'147430C6-719E-4C1E-83C3-0D038B5F2DC9', N'CMS Article short description - To update content of site page...1111111', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', N'982C5020-54F1-4DA3-84AD-74BE7BAEE4DF')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'C25CA550-E65B-40D7-B61A-906C2DCB9768', N'30A81E22-6712-4717-A3FF-1ADB7D7792F1', N'Title of article thrid - ucms', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', N'B981B5A7-9FBC-4A58-A96C-7D458BBA3E39')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'C38BBA83-9921-449D-BD53-078398047C87', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', N'Test data MainNagivation', N'A6676449-07F1-4DEA-B456-6D4BE646E351', N'B6965FB9-B28D-4F4A-942F-1E34A8E24D84')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'C7AE532B-E66E-45E6-B9D3-EF2008D162CF', N'BDF7665E-E0AD-4F24-A139-392DE149E00D', N'Article', N'F3D00719-3736-4B63-83B6-5C9C865ECCBC', N'37E80E99-15E0-4373-92DB-8FD292482270')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'CFA595E3-46AA-4EBE-B327-31EE248A78C9', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', N'Test data BottomContent', N'608AD90B-52F0-451A-8FE8-DB284ED0E3E4', N'B748B64E-89DB-45BE-8DAA-3FB6EE2EDC69')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'DD9A8735-7EA3-457D-B4FD-2A7B36789FFD', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', N'Test data SecondAssetItem', N'E9E34FBE-0F61-4B16-BA71-E938365FBA61', N'94ECC1CF-19BA-4B1F-99B8-BCF1778A139D')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'E57045E0-E752-48B2-BB51-0B0A34257907', N'E19765AD-A559-40F0-837A-132841CAD972', N'Test data FirstAssetItem', N'E9E34FBE-0F61-4B16-BA71-E938365FBA61', N'3941B0BB-F2FD-483A-81EE-C73117F8C1F9')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'EA4746C7-54A1-4BF5-9F42-5B0ECEEB3343', N'9047F87A-5D9D-4A6C-A2A3-53477608CCFF', N'Disclamier of article ', N'A49C6831-B51F-46E8-86D6-74C399AFD1C5', N'F642B56C-0E5D-44BE-88BF-A2661D910D46')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'EF4B20A1-E756-4D1E-908A-95A4336E2515', N'E19765AD-A559-40F0-837A-132841CAD972', N'Test data BottomContent', N'608AD90B-52F0-451A-8FE8-DB284ED0E3E4', N'B748B64E-89DB-45BE-8DAA-3FB6EE2EDC69')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'FA2DEB15-CE9F-4968-BA5B-C2A5A702FFED', N'318501E0-8E4B-4407-8C09-35DF00FC61DF', N'Title of article footer', N'CBF23F60-D5DF-461C-A589-011650C698C3', N'1463A115-AC27-4E46-B240-6F786478EF05')
GO
INSERT [dbo].[AssetItemFields] ([ID], [AssetFieldID], [AssetFieldValue], [AssetSchemaID], [AssetItemID]) VALUES (N'FC62B648-2114-4BAF-B2E2-EAAC6B7B4AA1', N'B3DBD35E-10C2-4370-B2BC-F40AE781DC57', N'[[PLACEHOLDER_CONTENTBODY]]', N'3B0DDBDC-D160-42DC-845A-045F26A2A494', N'37219233-15C1-4C5C-A5BE-C328B97FBCFC')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'003384FE-E1EF-4BDB-83F0-35B68FA9478A', N'PrivacyInfo', N'/UniversalCMS/Schema/CommonSchema/Footer/PrivacyInfo', N'CBF23F60-D5DF-461C-A589-011650C698C3', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'00BEF808-AFF0-4489-853F-2BF65705C300', N'Heading', N'', N'4E281921-EC0B-4563-80D2-828C38FDF250', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'07BE06E2-13C3-4F58-A8B5-67F8BA2FB0F7', N'Search', N'/Main/Schema/ProjectSchema/SampleSite1/Base/Search', N'6656B0C9-60C0-4F13-9C95-5868FCCE9DA5', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'080F4A32-82F7-4AF6-B4E6-5847DC1EACD6', N'ArticleSchema', N'/UniversalCMS/Schema/ArticleSchema', N'1049D17E-6C1C-45A9-9B75-5F779B61023E', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'0EEA7F48-DC8C-4F40-B69E-61DFFF9A9DA0', N'level2', N'', N'EFF2AC28-9351-44D6-9D88-C7252D090D89', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'1049D17E-6C1C-45A9-9B75-5F779B61023E', N'Schema', N'/Main/Schema', N'4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'1091434A-4955-486F-938C-287A5E5DA2B2', N'ShortDescription', N'', N'4E281921-EC0B-4563-80D2-828C38FDF250', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'10DCCA48-6F0A-4A93-B9ED-67C43C423F58', N'ArticleDescription1', N'/Main/Schema/TestFoldersdfdfsd/ArticleDescription', N'080F4A32-82F7-4AF6-B4E6-5847DC1EACD6', N'E19765AD-A559-40F0-837A-132841CAD972')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'111035FA-612A-4EB5-9CBC-8DF91E9152A3', N'Layout', N'/Main/Layout', N'4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'115DAE9B-4FE6-4222-9046-D5BFF5FE638E', N'HeaderImage', N'', N'080F4A32-82F7-4AF6-B4E6-5847DC1EACD6', N'A9F7BBE1-2FEA-40D4-BC43-0A0C2E20C824')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'126C4635-4E82-45C4-ABF0-1E05D71C5BA0', N'AssetForth', N'/UniversalCMS/Content/AssetForth', N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'147430C6-719E-4C1E-83C3-0D038B5F2DC9', N'ArticleShortDescription', N'/UniversalCMS/Schema/Base/FirstSchema/ArticleShortDescription1', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'14C150E0-0840-4FF7-8F6F-B07935B60B95', N'FirstPage', N'/Main/Schema/ProjectSchema/SampleSite1/Page/FirstPage', N'74B2EF4B-C264-474F-ABA1-066F494264CD', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'16E7CF1F-B810-4F75-981E-F51E5BCDEFBB', N'ArticleCategory', N'', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', N'919175D2-D5D6-4BAB-B213-655E40E29FB0')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'17C81012-65CD-42B9-AA27-49ACABCCCD70', N'ControllerAction', N'', N'C59D44B9-EEE6-4D57-9769-CB53082E343D', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'18D607FD-938E-42FD-936A-8003A8F604D7', N'Languages', N'/Schema/Generic/Setting.Languages', N'DC30B818-0EF8-4BF9-84E2-812EC508A483', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'1EBD80F3-0504-46D4-A5BA-C00BEE6F178A', N'ArticleHeader', N'/UniversalCMS/Layout/Rendering/View/ArticleHeader', N'CC7CDD08-B9EC-463D-A11E-C1BA7BC447C7', N'0101616E-6830-4C65-95E1-1E72F2C6D222')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'1FD66191-4977-4931-B4BC-C9757F42A242', N'Project', N'/Schema/Generic/Media/Project', N'B8FFD700-4AA9-45A0-B4B3-A65ED6F993B9', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'213C86F9-E1EE-4C5D-BC3C-542B5A81F51C', N'ContentItem', N'', N'C59D44B9-EEE6-4D57-9769-CB53082E343D', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'21A5C66B-7FE6-4907-B009-C33F3A9AA068', N'IsArticleSearchable', N'', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', N'DC218D8D-1F5C-4C94-AF79-A90B75097EB1')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'21F5700A-23E1-4CF1-827F-DE5ECFAD4D1B', N'Korein', N'', N'18D607FD-938E-42FD-936A-8003A8F604D7', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'24EEE53B-5962-4442-ABC4-DB813DBE1B92', N'Home', N'/Main/Content/Home', N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'27BC346D-8A87-4366-886F-14C1DD5F484D', N'Layout', N'', N'1049D17E-6C1C-45A9-9B75-5F779B61023E', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'2AF482AE-C5D8-4D07-9F4A-010699A6BDC8', N'Footer', N'/UniversalCMS/Layout/PlaceholderTemplate/Footer', N'8CEE3BBE-195F-416A-A204-1B15BE16AD66', N'574F5063-25EE-4A17-BCFE-9D9DFFF4D17C')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'2B7B87F8-F8F9-4241-A248-31CC74AF0568', N'Japanese', N'', N'18D607FD-938E-42FD-936A-8003A8F604D7', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'2BAEBCD9-4B91-4139-8345-06CA3B63C5F2', N'Header', N'/UniversalCMS/Content/SharedData/Article/Header', N'53F5627D-6E7A-4C2F-BB70-2101D43B352D', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'2D64045C-E9B1-49E9-A27B-9C672F60AE0D', N'Hindi', N'', N'18D607FD-938E-42FD-936A-8003A8F604D7', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'2DAAE96B-2437-4FF8-9F0C-EB2ED14A14F5', N'ViewRender', N'/UniversalCMS/Schema/SystemSchema/ViewRender', N'5F24782D-19C9-4BFF-B90C-ABC4BE48AA69', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'2E2687A6-68D4-4980-9514-DA4A3173C16D', N'IsFooterAvailable', N'', N'CBF23F60-D5DF-461C-A589-011650C698C3', N'DC218D8D-1F5C-4C94-AF79-A90B75097EB1')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'2EB94A78-CC78-4C33-84EA-C2B583A9C8BD', N'PageTemplate', N'/Schema/Generic/PageTemplate', N'111035FA-612A-4EB5-9CBC-8DF91E9152A3', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'2F2C74B2-DB3B-44F8-9BF7-F9482A6038FF', N'SampleSite1', N'/Main/Schema/ProjectSchema/SampleSite1', N'B1D85537-FBC1-49B8-887F-61A7DD62F2C7', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'2F433119-3A7D-4CB3-A09D-443C74A653E0', N'ProductViewModel', N'/Schema/Generic/Model/HomeViewModel', N'3B6B4A0A-CE7A-4CFA-8B9D-47ED4DC89DC0', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'30A81E22-6712-4717-A3FF-1ADB7D7792F1', N'Title', N'/UniversalCMS/Schema/Base/FirstSchema/Title', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'318501E0-8E4B-4407-8C09-35DF00FC61DF', N'Title', N'/UniversalCMS/Schema/CommonSchema/Footer/Title1', N'CBF23F60-D5DF-461C-A589-011650C698C3', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'32D4E807-DD87-4019-93D5-9524DD4D4293', N'CommonSchema', N'/Main/Schema/CommonSchema', N'1049D17E-6C1C-45A9-9B75-5F779B61023E', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'3986136C-E953-42CA-8473-91315377946E', N'level8', N'', N'7F8141E6-3967-4B3A-BA11-154FD5C86B25', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'3A448922-1720-4101-AE3B-CCD87ADF7497', N'MasterRendering', N'', N'27BC346D-8A87-4366-886F-14C1DD5F484D', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'3B0DDBDC-D160-42DC-845A-045F26A2A494', N'Placeholder', N'/UniversalCMS/Schema/SystemSchema/Placeholder', N'5F24782D-19C9-4BFF-B90C-ABC4BE48AA69', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'3B6B4A0A-CE7A-4CFA-8B9D-47ED4DC89DC0', N'Model', N'/Schema/Generic/Model', N'111035FA-612A-4EB5-9CBC-8DF91E9152A3', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'3CECF310-6B73-4C48-89B0-3E6BF151A819', N'FirstSchema', N'', N'F93D6E88-5255-4F21-8317-4259D79E635E', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'3D9349BA-1971-4710-AE19-6B6FDB4FAE8C', N'PdfLink', N'', N'080F4A32-82F7-4AF6-B4E6-5847DC1EACD6', N'395A153E-1967-490C-B293-42824E754DAF')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'3DE3D088-C2CA-4B3C-99CD-612296509BE8', N'HomeViewModel', N'/Schema/Generic/Model/HomeViewModel', N'3B6B4A0A-CE7A-4CFA-8B9D-47ED4DC89DC0', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'4130852F-5489-414A-8F5C-ECCF42C39546', N'FooterImage', N'', N'CBF23F60-D5DF-461C-A589-011650C698C3', N'A9F7BBE1-2FEA-40D4-BC43-0A0C2E20C824')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'41B747BA-A195-4FEB-BF3D-2A448D3C650E', N'TestVivek', N'', N'EEC88B58-1FD0-4314-A3A0-39F3284230E6', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'4216979E-B7A1-4D04-8794-A553B7D7BFAF', N'ModifiedDate', N'', N'080F4A32-82F7-4AF6-B4E6-5847DC1EACD6', N'5CE9E74B-B79B-421C-A346-00DFA1410D76')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'469AB8F1-87E5-4EB0-A743-587259D44764', N'Arabic', N'', N'18D607FD-938E-42FD-936A-8003A8F604D7', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'485233F8-90C6-46B8-ADA0-CAC767E105D5', N'Danish', N'', N'18D607FD-938E-42FD-936A-8003A8F604D7', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'4BCC7DD0-034B-4594-8D92-97BFDB139FB4', N'ProductSite', N'/Main/Content/ArticleSecond', N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'4D021505-2909-4457-AC90-2C2F5E3B2084', N'LeftNavigation', N'/Main/Schema/ProjectSchema/SampleSite1/Base/LeftNavigation', N'6656B0C9-60C0-4F13-9C95-5868FCCE9DA5', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'4E281921-EC0B-4563-80D2-828C38FDF250', N'ContentBody', N'', N'32D4E807-DD87-4019-93D5-9524DD4D4293', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE', N'UniversalCMS', N'/Main', NULL, N'5BC9CA65-E5A3-454A-A803-9DF082F323BE')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'4FEDA711-509E-440E-AF6E-6D1DAD72A974', N'ArticleContent', N'/UniversalCMS/Layout/Rendering/Controller/ArticleContent', N'9BBCD847-8AF5-4333-8553-29DD646C4D00', N'8C9068B2-9562-4757-947F-C6DA3389D13F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'5049C391-3811-44CF-B537-9643E3AA38C3', N'ContentItem', N'', N'3A448922-1720-4101-AE3B-CCD87ADF7497', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'5071A124-E75A-4094-A90C-90EA75A9627C', N'Engllish', N'', N'18D607FD-938E-42FD-936A-8003A8F604D7', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'536D8A78-2313-4346-BA3B-E23FFCD73FB2', N'sdsadsa', N'', N'1049D17E-6C1C-45A9-9B75-5F779B61023E', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'53F5627D-6E7A-4C2F-BB70-2101D43B352D', N'Article', N'', N'E9049DDB-1EAE-4C20-9DEC-568F74C98C05', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'59878363-2EAC-4409-A440-DE7C9BC2B771', N'Model', N'', N'8DBAC909-209A-407C-AF24-3E688F698E10', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'5F24782D-19C9-4BFF-B90C-ABC4BE48AA69', N'SystemSchema', N'/Main/Schema/SystemSchema', N'1049D17E-6C1C-45A9-9B75-5F779B61023E', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'608AD90B-52F0-451A-8FE8-DB284ED0E3E4', N'BottomContent', N'/Main/Layout/ComponentTemplate/BottomContent', N'E17E4A01-ECCA-4B9F-886C-7BE198091843', N'0101616E-6830-4C65-95E1-1E72F2C6D222')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'63CAFB53-3D4F-473B-A66A-E03D5E718127', N'Description', N'/UniversalCMS/Schema/CommonSchema/ContentBody/Description1', N'4E281921-EC0B-4563-80D2-828C38FDF250', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'6656B0C9-60C0-4F13-9C95-5868FCCE9DA5', N'Base', N'/Main/Schema/ProjectSchema/SampleSite1/Base', N'2F2C74B2-DB3B-44F8-9BF7-F9482A6038FF', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'6E07FD18-F560-4579-A210-3E2065752AD5', N'ContentItem', N'/Main/Schema/SystemSchema/Item', N'5F24782D-19C9-4BFF-B90C-ABC4BE48AA69', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'6E9CCF49-FFF4-4912-AAE4-495F7629D542', N'FooterTitle', N'', N'080F4A32-82F7-4AF6-B4E6-5847DC1EACD6', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'700C1D4A-A73B-45AE-83BF-F3D3F3D60FFF', N'MasterLayout', N'/UniversalCMS/Schema/Layout/MasterRendering/MasterLayoutPath', N'3A448922-1720-4101-AE3B-CCD87ADF7497', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'710FBE40-8EBD-4FDE-BA99-282501FA809A', N'Footer', N'/Schema/MySite/Footer', N'E17E4A01-ECCA-4B9F-886C-7BE198091843', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'71C28F43-98C4-4369-88B9-DF519C5EBA6B', N'ViewRenderring', N'', N'E17E4A01-ECCA-4B9F-886C-7BE198091843', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'74826E3E-C2EA-45DC-A328-43F115F45161', N'Header', N'/Schema/MySite/Header', N'E17E4A01-ECCA-4B9F-886C-7BE198091843', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'74B2EF4B-C264-474F-ABA1-066F494264CD', N'Page', N'/Main/Schema/ProjectSchema/SampleSite1/Page', N'2F2C74B2-DB3B-44F8-9BF7-F9482A6038FF', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'76A29DE8-C46C-49DE-9362-A073D3FB8E35', N'Component', N'/Main/Schema/ProjectSchema/SampleSite1/Component', N'2F2C74B2-DB3B-44F8-9BF7-F9482A6038FF', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'772941E9-28CE-466F-9EAE-9F7959559025', N'ShortDescription', N'', N'A49C6831-B51F-46E8-86D6-74C399AFD1C5', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'7F8141E6-3967-4B3A-BA11-154FD5C86B25', N'level7', N'', N'B2B25063-93E5-4C71-AE44-FF2D365659A3', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'8144904A-FC80-49CE-AE62-CD89753D106D', N'ArticleSite', N'/UniversalCMS/Content/ArticleSite', N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'81C34F25-09AA-4338-BB5A-5EDA26FCDEA6', N'child333', N'/Main/Content/Home/Child111/child 22/child33', N'EEC88B58-1FD0-4314-A3A0-39F3284230E6', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'8439690B-69BA-44CB-8E16-BF8C9280FCA6', N'German', N'', N'18D607FD-938E-42FD-936A-8003A8F604D7', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'84F99E9C-5E63-43AB-9AD5-2E7565D93974', N'ArticleFooter', N'/UniversalCMS/Layout/Rendering/View/ArticleFooter', N'CC7CDD08-B9EC-463D-A11E-C1BA7BC447C7', N'0101616E-6830-4C65-95E1-1E72F2C6D222')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'85B01480-B8AC-4EB2-ABA1-A280E0A6FA04', N'Footer', N'/Main/Schema/ProjectSchema/SampleSite1/Base/Footer', N'6656B0C9-60C0-4F13-9C95-5868FCCE9DA5', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'878D9924-40CD-46FF-8D7F-7984CA72F705', N'IsSearchable', N'', N'080F4A32-82F7-4AF6-B4E6-5847DC1EACD6', N'DC218D8D-1F5C-4C94-AF79-A90B75097EB1')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'88FDCEF5-EAAB-4349-93BE-08DCC3E7765D', N'MiddleContent', N'/Schema/MySite/MiddleContent', N'E17E4A01-ECCA-4B9F-886C-7BE198091843', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'8CD2DECE-30E2-41D0-98B4-A001B6EEFE77', N'FooterDescription', N'', N'080F4A32-82F7-4AF6-B4E6-5847DC1EACD6', N'E19765AD-A559-40F0-837A-132841CAD972')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'8CEE3BBE-195F-416A-A204-1B15BE16AD66', N'PlaceholderTemplate', N'/Schema/Generic/ComponentTemplate', N'111035FA-612A-4EB5-9CBC-8DF91E9152A3', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'8DBAC909-209A-407C-AF24-3E688F698E10', N'ViewRendering', N'', N'27BC346D-8A87-4366-886F-14C1DD5F484D', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'8DD07CDC-590C-4408-B0D1-0CB195B1709C', N'ControllerRendering', N'', N'E17E4A01-ECCA-4B9F-886C-7BE198091843', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'9047F87A-5D9D-4A6C-A2A3-53477608CCFF', N'Disclamier', N'/UniversalCMS/Schema/CommonSchema/Header/Disclamier', N'A49C6831-B51F-46E8-86D6-74C399AFD1C5', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'98765071-870F-4D6E-9C2B-7B4289CFD876', N'Header', N'/UniversalCMS/Layout/PlaceholderTemplate/Header', N'8CEE3BBE-195F-416A-A204-1B15BE16AD66', N'574F5063-25EE-4A17-BCFE-9D9DFFF4D17C')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'98A3C620-9ABB-4F75-B942-4AB9F8C7F3A7', N'PageLayout', N'', N'5F24782D-19C9-4BFF-B90C-ABC4BE48AA69', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'9A0B3186-1E5F-47A8-9ED6-C7FB4346CB0F', N'System', N'/Schema/Generic/Media/System', N'B8FFD700-4AA9-45A0-B4B3-A65ED6F993B9', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'9BBCD847-8AF5-4333-8553-29DD646C4D00', N'Controller', N'', N'BDA620AB-DC7C-4D21-A5E3-2363C6451E3F', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'9D075E6C-3AA3-4E77-A306-54FE0B86CC12', N'ArticleDetailsLink', N'', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', N'395A153E-1967-490C-B293-42824E754DAF')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'9E5FBA45-31F2-4A4D-A82A-F6CAD18ABEB4', N'Workflow', N'', N'5F24782D-19C9-4BFF-B90C-ABC4BE48AA69', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'A148EC08-1715-475A-B720-7EDDF55DA327', N'Spanish', N'', N'18D607FD-938E-42FD-936A-8003A8F604D7', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'A23BE558-72E9-4326-B2C7-BC5C99F38B34', N'SocialMedia', N'/Schema/MySite/SocialMedia', N'E17E4A01-ECCA-4B9F-886C-7BE198091843', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'A49C6831-B51F-46E8-86D6-74C399AFD1C5', N'Header', N'/UniversalCMS/Schema/CommonSchema/Header', N'32D4E807-DD87-4019-93D5-9524DD4D4293', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'A52161CC-8F4B-488C-9647-D6D12B6F0270', N'Description', N'/UniversalCMS/Schema/CommonSchema/Header/Description', N'A49C6831-B51F-46E8-86D6-74C399AFD1C5', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'A5D9282C-9C20-46E3-BD72-11267ADD6E13', N'ArticlePublishDate', N'', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', N'5CE9E74B-B79B-421C-A346-00DFA1410D76')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'A6676449-07F1-4DEA-B456-6D4BE646E351', N'MainNagivation', N'/Schema/MySite/MainNagiation', N'E17E4A01-ECCA-4B9F-886C-7BE198091843', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'ABF56775-3E12-4FB6-9CBB-7B1412762745', N'Second Page', N'/Main/Schema/ProjectSchema/SampleSite1/Page/Second Page', N'74B2EF4B-C264-474F-ABA1-066F494264CD', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'ADCA78F3-1E1D-41CA-89A1-0020A4438158', N'Model', N'', N'3A448922-1720-4101-AE3B-CCD87ADF7497', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'ADF5E180-CAD4-46D8-AA37-C854319D59F0', N'CreatedDate', N'', N'080F4A32-82F7-4AF6-B4E6-5847DC1EACD6', N'5CE9E74B-B79B-421C-A346-00DFA1410D76')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'B072CF24-915A-47BA-9CF7-EF0BE5F8B9DE', N'ArticleImage', N'', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', N'A9F7BBE1-2FEA-40D4-BC43-0A0C2E20C824')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'B0A2F2B9-20E9-4BFF-8D6A-A050148C8DBD', N'Article Description1', N'/UniversalCMS/Schema/Base/FirstSchema/Article Description', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'B1AB8D60-844D-4706-872C-6A67627288B8', N'HeaderDescription', N'', N'080F4A32-82F7-4AF6-B4E6-5847DC1EACD6', N'E19765AD-A559-40F0-837A-132841CAD972')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'B1D85537-FBC1-49B8-887F-61A7DD62F2C7', N'ProjectSchema', N'/Main/Schema/ProjectSchema', N'1049D17E-6C1C-45A9-9B75-5F779B61023E', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'B2B25063-93E5-4C71-AE44-FF2D365659A3', N'level6', N'', N'E45F5366-523B-4C95-AB1E-342232FF8D9F', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'B2E50BE7-F7BE-4778-AB3A-5E52773571F2', N'Workflow', N'/Schema/Generic/Setting/Workflow', N'DC30B818-0EF8-4BF9-84E2-812EC508A483', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'B3244E5C-9307-43FE-A008-8B78420F2B4C', N'Chinese', N'', N'18D607FD-938E-42FD-936A-8003A8F604D7', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'B3DBD35E-10C2-4370-B2BC-F40AE781DC57', N'PlaceholderName', N'', N'3B0DDBDC-D160-42DC-845A-045F26A2A494', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'B8FFD700-4AA9-45A0-B4B3-A65ED6F993B9', N'Media', N'/Main/Media', N'4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'BCD3A6D9-B995-43B4-8E06-05C42441737D', N'Description', N'/UniversalCMS/Schema/CommonSchema/Footer/Description', N'CBF23F60-D5DF-461C-A589-011650C698C3', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'BD1A5331-37E8-416E-A429-113B3F72CB89', N'Placeholder', N'/Main/Schema/Layout/Placeholder', N'27BC346D-8A87-4366-886F-14C1DD5F484D', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'BDA620AB-DC7C-4D21-A5E3-2363C6451E3F', N'Rendering', N'', N'111035FA-612A-4EB5-9CBC-8DF91E9152A3', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'BDF7665E-E0AD-4F24-A139-392DE149E00D', N'ControllerName', N'', N'F3D00719-3736-4B63-83B6-5C9C865ECCBC', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'BFA8AC35-63C1-4FC1-8A3F-4A536E77B47D', N'BlogSite', N'/Main/Content/Article Third', N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'C0347514-A081-4D40-82B7-8A072118BD72', N'TypeOfArticle', N'', N'080F4A32-82F7-4AF6-B4E6-5847DC1EACD6', N'919175D2-D5D6-4BAB-B213-655E40E29FB0')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'C1E7E97D-45A1-491B-8F2F-2FE61CFF034C', N'HeaderTitle', N'', N'080F4A32-82F7-4AF6-B4E6-5847DC1EACD6', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'C20B4224-7927-4D46-A654-D152D4C140BA', N'ControllerName', N'', N'C59D44B9-EEE6-4D57-9769-CB53082E343D', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'C59D44B9-EEE6-4D57-9769-CB53082E343D', N'ControllerRendering', N'', N'27BC346D-8A87-4366-886F-14C1DD5F484D', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'C5F85B52-AC31-4358-9C0F-45C05BD14593', N'Child111', N'/Main/Content/Home/Child1', N'24EEE53B-5962-4442-ABC4-DB813DBE1B92', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'C67F03BF-2478-4F39-BD3E-5B880385BA8D', N'level4asdasdasdsadsaad', N'', N'0EEA7F48-DC8C-4F40-B69E-61DFFF9A9DA0', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'C69B3996-65BE-4BFE-B545-0A7E419B0749', N'System', N'/Schema/Generic/Setting/System', N'DC30B818-0EF8-4BF9-84E2-812EC508A483', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'CAFCCA7C-020C-456E-936B-8AE465DAD6CB', N'ControllerAction', N'', N'F3D00719-3736-4B63-83B6-5C9C865ECCBC', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'CBF23F60-D5DF-461C-A589-011650C698C3', N'Footer', N'/UniversalCMS/Schema/CommonSchema/Footer', N'32D4E807-DD87-4019-93D5-9524DD4D4293', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'CC621189-196D-4AA3-AE6A-2A215B93328C', N'Mexican', N'', N'18D607FD-938E-42FD-936A-8003A8F604D7', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'CC7CDD08-B9EC-463D-A11E-C1BA7BC447C7', N'View', N'', N'BDA620AB-DC7C-4D21-A5E3-2363C6451E3F', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'CF868344-9FD0-4D90-8A94-C0A487975D87', N'ViewRenderingPath', N'', N'8DBAC909-209A-407C-AF24-3E688F698E10', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC', N'Content', N'/Main/Content', N'4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'D3463F38-B85C-4DA7-8F1A-CDB771700172', N'Title', N'/UniversalCMS/Schema/CommonSchema/Header/Title', N'A49C6831-B51F-46E8-86D6-74C399AFD1C5', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'D45238F6-473B-4C54-AC4B-EC7DAD072A48', N'ContentBody', N'/UniversalCMS/Layout/PlaceholderTemplate/ContentBody', N'8CEE3BBE-195F-416A-A204-1B15BE16AD66', N'574F5063-25EE-4A17-BCFE-9D9DFFF4D17C')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'D6BD7046-94C9-4362-93C6-005025357EDD', N'ContentItem', N'', N'8DBAC909-209A-407C-AF24-3E688F698E10', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'D7C89C93-63D3-4078-A2A3-D5D5A3C91716', N'Title', N'', N'4E281921-EC0B-4563-80D2-828C38FDF250', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'DA45384F-07F1-4BC2-BE5B-73183577E83C', N'SampleSite1', N'/Schema/Generic/Schema/Project/SampleSite1', N'B1D85537-FBC1-49B8-887F-61A7DD62F2C7', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'DC30B818-0EF8-4BF9-84E2-812EC508A483', N'Setting', N'/Main/Setting', N'4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'DF6A2409-C2CF-4FA6-BF2F-B898D42DFA79', N'MasterLayout', N'', N'2EB94A78-CC78-4C33-84EA-C2B583A9C8BD', N'69596F18-F516-4367-8526-E555D066C65E')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'E17E4A01-ECCA-4B9F-886C-7BE198091843', N'Test', N'/Main/Layout/ComponentTemplate', N'111035FA-612A-4EB5-9CBC-8DF91E9152A3', N'0')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'E45F5366-523B-4C95-AB1E-342232FF8D9F', N'level5', N'', N'C67F03BF-2478-4F39-BD3E-5B880385BA8D', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'E71A8535-410B-4B3E-98A6-3879CEE9E248', N'ThirdPage', N'/Main/Schema/ProjectSchema/SampleSite1/Page/ThirdPage', N'74B2EF4B-C264-474F-ABA1-066F494264CD', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'E9049DDB-1EAE-4C20-9DEC-568F74C98C05', N'SharedData', N'', N'D1B2BE76-C76B-447A-A30A-DDDF4959A8FC', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'E9E34FBE-0F61-4B16-BA71-E938365FBA61', N'MasterArticleLayout', N'/UniversalCMS/Layout/PageTemplate/MasterArticleLayout', N'2EB94A78-CC78-4C33-84EA-C2B583A9C8BD', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'EB17A358-C1C5-4981-8E2D-DAF837FF819C', N'Footer', N'/UniversalCMS/Content/SharedData/Article/Footer', N'53F5627D-6E7A-4C2F-BB70-2101D43B352D', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'EB60F493-F53B-4388-B17E-B3D1A3A0456E', N'MasterProductLayout', N'/Main/Layout/PageTemplate/MasterProduct', N'2EB94A78-CC78-4C33-84EA-C2B583A9C8BD', N'0')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'EC2606D9-6D67-45BA-9B0A-EE5E9C76ED7D', N'AssetJune22nd', N'', N'24EEE53B-5962-4442-ABC4-DB813DBE1B92', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'ED971572-A6B3-4027-BEB2-86DB641AA267', N'Media', N'', N'5F24782D-19C9-4BFF-B90C-ABC4BE48AA69', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'EEC88B58-1FD0-4314-A3A0-39F3284230E6', N'child 22', N'', N'C5F85B52-AC31-4358-9C0F-45C05BD14593', N'0')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'EF9F4297-0129-407C-AF31-F6736C7F1C1B', N'ContentBody', N'/UniversalCMS/Content/SharedData/Article/ContentBody', N'53F5627D-6E7A-4C2F-BB70-2101D43B352D', N'5BC9CA65-E5A3-454A-A803-9DF082F323BE')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'EFF2AC28-9351-44D6-9D88-C7252D090D89', N'level1', N'', N'536D8A78-2313-4346-BA3B-E23FFCD73FB2', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'F23A917E-8D1C-467B-8419-06E8F48A6FCF', N'Header', N'/Main/Schema/ProjectSchema/SampleSite1/Base/Header', N'6656B0C9-60C0-4F13-9C95-5868FCCE9DA5', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'F3D00719-3736-4B63-83B6-5C9C865ECCBC', N'ControllerRender', N'/UniversalCMS/Schema/SystemSchema/ControllerRender', N'5F24782D-19C9-4BFF-B90C-ABC4BE48AA69', N'8C56BDB9-B8F3-4BD2-9B5D-F412FEAEFC69')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'F6CEFB03-0492-42CF-AD84-EEDA1CF29668', N'Common', N'/Schema/Generic/Media/Common', N'B8FFD700-4AA9-45A0-B4B3-A65ED6F993B9', NULL)
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'F935C03F-B4A7-46D2-84F6-627E1D8B64F1', N'SubHeading', N'', N'4E281921-EC0B-4563-80D2-828C38FDF250', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'F93D6E88-5255-4F21-8317-4259D79E635E', N'Base', N'', N'1049D17E-6C1C-45A9-9B75-5F779B61023E', N'B39AC555-FD24-4E60-911C-8504FB0721B3')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'FC5BFA3B-F1A4-4088-897E-75A8088DFE4F', N'ViewPath', N'', N'2DAAE96B-2437-4FF8-9F0C-EB2ED14A14F5', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'FEDA0E4E-3877-412F-ACCF-FC189050CE10', N'PlaceholderName', N'', N'BD1A5331-37E8-416E-A429-113B3F72CB89', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F')
GO
INSERT [dbo].[AssetSchema] ([ID], [SchemaName], [SchemaPath], [ParentID], [AssetTypeID]) VALUES (N'FFEA8C39-0272-4734-AEEF-251DF73CA36E', N'SubArticles', N'', N'3CECF310-6B73-4C48-89B0-3E6BF151A819', N'0E6A14C7-B8EB-4042-AC5A-450DCE5B3FFA')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'0183C8A4-A2A0-4F34-A180-C245C03771CA', N'710FBE40-8EBD-4FDE-BA99-282501FA809A', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', N'Test of Footer SingleText second', N'Title')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'0E656D8A-5A9B-4107-9526-9668A0BFCCA3', N'74826E3E-C2EA-45DC-A328-43F115F45161', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', N'Test of Header Rich text', N'Description')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'20994326-6A95-45A5-AEB4-D54D8C8DB451', N'080F4A32-82F7-4AF6-B4E6-5847DC1EACD6', N'E19765AD-A559-40F0-837A-132841CAD972', NULL, N'Description')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'2A0DFA1E-3E3A-459A-80A2-9183405352A1', N'4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE', N'0E6A14C7-B8EB-4042-AC5A-450DCE5B3FFA', NULL, N'safdsd')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'2F9A084B-3FFF-4762-9EB0-289F25378104', N'608AD90B-52F0-451A-8FE8-DB284ED0E3E4', N'E19765AD-A559-40F0-837A-132841CAD972', N'Test of BottomContent Multiline text', N'ShortDescription')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'3BF2DF90-7A21-4CFB-9498-25A6C6938BAF', N'E9E34FBE-0F61-4B16-BA71-E938365FBA61', N'E19765AD-A559-40F0-837A-132841CAD972', N'Test of FirstAssetPage Multiline text', N'ShortDescription')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'44D04728-BBA4-4CB0-96F3-646AB0E12040', N'080F4A32-82F7-4AF6-B4E6-5847DC1EACD6', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', NULL, N'TestField')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'48D07E3F-76C7-47AF-AAED-18A4209C7298', N'4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE', N'395A153E-1967-490C-B293-42824E754DAF', NULL, N'asdsada')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'4A435B8D-6AFF-4466-88EF-ABA5843718A0', N'4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', NULL, N'sadsadsa')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'54984EBE-96B6-4DD9-A1F0-9E88E0FD99A0', N'EB60F493-F53B-4388-B17E-B3D1A3A0456E', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', N'Test of SecondAssetPage Rich text', N'Description')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'5AE5077A-E774-44E1-AADB-30A5F5808752', N'A6676449-07F1-4DEA-B456-6D4BE646E351', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', N'Test of MainNagivation Rich text', N'Description')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'5D207C80-4BE9-4DF7-B625-EB2D11C807B0', N'E9E34FBE-0F61-4B16-BA71-E938365FBA61', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', N'Test of FirstAssetPage SingleText', N'Title')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'6B629834-B64E-409B-B2BB-47CF6696A2E0', N'710FBE40-8EBD-4FDE-BA99-282501FA809A', N'E19765AD-A559-40F0-837A-132841CAD972', N'Test of Footer Multiline text', N'ShortDescription')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'6F115B75-D644-4D32-8FE4-0FE15F75D56F', N'4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', NULL, N'asdsadsada')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'73F9AA69-8936-4E54-9570-213793F95FA8', N'710FBE40-8EBD-4FDE-BA99-282501FA809A', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', N'Test of Footer Rich text', N'Description')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'787DA844-82CB-4E24-8C62-091BF0850E01', N'080F4A32-82F7-4AF6-B4E6-5847DC1EACD6', N'0E6A14C7-B8EB-4042-AC5A-450DCE5B3FFA', NULL, N'field1')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'7A462513-99EA-401C-9B6C-8B96DB438F85', N'88FDCEF5-EAAB-4349-93BE-08DCC3E7765D', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', N'Test of MiddleContent SingleText', N'Title')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'995DFC49-ED50-4F29-8CCE-B54F4DE3C558', N'4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE', N'0E6A14C7-B8EB-4042-AC5A-450DCE5B3FFA', NULL, N'asdsa')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'9B13B112-BF3C-48F7-ADE6-156D60A4843B', N'E9E34FBE-0F61-4B16-BA71-E938365FBA61', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', N'Test of FirstAssetPage Rich text', N'Description')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'9F60BDB3-C19B-4ED8-9FBF-F7A0EF368A38', N'4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE', N'0E6A14C7-B8EB-4042-AC5A-450DCE5B3FFA', NULL, N'sadsda')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'A30118F5-AED2-4B7B-B08A-CFFE01E79C4D', N'A6676449-07F1-4DEA-B456-6D4BE646E351', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', N'Test of MainNagivation SingleText', N'Title')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'AB2F8F25-48E1-40D1-90EF-2F68181C0079', N'A23BE558-72E9-4326-B2C7-BC5C99F38B34', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', N'Test of SocialMedia Rich text', N'Description')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'ACD47516-C62A-4077-A7A9-6A4007D62613', N'080F4A32-82F7-4AF6-B4E6-5847DC1EACD6', N'0E6A14C7-B8EB-4042-AC5A-450DCE5B3FFA', NULL, N'Subtitle')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'B0C4C8C0-BEF4-4F76-BC73-3BB86A6BAB7A', N'A6676449-07F1-4DEA-B456-6D4BE646E351', N'E19765AD-A559-40F0-837A-132841CAD972', N'Test of MainNagivation Multiline text', N'ShortDescription')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'BEDF55FE-E9EC-4E76-A54B-20F9F602BA53', N'608AD90B-52F0-451A-8FE8-DB284ED0E3E4', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', N'Test of BottomContent Rich text', N'Description')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'C0E72003-050B-44F5-9B62-3537B17CECE8', N'74826E3E-C2EA-45DC-A328-43F115F45161', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', N'Test of Header SingleText', N'Title')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'C9E32878-573A-4E52-8E96-D38F4A94C8D1', N'EB60F493-F53B-4388-B17E-B3D1A3A0456E', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', N'Test of SecondAssetPage SingleText', N'Title')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'CEE2D611-98A4-41D5-B703-8BB0E5C6BFC9', N'A23BE558-72E9-4326-B2C7-BC5C99F38B34', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', N'Test of SocialMedia SingleText', N'Title')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'D0D543EC-8461-49A6-969F-262828C3CFA3', N'608AD90B-52F0-451A-8FE8-DB284ED0E3E4', N'1E0C6229-01D2-45E5-8A66-65F2964DDD8F', N'Test of BottomContent SingleText', N'Title')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'D3CF017A-7CEB-49F1-A1FE-CCFD649D6867', N'EB60F493-F53B-4388-B17E-B3D1A3A0456E', N'E19765AD-A559-40F0-837A-132841CAD972', N'Test of SecondAssetPage Multiline text', N'ShortDescription')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'DB8D776D-4849-4059-BCC9-8D3DC208AEB0', N'4FDB8DDB-C19C-4DCA-AD64-5C2A52F969DE', N'1', NULL, N'zcxcxz')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'E0C1468A-1B05-499A-BEEC-3D3088D9B33E', N'88FDCEF5-EAAB-4349-93BE-08DCC3E7765D', N'115A7A1E-D135-42E7-BAB2-7E400F4AF29E', N'Test of MiddleContent Rich text', N'Description')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'E21D68AF-80F6-450F-8CE7-280375AF8837', N'88FDCEF5-EAAB-4349-93BE-08DCC3E7765D', N'E19765AD-A559-40F0-837A-132841CAD972', N'Test of MiddleContent Multiline text', N'ShortDescription')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'EB166FAA-1831-4B0F-A899-19274769259E', N'74826E3E-C2EA-45DC-A328-43F115F45161', N'E19765AD-A559-40F0-837A-132841CAD972', N'Test of Header Multiline text', N'ShortDescription')
GO
INSERT [dbo].[AssetSchemaFields] ([ID], [SchemaID], [FieldTypeID], [FieldData], [FieldName]) VALUES (N'F54CDCB6-0566-43B9-96ED-51F530D348FB', N'A23BE558-72E9-4326-B2C7-BC5C99F38B34', N'E19765AD-A559-40F0-837A-132841CAD972', N'Test of SocialMedia Multiline text', N'ShortDescription')
GO
INSERT [dbo].[ComponentPresentation] ([ID], [AssetItemID], [ComponentPath], [LinkedAssetItem], [PlaceholderPath]) VALUES (N'0B621DE3-8200-46C7-B1AF-02FCD0BF98A1', N'982C5020-54F1-4DA3-84AD-74BE7BAEE4DF', N'/UniversalCMS/Layout/Rendering/Controller/ArticleContent', N'/UniversalCMS/Content/SharedData/Article/ContentBody', N'/UniversalCMS/Layout/PlaceholderTemplate/ContentBody')
GO
INSERT [dbo].[ComponentPresentation] ([ID], [AssetItemID], [ComponentPath], [LinkedAssetItem], [PlaceholderPath]) VALUES (N'303A5925-27F6-49EB-94FA-79A56FA49FA2', N'982C5020-54F1-4DA3-84AD-74BE7BAEE4DF', N'/UniversalCMS/Layout/Rendering/View/ArticleFooter', N'/UniversalCMS/Content/SharedData/Article/Footer', N'/UniversalCMS/Layout/PlaceholderTemplate/Footer')
GO
INSERT [dbo].[ComponentPresentation] ([ID], [AssetItemID], [ComponentPath], [LinkedAssetItem], [PlaceholderPath]) VALUES (N'42252649-A740-4788-A131-42091ABA80D6', N'982C5020-54F1-4DA3-84AD-74BE7BAEE4DF', N'/UniversalCMS/Layout/Rendering/View/ArticleHeader', N'/UniversalCMS/Content/SharedData/Article/Header', N'/UniversalCMS/Layout/PlaceholderTemplate/Header')
GO
INSERT [dbo].[ComponentPresentation] ([ID], [AssetItemID], [ComponentPath], [LinkedAssetItem], [PlaceholderPath]) VALUES (N'54C85BAA-CEF6-4D6B-A9AD-433958F10AED', N'A6E23920-EE29-4B81-9F9C-C9EBDAFC369A', N'qqq22', N'www22', N'eee22')
GO
INSERT [dbo].[ComponentPresentation] ([ID], [AssetItemID], [ComponentPath], [LinkedAssetItem], [PlaceholderPath]) VALUES (N'6F9506B6-9DC1-408B-8A8C-89689E259290', N'A6E23920-EE29-4B81-9F9C-C9EBDAFC369A', N'qqq11', N'www11', N'eee11')
GO
INSERT [dbo].[ComponentPresentation] ([ID], [AssetItemID], [ComponentPath], [LinkedAssetItem], [PlaceholderPath]) VALUES (N'7E4917EE-8EDA-4B17-B3F9-FEBC0ECD118B', N'B981B5A7-9FBC-4A58-A96C-7D458BBA3E39', N'cc1', N'con11', N'pp11')
GO
INSERT [dbo].[ComponentPresentation] ([ID], [AssetItemID], [ComponentPath], [LinkedAssetItem], [PlaceholderPath]) VALUES (N'E5E937EC-5CA8-4E5D-BF29-95EFFB921BF6', N'A6E23920-EE29-4B81-9F9C-C9EBDAFC369A', N'qqq', N'www', N'eee')
GO
INSERT [dbo].[PageContent] ([PageUrl], [PageContent], [PageUpdatedDate]) VALUES (N'http://localhost:5287/', N'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> - DynamicContentApp</title>
    <link rel="stylesheet" href="/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/site.css?v=pAGv4ietcJNk_EwsQZ5BN9-K4MuNYS2a9wl4Jw-q9D0" />
    <link rel="stylesheet" href="/DynamicContentApp.styles.css?v=EQgS2ivCCWcEp7Kkv8pj6U8Cdcr0UJ-avD__djcgHrc" />
</head>
<body>
    <div class="container">
        <main role="main" class="pb-3">

          
            
<div style="background-color:#871409;color:white">
    <h1 class="display-4">Header</h1>


<header>
    <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
        <div class="container-fluid">
            <a class="navbar-brand">DynamicContentAppHome</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            Vivek joshi
            <div class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/index?id=1">Home</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/ContactUs?id=1">Contact Us</a>
                    </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/AboutUs?id=1">About Us</a>
                        </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/index?id=2">Product</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/Privacy?id=1"> Privacy</a>
                    </li>
                       
                </ul>
            </div>
        </div>
    </nav>
</header>
</div>


        </main>
    </div>
   
    <div class="container">
        <main role="main" class="pb-3">
            


<div style="background-color:#E3D9D8;height:80vh;">
    <h1 class="display-4">Content Body </h1>

<p>Model value at contnet  level</p>
<p>BrowserUrl -- http://localhost:5287/</p>
<p>InternalUrl -- http://localhost:5287/Generic/Start</p>
</div>

        </main>
    </div>
    <div class="container">
        <main role="main" class="pb-3">
            

<div style="background-color:#871409;color:white">
    <h1 class="display-4">Footer</h1>
   

<footer class="border-top footer text-muted">
        <div class="container" style="color:white">
        &copy; 2026 - DynamicContentApp - <a>Privacy</a>
    </div>
</footer>

</div><h1>Privacy Policy</h1>

<p><h4>Product Privacy </h4></p>
browserurl


        </main>
    </div>
   
    <script src="/lib/jquery/dist/jquery.min.js"></script>
    <script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/site.js?v=hRQyftXiu1lLX2P9Ly9xa4gHJgLeR1uGN5qegUobtGo"></script>
</body>
</html>
', CAST(N'2026-05-29T14:14:09.293' AS DateTime))
GO
INSERT [dbo].[PageContent] ([PageUrl], [PageContent], [PageUpdatedDate]) VALUES (N'http://localhost:5287/product/index?id=2', N'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> - DynamicContentApp</title>
    <link rel="stylesheet" href="/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/site.css?v=pAGv4ietcJNk_EwsQZ5BN9-K4MuNYS2a9wl4Jw-q9D0" />
    <link rel="stylesheet" href="/DynamicContentApp.styles.css?v=EQgS2ivCCWcEp7Kkv8pj6U8Cdcr0UJ-avD__djcgHrc" />
</head>
<body>
    <div class="container">
        <main role="main" class="pb-3">
            <p> PROPERTY ALERT SERVICE - OWNER AND NAME MATCHING </p>
        </main>
    </div>
   
    <div class="container">
        <main role="main" class="pb-3">
            
<div style="background-color:#757387;color:white">
    <h1 class="display-4">Header</h1>


<header>
    <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
        <div class="container-fluid">
            <a class="navbar-brand">Product portal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/index?id=1">Home</a>
                    </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/Catalog?id=2">Catalog</a>
                        </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/order?id=2">Order</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/payment?id=2">Payment</a>
                    </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/Privacy?id=2">Privacy</a>
                        </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
</div>


        </main>
    </div>
   
    <div class="container">
        <main role="main" class="pb-3">
            


<div style="background-color:#C2BEE5;height:80vh;">
    <h1 class="display-4">Content Body </h1>

<p>Model value at contnet  level</p>
<p>BrowserUrl -- http://localhost:5287/product/index?id=2</p>
<p>InternalUrl -- http://localhost:5287/Generic/Start?id=2
    <p>
    Welcome to [Your House Show Name], a grassroots listening room right in the heart of White Plains. We strip away the barriers 
    of traditional venues to create an intimate, distraction-free space where local artists and music lovers can connect on a deeply personal level.
    </p>
</div>

        </main>
    </div>
    <div class="container">
        <main role="main" class="pb-3">
            

<div style="background-color:#757387;color:white">
    <h1 class="display-4">Footer</h1>
   

<footer class="border-top footer text-muted">
        <div class="container" style="color:white">
        &copy; 2026 - DynamicContentApp - <a>Privacy</a>
    </div>
</footer>
    <p>
        A product privacy policy is a legal document outlining exactly how your company collects, uses, stores, and protects customer data.
        It is required by law (such as GDPR and CCPA) and is strictly enforced by major app stores before publication.
        A compliant product privacy policy should include the following core sections:Data Collection: Specify exactly
        what information you gather (e.g., names, emails, device IDs, IP addresses, payment info) and how it is collected.
        Purpose of Use: Explain why you need this data—such as to deliver product features, process payments, or improve
        user experience.Data Sharing: Disclose whether personal data is shared with third parties (e.g., cloud hosting,
        analytics, payment processors).Cookies & Tracking: Detail the use of cookies, beacons, or other tracking technologies
        used in your product.User Rights & Choices: Explain how users can opt-out of data collection, request access to their
        data, or request deletion.Data Retention & Security: Outline how long you keep the information and the security measures
        used to protect it.Updates & Contact: Provide your company''s contact information and state how users will be notified
        if the policy changes.
    </p>

</div><h1>Privacy Policy</h1>

<p><h4>Product Privacy </h4></p>
browserurl


        </main>
    </div>
   
    <script src="/lib/jquery/dist/jquery.min.js"></script>
    <script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/site.js?v=hRQyftXiu1lLX2P9Ly9xa4gHJgLeR1uGN5qegUobtGo"></script>
</body>
</html>
', CAST(N'2026-05-29T14:14:12.540' AS DateTime))
GO
INSERT [dbo].[PageContent] ([PageUrl], [PageContent], [PageUpdatedDate]) VALUES (N'http://localhost:5287/product/Categlog?id=2', N'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> - DynamicContentApp</title>
    <link rel="stylesheet" href="/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/site.css?v=pAGv4ietcJNk_EwsQZ5BN9-K4MuNYS2a9wl4Jw-q9D0" />
    <link rel="stylesheet" href="/DynamicContentApp.styles.css?v=EQgS2ivCCWcEp7Kkv8pj6U8Cdcr0UJ-avD__djcgHrc" />
</head>
<body>
    <div class="container">
        <main role="main" class="pb-3">
            <p> PROPERTY ALERT SERVICE - OWNER AND NAME MATCHING </p>
        </main>
    </div>
   
    <div class="container">
        <main role="main" class="pb-3">
            
<div style="background-color:#757387;color:white">
    <h1 class="display-4">Header</h1>


<header>
    <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
        <div class="container-fluid">
            <a class="navbar-brand">Product portal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/index?id=1">Home</a>
                    </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/Categlog?id=2">Categlog</a>
                        </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/order?id=2">Order</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/payment?id=2">Payment</a>
                    </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/Privacy?id=2">Categlog</a>
                        </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
</div>


        </main>
    </div>
   
    <div class="container">
        <main role="main" class="pb-3">
            


<div style="background-color:#C2BEE5;height:80vh;">
    <h1 class="display-4">Content Body </h1>

<p>Model value at contnet  level</p>
<p>BrowserUrl -- http://localhost:5287/product/Categlog?id=2</p>
<p>InternalUrl -- http://localhost:5287/Generic/Start?id=2
    <p>
    Welcome to [Your House Show Name], a grassroots listening room right in the heart of White Plains. We strip away the barriers 
    of traditional venues to create an intimate, distraction-free space where local artists and music lovers can connect on a deeply personal level.
    </p>
</div>

        </main>
    </div>
    <div class="container">
        <main role="main" class="pb-3">
            

<div style="background-color:#757387;color:white">
    <h1 class="display-4">Footer</h1>
   

<footer class="border-top footer text-muted">
        <div class="container" style="color:white">
        &copy; 2026 - DynamicContentApp - <a>Privacy</a>
    </div>
</footer>
    <p>
        A product privacy policy is a legal document outlining exactly how your company collects, uses, stores, and protects customer data.
        It is required by law (such as GDPR and CCPA) and is strictly enforced by major app stores before publication.
        A compliant product privacy policy should include the following core sections:Data Collection: Specify exactly
        what information you gather (e.g., names, emails, device IDs, IP addresses, payment info) and how it is collected.
        Purpose of Use: Explain why you need this data—such as to deliver product features, process payments, or improve
        user experience.Data Sharing: Disclose whether personal data is shared with third parties (e.g., cloud hosting,
        analytics, payment processors).Cookies & Tracking: Detail the use of cookies, beacons, or other tracking technologies
        used in your product.User Rights & Choices: Explain how users can opt-out of data collection, request access to their
        data, or request deletion.Data Retention & Security: Outline how long you keep the information and the security measures
        used to protect it.Updates & Contact: Provide your company''s contact information and state how users will be notified
        if the policy changes.
    </p>

</div><h1>Privacy Policy</h1>

<p>Use this page to detail your site'' product policy.</p>
browserurl


        </main>
    </div>
   
    <script src="/lib/jquery/dist/jquery.min.js"></script>
    <script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/site.js?v=hRQyftXiu1lLX2P9Ly9xa4gHJgLeR1uGN5qegUobtGo"></script>
</body>
</html>
', CAST(N'2026-05-29T13:04:29.167' AS DateTime))
GO
INSERT [dbo].[PageContent] ([PageUrl], [PageContent], [PageUpdatedDate]) VALUES (N'http://localhost:5287/product/order?id=2', N'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> - DynamicContentApp</title>
    <link rel="stylesheet" href="/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/site.css?v=pAGv4ietcJNk_EwsQZ5BN9-K4MuNYS2a9wl4Jw-q9D0" />
    <link rel="stylesheet" href="/DynamicContentApp.styles.css?v=EQgS2ivCCWcEp7Kkv8pj6U8Cdcr0UJ-avD__djcgHrc" />
</head>
<body>
    <div class="container">
        <main role="main" class="pb-3">
            <p> PROPERTY ALERT SERVICE - OWNER AND NAME MATCHING </p>
        </main>
    </div>
   
    <div class="container">
        <main role="main" class="pb-3">
            
<div style="background-color:#757387;color:white">
    <h1 class="display-4">Header</h1>


<header>
    <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
        <div class="container-fluid">
            <a class="navbar-brand">Product portal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/index?id=1">Home</a>
                    </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/Catalog?id=2">Catalog</a>
                        </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/order?id=2">Order</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/payment?id=2">Payment</a>
                    </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/Privacy?id=2">Privacy</a>
                        </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
</div>


        </main>
    </div>
   
    <div class="container">
        <main role="main" class="pb-3">
            


<div style="background-color:#C2BEE5;height:80vh;">
    <h1 class="display-4">Content Body </h1>

<p>Model value at contnet  level</p>
<p>BrowserUrl -- http://localhost:5287/product/order?id=2</p>
<p>InternalUrl -- http://localhost:5287/Generic/Start?id=2
    <p>
    Welcome to [Your House Show Name], a grassroots listening room right in the heart of White Plains. We strip away the barriers 
    of traditional venues to create an intimate, distraction-free space where local artists and music lovers can connect on a deeply personal level.
    </p>
</div>

        </main>
    </div>
    <div class="container">
        <main role="main" class="pb-3">
            

<div style="background-color:#757387;color:white">
    <h1 class="display-4">Footer</h1>
   

<footer class="border-top footer text-muted">
        <div class="container" style="color:white">
        &copy; 2026 - DynamicContentApp - <a>Privacy</a>
    </div>
</footer>
    <p>
        A product privacy policy is a legal document outlining exactly how your company collects, uses, stores, and protects customer data.
        It is required by law (such as GDPR and CCPA) and is strictly enforced by major app stores before publication.
        A compliant product privacy policy should include the following core sections:Data Collection: Specify exactly
        what information you gather (e.g., names, emails, device IDs, IP addresses, payment info) and how it is collected.
        Purpose of Use: Explain why you need this data—such as to deliver product features, process payments, or improve
        user experience.Data Sharing: Disclose whether personal data is shared with third parties (e.g., cloud hosting,
        analytics, payment processors).Cookies & Tracking: Detail the use of cookies, beacons, or other tracking technologies
        used in your product.User Rights & Choices: Explain how users can opt-out of data collection, request access to their
        data, or request deletion.Data Retention & Security: Outline how long you keep the information and the security measures
        used to protect it.Updates & Contact: Provide your company''s contact information and state how users will be notified
        if the policy changes.
    </p>

</div><h1>Privacy Policy</h1>

<p><h4>Product Privacy </h4></p>
browserurl


        </main>
    </div>
   
    <script src="/lib/jquery/dist/jquery.min.js"></script>
    <script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/site.js?v=hRQyftXiu1lLX2P9Ly9xa4gHJgLeR1uGN5qegUobtGo"></script>
</body>
</html>
', CAST(N'2026-05-29T14:14:14.777' AS DateTime))
GO
INSERT [dbo].[PageContent] ([PageUrl], [PageContent], [PageUpdatedDate]) VALUES (N'http://localhost:5287/product/payment?id=2', N'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> - DynamicContentApp</title>
    <link rel="stylesheet" href="/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/site.css?v=pAGv4ietcJNk_EwsQZ5BN9-K4MuNYS2a9wl4Jw-q9D0" />
    <link rel="stylesheet" href="/DynamicContentApp.styles.css?v=EQgS2ivCCWcEp7Kkv8pj6U8Cdcr0UJ-avD__djcgHrc" />
</head>
<body>
    <div class="container">
        <main role="main" class="pb-3">
            <p> PROPERTY ALERT SERVICE - OWNER AND NAME MATCHING </p>
        </main>
    </div>
   
    <div class="container">
        <main role="main" class="pb-3">
            
<div style="background-color:#757387;color:white">
    <h1 class="display-4">Header</h1>


<header>
    <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
        <div class="container-fluid">
            <a class="navbar-brand">Product portal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/index?id=1">Home</a>
                    </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/Catalog?id=2">Catalog</a>
                        </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/order?id=2">Order</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/payment?id=2">Payment</a>
                    </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/Privacy?id=2">Privacy</a>
                        </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
</div>


        </main>
    </div>
   
    <div class="container">
        <main role="main" class="pb-3">
            


<div style="background-color:#C2BEE5;height:80vh;">
    <h1 class="display-4">Content Body </h1>

<p>Model value at contnet  level</p>
<p>BrowserUrl -- http://localhost:5287/product/payment?id=2</p>
<p>InternalUrl -- http://localhost:5287/Generic/Start?id=2
    <p>
    Welcome to [Your House Show Name], a grassroots listening room right in the heart of White Plains. We strip away the barriers 
    of traditional venues to create an intimate, distraction-free space where local artists and music lovers can connect on a deeply personal level.
    </p>
</div>

        </main>
    </div>
    <div class="container">
        <main role="main" class="pb-3">
            

<div style="background-color:#757387;color:white">
    <h1 class="display-4">Footer</h1>
   

<footer class="border-top footer text-muted">
        <div class="container" style="color:white">
        &copy; 2026 - DynamicContentApp - <a>Privacy</a>
    </div>
</footer>
    <p>
        A product privacy policy is a legal document outlining exactly how your company collects, uses, stores, and protects customer data.
        It is required by law (such as GDPR and CCPA) and is strictly enforced by major app stores before publication.
        A compliant product privacy policy should include the following core sections:Data Collection: Specify exactly
        what information you gather (e.g., names, emails, device IDs, IP addresses, payment info) and how it is collected.
        Purpose of Use: Explain why you need this data—such as to deliver product features, process payments, or improve
        user experience.Data Sharing: Disclose whether personal data is shared with third parties (e.g., cloud hosting,
        analytics, payment processors).Cookies & Tracking: Detail the use of cookies, beacons, or other tracking technologies
        used in your product.User Rights & Choices: Explain how users can opt-out of data collection, request access to their
        data, or request deletion.Data Retention & Security: Outline how long you keep the information and the security measures
        used to protect it.Updates & Contact: Provide your company''s contact information and state how users will be notified
        if the policy changes.
    </p>

</div><h1>Privacy Policy</h1>

<p><h4>Product Privacy </h4></p>
browserurl


        </main>
    </div>
   
    <script src="/lib/jquery/dist/jquery.min.js"></script>
    <script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/site.js?v=hRQyftXiu1lLX2P9Ly9xa4gHJgLeR1uGN5qegUobtGo"></script>
</body>
</html>
', CAST(N'2026-05-29T14:14:14.320' AS DateTime))
GO
INSERT [dbo].[PageContent] ([PageUrl], [PageContent], [PageUpdatedDate]) VALUES (N'http://localhost:5287/product/Privacy?id=2', N'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> - DynamicContentApp</title>
    <link rel="stylesheet" href="/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/site.css?v=pAGv4ietcJNk_EwsQZ5BN9-K4MuNYS2a9wl4Jw-q9D0" />
    <link rel="stylesheet" href="/DynamicContentApp.styles.css?v=EQgS2ivCCWcEp7Kkv8pj6U8Cdcr0UJ-avD__djcgHrc" />
</head>
<body>
    <div class="container">
        <main role="main" class="pb-3">
            <p> PROPERTY ALERT SERVICE - OWNER AND NAME MATCHING </p>
        </main>
    </div>
   
    <div class="container">
        <main role="main" class="pb-3">
            
<div style="background-color:#757387;color:white">
    <h1 class="display-4">Header</h1>


<header>
    <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
        <div class="container-fluid">
            <a class="navbar-brand">Product portal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/index?id=1">Home</a>
                    </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/Catalog?id=2">Catalog</a>
                        </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/order?id=2">Order</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/payment?id=2">Payment</a>
                    </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/Privacy?id=2">Privacy</a>
                        </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
</div>


        </main>
    </div>
   
    <div class="container">
        <main role="main" class="pb-3">
            


<div style="background-color:#C2BEE5;height:80vh;">
    <h1 class="display-4">Content Body </h1>

<p>Model value at contnet  level</p>
<p>BrowserUrl -- http://localhost:5287/product/Privacy?id=2</p>
<p>InternalUrl -- http://localhost:5287/Generic/Start?id=2
    <p>
    Welcome to [Your House Show Name], a grassroots listening room right in the heart of White Plains. We strip away the barriers 
    of traditional venues to create an intimate, distraction-free space where local artists and music lovers can connect on a deeply personal level.
    </p>
</div>

        </main>
    </div>
    <div class="container">
        <main role="main" class="pb-3">
            

<div style="background-color:#757387;color:white">
    <h1 class="display-4">Footer</h1>
   

<footer class="border-top footer text-muted">
        <div class="container" style="color:white">
        &copy; 2026 - DynamicContentApp - <a>Privacy</a>
    </div>
</footer>
    <p>
        A product privacy policy is a legal document outlining exactly how your company collects, uses, stores, and protects customer data.
        It is required by law (such as GDPR and CCPA) and is strictly enforced by major app stores before publication.
        A compliant product privacy policy should include the following core sections:Data Collection: Specify exactly
        what information you gather (e.g., names, emails, device IDs, IP addresses, payment info) and how it is collected.
        Purpose of Use: Explain why you need this data—such as to deliver product features, process payments, or improve
        user experience.Data Sharing: Disclose whether personal data is shared with third parties (e.g., cloud hosting,
        analytics, payment processors).Cookies & Tracking: Detail the use of cookies, beacons, or other tracking technologies
        used in your product.User Rights & Choices: Explain how users can opt-out of data collection, request access to their
        data, or request deletion.Data Retention & Security: Outline how long you keep the information and the security measures
        used to protect it.Updates & Contact: Provide your company''s contact information and state how users will be notified
        if the policy changes.
    </p>

</div><h1>Privacy Policy</h1>

<p><h4>Product Privacy </h4></p>
browserurl


        </main>
    </div>
   
    <script src="/lib/jquery/dist/jquery.min.js"></script>
    <script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/site.js?v=hRQyftXiu1lLX2P9Ly9xa4gHJgLeR1uGN5qegUobtGo"></script>
</body>
</html>
', CAST(N'2026-05-29T14:14:13.790' AS DateTime))
GO
INSERT [dbo].[PageContent] ([PageUrl], [PageContent], [PageUpdatedDate]) VALUES (N'http://localhost:5287/home/ContactUs?id=1', N'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> - DynamicContentApp</title>
    <link rel="stylesheet" href="/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/site.css?v=pAGv4ietcJNk_EwsQZ5BN9-K4MuNYS2a9wl4Jw-q9D0" />
    <link rel="stylesheet" href="/DynamicContentApp.styles.css?v=EQgS2ivCCWcEp7Kkv8pj6U8Cdcr0UJ-avD__djcgHrc" />
</head>
<body>
    <div class="container">
        <main role="main" class="pb-3">

          
            
<div style="background-color:#871409;color:white">
    <h1 class="display-4">Header</h1>


<header>
    <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
        <div class="container-fluid">
            <a class="navbar-brand">DynamicContentAppHome</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            Vivek joshi
            <div class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/index?id=1">Home</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/ContactUs?id=1">Contact Us</a>
                    </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/AboutUs?id=1">About Us</a>
                        </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/index?id=2">Product</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/Privacy?id=1"> Privacy</a>
                    </li>
                       
                </ul>
            </div>
        </div>
    </nav>
</header>
</div>


        </main>
    </div>
   
    <div class="container">
        <main role="main" class="pb-3">
            


<div style="background-color:#E3D9D8;height:80vh;">
    <h1 class="display-4">Content Body </h1>

<p>Model value at contnet  level</p>
<p>BrowserUrl -- http://localhost:5287/home/ContactUs?id=1</p>
<p>InternalUrl -- http://localhost:5287/Generic/Start?id=1</p>
</div>

        </main>
    </div>
    <div class="container">
        <main role="main" class="pb-3">
            

<div style="background-color:#871409;color:white">
    <h1 class="display-4">Footer</h1>
   

<footer class="border-top footer text-muted">
        <div class="container" style="color:white">
        &copy; 2026 - DynamicContentApp - <a>Privacy</a>
    </div>
</footer>

</div><h1>Privacy Policy</h1>

<p><h4>Product Privacy </h4></p>
browserurl


        </main>
    </div>
   
    <script src="/lib/jquery/dist/jquery.min.js"></script>
    <script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/site.js?v=hRQyftXiu1lLX2P9Ly9xa4gHJgLeR1uGN5qegUobtGo"></script>
</body>
</html>
', CAST(N'2026-05-29T14:14:19.187' AS DateTime))
GO
INSERT [dbo].[PageContent] ([PageUrl], [PageContent], [PageUpdatedDate]) VALUES (N'http://localhost:5287/home/index?id=1', N'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> - DynamicContentApp</title>
    <link rel="stylesheet" href="/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/site.css?v=pAGv4ietcJNk_EwsQZ5BN9-K4MuNYS2a9wl4Jw-q9D0" />
    <link rel="stylesheet" href="/DynamicContentApp.styles.css?v=EQgS2ivCCWcEp7Kkv8pj6U8Cdcr0UJ-avD__djcgHrc" />
</head>
<body>
    <div class="container">
        <main role="main" class="pb-3">

          
            
<div style="background-color:#871409;color:white">
    <h1 class="display-4">Header</h1>


<header>
    <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
        <div class="container-fluid">
            <a class="navbar-brand">DynamicContentAppHome</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            Vivek joshi
            <div class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/index?id=1">Home</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/ContactUs?id=1">Contact Us</a>
                    </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/AboutUs?id=1">About Us</a>
                        </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/index?id=2">Product</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/Privacy?id=1"> Privacy</a>
                    </li>
                       
                </ul>
            </div>
        </div>
    </nav>
</header>
</div>


        </main>
    </div>
   
    <div class="container">
        <main role="main" class="pb-3">
            


<div style="background-color:#E3D9D8;height:80vh;">
    <h1 class="display-4">Content Body </h1>

<p>Model value at contnet  level</p>
<p>BrowserUrl -- http://localhost:5287/home/index?id=1</p>
<p>InternalUrl -- http://localhost:5287/Generic/Start?id=1</p>
</div>

        </main>
    </div>
    <div class="container">
        <main role="main" class="pb-3">
            

<div style="background-color:#871409;color:white">
    <h1 class="display-4">Footer</h1>
   

<footer class="border-top footer text-muted">
        <div class="container" style="color:white">
        &copy; 2026 - DynamicContentApp - <a>Privacy</a>
    </div>
</footer>

</div><h1>Privacy Policy</h1>

<p><h4>Product Privacy </h4></p>
browserurl


        </main>
    </div>
   
    <script src="/lib/jquery/dist/jquery.min.js"></script>
    <script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/site.js?v=hRQyftXiu1lLX2P9Ly9xa4gHJgLeR1uGN5qegUobtGo"></script>
</body>
</html>
', CAST(N'2026-05-29T14:14:19.563' AS DateTime))
GO
INSERT [dbo].[PageContent] ([PageUrl], [PageContent], [PageUpdatedDate]) VALUES (N'http://localhost:5287/home/AboutUs?id=1', N'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> - DynamicContentApp</title>
    <link rel="stylesheet" href="/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/site.css?v=pAGv4ietcJNk_EwsQZ5BN9-K4MuNYS2a9wl4Jw-q9D0" />
    <link rel="stylesheet" href="/DynamicContentApp.styles.css?v=EQgS2ivCCWcEp7Kkv8pj6U8Cdcr0UJ-avD__djcgHrc" />
</head>
<body>
    <div class="container">
        <main role="main" class="pb-3">

          
            
<div style="background-color:#871409;color:white">
    <h1 class="display-4">Header</h1>


<header>
    <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
        <div class="container-fluid">
            <a class="navbar-brand">DynamicContentAppHome</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            Vivek joshi
            <div class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/index?id=1">Home</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/ContactUs?id=1">Contact Us</a>
                    </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/AboutUs?id=1">About Us</a>
                        </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/index?id=2">Product</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/Privacy?id=1"> Privacy</a>
                    </li>
                       
                </ul>
            </div>
        </div>
    </nav>
</header>
</div>


        </main>
    </div>
   
    <div class="container">
        <main role="main" class="pb-3">
            


<div style="background-color:#E3D9D8;height:80vh;">
    <h1 class="display-4">Content Body </h1>

<p>Model value at contnet  level</p>
<p>BrowserUrl -- http://localhost:5287/home/AboutUs?id=1</p>
<p>InternalUrl -- http://localhost:5287/Generic/Start?id=1</p>
</div>

        </main>
    </div>
    <div class="container">
        <main role="main" class="pb-3">
            

<div style="background-color:#871409;color:white">
    <h1 class="display-4">Footer</h1>
   

<footer class="border-top footer text-muted">
        <div class="container" style="color:white">
        &copy; 2026 - DynamicContentApp - <a>Privacy</a>
    </div>
</footer>

</div><h1>Privacy Policy</h1>

<p><h4>Product Privacy </h4></p>
browserurl


        </main>
    </div>
   
    <script src="/lib/jquery/dist/jquery.min.js"></script>
    <script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/site.js?v=hRQyftXiu1lLX2P9Ly9xa4gHJgLeR1uGN5qegUobtGo"></script>
</body>
</html>
', CAST(N'2026-05-29T14:14:17.327' AS DateTime))
GO
INSERT [dbo].[PageContent] ([PageUrl], [PageContent], [PageUpdatedDate]) VALUES (N'http://localhost:5287/home/Privacy?id=1', N'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> - DynamicContentApp</title>
    <link rel="stylesheet" href="/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/site.css?v=pAGv4ietcJNk_EwsQZ5BN9-K4MuNYS2a9wl4Jw-q9D0" />
    <link rel="stylesheet" href="/DynamicContentApp.styles.css?v=EQgS2ivCCWcEp7Kkv8pj6U8Cdcr0UJ-avD__djcgHrc" />
</head>
<body>
    <div class="container">
        <main role="main" class="pb-3">

          
            
<div style="background-color:#871409;color:white">
    <h1 class="display-4">Header</h1>


<header>
    <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
        <div class="container-fluid">
            <a class="navbar-brand">DynamicContentAppHome</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            Vivek joshi
            <div class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/index?id=1">Home</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/ContactUs?id=1">Contact Us</a>
                    </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/AboutUs?id=1">About Us</a>
                        </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/product/index?id=2">Product</a>
                    </li>
                    <li class="nav-item">
                            <a class="nav-link text-dark" href="/home/Privacy?id=1"> Privacy</a>
                    </li>
                       
                </ul>
            </div>
        </div>
    </nav>
</header>
</div>


        </main>
    </div>
   
    <div class="container">
        <main role="main" class="pb-3">
            


<div style="background-color:#E3D9D8;height:80vh;">
    <h1 class="display-4">Content Body </h1>

<p>Model value at contnet  level</p>
<p>BrowserUrl -- http://localhost:5287/home/Privacy?id=1</p>
<p>InternalUrl -- http://localhost:5287/Generic/Start?id=1</p>
</div>

        </main>
    </div>
    <div class="container">
        <main role="main" class="pb-3">
            

<div style="background-color:#871409;color:white">
    <h1 class="display-4">Footer</h1>
   

<footer class="border-top footer text-muted">
        <div class="container" style="color:white">
        &copy; 2026 - DynamicContentApp - <a>Privacy</a>
    </div>
</footer>

</div><h1>Privacy Policy</h1>

<p><h4>Product Privacy </h4></p>
browserurl


        </main>
    </div>
   
    <script src="/lib/jquery/dist/jquery.min.js"></script>
    <script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/site.js?v=hRQyftXiu1lLX2P9Ly9xa4gHJgLeR1uGN5qegUobtGo"></script>
</body>
</html>
', CAST(N'2026-05-29T14:14:18.140' AS DateTime))
GO
INSERT [dbo].[PageContent] ([PageUrl], [PageContent], [PageUpdatedDate]) VALUES (N'http://localhost:5287//UniversalCMS/Content/ArticleSite', N'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title> - DynamicContentApp</title>
    <link rel="stylesheet" href="/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/css/site.css?v=pAGv4ietcJNk_EwsQZ5BN9-K4MuNYS2a9wl4Jw-q9D0" />
    <link rel="stylesheet" href="/DynamicContentApp.styles.css?v=EQgS2ivCCWcEp7Kkv8pj6U8Cdcr0UJ-avD__djcgHrc" />
</head>
<body>
    <div class="container">
        <main role="main" class="pb-3">
            <h2>Dynamically model AssetFields  Title - CMS ARTICLE FIRST111111</h2>
            <h2>Dynamically model AssetFields ArticleShortDescription - CMS Article short description - To update content of site page...1111111</h2>
          
            
<div style="background-color:#871409;color:white">
    <h1 class="display-4">Article Header</h1>

    <h2>Dynamically model AssetFields  Title - It is related to view header details of article </h2>
    <h2>Dynamically model AssetFields ArticleShortDescription - </h2>

</div>


        </main>
    </div>
   
    <div class="container">
        <main role="main" class="pb-3">
            
<div style="background-color:#871409;color:white">
    <h1 class="display-4">Article Content</h1>

    <p>ReWriteUrl -- rewriteurl1</p>
    <p>ReWriteUrl -- browserurl1</p>
</div>


        </main>
    </div>
    <div class="container">
        <main role="main" class="pb-3">
            
<div style="background-color:#871409;color:white">
    <h1 class="display-4">Article Footer</h1>

</div>
<h2>Dynamically model AssetFields  Title - It is related to main content of footer like privacy , copy right details</h2>
<h2>Dynamically model AssetFields ArticleShortDescription - Title of article footer</h2>



        </main>
    </div>
   
    <script src="/lib/jquery/dist/jquery.min.js"></script>
    <script src="/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/js/site.js?v=hRQyftXiu1lLX2P9Ly9xa4gHJgLeR1uGN5qegUobtGo"></script>
</body>
</html>
', CAST(N'2026-07-09T15:47:23.023' AS DateTime))
GO
ALTER TABLE [dbo].[AssetFieldsType] ADD  CONSTRAINT [DF_AssetFields_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[AssetItem] ADD  CONSTRAINT [DF_AssetItem_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[AssetItem] ADD  CONSTRAINT [DF_AssetItem_SchemaID]  DEFAULT (newid()) FOR [SchemaID]
GO
ALTER TABLE [dbo].[AssetItemFields] ADD  CONSTRAINT [DF_AssetItemFields_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[AssetItemFields] ADD  CONSTRAINT [DF_AssetItemFields_AssetItemID]  DEFAULT (newid()) FOR [AssetItemID]
GO
ALTER TABLE [dbo].[AssetItemLayout] ADD  CONSTRAINT [DF_AssetItemLayout_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[AssetSchema] ADD  CONSTRAINT [DF_AssetSchema_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[AssetSchemaFields] ADD  CONSTRAINT [DF_AssetSchemaFields_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[ComponentPresentation] ADD  CONSTRAINT [DF_AssetItemComponents_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[PagePresentation] ADD  CONSTRAINT [DF_PagePresentation_ID]  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[AssetItemFields]  WITH CHECK ADD  CONSTRAINT [FK_AssetItemFields_AssetItem] FOREIGN KEY([AssetItemID])
REFERENCES [dbo].[AssetItem] ([ID])
GO
ALTER TABLE [dbo].[AssetItemFields] CHECK CONSTRAINT [FK_AssetItemFields_AssetItem]
GO
ALTER TABLE [dbo].[AssetItemFields]  WITH CHECK ADD  CONSTRAINT [FK_AssetItemFields_AssetItemFields] FOREIGN KEY([ID])
REFERENCES [dbo].[AssetItemFields] ([ID])
GO
ALTER TABLE [dbo].[AssetItemFields] CHECK CONSTRAINT [FK_AssetItemFields_AssetItemFields]
GO
ALTER TABLE [dbo].[AssetSchema]  WITH CHECK ADD  CONSTRAINT [FK_AssetSchema_AssetSchema] FOREIGN KEY([ID])
REFERENCES [dbo].[AssetSchema] ([ID])
GO
ALTER TABLE [dbo].[AssetSchema] CHECK CONSTRAINT [FK_AssetSchema_AssetSchema]
GO
ALTER TABLE [dbo].[AssetSchema]  WITH CHECK ADD  CONSTRAINT [FK_AssetSchema_AssetSchema1] FOREIGN KEY([ParentID])
REFERENCES [dbo].[AssetSchema] ([ID])
GO
ALTER TABLE [dbo].[AssetSchema] CHECK CONSTRAINT [FK_AssetSchema_AssetSchema1]
GO
ALTER TABLE [dbo].[AssetSchemaFields]  WITH CHECK ADD  CONSTRAINT [FK_AssetSchemaFields_SchemaID_AssetSchema_ID] FOREIGN KEY([SchemaID])
REFERENCES [dbo].[AssetSchema] ([ID])
GO
ALTER TABLE [dbo].[AssetSchemaFields] CHECK CONSTRAINT [FK_AssetSchemaFields_SchemaID_AssetSchema_ID]
GO
ALTER TABLE [dbo].[ComponentPresentation]  WITH CHECK ADD  CONSTRAINT [FK_ComponentPresentation_AssetItem] FOREIGN KEY([AssetItemID])
REFERENCES [dbo].[AssetItem] ([ID])
GO
ALTER TABLE [dbo].[ComponentPresentation] CHECK CONSTRAINT [FK_ComponentPresentation_AssetItem]
GO
