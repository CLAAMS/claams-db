USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[createTemplate]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createTemplate]
	@name varchar(MAX),
	@make varchar(MAX),
	@model varchar(MAX),
	@description varchar(MAX)
AS
	INSERT INTO Asset_Template (Name, Make, Model, Description, recordModified, recordCreated)
	VALUES (@name, @make, @model, @description, GETDATE(), GETDATE())
RETURN SCOPE_IDENTITY()
GO
