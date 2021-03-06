USE [master]
GO
/****** Object:  Database [Coursework]    Script Date: 26.12.17 20:16:01 ******/
CREATE DATABASE [Coursework] ON  PRIMARY 
( NAME = N'Coursework', FILENAME = N'D:\MSSQL\Data\Coursework.mdf' , SIZE = 10072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Coursework_log', FILENAME = N'D:\MSSQL\Data\Coursework_log.ldf' , SIZE = 5136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Coursework] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Coursework].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Coursework] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Coursework] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Coursework] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Coursework] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Coursework] SET ARITHABORT OFF 
GO
ALTER DATABASE [Coursework] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Coursework] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Coursework] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Coursework] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Coursework] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Coursework] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Coursework] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Coursework] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Coursework] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Coursework] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Coursework] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Coursework] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Coursework] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Coursework] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Coursework] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Coursework] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Coursework] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Coursework] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Coursework] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Coursework] SET  MULTI_USER 
GO
ALTER DATABASE [Coursework] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Coursework] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Coursework', N'ON'
GO
USE [Coursework]
GO
GRANT ALTER ANY USER TO [comp_admins] AS [dbo]
GO
USE [master]
GO
ALTER DATABASE [Coursework] SET  READ_WRITE 
GO

/****** Object:  DatabaseRole [comp_admins]    Script Date: 26.12.17 20:16:01 ******/
CREATE ROLE [comp_admins]
GO

/****** Object:  DatabaseRole [comp_viewers]    Script Date: 26.12.17 20:16:01 ******/
CREATE ROLE [comp_viewers]
GO

CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](128) NOT NULL,
	[isadmin] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
GRANT SELECT ON [dbo].[Users] TO [comp_viewers] AS [dbo]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_isadmin]  DEFAULT ((0)) FOR [isadmin]
GO

