USE [C114_jeff_moya_hotmail]
GO
/****** Object:  StoredProcedure [dbo].[Presidents_SelectByParty]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[Presidents_SelectByParty]
				@PartyAffiliation nvarchar(50)


as


/*

Declare @PartyAffiliation nvarchar(50) = 'independent'


Execute dbo.Presidents_SelectByParty @PartyAffiliation

		


*/


BEGIN


SELECT [FirstName]
      ,[LastName]


  FROM [dbo].[Presidents]



END


GO
