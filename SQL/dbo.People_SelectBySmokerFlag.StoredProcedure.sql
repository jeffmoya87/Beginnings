USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[People_SelectBySmokerFlag]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[People_SelectBySmokerFlag]
			@SmokerFlag bit


as

/*
	Declare @SmokerFlag bit = null;

	Execute dbo.[People_SelectBySmokerFlag] @SmokerFlag

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
  Where ([IsSmoker] = @SmokerFlag)
		OR 
		(@SmokerFlag IS NULL AND [IsSmoker] IS NULL)


End
GO