/****** Object:  Table [dbo].[Stores]    Script Date: 26.12.17 20:24:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Stores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](128) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[email] [nvarchar](256) NULL,
 CONSTRAINT [PK_Stores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO



/****** Object:  Table [dbo].[Computers]    Script Date: 26.12.17 20:25:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Computers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](128) NOT NULL,
	[video] [nvarchar](50) NOT NULL,
	[videogb] [int] NOT NULL,
	[memory] [int] NOT NULL,
	[hdd] [int] NOT NULL,
	[optidrive] [bit] NOT NULL,
	[monit] [bit] NOT NULL,
	[moninches] [float] NULL,
 CONSTRAINT [PK_Computers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Computers]  WITH CHECK ADD  CONSTRAINT [CK_Computers] CHECK  (([videogb]>(0)))
GO

ALTER TABLE [dbo].[Computers] CHECK CONSTRAINT [CK_Computers]
GO

ALTER TABLE [dbo].[Computers]  WITH CHECK ADD  CONSTRAINT [CK_Computers_1] CHECK  (([memory]>(0)))
GO

ALTER TABLE [dbo].[Computers] CHECK CONSTRAINT [CK_Computers_1]
GO

ALTER TABLE [dbo].[Computers]  WITH CHECK ADD  CONSTRAINT [CK_Computers_2] CHECK  (([hdd]>(0)))
GO

ALTER TABLE [dbo].[Computers] CHECK CONSTRAINT [CK_Computers_2]
GO

ALTER TABLE [dbo].[Computers]  WITH CHECK ADD  CONSTRAINT [CK_Computers_3] CHECK  (([moninches]>(0)))
GO

ALTER TABLE [dbo].[Computers] CHECK CONSTRAINT [CK_Computers_3]
GO

/****** Object:  Table [dbo].[ComputerInStores]    Script Date: 26.12.17 20:26:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ComputerInStores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[computer_id] [int] NOT NULL,
	[store_id] [int] NOT NULL,
	[price] [float] NULL,
	[comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ComputerInStores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Index [IX_ComputerInStores]    Script Date: 26.12.17 20:26:19 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ComputerInStores] ON [dbo].[ComputerInStores]
(
	[computer_id] ASC,
	[store_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ComputerInStores]  WITH CHECK ADD  CONSTRAINT [FK_ComputerInStores_Computers] FOREIGN KEY([computer_id])
REFERENCES [dbo].[Computers] ([id])
GO

ALTER TABLE [dbo].[ComputerInStores] CHECK CONSTRAINT [FK_ComputerInStores_Computers]
GO

ALTER TABLE [dbo].[ComputerInStores]  WITH CHECK ADD  CONSTRAINT [FK_ComputerInStores_Stores] FOREIGN KEY([store_id])
REFERENCES [dbo].[Stores] ([id])
GO

ALTER TABLE [dbo].[ComputerInStores] CHECK CONSTRAINT [FK_ComputerInStores_Stores]
GO

ALTER TABLE [dbo].[ComputerInStores]  WITH CHECK ADD  CONSTRAINT [CK_ComputerInStores] CHECK  (([price]>(0)))
GO

ALTER TABLE [dbo].[ComputerInStores] CHECK CONSTRAINT [CK_ComputerInStores]
GO

CREATE view [dbo].[Admin_ComputerInStores]
as
SELECT 
	[ComputerInStores].[id]
    
    

	,[dbo].[FullComputerName]([ComputerInStores].[computer_id]) as [Computer]
	,[dbo].[FullStoreName]([ComputerInStores].[store_id]) as [Store]
	,[ComputerInStores].[price]
    ,[ComputerInStores].[comment]
	,[ComputerInStores].[computer_id]
    ,[ComputerInStores].[store_id]
FROM [dbo].[ComputerInStores] as [ComputerInStores]
	INNER JOIN [dbo].[Computers] as [Computers]
	ON [Computers].[id]=[ComputerInStores].[computer_id]
	INNER JOIN [dbo].[Stores] as [Stores]
	ON [Stores].[id]=[ComputerInStores].[store_id]

GO
GRANT ALTER ON [dbo].[Admin_ComputerInStores] TO [comp_admins] AS [dbo]
GO
GRANT DELETE ON [dbo].[Admin_ComputerInStores] TO [comp_admins] AS [dbo]
GO
GRANT INSERT ON [dbo].[Admin_ComputerInStores] TO [comp_admins] AS [dbo]
GO
GRANT SELECT ON [dbo].[Admin_ComputerInStores] TO [comp_admins] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Admin_ComputerInStores] TO [comp_admins] AS [dbo]
GO
/****** Object:  Trigger [dbo].[ComputerInStoresInsteadDeleteTrigger]    Script Date: 26.12.17 20:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ComputerInStoresInsteadDeleteTrigger] on [dbo].[Admin_ComputerInStores]
INSTEAD OF DELETE
AS
BEGIN 
	DELETE [ComputerInStores]
	
	FROM [dbo].[ComputerInStores] as [ComputerInStores]
		INNER JOIN deleted
		ON [ComputerInStores].[id] = deleted.[id]  
END;

GO
/****** Object:  Trigger [dbo].[ComputerInStoresInsteadInsertTrigger]    Script Date: 26.12.17 20:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ComputerInStoresInsteadInsertTrigger] on [dbo].[Admin_ComputerInStores]
INSTEAD OF INSERT
AS
BEGIN
  
  INSERT INTO [dbo].[ComputerInStores]([computer_id],[store_id],[price],[comment])
       SELECT 
		[computer_id]
		,[store_id]
		,[price]
		,nullif(ltrim(rtrim([comment])),N'')
       FROM inserted
END;

GO
/****** Object:  Trigger [dbo].[ComputerInStoresInsteadUpdateTrigger]    Script Date: 26.12.17 20:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ComputerInStoresInsteadUpdateTrigger] on [dbo].[Admin_ComputerInStores]
INSTEAD OF UPDATE
AS
BEGIN 
	UPDATE [ComputerInStores]
	SET [ComputerInStores].[computer_id] = inserted.[computer_id]
		,[ComputerInStores].[store_id] = inserted.[store_id]
		,[ComputerInStores].[price] = inserted.[price]
		,[ComputerInStores].[comment] = nullif(ltrim(rtrim(inserted.[comment])),N'')
		
	FROM [dbo].[ComputerInStores] as [ComputerInStores]
		INNER JOIN inserted
		ON [ComputerInStores].[id] = inserted.[id]  
END;

GO



CREATE VIEW [dbo].[Admin_computers]
AS
SELECT        
id, 
name,
[video],
[videogb],
[memory],
[hdd],
[optidrive],
[monit],
[moninches]
FROM dbo.Computers



GO
GRANT ALTER ON [dbo].[Admin_computers] TO [comp_admins] AS [dbo]
GO
GRANT DELETE ON [dbo].[Admin_computers] TO [comp_admins] AS [dbo]
GO
GRANT INSERT ON [dbo].[Admin_computers] TO [comp_admins] AS [dbo]
GO
GRANT SELECT ON [dbo].[Admin_computers] TO [comp_admins] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Admin_computers] TO [comp_admins] AS [dbo]
GO
/****** Object:  Trigger [dbo].[ComputersInsteadDeleteTrigger]    Script Date: 26.12.17 20:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ComputersInsteadDeleteTrigger] on [dbo].[Admin_computers]
INSTEAD OF DELETE
AS
BEGIN 
	DELETE [Computers]
	
	FROM [dbo].[Computers] as [Computers]
		INNER JOIN deleted
		ON [Computers].[id] = deleted.[id]  
END;

GO
/****** Object:  Trigger [dbo].[ComputersInsteadInsertTrigger]    Script Date: 26.12.17 20:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ComputersInsteadInsertTrigger] on [dbo].[Admin_computers]
INSTEAD OF INSERT
AS
BEGIN
  
  INSERT INTO [dbo].[Computers]([name],[video],[videogb],[memory],[hdd],[optidrive],[monit],[moninches])
       SELECT 
		[name]
		,[video]
		,[videogb]
		,[memory]
		,[hdd]
		,[optidrive]
		,[monit]
		,[moninches]
       FROM inserted
END;

GO
/****** Object:  Trigger [dbo].[ComputersInsteadUpdateTrigger]    Script Date: 26.12.17 20:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[ComputersInsteadUpdateTrigger] on [dbo].[Admin_computers]
INSTEAD OF UPDATE
AS
BEGIN 
	UPDATE [Computers]
	SET [Computers].[name] = inserted.[name]
		,[Computers].[videogb] = inserted.[videogb]
		,[Computers].[memory] = inserted.[memory]
		,[Computers].[hdd] = inserted.[hdd]
		,[Computers].[optidrive] = inserted.[optidrive]
		,[Computers].[monit] = inserted.[monit]
		,[Computers].[moninches] = inserted.[moninches]
	FROM [dbo].[Computers] as [Computers]
		INNER JOIN inserted
		ON [Computers].[id] = inserted.[id]  
END;

GO


create view [dbo].[Admin_Stores]
as
SELECT [id]
      ,[name]
      ,[address]
      ,[email]
  FROM [dbo].[Stores]
GO
GRANT ALTER ON [dbo].[Admin_Stores] TO [comp_admins] AS [dbo]
GO
GRANT DELETE ON [dbo].[Admin_Stores] TO [comp_admins] AS [dbo]
GO
GRANT INSERT ON [dbo].[Admin_Stores] TO [comp_admins] AS [dbo]
GO
GRANT SELECT ON [dbo].[Admin_Stores] TO [comp_admins] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Admin_Stores] TO [comp_admins] AS [dbo]
GO
/****** Object:  Trigger [dbo].[StoresInsteadDeleteTrigger]    Script Date: 26.12.17 20:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[StoresInsteadDeleteTrigger] on [dbo].[Admin_Stores]
INSTEAD OF DELETE
AS
BEGIN 
	DELETE [Stores]
	
	FROM [dbo].[Stores] as [Stores]
		INNER JOIN deleted
		ON [Stores].[id] = deleted.[id]  
END;

GO
/****** Object:  Trigger [dbo].[StoresInsteadInsertTrigger]    Script Date: 26.12.17 20:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[StoresInsteadInsertTrigger] on [dbo].[Admin_Stores]
INSTEAD OF INSERT
AS
BEGIN
  
  INSERT INTO [dbo].[Stores]([name],[address],[email])
       SELECT 
		ltrim(rtrim(inserted.[name]))
		,ltrim(rtrim(inserted.[address]))
		,nullif(ltrim(rtrim(inserted.[email])),N'')
	   FROM inserted
END;

GO
/****** Object:  Trigger [dbo].[StoresInsteadUpdateTrigger]    Script Date: 26.12.17 20:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[StoresInsteadUpdateTrigger] on [dbo].[Admin_Stores]
INSTEAD OF UPDATE
AS
BEGIN 
	UPDATE [Stores]
	SET [Stores].[name] = ltrim(rtrim(inserted.[name]))
		,[Stores].[address] = ltrim(rtrim(inserted.[address]))
		,[Stores].[email] = nullif(ltrim(rtrim(inserted.[email])),N'')
		
	FROM [dbo].[Stores] as [Stores]
		INNER JOIN inserted
		ON [Stores].[id] = inserted.[id]  
END;

GO

CREATE FUNCTION [dbo].[FullComputerName](@id integer)

RETURNS nvarchar(max)
AS
BEGIN
	
	RETURN isnull((select 
					[name]
					+N'[VideoCard: '
					+[video]
					+N', '
					+cast([videoGb] as nvarchar(64))
					+N'Gb, RAM: '
					+cast([memory] as nvarchar(64))
					+N'Gb, HDD: '
					+cast([hdd] as nvarchar(64))
					+N'Mb'
					+case	when [optidrive]=1
							then N', DVD-drive'
							else N''
					end
					+case	when [monit]=1 and [moninches] is not null
							then N', monitor '+cast([moninches] as nvarchar(64))+N'"'
							else N''
					end
					+N' ]'
				   from [dbo].[Computers]
				   where [id]=@id
					
	),N'')

END

GO


create FUNCTION [dbo].[FullStoreName](@id integer)

RETURNS nvarchar(max)
AS
BEGIN
	
	RETURN isnull((select 
					[name]
					+N' ,Address: '
					+[address]
					+case	when [email] is not null
							then N', e-mail: '+[email]
							else N''
					end
					
				   from [dbo].[Stores]
				   where [id]=@id
					
	),N'')

END

GO

create view [dbo].[admin_FullComputerName]
as
SELECT [id]
      ,[dbo].[FullComputerName]([id]) as [FullComputerName]
  FROM [dbo].[Computers]
GO
GRANT SELECT ON [dbo].[admin_FullComputerName] TO [comp_admins] AS [dbo]
GO

create view [dbo].[admin_FullStoreName]
as
SELECT [id]
      ,[dbo].[FullStoreName]([id]) as [FullStoreName]
  FROM [dbo].[Stores]
GO
GRANT SELECT ON [dbo].[admin_FullStoreName] TO [comp_admins] AS [dbo]
GO


CREATE PROCEDURE [dbo].[CheckUser] 
	-- Add the parameters for the stored procedure here
	@username nvarchar(128)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 1 [id]
      ,[isadmin]
  FROM [dbo].[Users] WHERE [username] = @username
END

GO
GRANT EXECUTE ON [dbo].[CheckUser] TO [comp_admins] AS [dbo]
GO
GRANT EXECUTE ON [dbo].[CheckUser] TO [comp_viewers] AS [dbo]
GO


CREATE PROCEDURE [dbo].[CreateUser] 
	-- Add the parameters for the stored procedure here
	@username nvarchar(128),
	@pwd nvarchar(128),
	@isadmin bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	declare @SqlCmd nvarchar(MAX)
	declare @errormessage nvarchar(4000)
	declare @errorseverity int = 16
	declare @errorstate int = 1
	SET NOCOUNT ON;
	BEGIN TRY
		if @username in (N'sa', N'compadmin')
		BEGIN
			RAISERROR (N'The current login is prohibited',@errorseverity,@errorstate);
		END
		if exists(Select 1 from Sys.database_principals where type = 'S' and name = @username)
		BEGIN
			RAISERROR (N'The current user already exists',@errorseverity,@errorstate);
		END
		if exists(Select * from Sys.server_principals where type = 'S' and name = @username )
		BEGIN
			RAISERROR (N'The current login already exists',@errorseverity,@errorstate);
		END		
		if exists(Select 1 from dbo.Users where username = @username)
		BEGIN
			RAISERROR (N'The current login already exists',@errorseverity,@errorstate);
		END
		if (@username is null or @pwd is null)
		BEGIN
			RAISERROR (N'Username or login is empty',@errorseverity,@errorstate);
		END
		Begin Tran;
		if(@isadmin = 1)
		BEGIN
			SET @SqlCmd = N'CREATE LOGIN '+QUOTENAME(@username)+N' WITH PASSWORD= N'''+ @pwd+ N''' , DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF'+NCHAR(13)+NCHAR(10)
			--+N'GO '+NCHAR(13)+NCHAR(10)
			
			SET @SqlCmd = @SqlCmd + N'CREATE USER '+QUOTENAME(@username)+ N' FOR LOGIN ' + QUOTENAME(@username) +NCHAR(13)+NCHAR(10)
			--+N'GO '+NCHAR(13)+NCHAR(10)
			SET @SqlCmd = @SqlCmd + N'EXEC sp_addrolemember N''comp_viewers'', N'''+@username+N''''+NCHAR(13)+NCHAR(10)
			--+N'GO '+NCHAR(13)+NCHAR(10)
			SET @SqlCmd = @SqlCmd + N'EXEC sp_addrolemember N''comp_admins'', N'''+@username+N''''+NCHAR(13)+NCHAR(10)
			--+N'GO 'NCHAR(13)+NCHAR(10)
			SELECT @SqlCmd

			EXEC (@SqlCmd)
			
			INSERT INTO [dbo].[Users]
					   ([username]
					    ,[isadmin])
				 VALUES
					   (@username
					   ,1)
			--,NCHAR(13)+NCHAR(10)
		END
		ELSE
		BEGIN
			SET @SqlCmd = N'CREATE LOGIN '+QUOTENAME(@username)+N' WITH PASSWORD= N'''+ @pwd+ N''' , DEFAULT_DATABASE=[master], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF'+NCHAR(13)+NCHAR(10)
			--+N'GO '+NCHAR(13)+NCHAR(10)
			
			SET @SqlCmd = @SqlCmd + N'CREATE USER '+QUOTENAME(@username)+ N' FOR LOGIN ' + QUOTENAME(@username) +NCHAR(13)+NCHAR(10)
			--+N'GO '+NCHAR(13)+NCHAR(10)
			SET @SqlCmd = @SqlCmd + N'EXEC sp_addrolemember N''comp_viewers'', N'''+@username+N''''+NCHAR(13)+NCHAR(10)
			--+N'GO '+NCHAR(13)+NCHAR(10)
			--SET @SqlCmd = @SqlCmd + N'EXEC sp_addrolemember N''comp_admins'', N'''+@username+N''''+NCHAR(13)+NCHAR(10)
			--+N'GO 'NCHAR(13)+NCHAR(10)
			--SELECT @SqlCmd

			EXEC (@SqlCmd)
			
			INSERT INTO [dbo].[Users]
					   ([username]
					    ,[isadmin])
				 VALUES
					   (@username
					   ,0)
			--,NCHAR(13)+NCHAR(10)
		END
	--	SELECT TOP 1 [id]
	--	,[isadmin]
	--FROM [dbo].[Users] WHERE [username] = @username

		--select @@TRANCOUNT
		if (@@TRANCOUNT > 0)
			Commit;
		return 0;
	END TRY
	BEGIN CATCH
		if (@@TRANCOUNT > 0)
			Rollback Transaction
			SET @errormessage = ERROR_MESSAGE() 
			SET @errorseverity = ERROR_SEVERITY()
			SET @errorstate = ERROR_STATE()

		--SELECT  
			--ERROR_NUMBER() AS ErrorNumber  
			--,ERROR_SEVERITY() AS ErrorSeverity  
			--,ERROR_STATE() AS ErrorState  
			--,ERROR_PROCEDURE() AS ErrorProcedure  
			--,ERROR_LINE() AS ErrorLine  
			--,ERROR_MESSAGE() AS ErrorMessage; 
			RAISERROR(@errormessage, @errorseverity, @errorstate) 
			return Error_number(); 
	END CATCH
    
	--SELECT TOP 1 [id]
	--	,[isadmin]
	--FROM [dbo].[Users] WHERE [username] = @username
END

GO
GRANT EXECUTE ON [dbo].[CreateUser] TO [comp_admins] AS [dbo]
GO

/****** Object:  View [dbo].[View_ComputerInStores]    Script Date: 26.12.17 20:35:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[View_ComputerInStores]
as
SELECT 
	[ComputerInStores].[id]
    ,[ComputerInStores].[computer_id]
    --,[ComputerInStores].[store_id]
    ,[ComputerInStores].[price]
    ,[ComputerInStores].[comment]

	--,[dbo].[FullComputerName]([ComputerInStores].[computer_id]) as [Computer]
	,[dbo].[FullStoreName]([ComputerInStores].[store_id]) as [Store]
FROM [dbo].[ComputerInStores] as [ComputerInStores]
	INNER JOIN [dbo].[Computers] as [Computers]
	ON [Computers].[id]=[ComputerInStores].[computer_id]
	INNER JOIN [dbo].[Stores] as [Stores]
	ON [Stores].[id]=[ComputerInStores].[store_id]
GO

GRANT SELECT ON [dbo].[View_ComputerInStores] TO [comp_viewers] AS [dbo]
GO

/****** Object:  View [dbo].[View_computers]    Script Date: 26.12.17 20:36:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[View_computers]
AS
SELECT        
id, 
name,
[video],
[videogb],
[memory],
[hdd],
[optidrive],
[monit],
[moninches]
FROM dbo.Computers


GO

GRANT SELECT ON [dbo].[View_computers] TO [comp_admins] AS [dbo]
GO

GRANT SELECT ON [dbo].[View_computers] TO [comp_viewers] AS [dbo]
GO

CREATE FUNCTION [dbo].[SearchComputerHdd]
(
	
	@Hdd [int]
	,@HddOperator [varchar](16) 
		
)
RETURNS 
	@Result	TABLE ([Id] [int])
AS
BEGIN
	-- Operators:
	--	like		nvarchar
	--	notlike		nvarchar
	--	equal		nvarchar, int
	--	notequal	nvarchar, int
	--	less		int,float
	--	great		int,float
	--	between		float
	--	all			nvarchar, int, float
	--declare @Ids	TABLE ([Id] [int])

	
	if (@HddOperator='less')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
		where	[hdd] < @Hdd
				
	end
	else if (@HddOperator='great')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
		where	[hdd] > @Hdd
				
	end
	else if (@HddOperator='equal')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
		where	[hdd] = @Hdd
				
	end
	else if (@HddOperator='notequal')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
		where	[hdd] != @Hdd
				
	end
	else if (@HddOperator='all')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
						
	end



	RETURN 
END


GO

CREATE FUNCTION [dbo].[SearchComputerMemory]
(
	
	@Memory [int]
	,@MemoryOperator [varchar](16) 
		
)
RETURNS 
	@Result	TABLE ([Id] [int])
AS
BEGIN
	-- Operators:
	--	like		nvarchar
	--	notlike		nvarchar
	--	equal		nvarchar, int
	--	notequal	nvarchar, int
	--	less		int,float
	--	great		int,float
	--	between		float
	--	all			nvarchar, int, float
	--declare @Ids	TABLE ([Id] [int])

	
	if (@MemoryOperator='less')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
		where	[memory] < @Memory
				
	end
	else if (@MemoryOperator='great')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
		where	[memory] > @Memory
				
	end
	else if (@MemoryOperator='equal')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
		where	[memory] = @Memory
				
	end
	else if (@MemoryOperator='notequal')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
		where	[memory] != @Memory
				
	end
	else if (@MemoryOperator='all')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
						
	end



	RETURN 
END


GO

create FUNCTION [dbo].[SearchComputerPrice]
(
	
	@Price1 [float]
	,@Price2 [float]
	,@PriceOperator [varchar](16) 

)
RETURNS 
	@Result	TABLE ([Id] [int])
AS
BEGIN
	-- Operators:
	--	like		nvarchar
	--	notlike		nvarchar
	--	equal		nvarchar, int
	--	notequal	nvarchar, int
	--	less		int,float
	--	great		int,float
	--	between		float
	--	all			nvarchar, int, float
	--declare @Ids	TABLE ([Id] [int])

	
	if (@PriceOperator='less')
	begin
		insert into @Result([Id])
		select [computer_id] from [dbo].[ComputerInStores] 
		where	[price] < @Price1
				
	end
	else if (@PriceOperator='great')
	begin
		insert into @Result([Id])
		select [computer_id] from [dbo].[ComputerInStores] 
		where	[price] > @Price1
				
	end
	else if (@PriceOperator='between')
	begin
		insert into @Result([Id])
		select [computer_id] from [dbo].[ComputerInStores] 
		where	[price] between @Price1 and @Price2
				
	end
	
	else if (@PriceOperator='all')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
						
	end



	RETURN 
END


GO

CREATE FUNCTION [dbo].[SearchComputerVideoGb]
(
	
	@VideoGb [int]
	,@VideoGbOperator [varchar](16) 
		
)
RETURNS 
	@Result	TABLE ([Id] [int])
AS
BEGIN
	-- Operators:
	--	like		nvarchar
	--	notlike		nvarchar
	--	equal		nvarchar, int
	--	notequal	nvarchar, int
	--	less		int,float
	--	great		int,float
	--	between		float
	--	all			nvarchar, int, float
	--declare @Ids	TABLE ([Id] [int])

	
	if (@VideoGbOperator='less')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
		where	[videoGb] < @VideoGb
				
	end
	else if (@VideoGbOperator='great')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
		where	[videoGb] > @VideoGb
				
	end
	else if (@VideoGbOperator='equal')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
		where	[videoGb] = @VideoGb
				
	end
	else if (@VideoGbOperator='notequal')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
		where	[videoGb] != @VideoGb
				
	end
	else if (@VideoGbOperator='all')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
						
	end



	RETURN 
END


GO

CREATE FUNCTION [dbo].[SearchComputerVideoName]
(
	
	@VideoName [nvarchar](128)
	,@VideoNameOperator [varchar](16) 
		
)
RETURNS 
	@Result	TABLE ([Id] [int])
AS
BEGIN
	-- Operators:
	--	like		nvarchar
	--	notlike		nvarchar
	--	equal		nvarchar, int
	--	notequal	nvarchar, int
	--	less		int,float
	--	great		int,float
	--	between		float
	--	all			nvarchar, int, float
	--declare @Ids	TABLE ([Id] [int])

	
	if (@VideoNameOperator='like')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
		where	[video] like N'%'+@VideoName+N'%'
				
	end
	else if (@VideoNameOperator='notlike')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
		where	[video] not like N'%'+@VideoName+N'%'
				
	end
	else if (@VideoNameOperator='equal')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
		where	[video] = @VideoName
				
	end
	else if (@VideoNameOperator='notequal')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
		where	[video] != @VideoName
				
	end
	else if (@VideoNameOperator='all')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
			
	end
	



	RETURN 
END


GO

CREATE FUNCTION [dbo].[SearchStoreAddress]
(
	
	@StoreAddress [nvarchar](max)
	,@StoreAddressOperator [varchar](16) 
		
)
RETURNS 
	@Result	TABLE ([Id] [int])
AS
BEGIN
	-- Operators:
	--	like		nvarchar
	--	notlike		nvarchar
	--	equal		nvarchar, int
	--	notequal	nvarchar, int
	--	less		int,float
	--	great		int,float
	--	between		float
	--	all			nvarchar, int, float
	--declare @Ids	TABLE ([Id] [int])

	
	if (@StoreAddressOperator='like')
	begin
		insert into @Result([Id])
		select 
			[ComputerInStores].[computer_id]
		from [dbo].[ComputerInStores] as [ComputerInStores]
			inner join [dbo].[Stores] as [Stores]
			on [Stores].[id]=[ComputerInStores].[store_id]
		where	[Stores].[Address] like N'%'+@StoreAddress+N'%'
				
	end
	else if (@StoreAddressOperator='notlike')
	begin
		insert into @Result([Id])
		select 
			[ComputerInStores].[computer_id]
		from [dbo].[ComputerInStores] as [ComputerInStores]
			inner join [dbo].[Stores] as [Stores]
			on [Stores].[id]=[ComputerInStores].[store_id]
		where	[Stores].[Address] not like N'%'+@StoreAddress+N'%'
	end
	else if (@StoreAddressOperator='all')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
						
	end



	RETURN 
END


GO

CREATE FUNCTION [dbo].[SearchStoreName]
(
	
	@StoreName [nvarchar](128)
	,@StoreNameOperator [varchar](16) 
		
)
RETURNS 
	@Result	TABLE ([Id] [int])
AS
BEGIN
	-- Operators:
	--	like		nvarchar
	--	notlike		nvarchar
	--	equal		nvarchar, int
	--	notequal	nvarchar, int
	--	less		int,float
	--	great		int,float
	--	between		float
	--	all			nvarchar, int, float
	--declare @Ids	TABLE ([Id] [int])

	
	if (@StoreNameOperator='equal')
	begin
		insert into @Result([Id])
		select 
			[ComputerInStores].[computer_id]
		from [dbo].[ComputerInStores] as [ComputerInStores]
			inner join [dbo].[Stores] as [Stores]
			on [Stores].[id]=[ComputerInStores].[store_id]
		where	[Stores].[name] = @StoreName
				
	end
	else if (@StoreNameOperator='notequal')
	begin
		insert into @Result([Id])
		select 
			[ComputerInStores].[computer_id]
		from [dbo].[ComputerInStores] as [ComputerInStores]
			inner join [dbo].[Stores] as [Stores]
			on [Stores].[id]=[ComputerInStores].[store_id]
		where	[Stores].[name] != @StoreName
				
	end
	else if (@StoreNameOperator='like')
	begin
		insert into @Result([Id])
		select 
			[ComputerInStores].[computer_id]
		from [dbo].[ComputerInStores] as [ComputerInStores]
			inner join [dbo].[Stores] as [Stores]
			on [Stores].[id]=[ComputerInStores].[store_id]
		where	[Stores].[name] like N'%'+@StoreName+N'%'
				
	end
	else if (@StoreNameOperator='notlike')
	begin
		insert into @Result([Id])
		select 
			[ComputerInStores].[computer_id]
		from [dbo].[ComputerInStores] as [ComputerInStores]
			inner join [dbo].[Stores] as [Stores]
			on [Stores].[id]=[ComputerInStores].[store_id]
		where	[Stores].[name] not like N'%'+@StoreName+N'%'
	end
	else if (@StoreNameOperator='all')
	begin
		insert into @Result([Id])
		select [id] from [dbo].[Computers] 
						
	end



	RETURN 
END


GO

CREATE FUNCTION [dbo].[SearchComputersAndStores]
(
	@CompName [nvarchar](128)
	,@CompNameOperator [varchar](16) 

	,@VideoName [nvarchar](128)
	,@VideoNameOperator [varchar](16) 

	,@VideoGb [int]
	,@VideoGbOperator [varchar](16) 

	,@Memory [int]
	,@MemoryOperator [varchar](16) 

	,@Hdd [int]
	,@HddOperator [varchar](16) 

	,@StoreName [nvarchar](128)
	,@StoreNameOperator [varchar](16) 

	,@StoreAddress [nvarchar](max)
	,@StoreAddressOperator [varchar](16) 

	,@Price1 [float]
	,@Price2 [float]
	,@PriceOperator [varchar](16) 
)
RETURNS 
	@Result	TABLE (
		[Id] [int]
		,[FullComputerName] [nvarchar](max)
	)
AS
BEGIN
	-- Operators:
	--	like		nvarchar,nvarchar(max)
	--	notlike		nvarchar,nvarchar(max)
	--	equal		nvarchar, int
	--	notequal	nvarchar, int
	--	less		int,float
	--	great		int,float
	--	between		float
	--	all			nvarchar, int, float
	declare @Ids	TABLE ([Id] [int])

	
	if (@CompNameOperator='like')
	begin
		insert into @Ids([Id])
		select [id] from [dbo].[Computers] 
		where	[name] like N'%'+@CompName+N'%'
				and [id] in (select [id] from [dbo].[SearchComputerVideoName](@VideoName,@VideoNameOperator))
				and [id] in (select [id] from [dbo].[SearchComputerVideoGb](@VideoGb,@VideoGbOperator))
				and [id] in (select [id] from [dbo].[SearchComputerMemory](@Memory,@MemoryOperator))
				and [id] in (select [id] from [dbo].[SearchComputerHdd](@Hdd,@HddOperator))
				and [id] in (select [id] from [dbo].[SearchStoreName](@StoreName,@StoreNameOperator))
				and [id] in (select [id] from [dbo].[SearchStoreAddress](@StoreAddress,@StoreAddressOperator))
				and [id] in (select [id] from [dbo].[SearchComputerPrice](@Price1,@Price2,@PriceOperator))
	end
	else if (@CompNameOperator='notlike')
	begin
		insert into @Ids([Id])
		select [id] from [dbo].[Computers] 
		where	[name] not like N'%'+@CompName+N'%'
				and [id] in (select [id] from [dbo].[SearchComputerVideoName](@VideoName,@VideoNameOperator))
				and [id] in (select [id] from [dbo].[SearchComputerVideoGb](@VideoGb,@VideoGbOperator))
				and [id] in (select [id] from [dbo].[SearchComputerMemory](@Memory,@MemoryOperator))
				and [id] in (select [id] from [dbo].[SearchComputerHdd](@Hdd,@HddOperator))
				and [id] in (select [id] from [dbo].[SearchStoreName](@StoreName,@StoreNameOperator))
				and [id] in (select [id] from [dbo].[SearchStoreAddress](@StoreAddress,@StoreAddressOperator))
				and [id] in (select [id] from [dbo].[SearchComputerPrice](@Price1,@Price2,@PriceOperator))
	end
	else if (@CompNameOperator='equal')
	begin
		insert into @Ids([Id])
		select [id] from [dbo].[Computers] 
		where	[name] = @CompName
				and [id] in (select [id] from [dbo].[SearchComputerVideoName](@VideoName,@VideoNameOperator))
				and [id] in (select [id] from [dbo].[SearchComputerVideoGb](@VideoGb,@VideoGbOperator))
				and [id] in (select [id] from [dbo].[SearchComputerMemory](@Memory,@MemoryOperator))
				and [id] in (select [id] from [dbo].[SearchComputerHdd](@Hdd,@HddOperator))
				and [id] in (select [id] from [dbo].[SearchStoreName](@StoreName,@StoreNameOperator))
				and [id] in (select [id] from [dbo].[SearchStoreAddress](@StoreAddress,@StoreAddressOperator))
				and [id] in (select [id] from [dbo].[SearchComputerPrice](@Price1,@Price2,@PriceOperator))
	end
	else if (@CompNameOperator='notequal')
	begin
		insert into @Ids([Id])
		select [id] from [dbo].[Computers] 
		where	[name] != @CompName
				and [id] in (select [id] from [dbo].[SearchComputerVideoName](@VideoName,@VideoNameOperator))
				and [id] in (select [id] from [dbo].[SearchComputerVideoGb](@VideoGb,@VideoGbOperator))
				and [id] in (select [id] from [dbo].[SearchComputerMemory](@Memory,@MemoryOperator))
				and [id] in (select [id] from [dbo].[SearchComputerHdd](@Hdd,@HddOperator))
				and [id] in (select [id] from [dbo].[SearchStoreName](@StoreName,@StoreNameOperator))
				and [id] in (select [id] from [dbo].[SearchStoreAddress](@StoreAddress,@StoreAddressOperator))
				and [id] in (select [id] from [dbo].[SearchComputerPrice](@Price1,@Price2,@PriceOperator))
	end
	else if (@CompNameOperator='all')
	begin
		insert into @Ids([Id])
		select [id] from [dbo].[Computers] 
		where	[id] in (select [id] from [dbo].[SearchComputerVideoName](@VideoName,@VideoNameOperator))
				and [id] in (select [id] from [dbo].[SearchComputerVideoGb](@VideoGb,@VideoGbOperator))
				and [id] in (select [id] from [dbo].[SearchComputerMemory](@Memory,@MemoryOperator))
				and [id] in (select [id] from [dbo].[SearchComputerHdd](@Hdd,@HddOperator))
				and [id] in (select [id] from [dbo].[SearchStoreName](@StoreName,@StoreNameOperator))
				and [id] in (select [id] from [dbo].[SearchStoreAddress](@StoreAddress,@StoreAddressOperator))
				and [id] in (select [id] from [dbo].[SearchComputerPrice](@Price1,@Price2,@PriceOperator))
	end
	
	insert into @Result([Id],[FullComputerName])
	SELECT 
		[id]
		,[FullComputerName]
	FROM [dbo].[admin_FullComputerName]
	where id in (select id from @Ids)

	

	RETURN 
END


GO
GRANT SELECT ON [dbo].[SearchComputersAndStores] TO [comp_viewers] AS [dbo]
GO

