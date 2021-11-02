 
/****** Object:  Database [StockCoreDb]    Script Date: 10/28/2021 10:29:02 PM ******/
CREATE Schema [StockCoreDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockCoreDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\StockCoreDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StockCoreDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\StockCoreDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockCoreDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockCoreDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockCoreDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockCoreDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockCoreDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockCoreDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockCoreDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockCoreDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockCoreDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockCoreDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockCoreDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockCoreDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockCoreDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockCoreDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockCoreDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockCoreDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StockCoreDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockCoreDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockCoreDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockCoreDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockCoreDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockCoreDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [StockCoreDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockCoreDb] SET RECOVERY FULL 
GO
ALTER DATABASE [StockCoreDb] SET  MULTI_USER 
GO
ALTER DATABASE [StockCoreDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockCoreDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockCoreDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockCoreDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StockCoreDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StockCoreDb', N'ON'
GO
USE [StockCoreDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/28/2021 10:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryModels]    Script Date: 10/28/2021 10:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryModels](
	[Id] [uniqueidentifier] NOT NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_CategoryModels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyModels]    Script Date: 10/28/2021 10:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyModels](
	[Id] [uniqueidentifier] NOT NULL,
	[CompanyName] [nvarchar](max) NULL,
 CONSTRAINT [PK_CompanyModels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemModels]    Script Date: 10/28/2021 10:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemModels](
	[Id] [uniqueidentifier] NOT NULL,
	[CategoryId] [uniqueidentifier] NOT NULL,
	[CompanyId] [uniqueidentifier] NOT NULL,
	[ItemName] [nvarchar](max) NOT NULL,
	[CategoryModelId] [uniqueidentifier] NULL,
	[CompanyModelId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ItemModels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StockModels]    Script Date: 10/28/2021 10:29:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockModels](
	[Id] [uniqueidentifier] NOT NULL,
	[ItemId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_StockModels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211023102410_InitialCreate', N'5.0.11')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211024061029_build-model-relation', N'5.0.11')
INSERT [dbo].[CategoryModels] ([Id], [CategoryName]) VALUES (N'90418bfb-fae8-4f40-3086-08d99613c725', N'Stationary')
INSERT [dbo].[CategoryModels] ([Id], [CategoryName]) VALUES (N'7ccd1b56-0779-4b01-12b8-08d9961ec9a1', N'Electronics')
INSERT [dbo].[CategoryModels] ([Id], [CategoryName]) VALUES (N'8f65b812-cafe-43a3-12b9-08d9961ec9a1', N'Cookeries')
INSERT [dbo].[CategoryModels] ([Id], [CategoryName]) VALUES (N'9aa18ad1-7ddd-41dc-12ba-08d9961ec9a1', N'Food')
INSERT [dbo].[CategoryModels] ([Id], [CategoryName]) VALUES (N'f15834ba-8c3b-4adf-12bb-08d9961ec9a1', N'Snacks')
INSERT [dbo].[CompanyModels] ([Id], [CompanyName]) VALUES (N'ca3123ee-993c-49a0-0fc2-08d996b24943', N'Pran')
INSERT [dbo].[CompanyModels] ([Id], [CompanyName]) VALUES (N'dd1d50e5-369a-464e-0fc3-08d996b24943', N'BD Foods')
INSERT [dbo].[ItemModels] ([Id], [CategoryId], [CompanyId], [ItemName], [CategoryModelId], [CompanyModelId]) VALUES (N'83de7bec-405b-4064-9bd7-08d996b78fd1', N'f15834ba-8c3b-4adf-12bb-08d9961ec9a1', N'ca3123ee-993c-49a0-0fc2-08d996b24943', N'Dal Baja', NULL, NULL)
INSERT [dbo].[ItemModels] ([Id], [CategoryId], [CompanyId], [ItemName], [CategoryModelId], [CompanyModelId]) VALUES (N'0f61d893-3fb4-4e94-9bd8-08d996b78fd1', N'f15834ba-8c3b-4adf-12bb-08d9961ec9a1', N'ca3123ee-993c-49a0-0fc2-08d996b24943', N'Motor Baja', NULL, NULL)
INSERT [dbo].[ItemModels] ([Id], [CategoryId], [CompanyId], [ItemName], [CategoryModelId], [CompanyModelId]) VALUES (N'66b7a10c-e949-44e2-6d99-08d996b7b597', N'f15834ba-8c3b-4adf-12bb-08d9961ec9a1', N'ca3123ee-993c-49a0-0fc2-08d996b24943', N'Biscuit', NULL, NULL)
/****** Object:  Index [IX_ItemModels_CategoryModelId]    Script Date: 10/28/2021 10:29:04 PM ******/
CREATE NONCLUSTERED INDEX [IX_ItemModels_CategoryModelId] ON [dbo].[ItemModels]
(
	[CategoryModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ItemModels_CompanyModelId]    Script Date: 10/28/2021 10:29:04 PM ******/
CREATE NONCLUSTERED INDEX [IX_ItemModels_CompanyModelId] ON [dbo].[ItemModels]
(
	[CompanyModelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ItemModels]  WITH CHECK ADD  CONSTRAINT [FK_ItemModels_CategoryModels_CategoryModelId] FOREIGN KEY([CategoryModelId])
REFERENCES [dbo].[CategoryModels] ([Id])
GO
ALTER TABLE [dbo].[ItemModels] CHECK CONSTRAINT [FK_ItemModels_CategoryModels_CategoryModelId]
GO
ALTER TABLE [dbo].[ItemModels]  WITH CHECK ADD  CONSTRAINT [FK_ItemModels_CompanyModels_CompanyModelId] FOREIGN KEY([CompanyModelId])
REFERENCES [dbo].[CompanyModels] ([Id])
GO
ALTER TABLE [dbo].[ItemModels] CHECK CONSTRAINT [FK_ItemModels_CompanyModels_CompanyModelId]
GO
USE [master]
GO
ALTER DATABASE [StockCoreDb] SET  READ_WRITE 
GO
