USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [sab].[Person_SelectByIdsV2]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [sab].[Person_SelectByIdsV2]
		@listOfPeople [sab].[IntIdTable] READONLY
as


/*

Declare @targetPeople [sab].[IntIdTable]
	Insert into @targetPeople (Data)
	Values (11), (16), (9), (8), (10)
	--select * from @targetPeople

Execute sab.Person_SelectByIdsV2 @targetPeople

*/

BEGIN

Execute sab.Person_SelectByIds_Nested @listOfPeople

END
GO
