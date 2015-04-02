USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[updateUserStatus]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateUserStatus]
	@accessNetID varchar(8),
	@status varchar(8)
AS
	UPDATE CLA_IT_Member
	SET UserStatus = @status
	WHERE claID = @accessNetID
GO
