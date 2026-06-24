USE [TestPFP]
GO
/****** Object:  Table [dbo].[AssetFieldsType]    Script Date: 6/24/2026 2:54:04 PM ******/
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
/****** Object:  Table [dbo].[AssetItem]    Script Date: 6/24/2026 2:54:04 PM ******/
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
/****** Object:  Table [dbo].[AssetItemFields]    Script Date: 6/24/2026 2:54:04 PM ******/
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
/****** Object:  Table [dbo].[AssetItemLayout]    Script Date: 6/24/2026 2:54:04 PM ******/
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
/****** Object:  Table [dbo].[AssetSchema]    Script Date: 6/24/2026 2:54:04 PM ******/
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
/****** Object:  Table [dbo].[AssetSchemaFields]    Script Date: 6/24/2026 2:54:04 PM ******/
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
/****** Object:  Table [dbo].[ComponentPresentation]    Script Date: 6/24/2026 2:54:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponentPresentation](
	[ID] [varchar](100) NOT NULL,
	[ComponentPath] [varchar](500) NULL,
	[ComponenetName] [varchar](500) NULL,
	[ViewRenderingPath] [varchar](100) NULL,
	[ControllerName] [varchar](100) NULL,
	[ControllerAction] [varchar](100) NULL,
	[IsViewRender] [bit] NULL,
	[isControllerRender] [bit] NULL,
 CONSTRAINT [PK_AssetItemComponents] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageContent]    Script Date: 6/24/2026 2:54:04 PM ******/
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
/****** Object:  Table [dbo].[PagePresentation]    Script Date: 6/24/2026 2:54:04 PM ******/
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
/****** Object:  Table [dbo].[PlaceholderPresentation]    Script Date: 6/24/2026 2:54:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaceholderPresentation](
	[ID] [varchar](100) NOT NULL,
	[PlaceholderName] [varchar](100) NULL,
	[PlaceholderPath] [varchar](100) NULL,
 CONSTRAINT [PK_PlaceholderPresentation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER TABLE [dbo].[PlaceholderPresentation] ADD  CONSTRAINT [DF_PlaceholderPresentation_ID]  DEFAULT (newid()) FOR [ID]
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
ALTER TABLE [dbo].[AssetItemLayout]  WITH CHECK ADD  CONSTRAINT [FK_AssetItemLayout_AssetItem] FOREIGN KEY([MasterLayoutAssetItemID])
REFERENCES [dbo].[AssetItem] ([ID])
GO
ALTER TABLE [dbo].[AssetItemLayout] CHECK CONSTRAINT [FK_AssetItemLayout_AssetItem]
GO
ALTER TABLE [dbo].[AssetItemLayout]  WITH CHECK ADD  CONSTRAINT [FK_AssetItemLayout_AssetItemLayout] FOREIGN KEY([AssetItemID])
REFERENCES [dbo].[AssetItem] ([ID])
GO
ALTER TABLE [dbo].[AssetItemLayout] CHECK CONSTRAINT [FK_AssetItemLayout_AssetItemLayout]
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
ALTER TABLE [dbo].[PagePresentation]  WITH CHECK ADD  CONSTRAINT [FK_PagePresentation_AssetItem] FOREIGN KEY([AssetItemID])
REFERENCES [dbo].[AssetItem] ([ID])
GO
ALTER TABLE [dbo].[PagePresentation] CHECK CONSTRAINT [FK_PagePresentation_AssetItem]
GO
ALTER TABLE [dbo].[PagePresentation]  WITH CHECK ADD  CONSTRAINT [FK_PagePresentation_AssetItem1] FOREIGN KEY([ComponentID])
REFERENCES [dbo].[ComponentPresentation] ([ID])
GO
ALTER TABLE [dbo].[PagePresentation] CHECK CONSTRAINT [FK_PagePresentation_AssetItem1]
GO
ALTER TABLE [dbo].[PagePresentation]  WITH CHECK ADD  CONSTRAINT [FK_PagePresentation_AssetItem2] FOREIGN KEY([ComponentAssetID])
REFERENCES [dbo].[AssetItem] ([ID])
GO
ALTER TABLE [dbo].[PagePresentation] CHECK CONSTRAINT [FK_PagePresentation_AssetItem2]
GO
ALTER TABLE [dbo].[PagePresentation]  WITH CHECK ADD  CONSTRAINT [FK_PagePresentation_PlaceholderPresentation] FOREIGN KEY([PlaceholderID])
REFERENCES [dbo].[PlaceholderPresentation] ([ID])
GO
ALTER TABLE [dbo].[PagePresentation] CHECK CONSTRAINT [FK_PagePresentation_PlaceholderPresentation]
GO
