USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[sosTracking]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sosTracking]
AS
select
	sosID,
	(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
	CONVERT(date, DateDue) as Due,
	DATEDIFF(DAY,GETDATE(),DateDue) as Soonness,
	Asset_Recipient.EmailAddress as Email,
	Asset_Recipient.PhoneNumber as Phone
from sos
inner join CLA_IT_Member on CLA_IT_Member.claID=SOS.claID
inner join Asset_Recipient on Asset_Recipient.arID=SOS.arID
where 
	DATEDIFF(DAY,GETDATE(),DateDue) < 14
order by
	Soonness
GO
