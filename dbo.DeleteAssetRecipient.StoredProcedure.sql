USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAssetRecipient]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteAssetRecipient]
@arID int
AS
	Delete From Asset_Recipient Where arID=@arID
GO
