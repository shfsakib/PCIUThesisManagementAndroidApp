USE [master]
GO
/****** Object:  Database [ThesisDb]    Script Date: 11/3/2021 10:26:04 PM ******/
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
/****** Object:  Table [dbo].[Application]    Script Date: 11/3/2021 10:26:05 PM ******/
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
/****** Object:  Table [dbo].[AssignExaminer]    Script Date: 11/3/2021 10:26:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignExaminer](
	[AssignId] [int] IDENTITY(1,1) NOT NULL,
	[ExaminerId] [nvarchar](50) NOT NULL,
	[RegistrationId] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[AssignTime] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AssignExaminer] PRIMARY KEY CLUSTERED 
(
	[AssignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssignSupervisor]    Script Date: 11/3/2021 10:26:05 PM ******/
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
/****** Object:  Table [dbo].[Notice]    Script Date: 11/3/2021 10:26:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notice](
	[NoticeId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](1000) NULL,
	[Description] [nvarchar](max) NOT NULL,
	[NoticeTime] [nvarchar](50) NOT NULL,
	[RegistrationId] [int] NULL,
	[Path] [nvarchar](max) NULL,
 CONSTRAINT [PK_Notice] PRIMARY KEY CLUSTERED 
(
	[NoticeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 11/3/2021 10:26:05 PM ******/
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
/****** Object:  Table [dbo].[Report]    Script Date: 11/3/2021 10:26:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportId] [int] IDENTITY(1001,1) NOT NULL,
	[RegistrationId] [nvarchar](50) NOT NULL,
	[Topic] [nvarchar](max) NOT NULL,
	[About] [nvarchar](max) NULL,
	[Attachment] [nvarchar](max) NULL,
	[UploadTime] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 11/3/2021 10:26:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resource](
	[ResourceId] [int] IDENTITY(1001,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Path] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[SendTime] [nvarchar](50) NULL,
	[RegistrationId] [int] NULL,
	[SupervisorId] [int] NULL,
 CONSTRAINT [PK_Resource] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Application] ON 

INSERT [dbo].[Application] ([ApplicationId], [Program], [Type], [Status], [RegistrationId], [ApplicationText], [ApplicationTime]) VALUES (1, N'Bachelor', N'Before Assign', N'A', 1003, N'
                        <div><b>Date</b></div>
                        <div>
                            <b>
                                <br>
                            </b>
                        </div>
                        <div>To</div>
                        <div>The Chairman</div>
                        <div>Department of <span style="font-weight: 700;">Department Name</span>,</div>
                        <div>Port City International University. </div>
                        <div>
                            <br>
                        </div>
                        <div>Through: <b>Your supervisor name</b>,</div>
                        <div>Department of <b>Department Name</b>,</div>
                        <div>Port City International University. </div>
                        <div>
                            <br>
                        </div>
                        <div> ____________________</div>
                        <div>
                                            Signature<br>
                        </div>
                        <div>
                            <br>
                        </div>
                        <div>Subject:  <span style="font-weight: 700;"><u>Application for attending (Subject Name)</u></span>.</div>
                        <div>
                            <br>
                        </div>
                        <div>Dear Sir/Madam,</div>
                        <div>With due respect I would like to inform you that I am a student of <b>(B.Sc./M.Sc.)</b> in <span style="font-weight: 700;">Department Name</span> at Port City International University. My name is <b>Student Name</b> and ID number is <b>Student Id</b>, Program is <span style="font-weight: 700;">(B.Sc./M.Sc.)</span> in <span style="font-weight: 700;">Department Name</span>, Department of <span style="font-weight: 700;">Department Name</span>. </div>
                        <div>I am requesting you to give me permission to attend my <b>(presentation name)</b>. Therefore, I am looking forward to your kind consideration. Lastly, I would be very grateful to you if you consider my request.</div>
                        <div>
                            <br>
                        </div>
                        <div>Sincerely yours</div>
                        <div>
                            <br>
                        </div>
                        <div> ______________________</div>
                        <div>
                            <span style="font-weight: 700;">Student Name</span><br>
                        </div>
                        <div>ID: <span style="font-weight: 700;">Student Id</span></div>
                        <div><span style="font-weight: 700;">(B.Sc./M.Sc.)</span> in <span style="font-weight: 700;">Department Name</span></div>
                        <div>Port City International University</div>
                    ', N'02/11/2021_08:20:14')
SET IDENTITY_INSERT [dbo].[Application] OFF
SET IDENTITY_INSERT [dbo].[AssignExaminer] ON 

INSERT [dbo].[AssignExaminer] ([AssignId], [ExaminerId], [RegistrationId], [Status], [AssignTime]) VALUES (1, N'1002', N'1003', N'A', N'02/11/2021_10:50:12')
SET IDENTITY_INSERT [dbo].[AssignExaminer] OFF
SET IDENTITY_INSERT [dbo].[AssignSupervisor] ON 

INSERT [dbo].[AssignSupervisor] ([AssignId], [SupervisorId], [RegistrationId], [Status], [AssignTime]) VALUES (1, N'1002', N'1003', N'A', N'02/11/2021_08:20:47')
SET IDENTITY_INSERT [dbo].[AssignSupervisor] OFF
SET IDENTITY_INSERT [dbo].[Notice] ON 

INSERT [dbo].[Notice] ([NoticeId], [Title], [Description], [NoticeTime], [RegistrationId], [Path]) VALUES (1, N'Proposal Presentation', N'CSE 16th proposal presentation will be held in 10th november,2021.', N'02/11/2021_09:47:46', 1001, N'')
SET IDENTITY_INSERT [dbo].[Notice] OFF
INSERT [dbo].[Registration] ([RegistrationId], [Name], [Email], [MobileNo], [Type], [Picture], [Department], [Designation], [FreeScheduleFrom], [FreeScheduleTo], [IdNo], [Password], [Status], [InTime], [GroupLink], [Program]) VALUES (N'1001', N'Mr. Coordinator', N'coordinator@gmail.com', N'01921092189', N'Coordinator', N'/photos/1001.png', N'', N'', N'', N'', N'CSE 05 0123', N'123', N'A', N'02/11/2021_08:15:42', N'', N'')
INSERT [dbo].[Registration] ([RegistrationId], [Name], [Email], [MobileNo], [Type], [Picture], [Department], [Designation], [FreeScheduleFrom], [FreeScheduleTo], [IdNo], [Password], [Status], [InTime], [GroupLink], [Program]) VALUES (N'1002', N'Taofica Amrine', N'taofica@gmail.com', N'01821982312', N'Teacher', N'/photos/1002.png', N'CSE', N'Chairman', N'09:00', N'21:30', N'CSE 05 132', N'123', N'A', N'02/11/2021_08:17:23', N'', N'')
INSERT [dbo].[Registration] ([RegistrationId], [Name], [Email], [MobileNo], [Type], [Picture], [Department], [Designation], [FreeScheduleFrom], [FreeScheduleTo], [IdNo], [Password], [Status], [InTime], [GroupLink], [Program]) VALUES (N'1003', N'Utsha Dutta', N'utsha@gmail.com', N'01874382387', N'Student', N'/photos/1003.png', N'CSE', N'', N'', N'', N'CSE 010 05689', N'123', N'A', N'02/11/2021_08:18:37', N'', N'Bachelor')
SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([ReportId], [RegistrationId], [Topic], [About], [Attachment], [UploadTime], [Type]) VALUES (1001, N'1003', N'Home Constructor App', N'Test', N'/Attachment/11521821DemoSampleForms.zip', N'03/11/2021_09:50:06', N'Project')
SET IDENTITY_INSERT [dbo].[Report] OFF
SET IDENTITY_INSERT [dbo].[Resource] ON 

INSERT [dbo].[Resource] ([ResourceId], [Title], [Path], [Description], [SendTime], [RegistrationId], [SupervisorId]) VALUES (1006, N'Project progress', N'/Attachment/26028821DemoSampleForms.zip', N'Test', N'02/11/2021_09:18:14', 1003, 1002)
SET IDENTITY_INSERT [dbo].[Resource] OFF
USE [master]
GO
ALTER DATABASE [ThesisDb] SET  READ_WRITE 
GO
