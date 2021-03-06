USE [claams]
GO
/****** Object:  Table [dbo].[Asset]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Asset](
	[assetID] [int] IDENTITY(1,1) NOT NULL,
	[CLATag] [varchar](max) NOT NULL,
	[Make] [varchar](max) NULL,
	[Model] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[SerialNumber] [varchar](max) NULL,
	[Status] [varchar](max) NULL,
	[Notes] [varchar](max) NULL,
	[recordCreated] [datetime] NOT NULL,
	[recordModified] [datetime] NOT NULL,
	[sosID] [int] NULL,
	[editorID] [nchar](8) NULL,
 CONSTRAINT [PK_Asset] PRIMARY KEY CLUSTERED 
(
	[assetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_Asset] FOREIGN KEY([assetID])
REFERENCES [dbo].[Asset] ([assetID])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_Asset]
GO
ALTER TABLE [dbo].[Asset]  WITH CHECK ADD  CONSTRAINT [FK_Asset_SoS] FOREIGN KEY([sosID])
REFERENCES [dbo].[SoS] ([sosID])
GO
ALTER TABLE [dbo].[Asset] CHECK CONSTRAINT [FK_Asset_SoS]
GO
