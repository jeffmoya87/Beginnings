USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_SelectByIdV0]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Friends_SelectByIdV0]
			@Id int

as


/*

	Declare @Id int =2;

	Execute dbo.Friends_SelectById @Id
	select * from Friends

*/


BEGIN


SELECT Title
		,Bio
		,Summary
		,Headline
		,Slug
		,StatusId
		,Id

  FROM [dbo].[Friends] 
	WHERE Id = @Id

  END
GO
