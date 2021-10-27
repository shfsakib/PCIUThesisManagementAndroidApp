USE [master]
GO
/****** Object:  Database [ThesisDb]    Script Date: 10/27/2021 8:57:40 PM ******/
CREATE DATABASE [ThesisDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ThesisDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\ThesisDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ThesisDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.LOCAL\MSSQL\DATA\ThesisDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ThesisDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ThesisDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ThesisDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ThesisDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ThesisDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ThesisDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ThesisDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [ThesisDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ThesisDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ThesisDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ThesisDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ThesisDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ThesisDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ThesisDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ThesisDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ThesisDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ThesisDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ThesisDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ThesisDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ThesisDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ThesisDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ThesisDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ThesisDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ThesisDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ThesisDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ThesisDb] SET  MULTI_USER 
GO
ALTER DATABASE [ThesisDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ThesisDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ThesisDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ThesisDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ThesisDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ThesisDb', N'ON'
GO
USE [ThesisDb]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 10/27/2021 8:57:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[ApplicationId] [int] IDENTITY(1,1) NOT NULL,
	[Program] [nvarchar](50) NULL,
	[Type] [nvarchar](1000) NULL,
	[Status] [nvarchar](50) NULL,
	[RegistrationId] [int] NULL,
	[ApplicationText] [nvarchar](max) NULL,
	[ApplicationTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssignSupervisor]    Script Date: 10/27/2021 8:57:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignSupervisor](
	[AssignId] [int] IDENTITY(1,1) NOT NULL,
	[SupervisorId] [nvarchar](50) NOT NULL,
	[RegistrationId] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[AssignTime] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ReqSupervisor] PRIMARY KEY CLUSTERED 
(
	[AssignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notice]    Script Date: 10/27/2021 8:57:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notice](
	[NoticeId] [nvarchar](50) NULL,
	[Notice] [nvarchar](max) NOT NULL,
	[NoticeTime] [nvarchar](50) NOT NULL,
	[RegistrationId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 10/27/2021 8:57:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[RegistrationId] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[MobileNo] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Picture] [nvarchar](max) NULL,
	[Department] [nvarchar](50) NOT NULL,
	[Designation] [nvarchar](max) NULL,
	[FreeScheduleFrom] [nvarchar](50) NULL,
	[FreeScheduleTo] [nvarchar](50) NULL,
	[IdNo] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
	[InTime] [nvarchar](50) NOT NULL,
	[GroupLink] [nvarchar](max) NULL,
	[Program] [nvarchar](50) NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[RegistrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 10/27/2021 8:57:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportId] [nvarchar](50) NOT NULL,
	[SupervisorId] [nvarchar](50) NOT NULL,
	[RegistrationId] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileName] [nvarchar](max) NULL,
	[Attachment] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NOT NULL,
	[SendTime] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 10/27/2021 8:57:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[ResourceId] [nvarchar](50) NOT NULL,
	[ResourceName] [nvarchar](max) NOT NULL,
	[Path] [nvarchar](max) NOT NULL,
	[InTime] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [ThesisDb] SET  READ_WRITE 
GO
