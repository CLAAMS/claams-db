USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[UpdateAssetSOSID]    Script Date: 4/2/2015 8:17:34 AM ******/
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
