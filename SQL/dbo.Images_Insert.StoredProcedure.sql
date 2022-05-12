USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Images_Insert]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Images_Insert]
			@TypeId int
           ,@Url nvarchar(50)
		   ,@Id int OUTPUT


/*
	Declare @Id int = 0;

	Declare @TypeId int = 9
			,@Url nvarchar(50) = 'king crab'

		Execute dbo.Images_Insert
						@TypeId
						,@Url
						,@Id OUTPUT



*/

as



BEGIN

INSERT INTO [dbo].[Images]
           ([TypeId]
           ,[Url])
     VALUES
           (@TypeId
		   ,@Url)

	SET @Id = SCOPE_IDENTITY()


END



GO
