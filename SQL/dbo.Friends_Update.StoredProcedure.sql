USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Friends_Update]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Friends_Update]
					@Id int
					,@Title nvarchar(120)
				  ,@Bio nvarchar(700)
				  ,@Summary nvarchar(255)
				  ,@Headline nvarchar(80)
				  ,@Slug nvarchar(100)
				  ,@StatusId bit
				  


as


/*
		Declare @Id int =3;

		Declare		@Title nvarchar(120) = 'hello'
				  ,@Bio nvarchar(700) = 'people'
				  ,@Summary nvarchar(255) = 'of the'
				  ,@Headline nvarchar(80) = 'planet'
				  ,@Slug nvarchar(100) = 'Earth'
				  ,@StatusId bit = 1
				  

			Select *
			From dbo.Friends
			Where Id = @Id

	Execute dbo.Friends_Update
						@Id
					,@Title
				  ,@Bio
				  ,@Summary
				  ,@Headline
				  ,@Slug
				  ,@StatusId
				  

			Select *
			From dbo.Friends
			Where Id = @Id



*/



BEGIN

		Declare @newDate datetime2(7) = getutcdate()

		UPDATE [dbo].[Friends]
		   SET [Title] = @Title
			  ,[Bio] = @Bio
			  ,[Summary] = @Summary
			  ,[Headline] = @Headline
			  ,[Slug] = @Slug
			  ,[StatusId] = @StatusId
			  

		 WHERE Id = @Id



 END



GO
