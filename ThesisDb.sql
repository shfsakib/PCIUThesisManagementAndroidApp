USE [master]
GO
/****** Object:  Database [ThesisDb]    Script Date: 8/6/2021 10:30:16 PM ******/
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
/****** Object:  Table [dbo].[Application]    Script Date: 8/6/2021 10:30:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[ApplicationId] [int] IDENTITY(1,1) NOT NULL,
	[Program] [nvarchar](50) NULL,
	[Type] [nvarchar](1000) NULL,
	[Status] [nvarchar](50) NULL,
	[StudentId] [int] NULL,
	[ApplicationText] [nvarchar](max) NULL,
	[ApplicationTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssignSupervisor]    Script Date: 8/6/2021 10:30:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignSupervisor](
	[AssignId] [int] IDENTITY(1,1) NOT NULL,
	[SupervisorId] [nvarchar](50) NOT NULL,
	[StudentId] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[AssignTime] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ReqSupervisor] PRIMARY KEY CLUSTERED 
(
	[AssignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentInfo]    Script Date: 8/6/2021 10:30:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentInfo](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](max) NOT NULL,
	[InTime] [nvarchar](50) NULL,
 CONSTRAINT [PK_DepartmentInfo] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notice]    Script Date: 8/6/2021 10:30:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notice](
	[NoticeId] [nvarchar](50) NULL,
	[Notice] [nvarchar](max) NOT NULL,
	[NoticeTime] [nvarchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 8/6/2021 10:30:16 PM ******/
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
	[DepartmentId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Report]    Script Date: 8/6/2021 10:30:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportId] [nvarchar](50) NOT NULL,
	[SupervisorId] [nvarchar](50) NOT NULL,
	[StudentId] [nvarchar](50) NOT NULL,
	[Subject] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[FileName] [nvarchar](max) NULL,
	[Attachment] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NOT NULL,
	[SendTime] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resource]    Script Date: 8/6/2021 10:30:16 PM ******/
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
SET IDENTITY_INSERT [dbo].[Application] ON 

