USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[getNamesForSoS]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getNamesForSoS]
	@sosID int
AS
	select
		SoS.claID as AssignerID,
		(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as AssignerName,
		SoS.arID as RecipientID,
		(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as RecipientName
	from SoS
	inner join CLA_IT_Member on CLA_IT_Member.claID=SoS.claID
	inner join Asset_Recipient on Asset_Recipient.arID=SoS.arID
	where sosID=@sosID
RETURN 0
GO
