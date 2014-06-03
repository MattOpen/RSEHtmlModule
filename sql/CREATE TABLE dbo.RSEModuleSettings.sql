
/****** Object:  Table [dbo].[RSEModuleSettings]    Script Date: 06/03/2014 13:00:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RSEModuleSettings](
	[IPAddress] [nvarchar](100) NULL,
	[CreatedByUserID] [int] NULL,
	[CreatedOnDate] [datetime] NULL,
	[LastModifiedByUserID] [int] NULL,
	[LastModifiedOnDate] [datetime] NULL,
	[PortalID] [int] NOT NULL,
	[SettingName] [nvarchar](50) NOT NULL,
	[SettingValue] [nvarchar](2000) NULL,
	[SettingDescription] [nvarchar](2000) NULL,
	[CultureCode] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_RSEModuleSettings] PRIMARY KEY CLUSTERED 
(
	[PortalID] ASC,
	[SettingName] ASC,
	[CultureCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[RSEModuleSettings]  WITH CHECK ADD  CONSTRAINT [FK_RSEModuleSettings_Portals] FOREIGN KEY([PortalID])
REFERENCES [dbo].[Portals] ([PortalID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[RSEModuleSettings] CHECK CONSTRAINT [FK_RSEModuleSettings_Portals]
GO

ALTER TABLE [dbo].[RSEModuleSettings] ADD  CONSTRAINT [DF_RSEModuleSettings_CreatedOnDate]  DEFAULT (getdate()) FOR [CreatedOnDate]
GO

ALTER TABLE [dbo].[RSEModuleSettings] ADD  CONSTRAINT [DF_RSEModuleSettings_LastModifiedOnDate]  DEFAULT (getdate()) FOR [LastModifiedOnDate]
GO

ALTER TABLE [dbo].[RSEModuleSettings] ADD  CONSTRAINT [DF_RSEModuleSettings_CultureCode]  DEFAULT ('en-US') FOR [CultureCode]
GO

