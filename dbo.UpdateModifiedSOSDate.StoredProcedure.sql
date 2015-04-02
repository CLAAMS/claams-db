USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[UpdateModifiedSOSDate]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateModifiedSOSDate]
	@sosID int,
	@dueDate datetime,
	@editorID varchar(MAX)
AS
	UPDATE SoS 
	Set DateDue=@dueDate, editorID=@editorID
	WHERE sosID=@sosID
GO
