USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Search_Pagination]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[Users_Search_Pagination]
			@Query nvarchar(100)


as


/*

		Declare @Query nvarchar(100) = 'yo'

		Execute [dbo].[Users_Search] @Query

*/

BEGIN

			

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
  
  WHERE (FirstName LIKE '%' + @Query + '%')


END
GO
