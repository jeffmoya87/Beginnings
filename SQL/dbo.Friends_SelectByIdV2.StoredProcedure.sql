USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectByIdV2]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Friends_SelectByIdV2]
			@Id int

as


/*

	Declare @Id int = 5;

	Execute dbo.Friends_SelectByIdV2 @Id

	SELECT * FROM Images
	SELECT * FROM Friends
*/


BEGIN


SELECT f.Id
		,f.PrimaryImageId
		,f.StatusId
		,f.Title
		,f.Bio
		,f.Summary
		,f.Headline
		,f.Slug
		,f.DateCreated
		,f.DateModified
		,i.Url

  FROM [dbo].[Friends] as f inner join dbo.Images as i
			on f.PrimaryImageId = i.Id

	Where i.Id = @Id


  END
GO
