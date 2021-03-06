USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[FriendSkills_InsertV2]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[FriendSkills_InsertV2]
					



as


/*

		
*/



BEGIN

Select f.Id
		,f.Title
		,Skills = ( 
					Select s.Id as SkillsId
							,s.Name as Skill

					from dbo.FriendSkills as fs inner join dbo.Skills as s
								on fs.SkillId = s.Id
					Where fs.FriendId = f.Id
					For JSON AUTO
					)


From dbo.Friends as f
Where Exists (
				Select 1
				From dbo.FriendSkills fs
				Where f.Id = fs.FriendId)


order by f.Id
		
END
GO
