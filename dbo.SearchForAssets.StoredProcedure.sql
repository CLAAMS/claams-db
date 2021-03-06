USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[SearchForAssets]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchForAssets]
	@CLATag varchar(MAX),
	@Make varchar(MAX),
	@Model varchar(MAX),
	@Status varchar(MAX),
	@SerialNumber varchar(MAX),
	@Description varchar(MAX),
	@Notes varchar(MAX)
AS
	SELECT * 
	FROM Asset 
	WHERE sosID is NULL
	AND CLATag like '%' + @CLATag + '%'
	AND Make like '%' + @Make + '%'
	AND Model like '%' + @Model + '%'
	AND Status like '%' + @Status + '%'
	AND SerialNumber like '%' + @SerialNumber + '%'
	AND Description like '%' + @Description + '%'
	AND Notes like '%' + @Notes + '%'
GO
