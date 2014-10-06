/****** Object:  StoredProcedure [dbo].[RSEprocSetModuleSettings]    Script Date: 06/25/2014 18:43:49 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSEprocSetModuleSettings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RSEprocSetModuleSettings]
GO

/****** Object:  StoredProcedure [dbo].[RSEprocGetModuleSettings]    Script Date: 06/25/2014 18:43:29 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSEprocGetModuleSettings]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RSEprocGetModuleSettings]
GO

/****** Object:  StoredProcedure [dbo].[RSEprocGetItemIDLanguage]    Script Date: 06/25/2014 18:43:06 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSEprocGetItemIDLanguage]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RSEprocGetItemIDLanguage]
GO

/****** Object:  StoredProcedure [dbo].[RSEprocGetArticle]    Script Date: 06/25/2014 18:42:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSEprocGetArticle]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RSEprocGetArticle]
GO

/****** Object:  View [dbo].[vwRSEArticleToModule]    Script Date: 06/25/2014 18:41:51 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vwRSEArticleToModule]'))
DROP VIEW [dbo].[vwRSEArticleToModule]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RSEArticle_UID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RSEArticle] DROP CONSTRAINT [DF_RSEArticle_UID]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RSEArticle_ResponseDateTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RSEArticle] DROP CONSTRAINT [DF_RSEArticle_ResponseDateTime]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RSEArticle_ChangeDateTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RSEArticle] DROP CONSTRAINT [DF_RSEArticle_ChangeDateTime]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RSEArticle_userDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RSEArticle] DROP CONSTRAINT [DF_RSEArticle_userDeleted]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RSEArticle_sysDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RSEArticle] DROP CONSTRAINT [DF_RSEArticle_sysDeleted]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RSEArticle_ParentID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RSEArticle] DROP CONSTRAINT [DF_RSEArticle_ParentID]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RSEArticle_OrderParentID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RSEArticle] DROP CONSTRAINT [DF_RSEArticle_OrderParentID]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RSEArticle_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RSEArticle] DROP CONSTRAINT [DF_RSEArticle_IsActive]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RSEArticle_BaseName]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RSEArticle] DROP CONSTRAINT [DF_RSEArticle_BaseName]
END

GO

/****** Object:  Table [dbo].[RSEArticle]    Script Date: 06/25/2014 18:32:33 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSEArticle]') AND type in (N'U'))
DROP TABLE [dbo].[RSEArticle]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RSEArticleToModule_UID]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RSEArticleToModule] DROP CONSTRAINT [DF_RSEArticleToModule_UID]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RSEArticleToModule_ResponseDateTime]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RSEArticleToModule] DROP CONSTRAINT [DF_RSEArticleToModule_ResponseDateTime]
END

GO

/****** Object:  Table [dbo].[RSEArticleToModule]    Script Date: 06/25/2014 18:40:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSEArticleToModule]') AND type in (N'U'))
DROP TABLE [dbo].[RSEArticleToModule]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RSEModuleSettings_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[RSEModuleSettings]'))
ALTER TABLE [dbo].[RSEModuleSettings] DROP CONSTRAINT [FK_RSEModuleSettings_Portals]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RSEModuleSettings_CreatedOnDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RSEModuleSettings] DROP CONSTRAINT [DF_RSEModuleSettings_CreatedOnDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RSEModuleSettings_LastModifiedOnDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RSEModuleSettings] DROP CONSTRAINT [DF_RSEModuleSettings_LastModifiedOnDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RSEModuleSettings_CultureCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RSEModuleSettings] DROP CONSTRAINT [DF_RSEModuleSettings_CultureCode]
END

GO

/****** Object:  Table [dbo].[RSEModuleSettings]    Script Date: 06/25/2014 18:40:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSEModuleSettings]') AND type in (N'U'))
DROP TABLE [dbo].[RSEModuleSettings]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RSEUserSettings_Portals]') AND parent_object_id = OBJECT_ID(N'[dbo].[RSEUserSettings]'))
ALTER TABLE [dbo].[RSEUserSettings] DROP CONSTRAINT [FK_RSEUserSettings_Portals]
GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RSEUserSettings_CreatedOnDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RSEUserSettings] DROP CONSTRAINT [DF_RSEUserSettings_CreatedOnDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RSEUserSettings_LastModifiedOnDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RSEUserSettings] DROP CONSTRAINT [DF_RSEUserSettings_LastModifiedOnDate]
END

GO

IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_RSEUserSettings_CultureCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[RSEUserSettings] DROP CONSTRAINT [DF_RSEUserSettings_CultureCode]
END

GO

/****** Object:  Table [dbo].[RSEUserSettings]    Script Date: 06/25/2014 18:41:10 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSEUserSettings]') AND type in (N'U'))
DROP TABLE [dbo].[RSEUserSettings]
GO

/****** Object:  StoredProcedure [dbo].[RSEQueryFocusID]    Script Date: 10/01/2014 16:50:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RSEQueryFocusID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[RSEQueryFocusID]
GO

