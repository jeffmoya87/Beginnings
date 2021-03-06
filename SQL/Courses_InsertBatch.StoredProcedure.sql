USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [sab].[Courses_InsertBatch]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [sab].[Courses_InsertBatch]
			@newCourses sab.Course READONLY

as


BEGIN

	Insert into sab.Course( Credits
								, Title
								, DepartmentId)

		Select n.Credits
				,n.Title
				,n.DepId
		From @newCourses as n

END
GO
