USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[FriendSkills_Insert]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[FriendSkills_Insert]
					@Name nvarchar(50)
					,@Id int OUTPUT



as


/*

		Declare @Name nvarchar(50) = 'MS Excel'
				,@Id int = 0

		Execute dbo.FriendSkills_Insert
					@Name
					,@Id OUTPUT

		Select * FROM FriendSkills
		Select * FROM Skills
*/



BEGIN

Declare @SkillsId int

INSERT INTO [dbo].[Skills]
           ([Name])

     VALUES
           (@Name)

		SET @SkillsId = SCOPE_IDENTITY()


INSERT INTO [dbo].[FriendSkills]
           ([SkillId])

     VALUES
           (@SkillsId)

		SET @Id = SCOPE_IDENTITY()
		
END
GO
