USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectById]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[Users_SelectById]
		@Id int

as


/*

		Declare @Id int = 6;

		Execute [dbo].[Users_SelectById] @Id

*/

BEGIN


SELECT [FirstName]
      ,[LastName]
      ,[Email]
      ,[Password]
      ,[PasswordConfirm]
      ,[AvatarUrl]
      ,[TenantId]
	  ,[Id]
      
      
  FROM [dbo].[Users]
  WHERE Id = @Id


END
GO
