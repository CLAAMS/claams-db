USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[SelectCLAIDandName]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectCLAIDandName]
	
AS
	SELECT claID,(FirstName +' '+LastName) as Name From CLA_IT_Member
GO
