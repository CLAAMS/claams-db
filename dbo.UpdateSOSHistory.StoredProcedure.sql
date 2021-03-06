USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[UpdateSOSHistory]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSOSHistory]
	@sosID int,
	@editorID varchar(MAX)
AS
	DECLARE @recordModified AS datetime = GETDATE()

	INSERT INTO SoS_History (sosID, claID, arID, AssignmentPeriod, DateCreated, DateModified, DateDue, Status, ImageFileName, recordModified, recordCreated, editorID)
	SELECT sosID, claID, arID, AssingmentPeriod, DateCreated, DateModified, DateDue, Status, ImageFileName, @recordModified, recordCreated, @editorID FROM SoS WHERE sosID=@sosID and editorID=@editorID
GO
