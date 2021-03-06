USE [C114_jeff_moya_hotmail]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/12/2022 7:12:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateModified] [datetime2](7) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[UserId] [nvarchar](128) NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](64) NOT NULL,
	[PasswordConfirm] [nvarchar](64) NOT NULL,
	[AvatarUrl] [nvarchar](50) NULL,
	[TenantId] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_User_Register_POST] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_User_Register_POST_DateModified]  DEFAULT (getutcdate()) FOR [DateModified]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_User_Register_POST_DateAdded]  DEFAULT (getutcdate()) FOR [DateCreated]
GO
