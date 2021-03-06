USE [C114_jeff_moya_hotmail]
GO
/****** Object:  Table [sab].[CourseInstructor]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [sab].[CourseInstructor](
	[CourseId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_CourseInstructor] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC,
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [sab].[CourseInstructor]  WITH CHECK ADD  CONSTRAINT [FK_CourseInstructor_Person] FOREIGN KEY([PersonId])
REFERENCES [sab].[Person] ([PersonId])
GO
ALTER TABLE [sab].[CourseInstructor] CHECK CONSTRAINT [FK_CourseInstructor_Person]
GO
