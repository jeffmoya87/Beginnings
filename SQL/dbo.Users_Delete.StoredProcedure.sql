USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Delete]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[Users_Delete]
	@Id int

as


/*

	Declare @Id int = 6

	Select *
	From dbo.Users
	WHERE Id = @Id;

	Execute dbo.Users_Delete @Id

	Select *
	  From dbo.Users
	  WHERE Id =@Id;


*/


BEGIN




	  DELETE FROM dbo.Users
	  WHERE Id = @Id;

	  



END
GO
