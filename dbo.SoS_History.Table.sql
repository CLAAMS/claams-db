USE [claams]
GO
/****** Object:  Table [dbo].[SoS_History]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SoS_History](
	[sosID] [int] NOT NULL,
	[sosHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[claID] [nchar](8) NOT NULL,
	[arID] [nchar](8) NOT NULL,
	[AssignmentPeriod] [varchar](max) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DateModified] [datetime] NOT NULL,
	[DateDue] [date] NOT NULL,
	[Status] [varchar](max) NOT NULL,
	[ImageFileName] [varchar](max) NULL,
	[recordModified] [datetime] NOT NULL,
	[recordCreated] [datetime] NOT NULL,
	[editorID] [nchar](8) NULL,
 CONSTRAINT [PK_SoS_History] PRIMARY KEY CLUSTERED 
(
	[sosHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[SoS_History]  WITH CHECK ADD  CONSTRAINT [FK_SoS_History_SoS] FOREIGN KEY([sosID])
REFERENCES [dbo].[SoS] ([sosID])
GO
ALTER TABLE [dbo].[SoS_History] CHECK CONSTRAINT [FK_SoS_History_SoS]
GO
