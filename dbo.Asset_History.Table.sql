USE [claams]
GO
/****** Object:  Table [dbo].[Asset_History]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Asset_History](
	[assetID] [int] NOT NULL,
	[CLATag] [varchar](max) NOT NULL,
	[Make] [varchar](max) NULL,
	[Model] [varchar](max) NULL,
	[Description] [varchar](max) NOT NULL,
	[SerialNumber] [varchar](max) NULL,
	[Status] [varchar](max) NOT NULL,
	[Notes] [varchar](max) NULL,
	[recordCreated] [datetime] NOT NULL,
	[recordModified] [datetime] NOT NULL,
	[assetHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[ChangeTimeStamp] [datetime] NOT NULL,
	[sosID] [int] NULL,
	[editorID] [nchar](8) NULL,
 CONSTRAINT [PK_Asset_History] PRIMARY KEY CLUSTERED 
(
	[assetHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Asset_History]  WITH CHECK ADD  CONSTRAINT [FK_Asset_History_Asset] FOREIGN KEY([assetID])
REFERENCES [dbo].[Asset] ([assetID])
GO
ALTER TABLE [dbo].[Asset_History] CHECK CONSTRAINT [FK_Asset_History_Asset]
GO
