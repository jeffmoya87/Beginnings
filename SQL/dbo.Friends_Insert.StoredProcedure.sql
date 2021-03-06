USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Insert]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[Friends_Insert]
			@Title nvarchar(120)
           ,@Bio nvarchar(700)
           ,@Summary nvarchar(255)
           ,@Headline nvarchar(80)
           ,@Slug nvarchar(100)
           ,@StatusId bit
		   ,@Id int OUTPUT



/*

	Declare @Id int = 6;

	Declare		@Title nvarchar(120) = 'Someone'
			   ,@Bio nvarchar(700) = 'Unique'
			   ,@Summary nvarchar(255) = 'Hipster'
			   ,@Headline nvarchar(80) = 'Classy'
			   ,@Slug nvarchar(100) = 'joy'
			   ,@StatusId bit = 1
			   
			   


	Execute dbo.Friends_Insert
								@Title
							   ,@Bio
							   ,@Summary
							   ,@Headline
							   ,@Slug
							   ,@StatusId
							   ,@Id OUTPUT
select * from Friends
*/


as


BEGIN

INSERT INTO [dbo].[Friends]
           ([Title]
           ,[Bio]
           ,[Summary]
           ,[Headline]
           ,[Slug]
           ,[StatusId])
     VALUES
           (@Title
           ,@Bio
           ,@Summary
           ,@Headline
           ,@Slug
           ,@StatusId)

	SET @Id = SCOPE_IDENTITY()

END
GO
