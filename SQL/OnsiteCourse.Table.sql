USE [C114_jeff_moya_hotmail]
GO
/****** Object:  Table [sab].[OnsiteCourse]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sab].[OnsiteCourse](
	[CourseId] [int] NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Days] [nvarchar](50) NOT NULL,
	[Time] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_OnsiteCourse] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
