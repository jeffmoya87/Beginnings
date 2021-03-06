USE [C114_jeff_moya_hotmail]
GO
/****** Object:  Table [dbo].[FriendSkills]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FriendSkills](
	[FriendId] [int] NOT NULL,
	[SkillId] [int] NOT NULL,
 CONSTRAINT [PK_FriendSkills] PRIMARY KEY CLUSTERED 
(
	[FriendId] ASC,
	[SkillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FriendSkills]  WITH CHECK ADD  CONSTRAINT [FK_FriendSkills_Friends] FOREIGN KEY([FriendId])
REFERENCES [dbo].[Friends] ([Id])
GO
ALTER TABLE [dbo].[FriendSkills] CHECK CONSTRAINT [FK_FriendSkills_Friends]
GO
ALTER TABLE [dbo].[FriendSkills]  WITH CHECK ADD  CONSTRAINT [FK_FriendSkills_Skills] FOREIGN KEY([SkillId])
REFERENCES [dbo].[Skills] ([Id])
GO
ALTER TABLE [dbo].[FriendSkills] CHECK CONSTRAINT [FK_FriendSkills_Skills]
GO
