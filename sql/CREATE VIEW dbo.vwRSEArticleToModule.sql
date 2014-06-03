/****** Object:  View [dbo].[vwRSEArticleToModule]    Script Date: 06/03/2014 13:34:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwRSEArticleToModule]
AS
SELECT     dbo.RSEArticleToModule.ModuleID, dbo.RSEArticleToModule.ArticleID, dbo.RSEArticle.DS_ID, dbo.RSEArticle.UID, dbo.RSEArticle.IPAddress, 
                      dbo.RSEArticle.ResponseDateTime, dbo.RSEArticle.UserID, dbo.RSEArticle.ChangeDateTime, dbo.RSEArticle.LastUserID, dbo.RSEArticle.PortalID, 
                      dbo.RSEArticle.TabID, dbo.RSEArticle.viewcount, dbo.RSEArticle.userDeleted, dbo.RSEArticle.sysDeleted, dbo.RSEArticle.ParentID, dbo.RSEArticle.RefItemID, 
                      dbo.RSEArticle.ItemType, dbo.RSEArticle.OrderParentID, dbo.RSEArticle.IsActive, dbo.RSEArticle.language, dbo.RSEArticle.BaseName, 
                      dbo.RSEArticle.BaseDescription
FROM         dbo.RSEArticle RIGHT OUTER JOIN
                      dbo.RSEArticleToModule ON dbo.RSEArticle.DS_ID = dbo.RSEArticleToModule.ArticleID

GO


