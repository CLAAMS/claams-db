USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[UpdateSosFileName]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSosFileName]
	@sosID int,
	@fileName varchar(MAX),
	@editorID varchar(MAX)
AS
	UPDATE SoS 
	Set ImageFileName = @fileName, editorID = @editorID
	WHERE sosID = @sosID
GO
