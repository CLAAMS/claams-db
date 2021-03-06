USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[CreateSignOutSheet]    Script Date: 4/2/2015 8:17:34 AM ******/
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
