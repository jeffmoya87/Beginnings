USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_InsertV2]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[Friends_InsertV2]
			@Title nvarchar(120)
			,@Bio nvarchar(700)
           ,@Summary nvarchar(255)
           ,@Headline nvarchar(80)
           ,@Slug nvarchar(100)
		   ,@StatusId int
		   ,@TypeId int
		   ,@PrimaryImageUrl nvarchar(100)
			,@Id int OUTPUT
			

/*

	Declare		@Id int = 0
				,@TypeId int = 5;
				,@Title nvarchar(120) = 'hello'
			   ,@Bio nvarchar(700) = 'world'
			   ,@Summary nvarchar(255) = 'test'
			   ,@Headline nvarchar(80) = 'test'
			   ,@Slug nvarchar(100) = 'test'
			   ,@StatusId int = 129387
			   ,@PrimaryImageUrl nvarchar(50) = 'ocean'


	Execute dbo.Friends_InsertV2
								@Title
							   ,@Bio
							   ,@Summary
							   ,@Headline
							   ,@Slug
							   ,@StatusId
							   ,@TypeId
							   ,@PrimaryImageUrl
								,@Id OUTPUT
								
							   
SELECT * FROM dbo.Friends
where Id = @Id

select * FROM dbo.Images

*/


as


BEGIN

DECLARE @ImageId int

INSERT INTO [dbo].[Images]
		   ([Url]
			,[TypeId])

VALUES (@PrimaryImageUrl
		,@TypeId)


	SET @ImageId = SCOPE_IDENTITY()


INSERT INTO [dbo].[Friends]
           ([StatusId]
		   ,[Title]
           ,[Bio]
           ,[Summary]
           ,[Headline]
           ,[Slug]
           ,[PrimaryImageId])

VALUES	(@StatusId
			,@Title
           ,@Bio
           ,@Summary
           ,@Headline
           ,@Slug
           ,@ImageId)

	SET @Id = SCOPE_IDENTITY()
		  


END
GO
