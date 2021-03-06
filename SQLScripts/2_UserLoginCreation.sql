--Comment out the login creation after running this script for the first time.

USE master
GO

CREATE LOGIN FeedReaderApp
	WITH PASSWORD = 'password';
GO

USE FEEDREADER
GO

CREATE USER FeedReaderApp FOR LOGIN FeedReaderApp;
GO

EXEC sp_addrolemember 'db_owner', 'FeedReaderApp'
GO

USE FEEDREADER
GO

USE [FEEDREADER]
GO

/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/22/2014 12:57:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

CREATE PROCEDURE UserInfoInsert(
	@FirstName nvarchar(20),
	@LastName nvarchar(20),
	@UserName nvarchar(20),
	@Email nvarchar(20),
	@AspNetID nvarchar(128)
) AS
INSERT INTO UserInfo(FirstName, LastName, Email, AspNetID, UserName)
VALUES (@FirstName, @LastName, @Email, @AspNetID, @UserName)
GO