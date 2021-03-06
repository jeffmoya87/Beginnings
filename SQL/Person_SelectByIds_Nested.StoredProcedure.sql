USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [sab].[Person_SelectByIds_Nested]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [sab].[Person_SelectByIds_Nested]
		@people [sab].[IntIdTable] READONLY
as


/*

Declare @targetPeople [sab].[IntIdTable]
	Insert into @targetPeople (Data)
	Values (11), (16), (9), (8), (10)
	--select * from @targetPeople

Execute sab.Person_SelectByIds_Nested @targetPeople

*/

BEGIN



SELECT [PersonId]
      ,[LastName]
      ,[FirstName]
  FROM [sab].[Person] as p left outer join @people as t
				on p.PersonId = t.Data
		Where t.Data Is Not Null

END
GO
