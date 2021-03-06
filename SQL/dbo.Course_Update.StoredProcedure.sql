USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Course_Update]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[Course_Update]
					@Id int
					,@Name nvarchar(50)
					,@Description nvarchar(150)
					,@SeasonTermId int
					,@TeacherId int


/*
	Declare @Id int = 1
			,@Name nvarchar(50) = 'Science'
			,@Description nvarchar(150) = 'Science Stuff'
			,@SeasonTermId int = 2
			,@TeacherId int = 3

			select * from dbo.Course
			Where Id = @Id

		Execute dbo.Course_Update
						@Id 
						,@Name 
						,@Description
						,@SeasonTermId
						,@TeacherId

	select * from dbo.Course
			Where Id = @Id

*/

as


BEGIN


		UPDATE [dbo].[Course]
			SET [Name] = @Name
				,[Description] = @Description
				,[SeasonTermId] = @SeasonTermId
				,[TeacherId] = @TeacherId


		WHERE Id = @Id

	END
GO
