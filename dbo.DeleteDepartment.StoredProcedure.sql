USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[DeleteDepartment]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteDepartment]
	@departmentId int
	
AS
	Delete  From Department WHERE DepartmentId=@departmentId
GO
