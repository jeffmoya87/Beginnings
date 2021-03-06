USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[FriendSkills_InsertV3]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[FriendSkills_InsertV3]
					@Title nvarchar(120)
					,@Bio nvarchar(700)
					,@Summary nvarchar(255)
					,@Headline nvarchar(80)
					,@Slug nvarchar(100)
					,@StatusId int
					,@Id int OUTPUT
					,@SkillId int OUTPUT
					,@Name nvarchar(50)

					 
   

as


/*

		Declare @Title nvarchar(120) = 'Someone'
			   ,@Bio nvarchar(700) = 'Unique'
			   ,@Summary nvarchar(255) = 'Hipster'
			   ,@Headline nvarchar(80) = 'Classy'
			   ,@Slug nvarchar(100) = 'fest'
			   ,@StatusId int = 1
				,@Id int = 0
				,@SkillId int = 0
				,@Name nvarchar(50) = 'bobsled'

		Execute dbo.FriendSkills_InsertV2
					@Title
					,@Bio
					,@Summary
					,@Headline
					,@Slug
					,@StatusId
					,@Id OUTPUT
					,@SkillId OUTPUT
					,@Name

		Select * FROM Skills

		Select * FROM FriendSkills
		
		Select * FROM Friends
*/



BEGIN

Declare @FriendsId int

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

		SET @FriendsId = SCOPE_IDENTITY()


INSERT INTO [dbo].[FriendSkills]
           ([FriendId])

     VALUES
           (@FriendsId)

		SET @SkillId = SCOPE_IDENTITY()


INSERT INTO dbo.Skills
			([Name]
			,[Id])

		VALUES
				(@Name
				,@SkillId)
		
END
GO
