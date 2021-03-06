USE [claams]
GO
/****** Object:  StoredProcedure [dbo].[SearchForSOS]    Script Date: 4/2/2015 8:17:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchForSOS]
    @arID int,
    @claID varchar(MAX),
    @assingmentPeriod int,
    @dateCreated dateTime,
	@assetDescription varchar(MAX),
	@dateDue varchar(MAX)
AS
BEGIN
	if @assetDescription = ''
		if @dateCreated = '1/1/1900 12:00:00 AM'
			if @arID = 0
				Select
					SOS.sosID,
					(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as Name,
					(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
					--SOS.AssingmentPeriod,
					SOS.DateCreated,
					SOS.DateDue,
					SOS.Status
					--SOS.ImageFileName,
					--SOS.editorID
				from SoS
				inner join CLA_IT_Member
				on CLA_IT_Member.claID=SOS.claID
				inner join Asset_Recipient
				on Asset_Recipient.arID=SOS.arID
				where SOS.claID like '%' + CAST(@claID as varchar) + '%'
				and AssingmentPeriod = @assingmentPeriod
				and DateDue like '%' + @dateDue + '%'
			else
				Select
					SOS.sosID,
					(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as Name,
					(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
					--SOS.AssingmentPeriod,
					SOS.DateCreated,
					SOS.DateDue,
					SOS.Status
					--SOS.ImageFileName,
					--SOS.editorID
				from SoS
				inner join CLA_IT_Member
				on CLA_IT_Member.claID=SOS.claID
				inner join Asset_Recipient
				on Asset_Recipient.arID=SOS.arID
				where SOS.arID = @arID
				and SOS.claID like '%' + CAST(@claID as varchar) + '%'
				and AssingmentPeriod = @assingmentPeriod
				and DateDue like '%' + @dateDue + '%'
		else
			if @arID = 0
				Select
					SOS.sosID,
					(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as Name,
					(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
					--SOS.AssingmentPeriod,
					SOS.DateCreated,
					SOS.DateDue,
					SOS.Status
					--SOS.ImageFileName,
					--SOS.editorID
				from SoS
				inner join CLA_IT_Member
				on CLA_IT_Member.claID=SOS.claID
				inner join Asset_Recipient
				on Asset_Recipient.arID=SOS.arID
				where SOS.claID like '%' + CAST(@claID as varchar) + '%'
				and AssingmentPeriod = @assingmentPeriod
				and DateCreated = @dateCreated
				and DateDue like '%' + @dateDue + '%'
			else 
				Select
					SOS.sosID,
					(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as Name,
					(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
					--SOS.AssingmentPeriod,
					SOS.DateCreated,
					SOS.DateDue,
					SOS.Status
					--SOS.ImageFileName,
					--SOS.editorID
				from SoS
				inner join CLA_IT_Member
				on CLA_IT_Member.claID=SOS.claID
				inner join Asset_Recipient
				on Asset_Recipient.arID=SOS.arID
				where SOS.arID = @arID
				and SOS.claID like '%' + CAST(@claID as varchar) + '%'
				and AssingmentPeriod = @assingmentPeriod
				and DateCreated = @dateCreated
				and DateDue like '%' + @dateDue + '%'
	else
		if @dateCreated = '1/1/1900 12:00:00 AM'
			if @arID = 0
				Select
					SOS.sosID,
					(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as Name,
					(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
					--SOS.AssingmentPeriod,
					SOS.DateCreated,
					SOS.DateDue,
					SOS.Status
					--SOS.ImageFileName,
					--SOS.editorID
				from SoS 
				inner join CLA_IT_Member
				on CLA_IT_Member.claID=SOS.claID
				inner join Asset_Recipient
				on Asset_Recipient.arID=SOS.arID
				where SOS.claID like '%' + CAST(@claID as varchar) + '%'
				and AssingmentPeriod = @assingmentPeriod
				and sosID in (SELECT sosID FROM Asset WHERE Make + ' ' + Model like '%' + @assetDescription  + '%') 
				and DateDue like '%' + @dateDue + '%'
			else 
				Select
					SOS.sosID,
					(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as Name,
					(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
					--SOS.AssingmentPeriod,
					SOS.DateCreated,
					SOS.DateDue,
					SOS.Status
					--SOS.ImageFileName,
					--SOS.editorID
				from SoS
				inner join CLA_IT_Member
				on CLA_IT_Member.claID=SOS.claID
				inner join Asset_Recipient
				on Asset_Recipient.arID=SOS.arID
				where SOS.arID = @arID
				and SOS.claID like '%' + CAST(@claID as varchar) + '%'
				and AssingmentPeriod = @assingmentPeriod
				and ((sosID in (SELECT sosID FROM Asset WHERE Make + ' ' + Model like '%' + @assetDescription  + '%')) OR sosID IS NULL) 
				and DateDue like '%' + @dateDue + '%'
		else
			if @arID = 0
				Select
					SOS.sosID,
					(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as Name,
					(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
					--SOS.AssingmentPeriod,
					SOS.DateCreated,
					SOS.DateDue,
					SOS.Status
					--SOS.ImageFileName,
					--SOS.editorID
				from SoS
				inner join CLA_IT_Member
				on CLA_IT_Member.claID=SOS.claID
				inner join Asset_Recipient
				on Asset_Recipient.arID=SOS.arID
				where SOS.claID like '%' + CAST(@claID as varchar) + '%'
				and AssingmentPeriod = @assingmentPeriod
				and DateCreated = @dateCreated
				and ((sosID in (SELECT sosID FROM Asset WHERE Make + ' ' + Model like '%' + @assetDescription  + '%')) OR sosID IS NULL)
				and DateDue like '%' + @dateDue + '%'
			else 
				Select
					SOS.sosID,
					(CLA_IT_Member.FirstName + ' ' + CLA_IT_Member.LastName) as Name,
					(Asset_Recipient.FirstName + ' ' + Asset_Recipient.LastName) as Recipient,
					--SOS.AssingmentPeriod,
					SOS.DateCreated,
					SOS.DateDue,
					SOS.Status
					--SOS.ImageFileName,
					--SOS.editorID
				from SoS
				inner join CLA_IT_Member
				on CLA_IT_Member.claID=SOS.claID
				inner join Asset_Recipient
				on Asset_Recipient.arID=SOS.arID
				where SOS.arID = @arID
				and SOS.claID like '%' + CAST(@claID as varchar) + '%'
				and AssingmentPeriod = @assingmentPeriod
				and DateCreated = @dateCreated
				and DateDue like '%' + @dateDue + '%'
				and ((sosID in (SELECT sosID FROM Asset WHERE Make + ' ' + Model like '%' + @assetDescription  + '%')) OR sosID IS NULL)

END
GO
