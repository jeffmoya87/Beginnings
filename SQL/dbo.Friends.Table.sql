USE [C114_jeff_moya_hotmail]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[Id] [int] IDENTITY(15,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[Title] [nvarchar](120) NOT NULL,
	[Bio] [nvarchar](700) NOT NULL,
	[Summary] [nvarchar](255) NOT NULL,
	[Headline] [nvarchar](80) NOT NULL,
	[Slug] [nvarchar](100) NOT NULL,
	[StatusId] [bit] NOT NULL,
	[PrimaryImageId] [int] NULL,
 CONSTRAINT [PK_Friends_POST] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Friends] ADD  CONSTRAINT [DF_Friends_POST_DateAdded]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Friends] ADD  CONSTRAINT [DF_Friends_POST_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD  CONSTRAINT [FK_Friends_Images] FOREIGN KEY([PrimaryImageId])
REFERENCES [dbo].[Images] ([Id])
GO
ALTER TABLE [dbo].[Friends] CHECK CONSTRAINT [FK_Friends_Images]
GO
