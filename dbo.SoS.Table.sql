USE [claams]
GO
/****** Object:  Table [dbo].[SoS]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SoS](
	[sosID] [int] IDENTITY(1,1) NOT NULL,
	[claID] [nchar](8) NOT NULL,
	[arID] [int] NOT NULL,
	[AssingmentPeriod] [varchar](max) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDue] [datetime] NOT NULL,
	[Status] [varchar](max) NOT NULL,
	[ImageFileName] [varchar](max) NULL,
	[recordModified] [datetime] NOT NULL,
	[recordCreated] [datetime] NOT NULL,
	[editorID] [nchar](8) NULL,
 CONSTRAINT [PK_SoS] PRIMARY KEY CLUSTERED 
(
	[sosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[SoS]  WITH CHECK ADD  CONSTRAINT [FK_SoS_Asset_Recipient] FOREIGN KEY([arID])
REFERENCES [dbo].[Asset_Recipient] ([arID])
GO
ALTER TABLE [dbo].[SoS] CHECK CONSTRAINT [FK_SoS_Asset_Recipient]
GO
ALTER TABLE [dbo].[SoS]  WITH CHECK ADD  CONSTRAINT [FK_SoS_CLA_IT_Member] FOREIGN KEY([claID])
REFERENCES [dbo].[CLA_IT_Member] ([claID])
GO
ALTER TABLE [dbo].[SoS] CHECK CONSTRAINT [FK_SoS_CLA_IT_Member]
GO
