USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[SelectCLATagAndType]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectCLATagAndType]
	
AS
	SELECT assetID,(Make + ' '+ Model) As Asset From Asset
GO
