USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[CreateAssetRecipient]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateAssetRecipient]
	
	@Title varchar(MAX),
	@FirstName varchar(MAX),
	@LastName varchar(MAX),
	@EmailAddress varchar(MAX),
	@Location varchar(MAX),
	@Division varchar(MAX),
	@PrimaryDeptAffiliation varchar(MAX),
	@SecondaryDeptAffiliation varchar(MAX),
	@PhoneNumber varchar(MAX),
	@recordCreated varchar(MAX),
	@recordModified varchar(MAX)
AS
	INSERT INTO dbo.Asset_Recipient
	(
	  
	 Title,
	 FirstName,
	 LastName,
	 EmailAddress,
	 Location,
	 Division,
	 PrimaryDeptAffiliation,
	 SecondaryDeptAffiliation,
	 PhoneNumber,
	 recordCreated,
	 recordModified
	 )
	 VALUES
	 (
	  
	   @Title,
	   @FirstName,
	   @LastName,
	   @EmailAddress,
	   @Location,
	   @Division,
	   @PrimaryDeptAffiliation,
	   @SecondaryDeptAffiliation,
	   @PhoneNumber,
	   @recordCreated,
	   @recordModified
	   )
GO
