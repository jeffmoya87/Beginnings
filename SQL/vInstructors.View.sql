USE [C114_jeff_moya_hotmail]
GO
/****** Object:  View [sab].[vInstructors]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




Create view [sab].[vInstructors]

	/*

		select *
		From sab.vAllInstructors

	*/
as


	select	p.*
			,s.HireDate
			
		
	from	sab.Person p inner join sab.InstructorProfiles s
				on p.PersonId = s.InstructorId
		
			
GO
