USE [C114_jeff_moya_hotmail]
GO
/****** Object:  UserDefinedTableType [sab].[Course]    Script Date: 5/12/2022 7:12:42 AM ******/
CREATE TYPE [sab].[Course] AS TABLE(
	[Credits] [int] NOT NULL,
	[Title] [varchar](100) NULL,
	[DepId] [int] NULL
)
GO
