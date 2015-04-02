USE [claams]
GO
/****** Object:  User [claams]    Script Date: 4/2/2015 8:17:34 AM ******/
CREATE USER [claams] FOR LOGIN [claams] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [claams]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [claams]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [claams]
GO
ALTER ROLE [db_datareader] ADD MEMBER [claams]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [claams]
GO
