USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[getSosById]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getSosById]
	@sosID int
AS
	select * from SoS where sosID = @sosID
GO
