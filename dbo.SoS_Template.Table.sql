USE [claams]
GO
/****** Object:  Table [dbo].[SoS_Template]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SoS_Template](
	[SoSCopy] [varchar](max) NOT NULL,
	[recordCreated] [datetime] NOT NULL,
	[recordModified] [datetime] NOT NULL,
	[SoSTemplateID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_SoS_Template] PRIMARY KEY CLUSTERED 
(
	[SoSTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
