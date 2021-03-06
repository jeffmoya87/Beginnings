USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[People_Insert]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[People_Insert]

	@PersonName nvarchar(50)
		,@Age int
		,@UserId nvarchar(128)
		,@IsASmoker bit
		,@Id int OUTPUT


/* --------Test Code--------

Declare @Id int = 0;

	Declare @PersonName nvarchar(50) = 'Fred'
		,@Age int = 25
		,@UserId nvarchar(128) = '89'
		,@IsASmoker bit = 1


	Execute dbo.People_Insert 
						@PersonName
						,@Age
						,@UserId
						,@IsASmoker
						,@Id OUTPUT 

		Select @Id

		Select *
		From dbo.People
		Where Id = @Id

*/

as

BEGIN

	

INSERT INTO [dbo].[People]
           ([Name]
           ,[Age]
           ,[IsSmoker]
           ,[UserId])
     VALUES
           (@PersonName
           ,@Age
           ,@IsASmoker
           ,@UserId)

SET @Id = SCOPE_IDENTITY()





END
GO
