USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[DeleteSOS]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteSOS]
	@sosID int
	
AS
	Update Asset
    Set sosID=0,
	Status= 'Out of Service'
	Where sosID=@sosID
GO
