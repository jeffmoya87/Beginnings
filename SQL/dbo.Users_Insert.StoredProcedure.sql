USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Users_Insert]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Users_Insert]
								@FirstName nvarchar(128)
								,@LastName nvarchar(128)
								,@Email nvarchar(100)
								,@AvatarUrl nvarchar(128)
								,@TenantId nvarchar(30)
								,@Password nvarchar(64)
								,@PasswordConfirm nvarchar(64)
								,@Id int OUTPUT
								

/*-----TEST CODE------

Declare @Id int = 0;

Declare		@FirstName nvarchar(128) = 'yo'
			,@LastName nvarchar(128) = 'hello'
			,@Email nvarchar(100) = 'hello@sabio.la'
			,@AvatarUrl nvarchar(128) = 'image'
			,@TenantId nvarchar(30) = '9787kjkasd'
			,@Password nvarchar(64) = 'thisIsAPassword#7'
			,@PasswordConfirm nvarchar(64) = 'thisIsAPassword#7'
			
			

Execute dbo.Users_Insert
								@FirstName 
								,@LastName 
								,@Email 
								,@AvatarUrl
								,@TenantId 
								,@Password 
								,@PasswordConfirm 
								,@Id OUTPUT

*/

as





BEGIN



INSERT INTO [dbo].[Users]
           ([FirstName]
           ,[LastName]
           ,[Email]
		   ,[AvatarUrl]
		   ,[TenantId]
           ,[Password]
           ,[PasswordConfirm])
     VALUES
           (@FirstName
		   ,@LastName 
		   ,@Email
		   ,@AvatarUrl
		   ,@TenantId
		   ,@Password
		   ,@PasswordConfirm)

	SET @Id = SCOPE_IDENTITY()

	

END
GO
