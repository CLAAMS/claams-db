USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[SearchForAssetsForSOS]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchForAssetsForSOS]
    @assetId int,
	@make varchar(MAX),
	@model varchar(MAX),
	@claTag varchar(MAX),
	@serialNumber varchar(MAX)
AS
if @assetId = -1
	Select
		assetID,
		CLATag,
		Make,
		Model,
		(Make+ Model) as Name, 
		Description,
		SerialNumber,
		Status,
		editorID
	From Asset
	WHERE Make like '%' + @make + '%'
	AND Model  like '%' + @model + '%'
	AND CLATag like '%' + @claTag + '%'
	AND SerialNumber like '%' + @serialNumber + '%'
	AND Status = 'Active'
	AND sosID is NULL
else
	Select
		assetID,
		CLATag,
		Make,
		Model,
		(Make+ Model) as Name,
		Description,
		SerialNumber,
		Status,
		editorID
	From Asset
	WHERE assetID = @assetId
	AND Make like '%' + @make + '%'
	AND Model  like '%' + @model + '%'
	AND CLATag like '%' + @claTag + '%'
	AND SerialNumber like '%' + @serialNumber + '%'
	AND Status = 'Active'
	AND sosID is NULL
GO
