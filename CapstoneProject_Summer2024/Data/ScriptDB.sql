USE [master]
GO
CREATE DATABASE [SchoolRules]
USE [SchoolRules]
GO
/****** Object:  Table [dbo].[AttendanceRecord]    Script Date: 5/20/2024 12:01:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceRecord](
	[AttendanceRecordID] [int] IDENTITY(1,1) NOT NULL,
	[StudentInClassID] [int] NOT NULL,
	[TeacherID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[IsPresent] [bit] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AttendanceRecord] PRIMARY KEY CLUSTERED 
(
	[AttendanceRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolYearID] [int] NOT NULL,
	[ClassGroupID] [int] NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](70) NOT NULL,
	[Grade] [tinyint] NOT NULL,
	[TotalPoint] [int] NOT NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassGroup]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassGroup](
	[ClassGroupID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[TimeID] [int] NOT NULL,
	[Hall] [nvarchar](20) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ClassGroup] PRIMARY KEY CLUSTERED 
(
	[ClassGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discipline]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discipline](
	[DisciplineID] [int] IDENTITY(1,1) NOT NULL,
	[ViolationID] [int] NOT NULL,
	[PennaltyID] [int] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Discipline] PRIMARY KEY CLUSTERED 
(
	[DisciplineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluation]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluation](
	[EvaluationID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolYearID] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[From] [date] NOT NULL,
	[To] [date] NOT NULL,
	[Point] [smallint] NOT NULL,
 CONSTRAINT [PK_Evaluation] PRIMARY KEY CLUSTERED 
(
	[EvaluationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvaluationDetail]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluationDetail](
	[ClassID] [int] NOT NULL,
	[EvaluationID] [int] NOT NULL,
 CONSTRAINT [PK_EvaluationDetail] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC,
	[EvaluationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HighSchool]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HighSchool](
	[SchoolID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[Phone] [nvarchar](12) NULL,
	[ImageURL] [nvarchar](500) NULL,
	[WebURL] [nvarchar](500) NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HighSchool] PRIMARY KEY CLUSTERED 
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatrolSchedule]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatrolSchedule](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[SupervisorID] [int] NOT NULL,
	[TeacherID] [int] NOT NULL,
	[From] [date] NOT NULL,
	[To] [date] NOT NULL,
 CONSTRAINT [PK_PatrolSchedule] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Penalty]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Penalty](
	[PenaltyID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolID] [int] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_ActivityType] PRIMARY KEY CLUSTERED 
(
	[PenaltyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Principal]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Principal](
	[PrincipalID] [int] NOT NULL,
	[SchoolID] [int] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PrincipalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisteredSchool]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisteredSchool](
	[RegisteredID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolID] [int] NOT NULL,
	[RegisteredDate] [date] NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_RegisteredSchool] PRIMARY KEY CLUSTERED 
(
	[RegisteredID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [tinyint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolConfig]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolConfig](
	[ConfigID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Code] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SchoolConfig] PRIMARY KEY CLUSTERED 
(
	[ConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolYear]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolYear](
	[SchoolYearID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolID] [int] NOT NULL,
	[Year] [smallint] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_SchoolYear] PRIMARY KEY CLUSTERED 
(
	[SchoolYearID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolID] [int] NOT NULL,
	[Code] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Sex] [bit] NULL,
	[Birthday] [date] NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [nvarchar](12) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentInClass]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentInClass](
	[StudentInClassID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[EnrollDate] [date] NOT NULL,
	[IsSupervisor] [bit] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StudentInClass] PRIMARY KEY CLUSTERED 
(
	[StudentInClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentSupervisor]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentSupervisor](
	[StudentSupervisorID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_StudentSupervisor] PRIMARY KEY CLUSTERED 
(
	[StudentSupervisorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[TeacherID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolID] [int] NOT NULL,
	[Birthday] [date] NOT NULL,
	[Sex] [bit] NOT NULL,
	[UserID] [int] NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[TeacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Time]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Time](
	[TimeID] [int] IDENTITY(1,1) NOT NULL,
	[ClassGroupID] [int] NOT NULL,
	[Slot] [tinyint] NOT NULL,
	[Time] [time](7) NOT NULL,
 CONSTRAINT [PK_Time] PRIMARY KEY CLUSTERED 
(
	[TimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](70) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](255) NULL,
	[RoleID] [tinyint] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Violation]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Violation](
	[ViolationID] [int] IDENTITY(1,1) NOT NULL,
	[ClassID] [int] NOT NULL,
	[ViolationTypeID] [int] NOT NULL,
	[TeacherID] [int] NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Date] [date] NOT NULL,
	[CreatedAt] [date] NULL,
	[CreatedBy] [int] NULL,
	[UpdatedAt] [date] NULL,
	[UpdatedBy] [int] NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Violation] PRIMARY KEY CLUSTERED 
(
	[ViolationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViolationConfig]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViolationConfig](
	[ViolationConfigID] [int] IDENTITY(1,1) NOT NULL,
	[EvaluationID] [int] NOT NULL,
	[ViolationTypeID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ViolationConfig] PRIMARY KEY CLUSTERED 
(
	[ViolationConfigID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViolationGroup]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViolationGroup](
	[ViolationGroupID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_ViolationGroup] PRIMARY KEY CLUSTERED 
(
	[ViolationGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViolationReport]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViolationReport](
	[StudentInClassID] [int] NOT NULL,
	[ViolationID] [int] NOT NULL,
 CONSTRAINT [PK_ViolationReport] PRIMARY KEY CLUSTERED 
(
	[StudentInClassID] ASC,
	[ViolationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViolationType]    Script Date: 5/20/2024 12:01:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViolationType](
	[ViolationTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ViolationGroupID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_ViolationType] PRIMARY KEY CLUSTERED 
(
	[ViolationTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Principa__3DA4677A40A2D88C]    Script Date: 5/20/2024 12:01:22 AM ******/
