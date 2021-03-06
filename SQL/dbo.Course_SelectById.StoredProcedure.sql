USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Course_SelectById]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Course_SelectById]
				@Id int

as

/*
	Declare @Id int = 2

	Execute dbo.Course_SelectById @Id
	SELECT * FROM DBO. SeasonTerms
	select * from Course
*/

BEGIN


SELECT	Id
		,[Name]
		,[Description]
		,SeasonTerm = (
						Select st.Terms
						from dbo.SeasonTerms as st inner join dbo.Course as c
								on st.Id = c.SeasonTermId
							Where c.Id = @Id)
		,Teacher = (
					Select t.[Name]
					from dbo.Teacher as t inner join dbo.Course as c
							on t.Id = c.TeacherId
						Where c.Id = @Id)
		, Students = (
						Select s.Id as Id
								,s.[Name] as [Name]
						from dbo.StudentCourses as sc inner join dbo.Student as s
								on sc.StudentId = s.Id
							Where sc.CourseId = dbo.Course.Id
							For JSON AUTO)

FROM dbo.Course
	Where Id = @Id

	Order by Id


END
GO
