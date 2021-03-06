USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Batch_Insert]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Friends_Batch_Insert]		@Title nvarchar(120)
											,@Bio nvarchar(700)
											,@Summary nvarchar(255)
											,@Headline nvarchar(80)
											,@Slug nvarchar(100)
											,@StatusId bit
											,@Id int OUTPUT
											,@TypeId int
											,@Url nvarchar(50)
											,@batchSkills dbo.BatchInsertSkills READONLY
			

/*

	Declare @skills dbo.BatchInsertSkills
			,@Title nvarchar(120) = 'Ardyn Izunia'
			,@Bio nvarchar(700) = 'After sacrificing his health to save the lives of those affected by the Starscourge epidemic, 
			the Crystal finds him too corrupted to reign'
			,@Summary nvarchar(255) = 'Pledges revenge on the Lucian kingdom and the Astrals'
			,@Headline nvarchar(80) = 'Fallen Founder King of Lucis'
			,@Slug nvarchar(100) = 'Corrupted'
			,@StatusId bit = 1
			,@Id int = 0
			,@TypeId int = 5
			,@Url nvarchar(50) = 'https://bit.ly/3DcvpY6'

		Insert into @skills ( Name )
		Values ('Illusions')
				 ,('Healer')
				,('Daemonify')
		
		Execute dbo.Friends_Batch_Insert
											@Title
											,@Bio
											,@Summary
											,@Headline
											,@Slug
											,@StatusId
											,@Id OUTPUT
											,@TypeId
											,@Url
											,@skills
			select * from dbo.Friends
			
			select * from dbo.Images

			select * from dbo.Skills
			select * from dbo.FriendSkills
*/


as


BEGIN

		DECLARE @ImageId int

		
		INSERT INTO [dbo].[Images] 
						([Url]
						,[TypeId])

			SELECT @Url
					,@TypeId

			WHERE Not Exists ( Select 1
								from dbo.Images as i
								where i.[Url] = @Url)
		
			/*
			If you use "VALUES", 
			then you can't use the WHERE clause 
			= no bueno
				VALUES (@Url
						,@TypeId)
			*/
				
	SET @ImageId = SCOPE_IDENTITY()


		INSERT INTO [dbo].[Friends] 
					([Title]
					,[Bio]
					,[Summary]
					,[Headline]
					,[Slug]
					,[StatusId]
					,[PrimaryImageId])
						
			SELECT @Title
					,@Bio
					,@Summary
					,@Headline
					,@Slug
					,@StatusId
					,@ImageId

			WHERE Not Exists ( Select 1
								from dbo.Friends as f
								where f.Title = @Title)
			/*
			If you use "VALUES", 
			then you can't use the WHERE clause 
			= no bueno
			VALUES	(@Title
					,@Bio
					,@Summary
					,@Headline
					,@Slug
					,@StatusId
					,@ImageId)
			*/
			SET @Id = SCOPE_IDENTITY()


		Declare @SkillIds TABLE (Id int)

		INSERT INTO dbo.Skills
					([Name])

		OUTPUT inserted.Id INTO @SkillIds

			SELECT b.[Name] From @batchSkills as b
			WHERE Not Exists ( Select 1
								from dbo.Skills as s
								where s.[Name] = b.[Name])


		INSERT INTO dbo.FriendSkills 
					([FriendId]
					,[SkillId])

			SELECT @Id, si.Id
			FROM @SkillIds as si
			WHERE Not Exists (Select 1 
								from dbo.FriendSkills as fs
								where si.Id = fs.SkillId)

END
GO
