USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_PaginationV0]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Friends_PaginationV0]
					@Index int
					,@PageSize int

as


/*

		Declare @Index int = 4
				,@PageSize int = 10

Execute dbo.Friends_PaginationV0 @Index
									,@PageSize
			SELECT * FROM Friends



*/


BEGIN

	Declare @offset int = @Index * @PageSize
			,@DateModified datetime2(7) = getutcdate()
			

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
  ORDER BY Id

  OFFSET @offSet Rows
  Fetch Next @PageSize Rows ONLY


  END
GO
