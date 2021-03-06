USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[updateTemplate]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateTemplate]
	@assetTemplateID int,
	@name varchar(MAX),
	@make varchar(MAX),
	@model varchar(MAX),
	@description varchar(MAX)
AS
	UPDATE Asset_Template
	SET Name=@name, Make=@make, Model=@model, Description=@description, recordModified=GETDATE()
	WHERE assetTemplateID = @assetTemplateID
RETURN SCOPE_IDENTITY()
GO
