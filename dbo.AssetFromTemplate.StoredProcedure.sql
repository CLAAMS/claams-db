USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[AssetFromTemplate]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AssetFromTemplate]
	@Description varchar(MAX)
AS
	SELECT * FROM Asset_Template WHERE Description = @Description
GO
