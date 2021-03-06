USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[ModifySOS]    Script Date: 4/2/2015 8:17:34 AM ******/
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
