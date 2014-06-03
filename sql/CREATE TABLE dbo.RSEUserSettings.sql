
/****** Object:  Table [dbo].[RSEUserSettings]    Script Date: 06/03/2014 13:01:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RSEUserSettings](
	[IPAddress] [nvarchar](100) NULL,
	[CreatedByUserID] [int] NOT NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[PortalID] [int] NOT NULL,
	[SettingName] [nvarchar](50) NOT NULL,
	[SettingValue] [nvarchar](2000) NULL,
	[SettingDescription] [nvarchar](2000) NULL,
	[CultureCode] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_RSEUserSettings_1] PRIMARY KEY CLUSTERED 
(
	[CreatedByUserID] ASC,
	[PortalID] ASC,
	[SettingName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RSEUserSettings]  WITH CHECK ADD  CONSTRAINT [FK_RSEUserSettings_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[RSEUserSettings] CHECK CONSTRAINT [FK_RSEUserSettings_Portals]
GO

ALTER TABLE [dbo].[RSEUserSettings] ADD  CONSTRAINT [DF_RSEUserSettings_CreatedOnDate]  DEFAULT (getdate()) FOR [CreatedOnDate]
GO

ALTER TABLE [dbo].[RSEUserSettings] ADD  CONSTRAINT [DF_RSEUserSettings_LastModifiedOnDate]  DEFAULT (getdate()) FOR [LastModifiedOnDate]
GO

ALTER TABLE [dbo].[RSEUserSettings] ADD  CONSTRAINT [DF_RSEUserSettings_CultureCode]  DEFAULT ('en-US') FOR [CultureCode]
GO


