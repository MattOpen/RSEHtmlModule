/****** Object:  StoredProcedure [dbo].[RSEprocGetArticle]    Script Date: 06/03/2014 13:14:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[RSEprocGetArticle] 

(
 @UserID int ='',
 @PortalID int = '',
 @ModuleID int = ''
)
AS
/*************************


*************************/

	SET NOCOUNT ON

	
BEGIN

--	if @ModuleID in (select ModuleID from dbo.RSEArticleToModule where ArticleID = @ItemID) GOTO endsave

	select  BaseName+' (ID: '+ convert(varchar,DS_ID)+' '+[language]+' )' as Text, [DS_ID] as EntryID,* 
	from dbo.RSEArticle 
	where PortalID = @PortalID and ParentID = 0 and userDeleted = 0 and sysDeleted = 0 

endsave:
end





GO


