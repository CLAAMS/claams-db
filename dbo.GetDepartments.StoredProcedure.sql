USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[GetDepartments]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDepartments]
	
AS
	SELECT * From Department
RETURN 0
GO
