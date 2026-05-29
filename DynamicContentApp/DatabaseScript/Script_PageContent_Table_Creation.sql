USE [TestPFP]
GO

/****** Object:  Table [dbo].[PageContent]    Script Date: 5/29/2026 2:20:43 PM ******/
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


