USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[createUser]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createUser]
	@accessNetId varchar(8),
	@firstName varchar(max),
	@lastName varchar(max),
	@office varchar(max),
	@status varchar(10),
	@email varchar(max)
AS
	INSERT INTO CLA_IT_Member
	VALUES (@accessNetId,
			@firstName,
			@lastName,
			@office,
			@status,
			@email,
			GETDATE(),
			GETDATE()
			)
RETURN 0
GO
