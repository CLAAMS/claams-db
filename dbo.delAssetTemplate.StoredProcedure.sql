USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[delAssetTemplate]    Script Date: 4/2/2015 8:17:34 AM ******/
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
