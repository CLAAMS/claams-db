USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[ModifyAssetRecipient]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModifyAssetRecipient]
	@arID int,
	@Title varchar(MAX),
	@FirstName varchar(MAX),
	@LastName varchar(MAX),
	@EmailAddress varchar(MAX),
	@Location varchar(MAX),
	@Division varchar(MAX),
	@PrimaryDeptAffiliation varchar(MAX),
	@SecondaryDeptAffiliation varchar(MAX),
	@PhoneNumber varchar(MAX),
	@recordModified varchar(MAX)
AS
	Update Asset_Recipient Set Title=@Title, FirstName=@FirstName,LastName=@LastName,EmailAddress=@EmailAddress,Location=@Location,Division=@Division,PrimaryDeptAffiliation=@PrimaryDeptAffiliation, SecondaryDeptAffiliation=@SecondaryDeptAffiliation,PhoneNumber=@PhoneNumber,recordModified=GETDATE()
	Where arID=@arID
GO
