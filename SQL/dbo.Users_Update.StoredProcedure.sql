USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Update]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Users_Update]
						@Id int
						,@FirstName nvarchar(128)
						,@LastName nvarchar(128)
						,@Email nvarchar(100)
						,@AvatarUrl nvarchar(128)
						,@TenantId nvarchar(30)
						,@Password nvarchar(64)
						,@PasswordConfirm nvarchar(64)
						
						

as

/* ------Test Code------

	Declare @Id int = 3;

	Declare		@FirstName nvarchar(128) = 'bill'
				,@LastName nvarchar(128) = 'bob'
				,@Email nvarchar(100) = 'hola@sabio.la'
				,@AvatarUrl nvarchar(128) = 'imagine'
				,@TenantId nvarchar(30) = '455yhgbv'
				,@Password nvarchar(64) = 'thisIsAPassword#7'
				,@PasswordConfirm nvarchar(64) = 'thisIsAPassword#7'

		Select *
		From dbo.Users
		Where Id = @Id

Execute dbo.Users_Update
						@Id
						,@FirstName 
						,@LastName 
						,@Email 
						,@AvatarUrl 
						,@TenantId 
						,@Password 
						,@PasswordConfirm 
						 

			Select *
			From dbo.Users
			Where Id = @Id


*/



BEGIN

	Declare @newDate datetime2(7) = getutcdate()

	UPDATE [dbo].[Users]
	   SET [DateModified] = @newDate
		  ,[FirstName] = @FirstName
		  ,[LastName] = @LastName
		  ,[Email] = @Email
		  ,[AvatarUrl] = @AvatarUrl
		  ,[TenantId] = @TenantId
		  ,[Password] = @Password
		  ,[PasswordConfirm] = @PasswordConfirm
		  
		  
	 WHERE Id = @Id



END
GO
