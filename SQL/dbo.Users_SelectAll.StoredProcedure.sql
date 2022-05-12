USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectAll]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[Users_SelectAll]


as


/*


Execute [dbo].[Users_SelectAll]


*/



BEGIN


SELECT
      [FirstName]
      ,[LastName]
      ,[Email]
	  ,[AvatarUrl]
	  ,[TenantId]
      ,[Password]
      ,[PasswordConfirm]
	  ,[Id]
      
      
  FROM [dbo].[Users]


END
GO
