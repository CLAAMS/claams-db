USE [claams]
GO
/****** Object:  Table [dbo].[CLA_IT_Member]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CLA_IT_Member](
	[claID] [nchar](8) NOT NULL,
	[FirstName] [varchar](max) NOT NULL,
	[LastName] [varchar](max) NOT NULL,
	[OfficeLocation] [varchar](max) NOT NULL,
	[UserStatus] [varchar](max) NOT NULL,
	[EmailAddress] [varchar](max) NOT NULL,
	[recordCreated] [datetime] NOT NULL,
	[recordModified] [datetime] NOT NULL,
 CONSTRAINT [PK_CLA_IT_Member] PRIMARY KEY CLUSTERED 
(
	[claID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
