USE [C114_jeff_moya_hotmail]
GO
/****** Object:  Table [sab].[Course]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sab].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Credits] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_School.Course] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sab].[Course] ADD  CONSTRAINT [DF_Course_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
