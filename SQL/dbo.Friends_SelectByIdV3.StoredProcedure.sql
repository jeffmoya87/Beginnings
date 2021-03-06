USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectByIdV3]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectByIdV2]    Script Date: 3/10/2022 9:49:07 AM ******/



CREATE proc [dbo].[Friends_SelectByIdV3]
			@Id int

as


/*

	Declare @Id int = 5;

	Execute dbo.Friends_SelectByIdV3 @Id
	Where  (Select 1
				From dbo.FriendSkills fs
				Where f.Id = fs.FriendId)
*/ 


BEGIN

		

SELECT	f.Title
		,f.Bio
		,f.Summary
		,f.Headline
		,f.Slug
		,f.StatusId
		,f.Id
		,f.PrimaryImageId
		,i.Url
		,Skills = ( 
					Select s.Id as id
							,s.Name as name

					from dbo.FriendSkills as fs inner join dbo.Skills as s
								on fs.SkillId = s.Id
					Where fs.FriendId = f.Id
					For JSON AUTO
					)

  FROM [dbo].[Friends] as f inner join dbo.Images as i
			on f.PrimaryImageId = i.Id

		Where f.Id = @Id
			
		
		order by f.Id


  END
GO
