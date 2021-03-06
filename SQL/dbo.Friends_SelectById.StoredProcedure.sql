USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectById]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Friends_SelectById]
			@Id int

as


/*

	Declare @Id int =2;

	Execute dbo.Friends_SelectById @Id


*/


BEGIN


SELECT f.Title
		,f.Bio
		,f.Summary
		,f.Headline
		,f.Slug
		,f.StatusId
		,f.Id

  FROM [dbo].[Friends] as f inner join dbo.Images as i
			on f.Id = i.Id
	WHERE f.Id = @Id

  END
GO
