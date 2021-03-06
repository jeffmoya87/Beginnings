USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Pagination]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[Users_Pagination]
		@pageIndex int
		,@pageSize int

as


/*

		Declare @pageIndex int = 6
				,@pageSize int = 7

		Execute [dbo].[Users_SelectPaginated] @pageIndex
												,@pageSize

*/

BEGIN

			Declare @offset int = @pageIndex * @pageSize

SELECT [Id]
      ,[FirstName]
      ,[LastName]
      ,[Email]
      ,[Password]
      ,[PasswordConfirm]
      ,[AvatarUrl]
      ,[TenantId]
	  ,[DateCreated]
	  ,[DateModified]
      
  FROM [dbo].[Users]
  ORDER BY Id

  OFFSET @offset Rows
  Fetch Next @pageSize Rows ONLY


END
GO
