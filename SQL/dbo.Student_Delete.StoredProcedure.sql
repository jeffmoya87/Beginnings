USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Student_Delete]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[Student_Delete]
				@Id int


as


/*
		Declare @Id int = 1

		Select *
		from dbo.Student
		Where Id = @Id

		Execute dbo.Student_Delete @Id

		Select * 
		from dbo.Student
		Where Id = @Id;

*/


BEGIN

		DELETE from dbo.Student
				Where Id = @Id


END
GO
