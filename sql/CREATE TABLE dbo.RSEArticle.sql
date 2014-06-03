/****** Object:  Table [dbo].[RSEArticle]    Script Date: 06/03/2014 13:07:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RSEArticle](
	[DS_ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [nvarchar](50) NULL,
	[IPAddress] [nvarchar](100) NULL,
	[ResponseDateTime] [datetime] NULL,
	[UserID] [int] NOT NULL,
	[ChangeDateTime] [datetime] NULL,
	[LastUserID] [int] NULL,
	[PortalID] [int] NULL,
	[TabID] [int] NULL,
	[viewcount] [int] NULL,
	[userDeleted] [int] NULL,
	[sysDeleted] [int] NULL,
	[ParentID] [int] NULL,
	[RefItemID] [int] NULL,
	[ItemType] [nvarchar](20) NULL,
	[OrderParentID] [int] NULL,
	[IsActive] [int] NULL,
	[language] [nvarchar](10) NOT NULL,
	[BaseName] [nvarchar](100) NULL,
	[BaseDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_RSEArticle] PRIMARY KEY CLUSTERED 
(
	[DS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[RSEArticle] ADD  CONSTRAINT [DF_RSEArticle_UID]  DEFAULT (newid()) FOR [UID]
GO

ALTER TABLE [dbo].[RSEArticle] ADD  CONSTRAINT [DF_RSEArticle_ResponseDateTime]  DEFAULT (getdate()) FOR [ResponseDateTime]
GO

ALTER TABLE [dbo].[RSEArticle] ADD  CONSTRAINT [DF_RSEArticle_ChangeDateTime]  DEFAULT (getdate()) FOR [ChangeDateTime]
GO

ALTER TABLE [dbo].[RSEArticle] ADD  CONSTRAINT [DF_RSEArticle_userDeleted]  DEFAULT ((0)) FOR [userDeleted]
GO

ALTER TABLE [dbo].[RSEArticle] ADD  CONSTRAINT [DF_RSEArticle_sysDeleted]  DEFAULT ((0)) FOR [sysDeleted]
GO

ALTER TABLE [dbo].[RSEArticle] ADD  CONSTRAINT [DF_RSEArticle_ParentID]  DEFAULT ((0)) FOR [ParentID]
GO

ALTER TABLE [dbo].[RSEArticle] ADD  CONSTRAINT [DF_RSEArticle_OrderParentID]  DEFAULT (@@identity) FOR [OrderParentID]
GO

ALTER TABLE [dbo].[RSEArticle] ADD  CONSTRAINT [DF_RSEArticle_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO

ALTER TABLE [dbo].[RSEArticle] ADD  CONSTRAINT [DF_RSEArticle_BaseName]  DEFAULT ('....') FOR [BaseName]
GO


