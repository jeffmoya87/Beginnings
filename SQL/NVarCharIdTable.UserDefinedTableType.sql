USE [C114_jeff_moya_hotmail]
GO
/****** Object:  UserDefinedTableType [sab].[NVarCharIdTable]    Script Date: 5/12/2022 7:12:42 AM ******/
CREATE TYPE [sab].[NVarCharIdTable] AS TABLE(
	[Data] [varchar](128) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Data] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
