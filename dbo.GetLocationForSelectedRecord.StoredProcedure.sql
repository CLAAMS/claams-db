USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[GetLocationForSelectedRecord]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLocationForSelectedRecord]
	@arID int
	
AS
	SELECT * From Asset_Recipient where arID=@arID
GO
