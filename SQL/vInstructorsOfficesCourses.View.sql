USE [C114_jeff_moya_hotmail]
GO
/****** Object:  View [sab].[vInstructorsOfficesCourses]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




Create view [sab].[vInstructorsOfficesCourses]

	/*

		select *
		From sab.vAllInstructors

	*/
as


	select	p.*
			,s.HireDate
			,o.Name
			,o.Number
			,o.DateAssigned
			,c.Title
			,c.DepartmentId
			,c.Credits
	from	sab.Person p inner join sab.InstructorProfiles s
				on p.PersonId = s.InstructorId
			left outer join sab.OfficeAssignment o
					on o.InstructorId = p.PersonId
			left outer join sab.CourseInstructor ci
					on ci.PersonId = p.PersonId
			left outer join sab.Course c
					on c.CourseId = ci.CourseId
GO
