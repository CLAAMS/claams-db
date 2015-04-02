USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[AddDepartment]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddDepartment]
	
	@Name VarChar(MAX),
	@recordCreated datetime,
	@recordModified datetime

AS
    INSERT into Department
     (
	
	 Name,
	 recordCreated,
	 recordModified
	 )
	 VALUES
	 (
	
	 @Name,
	 @recordCreated,
	 @recordModified
	 )
GO
