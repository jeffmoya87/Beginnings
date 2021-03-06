USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Search_PaginationV2]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Friends_Search_PaginationV2]
							@Index int
							,@PageSize int
							,@Query nvarchar(500)

as


/*
		Declare @Index int = 0
				,@PageSize int = 5
				,@Query nvarchar(100) = 'Normal'

		Execute [dbo].[Friends_Search_PaginationV2] @Index, @PageSize, @Query 


*/


BEGIN

	Declare @offSet int = @Index * @PageSize

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
		,[TotalCount] = COUNT(1) OVER()
		
	  
  FROM [dbo].[Friends] as f inner join dbo.Images as i
			on f.PrimaryImageId = i.Id

  
  WHERE (Title LIKE '%' + @Query + '%')
  
		ORDER BY i.Id

	OFFSET @offSet Rows
	Fetch Next @PageSize Rows ONLY

  END
GO
