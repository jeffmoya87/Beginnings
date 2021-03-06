USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Presidents_Insert]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Presidents_Insert]
			@FirstName nvarchar(50)
           ,@LastName nvarchar(50)
           ,@InaugurationDate datetime2(7)
           ,@FirstYearInOffice int
           ,@LastYearInOffice int
           ,@PartyAffiliation nvarchar(50)
		   ,@Id int OUTPUT

as


/*

		Declare		@FirstName nvarchar(50) = 'George'
				   ,@LastName nvarchar(50) = 'Washington'
				   ,@InaugurationDate datetime2(7) = '4/30/1789'
				   ,@FirstYearInOffice int = 1789
				   ,@LastYearInOffice int =1797
				   ,@PartyAffiliation nvarchar(50) = 'independent'

			Execute dbo.Presidents_Insert
						@FirstName
					   ,@LastName
					   ,@InaugurationDate
					   ,@FirstYearInOffice
					   ,@LastYearInOffice
					   ,@PartyAffiliation
					   ,@Id OUTPUT


*/


BEGIN


INSERT INTO [dbo].[Presidents]
           ([FirstName]
           ,[LastName]
           ,[InaugurationDate]
           ,[FirstYearInOffice]
           ,[LastYearInOffice]
           ,[PartyAffiliation])
     VALUES
           (@FirstName
           ,@LastName
           ,@InaugurationDate
           ,@FirstYearInOffice
           ,@LastYearInOffice
           ,@PartyAffiliation)

END

GO
