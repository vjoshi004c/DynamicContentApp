USE [TestDCA_V2]
GO

/****** Object:  Table [dbo].[PublishQueue]    Script Date: 9/18/2026 2:00:45 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PublishQueue](
	[ID] [varchar](100) NULL,
	[PublishAssetID] [varchar](100) NULL,
	[PublishAssetPath] [varchar](max) NULL,
	[PublishDate] [datetime] NULL,
	[PublishAssetPageID] [varchar](100) NULL,
	[PublishAssetPagePath] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[PublishQueue] ADD  CONSTRAINT [DF_PublishQueue_ID]  DEFAULT (newid()) FOR [ID]
GO


