USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[updateUSerInfo]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateUSerInfo]
	@accessNetId varchar(8),
	@firstName varchar(max),
	@lastName varchar(max),
	@office varchar(max),
	@status varchar(10),
	@email varchar(max)
AS
	UPDATE CLA_IT_Member
	SET FirstName=@firstName,
		LastName=@lastName,
		OfficeLocation=@office,
		UserStatus=@status,
		EmailAddress=@email,
		recordModified=GETDATE()
	WHERE claID=@accessNetId
RETURN 0
GO