INSERT [dbo].[Application] ([ApplicationId], [Program], [Type], [Status], [StudentId], [ApplicationText], [ApplicationTime]) VALUES (1, N'Bachelor', N'Before Assign', N'A', 1001, N'
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
                    ', N'03/08/2021_08:16:45')
SET IDENTITY_INSERT [dbo].[Application] OFF
GO
SET IDENTITY_INSERT [dbo].[AssignSupervisor] ON 

INSERT [dbo].[AssignSupervisor] ([AssignId], [SupervisorId], [StudentId], [Status], [AssignTime]) VALUES (1, N'1002', N'1001', N'A', N'03/08/2021_09:55:48')
SET IDENTITY_INSERT [dbo].[AssignSupervisor] OFF
GO
SET IDENTITY_INSERT [dbo].[DepartmentInfo] ON 

INSERT [dbo].[DepartmentInfo] ([DepartmentId], [DepartmentName], [InTime]) VALUES (1, N'CSE', N'24/01/2021_10:21:34')
INSERT [dbo].[DepartmentInfo] ([DepartmentId], [DepartmentName], [InTime]) VALUES (2, N'EEE', N'29/07/2021_12:24:04')
SET IDENTITY_INSERT [dbo].[DepartmentInfo] OFF
GO
INSERT [dbo].[Notice] ([NoticeId], [Notice], [NoticeTime]) VALUES (N'1001', N'This is a test Notice', N'04/02/2021_12:44:56')
GO
INSERT [dbo].[Registration] ([RegistrationId], [Name], [Email], [MobileNo], [Type], [Picture], [DepartmentId], [Designation], [FreeScheduleFrom], [FreeScheduleTo], [IdNo], [Password], [Status], [InTime], [GroupLink], [Program]) VALUES (N'1001', N'Utsha Dutta', N'shfkte@gmail.com', N'01821223355', N'Student', N'/photos/1002.png', 1, N'', N'', N'', N'CSE02405112', N'123', N'A', N'29/07/2021_01:53:45', N'', N'Bachelor')
INSERT [dbo].[Registration] ([RegistrationId], [Name], [Email], [MobileNo], [Type], [Picture], [DepartmentId], [Designation], [FreeScheduleFrom], [FreeScheduleTo], [IdNo], [Password], [Status], [InTime], [GroupLink], [Program]) VALUES (N'1002', N'Taofica Amrine', N'Taofica@gmail.com', N'01921893213', N'Teacher', N'/photos/1003.png', 1, N'Chairman', N'10:00', N'18:00', N'CSE09023325', N'123', N'A', N'29/07/2021_01:56:44', N'wa.group.com?gid=10920192013219', N'--Select Program--')
INSERT [dbo].[Registration] ([RegistrationId], [Name], [Email], [MobileNo], [Type], [Picture], [DepartmentId], [Designation], [FreeScheduleFrom], [FreeScheduleTo], [IdNo], [Password], [Status], [InTime], [GroupLink], [Program]) VALUES (N'1003', N'Mr. Coordinator', N'Coordinator@gmail.com', N'01921092188', N'Coordinator', N'/photos/1004.png', 0, N'', N'', N'', N'CSE09023933', N'123', N'A', N'29/07/2021_01:59:07', N'', NULL)
INSERT [dbo].[Registration] ([RegistrationId], [Name], [Email], [MobileNo], [Type], [Picture], [DepartmentId], [Designation], [FreeScheduleFrom], [FreeScheduleTo], [IdNo], [Password], [Status], [InTime], [GroupLink], [Program]) VALUES (N'1004', N'Salekur Rahman', N'salek@gmail.com', N'01921092389', N'Student', N'/photos/1004.png', 1, N'', N'', N'', N'CSE02505115', N'123', N'A', N'06/08/2021_06:07:31', N'', N'Bachelor')
INSERT [dbo].[Registration] ([RegistrationId], [Name], [Email], [MobileNo], [Type], [Picture], [DepartmentId], [Designation], [FreeScheduleFrom], [FreeScheduleTo], [IdNo], [Password], [Status], [InTime], [GroupLink], [Program]) VALUES (N'1005', N'Manoara Begum', N'Manoara@gmail.com', N'01982189834', N'Teacher', N'/photos/1005.png', 1, N'Sr. Lecturer', N'22:08', N'17:59', N'CSE09024905', N'123', N'A', N'06/08/2021_06:10:03', N'', N'')
GO
INSERT [dbo].[Report] ([ReportId], [SupervisorId], [StudentId], [Subject], [Description], [FileName], [Attachment], [Status], [SendTime], [Type]) VALUES (N'1001', N'1001', N'1002', N'First Phase', N'Please check the attachment', N'Everything-1.4.1.969.x86-Setup.exe', N'/photos/1001Everything-1.4.1.969.x86-Setup.exe', N'A', N'29/01/2021_03:24:17', N'Report')
INSERT [dbo].[Report] ([ReportId], [SupervisorId], [StudentId], [Subject], [Description], [FileName], [Attachment], [Status], [SendTime], [Type]) VALUES (N'1002', N'', N'1001', N'', N'', N'Home Contructor Finder App', N'/photos/1002IDM 6.35 build 3 incl Patch [CrackingPatching] - Fake Serial Fixed.zip', N'A', N'29/01/2021_08:29:30', N'Project')
GO
INSERT [dbo].[Resource] ([ResourceId], [ResourceName], [Path], [InTime], [Type]) VALUES (N'1001', N'Data Mining Process', N'/photos/1001IMAGE.zip', N'04/02/2021_01:51:29', N'File')
INSERT [dbo].[Resource] ([ResourceId], [ResourceName], [Path], [InTime], [Type]) VALUES (N'1002', N'Demo File', N'/photos/1002seen messege.zip', N'04/02/2021_01:51:36', N'File')
INSERT [dbo].[Resource] ([ResourceId], [ResourceName], [Path], [InTime], [Type]) VALUES (N'1003', N'Management system project', N'/photos/1003WhItE-CALL-ICON.zip', N'04/02/2021_01:51:45', N'File')
INSERT [dbo].[Resource] ([ResourceId], [ResourceName], [Path], [InTime], [Type]) VALUES (N'1004', N'Demo Video', N'/photos/1004videoplayback.mp4', N'04/02/2021_01:51:52', N'Video')
GO
USE [master]
GO
ALTER DATABASE [ThesisDb] SET  READ_WRITE 
GO
