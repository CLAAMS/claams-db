USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[SelectAllByAssetID]    Script Date: 4/2/2015 8:17:34 AM ******/
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
