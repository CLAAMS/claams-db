USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[ModifyAsset]    Script Date: 4/2/2015 8:17:34 AM ******/
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
