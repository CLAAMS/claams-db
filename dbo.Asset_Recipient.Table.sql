USE [claams]
GO
/****** Object:  Table [dbo].[Asset_Recipient]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Asset_Recipient](
	[arID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](max) NOT NULL,
	[FirstName] [varchar](max) NOT NULL,
	[LastName] [varchar](max) NOT NULL,
	[EmailAddress] [varchar](max) NOT NULL,
	[Location] [varchar](max) NOT NULL,
	[Division] [varchar](max) NOT NULL,
	[PrimaryDeptAffiliation] [varchar](max) NOT NULL,
	[SecondaryDeptAffiliation] [varchar](max) NOT NULL,
	[PhoneNumber] [varchar](max) NOT NULL,
	[recordCreated] [varchar](max) NOT NULL,
	[recordModified] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Asset_Recipient] PRIMARY KEY CLUSTERED 
(
	[arID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
