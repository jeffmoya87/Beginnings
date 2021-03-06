USE [C114_jeff_moya_hotmail]
GO
/****** Object:  UserDefinedTableType [dbo].[TestTable]    Script Date: 5/12/2022 7:12:42 AM ******/
CREATE TYPE [dbo].[TestTable] AS TABLE(
	[Data] [int] NOT NULL,
	[TypeId] [int] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Data] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
