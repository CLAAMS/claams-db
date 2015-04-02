USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[ModifyDepartment]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModifyDepartment]
	@departmentId int,
	@Name varchar(MAX)
	
AS
	Update Department
	Set Name=@Name WHERE DepartmentId=@departmentId
GO
