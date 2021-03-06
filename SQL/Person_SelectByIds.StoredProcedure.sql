USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [sab].[Person_SelectByIds]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [sab].[Person_SelectByIds]
		@people [sab].[IntIdTable] READONLY
as


/*

Declare @targetPeople [sab].[IntIdTable]
	Insert into @targetPeople (Data)
	Values (11), (16), (9), (8), (10)
	--select * from @targetPeople

Execute sab.Person_SelectByIds @targetPeople

*/

BEGIN
--This is how you get around not being able to manipulate a UDT after setting it in a proc
--You define it as a variable and then do what you want to that variable
Declare @filteredPeople [sab].[IntIdTable]

Insert into @filteredPeople (Data)
Select Data
From @people as p
Where p.Data < 11


SELECT [PersonId]
      ,[LastName]
      ,[FirstName]
  FROM [sab].[Person] as p left outer join @filteredPeople as t
				on p.PersonId = t.Data
		Where t.Data Is Not Null

END
GO
