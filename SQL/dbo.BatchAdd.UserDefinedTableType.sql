USE [C114_jeff_moya_hotmail]
GO
/****** Object:  UserDefinedTableType [dbo].[BatchAdd]    Script Date: 5/12/2022 7:12:42 AM ******/
CREATE TYPE [dbo].[BatchAdd] AS TABLE(
	[TypeId] [int] NOT NULL,
	[Url] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL
)
GO
