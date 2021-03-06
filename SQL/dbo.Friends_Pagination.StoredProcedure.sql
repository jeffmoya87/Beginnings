USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Pagination]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Friends_Pagination]
					@Index int
					,@PageSize int

as


/*

		Declare @Index int = 0
				,@PageSize int = 1

Execute dbo.Friends_Pagination @Index
									,@PageSize



*/


BEGIN

	Declare @offset int = @Index * @PageSize

SELECT f.PrimaryImageId
		,i.Id
	  ,[TotalCount] = COUNT(1) OVER()

  FROM [dbo].[Friends] as f inner join dbo.Images as i
		on f.PrimaryImageId = i.Id
  ORDER BY i.Id

  OFFSET @offSet Rows
  Fetch Next @PageSize Rows ONLY


  END
GO
