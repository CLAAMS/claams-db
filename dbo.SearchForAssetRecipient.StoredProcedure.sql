USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[SearchForAssetRecipient]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchForAssetRecipient]
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
	SELECT arID,Title,FirstName,LastName,EmailAddress,Location,Division,PrimaryDeptAffiliation,SecondaryDeptAffiliation,PhoneNumber,recordCreated,recordModified 
	FROM Asset_Recipient 
	WHERE 
	Title LIKE '%' + @Title + '%'
	AND  FirstName LIKE '%' +@FirstName +'%'  
	AND  LastName LIKE '%' + @LastName + '%' 
	AND  EmailAddress LIKE '%' + @EmailAddress+ '%' 
	AND  Location LIKE '%' + @Location + '%' 
	AND  Division LIKE '%' + @Division + '%' 
	AND  PrimaryDeptAffiliation Like '%' + @PrimaryDeptAffiliation + '%' 
	AND   SecondaryDeptAffiliation Like '%' +@SecondaryDeptAffiliation + '%' 
	AND   PhoneNumber Like '%' + @PhoneNumber + '%'
GO
