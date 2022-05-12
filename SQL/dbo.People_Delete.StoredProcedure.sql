USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[People_Delete]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[People_Delete]
	@id int

as
/*
	Declare @id int = 9

	Select *
	From dbo.People
	WHERE Id = @id;

	Execute dbo.People_Delete @id

	Select *
	From dbo.People
	WHERE Id = @id;

*/


BEGIN

	  DELETE FROM [dbo].[People]
	  WHERE Id = @id;

END
GO
