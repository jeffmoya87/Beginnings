USE [C114_jeff_moya_hotmail]
GO
/****** Object:  Table [dbo].[SeasonTerms]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeasonTerms](
	[Id] [int] NOT NULL,
	[Terms] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_SeasonTerms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
