USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[People_SelectAll]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[People_SelectAll]


as

/*

	Execute dbo.dbo.People_SelectAll

*/

BEGIN


SELECT [Id]
      ,[Name]
      ,[Age]
      ,[IsSmoker]
      ,[DateAdded]
      ,[DateModified]
      ,[UserId]
  FROM [dbo].[People]


End
GO