ALTER TABLE [dbo].[Principal] ADD UNIQUE NONCLUSTERED 
(
	[SchoolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttendanceRecord]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceRecord_StudentInClass] FOREIGN KEY([StudentInClassID])
REFERENCES [dbo].[StudentInClass] ([StudentInClassID])
GO
ALTER TABLE [dbo].[AttendanceRecord] CHECK CONSTRAINT [FK_AttendanceRecord_StudentInClass]
GO
ALTER TABLE [dbo].[AttendanceRecord]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceRecord_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
GO
ALTER TABLE [dbo].[AttendanceRecord] CHECK CONSTRAINT [FK_AttendanceRecord_Teacher]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_ClassGroup] FOREIGN KEY([ClassGroupID])
REFERENCES [dbo].[ClassGroup] ([ClassGroupID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_ClassGroup]
GO
ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_SchoolYear] FOREIGN KEY([SchoolYearID])
REFERENCES [dbo].[SchoolYear] ([SchoolYearID])
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_SchoolYear]
GO
ALTER TABLE [dbo].[Discipline]  WITH CHECK ADD  CONSTRAINT [FK_Discipline_Penalty] FOREIGN KEY([PennaltyID])
REFERENCES [dbo].[Penalty] ([PenaltyID])
GO
ALTER TABLE [dbo].[Discipline] CHECK CONSTRAINT [FK_Discipline_Penalty]
GO
ALTER TABLE [dbo].[Discipline]  WITH CHECK ADD  CONSTRAINT [FK_Discipline_Violation] FOREIGN KEY([ViolationID])
REFERENCES [dbo].[Violation] ([ViolationID])
GO
ALTER TABLE [dbo].[Discipline] CHECK CONSTRAINT [FK_Discipline_Violation]
GO
ALTER TABLE [dbo].[Evaluation]  WITH CHECK ADD  CONSTRAINT [FK_Evaluation_SchoolYear] FOREIGN KEY([SchoolYearID])
REFERENCES [dbo].[SchoolYear] ([SchoolYearID])
GO
ALTER TABLE [dbo].[Evaluation] CHECK CONSTRAINT [FK_Evaluation_SchoolYear]
GO
ALTER TABLE [dbo].[EvaluationDetail]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationDetail_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[EvaluationDetail] CHECK CONSTRAINT [FK_EvaluationDetail_Class]
GO
ALTER TABLE [dbo].[EvaluationDetail]  WITH CHECK ADD  CONSTRAINT [FK_EvaluationDetail_Evaluation] FOREIGN KEY([EvaluationID])
REFERENCES [dbo].[Evaluation] ([EvaluationID])
GO
ALTER TABLE [dbo].[EvaluationDetail] CHECK CONSTRAINT [FK_EvaluationDetail_Evaluation]
GO
ALTER TABLE [dbo].[PatrolSchedule]  WITH CHECK ADD  CONSTRAINT [FK_PatrolSchedule_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[PatrolSchedule] CHECK CONSTRAINT [FK_PatrolSchedule_Class]
GO
ALTER TABLE [dbo].[PatrolSchedule]  WITH CHECK ADD  CONSTRAINT [FK_PatrolSchedule_StudentSupervisor] FOREIGN KEY([SupervisorID])
REFERENCES [dbo].[StudentSupervisor] ([StudentSupervisorID])
GO
ALTER TABLE [dbo].[PatrolSchedule] CHECK CONSTRAINT [FK_PatrolSchedule_StudentSupervisor]
GO
ALTER TABLE [dbo].[PatrolSchedule]  WITH CHECK ADD  CONSTRAINT [FK_PatrolSchedule_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
GO
ALTER TABLE [dbo].[PatrolSchedule] CHECK CONSTRAINT [FK_PatrolSchedule_Teacher]
GO
ALTER TABLE [dbo].[Penalty]  WITH CHECK ADD  CONSTRAINT [FK_Penalty_HighSchool] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[HighSchool] ([SchoolID])
GO
ALTER TABLE [dbo].[Penalty] CHECK CONSTRAINT [FK_Penalty_HighSchool]
GO
ALTER TABLE [dbo].[Principal]  WITH CHECK ADD  CONSTRAINT [FK_Principal_HighSchool] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[HighSchool] ([SchoolID])
GO
ALTER TABLE [dbo].[Principal] CHECK CONSTRAINT [FK_Principal_HighSchool]
GO
ALTER TABLE [dbo].[Principal]  WITH CHECK ADD  CONSTRAINT [FK_Principal_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Principal] CHECK CONSTRAINT [FK_Principal_User]
GO
ALTER TABLE [dbo].[RegisteredSchool]  WITH CHECK ADD  CONSTRAINT [FK_RegisteredSchool_HighSchool] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[HighSchool] ([SchoolID])
GO
ALTER TABLE [dbo].[RegisteredSchool] CHECK CONSTRAINT [FK_RegisteredSchool_HighSchool]
GO
ALTER TABLE [dbo].[SchoolConfig]  WITH CHECK ADD  CONSTRAINT [FK_SchoolConfig_HighSchool] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[HighSchool] ([SchoolID])
GO
ALTER TABLE [dbo].[SchoolConfig] CHECK CONSTRAINT [FK_SchoolConfig_HighSchool]
GO
ALTER TABLE [dbo].[SchoolYear]  WITH CHECK ADD  CONSTRAINT [FK_SchoolYear_HighSchool] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[HighSchool] ([SchoolID])
GO
ALTER TABLE [dbo].[SchoolYear] CHECK CONSTRAINT [FK_SchoolYear_HighSchool]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_HighSchool] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[HighSchool] ([SchoolID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_HighSchool]
GO
ALTER TABLE [dbo].[StudentInClass]  WITH CHECK ADD  CONSTRAINT [FK_StudentInClass_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[StudentInClass] CHECK CONSTRAINT [FK_StudentInClass_Class]
GO
ALTER TABLE [dbo].[StudentInClass]  WITH CHECK ADD  CONSTRAINT [FK_StudentInClass_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentInClass] CHECK CONSTRAINT [FK_StudentInClass_Student]
GO
ALTER TABLE [dbo].[StudentSupervisor]  WITH CHECK ADD  CONSTRAINT [FK_StudentSupervisor_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[StudentSupervisor] CHECK CONSTRAINT [FK_StudentSupervisor_User]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_HighSchool] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[HighSchool] ([SchoolID])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_HighSchool]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_User]
GO
ALTER TABLE [dbo].[Time]  WITH CHECK ADD  CONSTRAINT [FK_Time_ClassGroup] FOREIGN KEY([ClassGroupID])
REFERENCES [dbo].[ClassGroup] ([ClassGroupID])
GO
ALTER TABLE [dbo].[Time] CHECK CONSTRAINT [FK_Time_ClassGroup]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[Violation]  WITH CHECK ADD  CONSTRAINT [FK_Violation_Class] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[Violation] CHECK CONSTRAINT [FK_Violation_Class]
GO
ALTER TABLE [dbo].[Violation]  WITH CHECK ADD  CONSTRAINT [FK_Violation_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([TeacherID])
GO
ALTER TABLE [dbo].[Violation] CHECK CONSTRAINT [FK_Violation_Teacher]
GO
ALTER TABLE [dbo].[Violation]  WITH CHECK ADD  CONSTRAINT [FK_Violation_ViolationType] FOREIGN KEY([ViolationTypeID])
REFERENCES [dbo].[ViolationType] ([ViolationTypeID])
GO
ALTER TABLE [dbo].[Violation] CHECK CONSTRAINT [FK_Violation_ViolationType]
GO
ALTER TABLE [dbo].[ViolationConfig]  WITH CHECK ADD  CONSTRAINT [FK_ViolationConfig_Evaluation] FOREIGN KEY([EvaluationID])
REFERENCES [dbo].[Evaluation] ([EvaluationID])
GO
ALTER TABLE [dbo].[ViolationConfig] CHECK CONSTRAINT [FK_ViolationConfig_Evaluation]
GO
ALTER TABLE [dbo].[ViolationConfig]  WITH CHECK ADD  CONSTRAINT [FK_ViolationConfig_ViolationType] FOREIGN KEY([ViolationTypeID])
REFERENCES [dbo].[ViolationType] ([ViolationTypeID])
GO
ALTER TABLE [dbo].[ViolationConfig] CHECK CONSTRAINT [FK_ViolationConfig_ViolationType]
GO
ALTER TABLE [dbo].[ViolationReport]  WITH CHECK ADD  CONSTRAINT [FK_ViolationReport_StudentInClass] FOREIGN KEY([StudentInClassID])
REFERENCES [dbo].[StudentInClass] ([StudentInClassID])
GO
ALTER TABLE [dbo].[ViolationReport] CHECK CONSTRAINT [FK_ViolationReport_StudentInClass]
GO
ALTER TABLE [dbo].[ViolationReport]  WITH CHECK ADD  CONSTRAINT [FK_ViolationReport_Violation] FOREIGN KEY([ViolationID])
REFERENCES [dbo].[Violation] ([ViolationID])
GO
ALTER TABLE [dbo].[ViolationReport] CHECK CONSTRAINT [FK_ViolationReport_Violation]
GO
ALTER TABLE [dbo].[ViolationType]  WITH CHECK ADD  CONSTRAINT [FK_ViolationType_ViolationGroup] FOREIGN KEY([ViolationGroupID])
REFERENCES [dbo].[ViolationGroup] ([ViolationGroupID])
GO
ALTER TABLE [dbo].[ViolationType] CHECK CONSTRAINT [FK_ViolationType_ViolationGroup]
GO
USE [master]
GO
ALTER DATABASE [SchoolRules] SET  READ_WRITE 
GO
