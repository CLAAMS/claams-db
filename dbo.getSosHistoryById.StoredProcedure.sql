USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[getSosHistoryById]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getSosHistoryById]
	@sosHistoryID int
AS
	select * from SoS_History where sosHistoryID = @sosHistoryID;
GO
