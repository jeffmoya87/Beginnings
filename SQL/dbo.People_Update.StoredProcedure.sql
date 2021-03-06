USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[People_Update]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[People_Update]
	@PersonName nvarchar(50)
		,@Age int
		,@UserId nvarchar(128)
		,@IsASmoker bit
		,@Id int

as 
/*

	Declare @Id int = 0;

	Declare @PersonName nvarchar(50) = 'Fred'
		,@Age int = 25
		,@UserId nvarchar(128) = '89'
		,@IsASmoker bit = 1

	Select *
	From dbo.People
	Where Id = @Id


	Execute dbo.People_Update 
						@PersonName
						,@Age
						,@UserId
						,@IsASmoker
						,@Id 

		Select *
		From dbo.People
		Where Id = @Id


*/

BEGIN

Declare @datNow datetime2 = getutcdate()

	UPDATE [dbo].[People]
   SET [Name] = @PersonName
      ,[IsSmoker] = @IsASmoker
      ,[DateModified] = @datNow
      ,[UserId] = @UserId
	  ,[Age] = @Age

 WHERE Id = @Id

END
GO
