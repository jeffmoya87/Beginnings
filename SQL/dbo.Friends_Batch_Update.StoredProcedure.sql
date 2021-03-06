USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Batch_Update]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Friends_Batch_Update]	@Id int
											,@Title nvarchar(120)
											,@Bio nvarchar(700)
											,@Summary nvarchar(255)
											,@Headline nvarchar(80)
											,@Slug nvarchar(100)
											,@StatusId bit
											,@TypeId int
											,@Url nvarchar(50)
											,@batchSkills dbo.BatchInsertSkills READONLY
			

/*
	Declare @Id int = 27
			,@skills dbo.BatchInsertSkills
			,@Title nvarchar(120) = 'Ardyn Izunia'
			,@Bio nvarchar(700) = 'After sacrificing his health to save the lives of those affected by the Starscourge epidemic, 
			the Crystal finds him too corrupted to reign'
			,@Summary nvarchar(255) = 'Pledges revenge on the Lucian kingdom and the Astrals'
			,@Headline nvarchar(80) = 'Fallen Founder King of Lucis'
			,@Slug nvarchar(100) = 'Corrupted'
			,@StatusId bit = 1
			,@TypeId int = 5
			,@Url nvarchar(50) = 'https://bit.ly/3DcvpY6'

		Insert into @skills ( Name )
		Values ('UnHealer') 
		Insert into @skills ( Name )
		Values ('Illusions')
		Insert into @skills ( Name )
		Values('Daemonify')
		
		Execute dbo.Friends_Batch_Update	@Id
											,@Title
											,@Bio
											,@Summary
											,@Headline
											,@Slug
											,@StatusId
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

		UPDATE [dbo].[Friends] 
			SET [Title] = @Title
				,[Bio] = @Bio
				,[Summary] = @Summary
				,[Headline] = @Headline
				,[Slug] = @Slug
				,[StatusId] = @StatusId

			WHERE dbo.Friends.Id = @Id 

		UPDATE [dbo].[Images] 
			SET	[Url] = @Url
				,[TypeId] = @TypeId

			FROM dbo.Images as i inner join dbo.Friends as f
					on i.Id = f.PrimaryImageId

		UPDATE dbo.Skills
			SET [Name] = b.[Name] 

			FROM @batchSkills as b,
				dbo.FriendSkills  as fs inner join dbo.Skills as s
					on fs.SkillId = s.Id
			WHERE @Id = fs.FriendId
				

END
GO
