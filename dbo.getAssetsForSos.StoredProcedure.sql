USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[getAssetsForSos]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAssetsForSos]
	@sosID int
AS
	select *, (Make + ' ' + Model) as name from Asset where sosID = @sosID
GO
