USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAssetAndSetStatus]    Script Date: 4/2/2015 8:17:34 AM ******/
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
