USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[getSosHistory]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getSosHistory]
	@sosID int
AS
	select * from SoS_History where sosID = @sosID;
GO
