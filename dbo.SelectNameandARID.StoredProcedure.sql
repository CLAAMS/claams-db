USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[SelectNameandARID]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectNameandARID]
	
AS
	SELECT arID,(FirstName+ ' '+ LastName) AS Name From Asset_Recipient
GO
