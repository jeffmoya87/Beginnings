USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectAll]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Friends_SelectAll]

as


/*

Execute dbo.Friends_SelectAll



*/


BEGIN


SELECT [Title],
		[Bio],
		[Summary],
		[Headline],
		[Slug],
		[StatusId],
		[Id]
  FROM [dbo].[Friends]


  END
GO
