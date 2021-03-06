USE [claams]
GO
/****** Object:  Table [dbo].[Asset_Template]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Asset_Template](
	[assetTemplateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Make] [varchar](max) NULL,
	[Model] [varchar](max) NULL,
	[Description] [varchar](max) NOT NULL,
	[recordModified] [datetime] NOT NULL,
	[recordCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Asset_Template] PRIMARY KEY CLUSTERED 
(
	[assetTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
