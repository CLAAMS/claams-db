USE [master]
GO
/****** Object:  Database [claams]    Script Date: 4/2/2015 8:56:28 AM ******/
CREATE DATABASE [claams] ON  PRIMARY 
( NAME = N'claams', FILENAME = N'T:\Microsoft SQL Server\MSSQL11.CLAAMS\MSSQL\DATA\claams.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'claams_log', FILENAME = N'T:\Microsoft SQL Server\MSSQL11.CLAAMS\MSSQL\DATA\claams_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [claams].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [claams] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [claams] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [claams] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [claams] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [claams] SET ARITHABORT OFF 
GO
ALTER DATABASE [claams] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [claams] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [claams] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [claams] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [claams] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [claams] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [claams] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [claams] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [claams] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [claams] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [claams] SET  DISABLE_BROKER 
GO
ALTER DATABASE [claams] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [claams] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [claams] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [claams] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [claams] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [claams] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [claams] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [claams] SET RECOVERY FULL 
GO
ALTER DATABASE [claams] SET  MULTI_USER 
GO
ALTER DATABASE [claams] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [claams] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'claams', N'ON'
GO
USE [claams]
GO
/****** Object:  User [claams]    Script Date: 4/2/2015 8:56:28 AM ******/
CREATE USER [claams] FOR LOGIN [claams] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'claams'
GO
sys.sp_addrolemember @rolename = N'db_securityadmin', @membername = N'claams'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'claams'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'claams'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'claams'
GO
/****** Object:  StoredProcedure [dbo].[AddDepartment]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddDepartment]
	
	@Name VarChar(MAX),
	@recordCreated datetime,
	@recordModified datetime

AS
    INSERT into Department
     (
	
	 Name,
	 recordCreated,
	 recordModified
	 )
	 VALUES
	 (
	
	 @Name,
	 @recordCreated,
	 @recordModified
	 )
GO
/****** Object:  StoredProcedure [dbo].[ArchiveSOS]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ArchiveSOS]
	@sosID int,
	@EditorId VARCHAR(MAX)
	
AS
	Update Asset
    Set sosID=0,
	editorID=@editorID,
	Status = 'Out of Service'
	Where sosID=@sosID
GO
/****** Object:  StoredProcedure [dbo].[AssetFromTemplate]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AssetFromTemplate]
	@Description varchar(MAX)
AS
	SELECT * FROM Asset_Template WHERE Description = @Description
GO
/****** Object:  StoredProcedure [dbo].[CreateAsset]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateAsset]
	@CLATag varchar(MAX),
	@Make varchar(MAX),
	@Model varchar(MAX),
	@Description varchar(MAX),
	@SerialNumber varchar(MAX),
	@Status varchar(MAX),
	@Notes varchar(MAX),
	@recordCreated datetime,
	@recordModified datetime,
	@editorID nchar(8)
AS
	INSERT INTO Asset (CLATag, Make, Model, Description, SerialNumber, Status, Notes, recordCreated, recordModified,editorID) 
	VALUES (@CLATag, @Make, @Model, @Description, @SerialNumber, @Status, @Notes, @recordCreated, @recordModified,@editorID)
GO
/****** Object:  StoredProcedure [dbo].[CreateAssetRecipient]    Script Date: 4/2/2015 8:56:28 AM ******/
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
/****** Object:  StoredProcedure [dbo].[CreateSignOutSheet]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateSignOutSheet]
	@assetID int,
	@claID nchar(8),
	@arID int,
	@assignmentPeriod int,
	@dateCreated datetime,
	@dateModified datetime,
	@dateDue datetime,
	@status varchar(MAX),
	@imageFileName varchar(MAX),
	@recordModified datetime,
	@recordCreated datetime,
	@editorID nchar(8)
AS
	Insert into SoS
	(
	 claID,
	 arID,
	 AssingmentPeriod,
	 DateCreated,
	 DateModified,
	 DateDue,
	 Status,
	 ImageFileName,
	 recordCreated,
	 recordModified,
	 editorID
	 )
	 Values
	 (
	 @claID,
	 @arID,
	 @assignmentPeriod,
	 @dateCreated,
	 @dateModified,
	 @dateDue,
	 @status,
	 @imageFileName,
	 @recordModified,
	 @recordCreated,
	 @editorID
	 )
	 Select @@IDENTITY As [@@Identity]
GO
/****** Object:  StoredProcedure [dbo].[createTemplate]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createTemplate]
	@name varchar(MAX),
	@make varchar(MAX),
	@model varchar(MAX),
	@description varchar(MAX)
AS
	INSERT INTO Asset_Template (Name, Make, Model, Description, recordModified, recordCreated)
	VALUES (@name, @make, @model, @description, GETDATE(), GETDATE())
RETURN SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[createUser]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createUser]
	@accessNetId varchar(8),
	@firstName varchar(max),
	@lastName varchar(max),
	@office varchar(max),
	@status varchar(10),
	@email varchar(max)
AS
	INSERT INTO CLA_IT_Member
	VALUES (@accessNetId,
			@firstName,
			@lastName,
			@office,
			@status,
			@email,
			GETDATE(),
			GETDATE()
			)
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[delAssetTemplate]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[delAssetTemplate]
	@assetTemplateID int = 0
AS
	DELETE FROM Asset_Template WHERE assetTemplateID = @assetTemplateID;
RETURN @@ROWCOUNT
GO
/****** Object:  StoredProcedure [dbo].[DeleteAssetAndSetStatus]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAssetAndSetStatus]
	@assetID int
AS
	UPDATE Asset
	SET Status = 'Out of Service', recordModified = GETDATE()
	WHERE assetID = @assetID
GO
/****** Object:  StoredProcedure [dbo].[DeleteAssetRecipient]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAssetRecipient]
@arID int
AS
	Delete From Asset_Recipient Where arID=@arID
GO
/****** Object:  StoredProcedure [dbo].[DeleteDepartment]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteDepartment]
	@departmentId int
	
AS
	Delete  From Department WHERE DepartmentId=@departmentId
GO
/****** Object:  StoredProcedure [dbo].[DeleteSOS]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteSOS]
	@sosID int
	
AS
	Update Asset
    Set sosID=0,
	Status= 'Out of Service'
	Where sosID=@sosID
GO
/****** Object:  StoredProcedure [dbo].[GetAssetRecipientID]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAssetRecipientID]
	@index int

AS
	SELECT arID From Asset_Recipient where arID=@index
GO
/****** Object:  StoredProcedure [dbo].[getAssetsForSos]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAssetsForSos]
	@sosID int
AS
	select *, (Make + ' ' + Model) as name from Asset where sosID = @sosID
GO
/****** Object:  StoredProcedure [dbo].[GetDepartments]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDepartments]
	
AS
	SELECT * From Department
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[getLastSosHistoryIdBySos]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getLastSosHistoryIdBySos]
	@sosid int
AS
SELECT TOP 1 sosHistoryID from SoS_History where sosID = @sosid order by sosHistoryID desc
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[GetLocationForSelectedRecord]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLocationForSelectedRecord]
	@arID int
	
AS
	SELECT * From Asset_Recipient where arID=@arID
GO
/****** Object:  StoredProcedure [dbo].[getNamesForSoS]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getNamesForSoS]
	@sosID int
AS
	select
		SoS.claID as AssignerID,
		(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as AssignerName,
		SoS.arID as RecipientID,
		(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as RecipientName
	from SoS
	inner join CLA_IT_Member on CLA_IT_Member.claID=SoS.claID
	inner join Asset_Recipient on Asset_Recipient.arID=SoS.arID
	where sosID=@sosID
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[getSosById]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getSosById]
	@sosID int
AS
	select * from SoS where sosID = @sosID
GO
/****** Object:  StoredProcedure [dbo].[getSosHistory]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getSosHistory]
	@sosID int
AS
	select * from SoS_History where sosID = @sosID;
GO
/****** Object:  StoredProcedure [dbo].[getSosHistoryById]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getSosHistoryById]
	@sosHistoryID int
AS
	select * from SoS_History where sosHistoryID = @sosHistoryID;
GO
/****** Object:  StoredProcedure [dbo].[ModifyAsset]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModifyAsset]
	@assetID int,
	@CLATag varchar(MAX),
	@Make varchar(MAX),
	@Model varchar(MAX),
	@Description varchar(MAX),
	@SerialNumber varchar(MAX),
	@Status varchar(MAX),
	@Notes varchar(MAX),
	@recordModified datetime,
	@sosID int,
	@editorID nchar(8)
AS

IF @sosID = 0
	BEGIN
		Update Asset Set CLATag=@CLATag, Make=@Make, Model=@Model, Description=@Description, SerialNumber=@SerialNumber, Status=@Status, Notes=@Notes, recordModified = GETDATE(),sosID=null,editorID=@editorID
		Where assetID = @assetID
	END
ELSE
	BEGIN
		Update Asset Set CLATag=@CLATag, Make=@Make, Model=@Model, Description=@Description, SerialNumber=@SerialNumber, Status=@Status, Notes=@Notes, recordModified = GETDATE(),sosID=@sosID,editorID=@editorID
		Where assetID = @assetID
	END
GO
/****** Object:  StoredProcedure [dbo].[ModifyAssetRecipient]    Script Date: 4/2/2015 8:56:28 AM ******/
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
/****** Object:  StoredProcedure [dbo].[ModifyDepartment]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModifyDepartment]
	@departmentId int,
	@Name varchar(MAX)
	
AS
	Update Department
	Set Name=@Name WHERE DepartmentId=@departmentId
GO
/****** Object:  StoredProcedure [dbo].[ModifySOS]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModifySOS]
	@sosID int,
	@assetID int,
	@claID nchar(8),
	@arID int,
	@assignmentPeriod varchar(MAX),
	@dateCreated datetime,
	@dateModified datetime,
	@dateDue datetime,
	@imageFileName varchar(MAX),
	@recordModified datetime,
	@editorID nchar(8)
AS
	UPDATE SoS Set claID=@claID, arID=@arID, AssingmentPeriod=@assignmentPeriod, DateCreated=@dateCreated, DateModified=@dateModified, DateDue=@dateDue, ImageFileName=@imageFileName, recordModified=GETDate(),editorID=@editorID
	WHERE sosID = @sosID
GO
/****** Object:  StoredProcedure [dbo].[Procedure]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Procedure]
	@param1 int = 0,
	@param2 int
AS
	SELECT @param1, @param2
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[SearchForAssetRecipient]    Script Date: 4/2/2015 8:56:28 AM ******/
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
/****** Object:  StoredProcedure [dbo].[SearchForAssets]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchForAssets]
	@CLATag varchar(MAX),
	@Make varchar(MAX),
	@Model varchar(MAX),
	@Status varchar(MAX),
	@SerialNumber varchar(MAX),
	@Description varchar(MAX),
	@Notes varchar(MAX)
AS
	SELECT * 
	FROM Asset 
	WHERE sosID is NULL
	AND CLATag like '%' + @CLATag + '%'
	AND Make like '%' + @Make + '%'
	AND Model like '%' + @Model + '%'
	AND Status like '%' + @Status + '%'
	AND SerialNumber like '%' + @SerialNumber + '%'
	AND Description like '%' + @Description + '%'
	AND Notes like '%' + @Notes + '%'
GO
/****** Object:  StoredProcedure [dbo].[SearchForAssetsForSOS]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchForAssetsForSOS]
    @assetId int,
	@make varchar(MAX),
	@model varchar(MAX),
	@claTag varchar(MAX),
	@serialNumber varchar(MAX)
AS
if @assetId = -1
	Select
		assetID,
		CLATag,
		Make,
		Model,
		(Make+ Model) as Name, 
		Description,
		SerialNumber,
		Status,
		editorID
	From Asset
	WHERE Make like '%' + @make + '%'
	AND Model  like '%' + @model + '%'
	AND CLATag like '%' + @claTag + '%'
	AND SerialNumber like '%' + @serialNumber + '%'
	AND Status = 'Active'
	AND sosID is NULL
else
	Select
		assetID,
		CLATag,
		Make,
		Model,
		(Make+ Model) as Name,
		Description,
		SerialNumber,
		Status,
		editorID
	From Asset
	WHERE assetID = @assetId
	AND Make like '%' + @make + '%'
	AND Model  like '%' + @model + '%'
	AND CLATag like '%' + @claTag + '%'
	AND SerialNumber like '%' + @serialNumber + '%'
	AND Status = 'Active'
	AND sosID is NULL
GO
/****** Object:  StoredProcedure [dbo].[SearchForSOS]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchForSOS]
    @arID int,
    @claID varchar(MAX),
    @assingmentPeriod int,
    @dateCreated dateTime,
	@assetDescription varchar(MAX),
	@dateDue varchar(MAX)
AS
BEGIN
	if @assetDescription = ''
		if @dateCreated = '1/1/1900 12:00:00 AM'
			if @arID = 0
				Select
					SOS.sosID,
					(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as Name,
					(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
					--SOS.AssingmentPeriod,
					SOS.DateCreated,
					SOS.DateDue,
					SOS.Status
					--SOS.ImageFileName,
					--SOS.editorID
				from SoS
				inner join CLA_IT_Member
				on CLA_IT_Member.claID=SOS.claID
				inner join Asset_Recipient
				on Asset_Recipient.arID=SOS.arID
				where SOS.claID like '%' + CAST(@claID as varchar) + '%'
				and AssingmentPeriod = @assingmentPeriod
				and DateDue like '%' + @dateDue + '%'
			else
				Select
					SOS.sosID,
					(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as Name,
					(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
					--SOS.AssingmentPeriod,
					SOS.DateCreated,
					SOS.DateDue,
					SOS.Status
					--SOS.ImageFileName,
					--SOS.editorID
				from SoS
				inner join CLA_IT_Member
				on CLA_IT_Member.claID=SOS.claID
				inner join Asset_Recipient
				on Asset_Recipient.arID=SOS.arID
				where SOS.arID = @arID
				and SOS.claID like '%' + CAST(@claID as varchar) + '%'
				and AssingmentPeriod = @assingmentPeriod
				and DateDue like '%' + @dateDue + '%'
		else
			if @arID = 0
				Select
					SOS.sosID,
					(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as Name,
					(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
					--SOS.AssingmentPeriod,
					SOS.DateCreated,
					SOS.DateDue,
					SOS.Status
					--SOS.ImageFileName,
					--SOS.editorID
				from SoS
				inner join CLA_IT_Member
				on CLA_IT_Member.claID=SOS.claID
				inner join Asset_Recipient
				on Asset_Recipient.arID=SOS.arID
				where SOS.claID like '%' + CAST(@claID as varchar) + '%'
				and AssingmentPeriod = @assingmentPeriod
				and DateCreated = @dateCreated
				and DateDue like '%' + @dateDue + '%'
			else 
				Select
					SOS.sosID,
					(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as Name,
					(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
					--SOS.AssingmentPeriod,
					SOS.DateCreated,
					SOS.DateDue,
					SOS.Status
					--SOS.ImageFileName,
					--SOS.editorID
				from SoS
				inner join CLA_IT_Member
				on CLA_IT_Member.claID=SOS.claID
				inner join Asset_Recipient
				on Asset_Recipient.arID=SOS.arID
				where SOS.arID = @arID
				and SOS.claID like '%' + CAST(@claID as varchar) + '%'
				and AssingmentPeriod = @assingmentPeriod
				and DateCreated = @dateCreated
				and DateDue like '%' + @dateDue + '%'
	else
		if @dateCreated = '1/1/1900 12:00:00 AM'
			if @arID = 0
				Select
					SOS.sosID,
					(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as Name,
					(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
					--SOS.AssingmentPeriod,
					SOS.DateCreated,
					SOS.DateDue,
					SOS.Status
					--SOS.ImageFileName,
					--SOS.editorID
				from SoS 
				inner join CLA_IT_Member
				on CLA_IT_Member.claID=SOS.claID
				inner join Asset_Recipient
				on Asset_Recipient.arID=SOS.arID
				where SOS.claID like '%' + CAST(@claID as varchar) + '%'
				and AssingmentPeriod = @assingmentPeriod
				and sosID in (SELECT sosID FROM Asset WHERE Make + ' ' + Model like '%' + @assetDescription  + '%') 
				and DateDue like '%' + @dateDue + '%'
			else 
				Select
					SOS.sosID,
					(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as Name,
					(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
					--SOS.AssingmentPeriod,
					SOS.DateCreated,
					SOS.DateDue,
					SOS.Status
					--SOS.ImageFileName,
					--SOS.editorID
				from SoS
				inner join CLA_IT_Member
				on CLA_IT_Member.claID=SOS.claID
				inner join Asset_Recipient
				on Asset_Recipient.arID=SOS.arID
				where SOS.arID = @arID
				and SOS.claID like '%' + CAST(@claID as varchar) + '%'
				and AssingmentPeriod = @assingmentPeriod
				and ((sosID in (SELECT sosID FROM Asset WHERE Make + ' ' + Model like '%' + @assetDescription  + '%')) OR sosID IS NULL) 
				and DateDue like '%' + @dateDue + '%'
		else
			if @arID = 0
				Select
					SOS.sosID,
					(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as Name,
					(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
					--SOS.AssingmentPeriod,
					SOS.DateCreated,
					SOS.DateDue,
					SOS.Status
					--SOS.ImageFileName,
					--SOS.editorID
				from SoS
				inner join CLA_IT_Member
				on CLA_IT_Member.claID=SOS.claID
				inner join Asset_Recipient
				on Asset_Recipient.arID=SOS.arID
				where SOS.claID like '%' + CAST(@claID as varchar) + '%'
				and AssingmentPeriod = @assingmentPeriod
				and DateCreated = @dateCreated
				and ((sosID in (SELECT sosID FROM Asset WHERE Make + ' ' + Model like '%' + @assetDescription  + '%')) OR sosID IS NULL)
				and DateDue like '%' + @dateDue + '%'
			else 
				Select
					SOS.sosID,
					(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as Name,
					(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
					--SOS.AssingmentPeriod,
					SOS.DateCreated,
					SOS.DateDue,
					SOS.Status
					--SOS.ImageFileName,
					--SOS.editorID
				from SoS
				inner join CLA_IT_Member
				on CLA_IT_Member.claID=SOS.claID
				inner join Asset_Recipient
				on Asset_Recipient.arID=SOS.arID
				where SOS.arID = @arID
				and SOS.claID like '%' + CAST(@claID as varchar) + '%'
				and AssingmentPeriod = @assingmentPeriod
				and DateCreated = @dateCreated
				and DateDue like '%' + @dateDue + '%'
				and ((sosID in (SELECT sosID FROM Asset WHERE Make + ' ' + Model like '%' + @assetDescription  + '%')) OR sosID IS NULL)

END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllByAssetID]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllByAssetID]
	@assetID int
	
AS
	SELECT * From Asset where assetID=@assetID
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[SelectCLAIDandName]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectCLAIDandName]
	
AS
	SELECT claID,(FirstName +' '+LastName) as Name From CLA_IT_Member
GO
/****** Object:  StoredProcedure [dbo].[SelectCLATagAndType]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectCLATagAndType]
	
AS
	SELECT assetID,(Make + ' '+ Model) As Asset From Asset
GO
/****** Object:  StoredProcedure [dbo].[SelectNameandARID]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectNameandARID]
	
AS
	SELECT arID,(FirstName+ ' '+ LastName) AS Name From Asset_Recipient
GO
/****** Object:  StoredProcedure [dbo].[sosTracking]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sosTracking]
AS
select
	sosID,
	(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
	CONVERT(date, DateDue) as Due,
	DATEDIFF(DAY,GETDATE(),DateDue) as Soonness,
	Asset_Recipient.EmailAddress as Email,
	Asset_Recipient.PhoneNumber as Phone
from sos
inner join CLA_IT_Member on CLA_IT_Member.claID=SOS.claID
inner join Asset_Recipient on Asset_Recipient.arID=SOS.arID
where 
	DATEDIFF(DAY,GETDATE(),DateDue) < 14
order by
	Soonness
GO
/****** Object:  StoredProcedure [dbo].[UpdateAssetHistory]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAssetHistory]
	@assetID int,
	@editorID nchar(8)
AS
	DECLARE @ChangeTimeStamp AS datetime = GETDATE()

	INSERT INTO Asset_History (assetID, CLATag, Make, Model, Description, SerialNumber, Status, Notes, recordCreated, recordModified, sosID, ChangeTimeStamp,editorID)
	SELECT *, @ChangeTimeStamp FROM Asset WHERE assetID = @assetID AND editorID=@editorID
GO
/****** Object:  StoredProcedure [dbo].[UpdateAssetSOSID]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAssetSOSID]
    @sosID int,
	@editorID nchar,
	@assetID int
AS
	Update Asset

	Set sosID=@sosID,editorID=@editorID Where assetID=@assetID
GO
/****** Object:  StoredProcedure [dbo].[UpdateModifiedSOSDate]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateModifiedSOSDate]
	@sosID int,
	@dueDate datetime,
	@editorID varchar(MAX)
AS
	UPDATE SoS 
	Set DateDue=@dueDate, editorID=@editorID
	WHERE sosID=@sosID
GO
/****** Object:  StoredProcedure [dbo].[UpdateSosFileName]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSosFileName]
	@sosID int,
	@fileName varchar(MAX),
	@editorID varchar(MAX)
AS
	UPDATE SoS 
	Set ImageFileName = @fileName, editorID = @editorID
	WHERE sosID = @sosID
GO
/****** Object:  StoredProcedure [dbo].[UpdateSOSHistory]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSOSHistory]
	@sosID int,
	@editorID varchar(MAX)
AS
	DECLARE @recordModified AS datetime = GETDATE()

	INSERT INTO SoS_History (sosID, claID, arID, AssignmentPeriod, DateCreated, DateModified, DateDue, Status, ImageFileName, recordModified, recordCreated, editorID)
	SELECT sosID, claID, arID, AssingmentPeriod, DateCreated, DateModified, DateDue, Status, ImageFileName, @recordModified, recordCreated, @editorID FROM SoS WHERE sosID=@sosID and editorID=@editorID
GO
/****** Object:  StoredProcedure [dbo].[updateTemplate]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateTemplate]
	@assetTemplateID int,
	@name varchar(MAX),
	@make varchar(MAX),
	@model varchar(MAX),
	@description varchar(MAX)
AS
	UPDATE Asset_Template
	SET Name=@name, Make=@make, Model=@model, Description=@description, recordModified=GETDATE()
	WHERE assetTemplateID = @assetTemplateID
RETURN SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[updateUSerInfo]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateUSerInfo]
	@accessNetId varchar(8),
	@firstName varchar(max),
	@lastName varchar(max),
	@office varchar(max),
	@status varchar(10),
	@email varchar(max)
AS
	UPDATE CLA_IT_Member
	SET FirstName=@firstName,
		LastName=@lastName,
		OfficeLocation=@office,
		UserStatus=@status,
		EmailAddress=@email,
		recordModified=GETDATE()
	WHERE claID=@accessNetId
RETURN 0
GO
/****** Object:  StoredProcedure [dbo].[updateUserStatus]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateUserStatus]
	@accessNetID varchar(8),
	@status varchar(8)
AS
	UPDATE CLA_IT_Member
	SET UserStatus = @status
	WHERE claID = @accessNetID
GO
/****** Object:  Table [dbo].[Asset]    Script Date: 4/2/2015 8:56:28 AM ******/
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
/****** Object:  Table [dbo].[Asset_History]    Script Date: 4/2/2015 8:56:28 AM ******/
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
/****** Object:  Table [dbo].[Asset_Recipient]    Script Date: 4/2/2015 8:56:28 AM ******/
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
/****** Object:  Table [dbo].[Asset_Template]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Asset_Template](
	[assetTemplateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Make] [varchar](max) NULL,
	[Model] [varchar](max) NULL,
	[Description] [varchar](max) NOT NULL,
	[recordModified] [datetime] NOT NULL,
	[recordCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Asset_Template] PRIMARY KEY CLUSTERED 
(
	[assetTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CLA_IT_Member]    Script Date: 4/2/2015 8:56:28 AM ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[recordCreated] [datetime] NULL,
	[recordModified] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Email_Template]    Script Date: 4/2/2015 8:56:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Email_Template](
	[EmailCopy] [varchar](max) NOT NULL,
	[recordCreated] [datetime] NOT NULL,
	[recordModified] [datetime] NOT NULL,
	[EmailTemplateID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Email_Template] PRIMARY KEY CLUSTERED 
(
	[EmailTemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SoS]    Script Date: 4/2/2015 8:56:28 AM ******/
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
/****** Object:  Table [dbo].[SoS_History]    Script Date: 4/2/2015 8:56:28 AM ******/
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
/****** Object:  Table [dbo].[SoS_Template]    Script Date: 4/2/2015 8:56:28 AM ******/
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
ALTER TABLE [dbo].[Asset_History]  WITH CHECK ADD  CONSTRAINT [FK_Asset_History_Asset] FOREIGN KEY([assetID])
REFERENCES [dbo].[Asset] ([assetID])
GO
ALTER TABLE [dbo].[Asset_History] CHECK CONSTRAINT [FK_Asset_History_Asset]
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
ALTER TABLE [dbo].[SoS_History]  WITH CHECK ADD  CONSTRAINT [FK_SoS_History_SoS] FOREIGN KEY([sosID])
REFERENCES [dbo].[SoS] ([sosID])
GO
ALTER TABLE [dbo].[SoS_History] CHECK CONSTRAINT [FK_SoS_History_SoS]
GO
USE [master]
GO
ALTER DATABASE [claams] SET  READ_WRITE 
GO
