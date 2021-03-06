USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Course_Insert]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[Course_Insert] @Name nvarchar(50)
								,@Description nvarchar(150)
								,@SeasonTermId int
								,@TeacherId int
								,@Id int OUTPUT

/*

			Declare @Name nvarchar(50) = 'Calculus'
					,@Description nvarchar(150) = 'Math Stuff'
					,@SeasonTermId int = 1
					,@TeacherId int = 1
					,@Id int = 0

						Execute dbo.Course_Insert
								@Name 
								,@Description 
								,@SeasonTermId 
								,@TeacherId 
								,@Id 
				select * from dbo.Course
*/

as 

BEGIN


INSERT INTO [dbo].[Course]
					   ([Name]
					   ,[Description]
					   ,[SeasonTermId]
					   ,[TeacherId])


			 SELECT		@Name
						,@Description
						,@SeasonTermId
						,@TeacherId

			WHERE Not Exists (Select 1
								from dbo.Course as c
								where c.[Name] = @Name)

			SET @Id = SCOPE_IDENTITY()
END


GO
