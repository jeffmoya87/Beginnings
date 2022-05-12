USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[People_DeleteByName]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE proc [dbo].[People_DeleteByName]
	@name nvarchar(5)

as
/*
	Declare @name nvarchar(5) = 'Was Juls'

	Select *
	From dbo.People
	WHERE Name = @name;

	Execute dbo.People_DeleteByName @name

	Select *
	From dbo.People
	WHERE Name = @name;
	
*/


BEGIN

	  DELETE FROM [dbo].[People]
	  WHERE Name = @name;

END
GO
