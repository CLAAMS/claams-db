USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[GetAssetRecipientID]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAssetRecipientID]
	@index int

AS
	SELECT arID From Asset_Recipient where arID=@index
GO
