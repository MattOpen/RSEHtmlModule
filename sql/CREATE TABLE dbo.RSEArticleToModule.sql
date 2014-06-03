/****** Object:  Table [dbo].[RSEArticleToModule]    Script Date: 06/03/2014 13:09:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RSEArticleToModule](
	[DS_ID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [nvarchar](50) NULL,
	[IPAddress] [nvarchar](100) NULL,
	[ResponseDateTime] [datetime] NULL,
	[UserID] [int] NOT NULL,
	[ArticleID] [int] NOT NULL,
	[ModuleID] [int] NOT NULL,
	[PortalID] [int] NULL,
 CONSTRAINT [PK_RSEArticleToModule] PRIMARY KEY CLUSTERED 
(
	[DS_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RSEArticleToModule] ADD  CONSTRAINT [DF_RSEArticleToModule_UID]  DEFAULT (newid()) FOR [UID]
GO

ALTER TABLE [dbo].[RSEArticleToModule] ADD  CONSTRAINT [DF_RSEArticleToModule_ResponseDateTime]  DEFAULT (getdate()) FOR [ResponseDateTime]
GO


