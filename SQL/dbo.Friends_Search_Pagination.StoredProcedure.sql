USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Search_Pagination]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[Friends_Search_Pagination]
					@Index int
					, @PageSize int
					, @Query nvarchar(100)

as


/*

		Declare @Index int = 0
				, @PageSize int = 5
				, @Query nvarchar(100) = 'test'

		Execute dbo.Friends_Search_Pagination @Index
												,@PageSize
												,@Query 
												



*/


BEGIN
Declare @DateModified datetime2(7) = getutcdate()
		, @offset int = @Index * @PageSize
	

SELECT [Title]
      ,[Bio]
      ,[Summary]
      ,[Headline]
      ,[Slug]
      ,[StatusId]
	  ,[Id]
	  ,[TotalCount] = COUNT(1) OVER()
      ,[DateModified]
	  
  FROM [dbo].[Friends]
  
  WHERE (Title LIKE '%' + @Query + '%')
  ORDER BY Id

  OFFSET @offSet Rows
  Fetch Next @PageSize Rows ONLY


  END
GO
