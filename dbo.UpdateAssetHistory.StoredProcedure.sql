USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[UpdateAssetHistory]    Script Date: 4/2/2015 8:17:34 AM ******/
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
