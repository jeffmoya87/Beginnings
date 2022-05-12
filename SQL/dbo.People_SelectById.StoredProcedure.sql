USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[People_SelectById]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[People_SelectById]
			@Id int


as

/*
	Declare @Id int = 9;

	Execute dbo.People_SelectById @Id

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
  Where Id = @Id


End
GO
