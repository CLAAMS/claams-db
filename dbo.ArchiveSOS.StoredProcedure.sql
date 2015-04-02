USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[ArchiveSOS]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ArchiveSOS]
	@sosID int,
	@EditorId VARCHAR(MAX)
	
AS
	Update Asset
    Set sosID=0,
	editorID=@editorID,
	Status = 'Out of Service'
	Where sosID=@sosID
GO
