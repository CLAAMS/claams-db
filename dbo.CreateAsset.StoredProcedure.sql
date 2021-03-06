USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[CreateAsset]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateAsset]
	@CLATag varchar(MAX),
	@Make varchar(MAX),
	@Model varchar(MAX),
	@Description varchar(MAX),
	@SerialNumber varchar(MAX),
	@Status varchar(MAX),
	@Notes varchar(MAX),
	@recordCreated datetime,
	@recordModified datetime,
	@editorID nchar(8)
AS
	INSERT INTO Asset (CLATag, Make, Model, Description, SerialNumber, Status, Notes, recordCreated, recordModified,editorID) 
	VALUES (@CLATag, @Make, @Model, @Description, @SerialNumber, @Status, @Notes, @recordCreated, @recordModified,@editorID)
GO
