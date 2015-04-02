USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[getLastSosHistoryIdBySos]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getLastSosHistoryIdBySos]
	@sosid int
AS
SELECT TOP 1 sosHistoryID from SoS_History where sosID = @sosid order by sosHistoryID desc
RETURN 0
GO
