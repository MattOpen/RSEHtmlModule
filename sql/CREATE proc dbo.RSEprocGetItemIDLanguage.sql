/****** Object:  StoredProcedure [dbo].[RSEprocGetItemIDLanguage]    Script Date: 06/03/2014 13:31:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[RSEprocGetItemIDLanguage] 

(
 @UserID int ='',
 @ItemID int = '',
 @ItemType nvarchar(50) ,
 @ResultType nvarchar(50) = ''
)
AS
/*************************
liefert die DS_ID´s als array von Produkten, Companies etc mit den zugehörigen translation
und Sprachattributen de-DE, en-US
Übergabewerte sind
@ItemID = ProduktID, CompanyID...
@ItemType = Product, Company...

*************************/

	SET NOCOUNT ON

	
BEGIN
declare @ParentID int
declare @DNNInstance nvarchar(50) = 'dnn7local'
/*	--PRÜFUNG
declare @ItemID int set @ItemID = 45
declare @ItemType nvarchar(50) set @ItemType = 'product'
*/
declare @returnmessage nvarchar(500)
set @returnmessage = 'HINWEIS'
if @ResultType = '' or @ResultType is NULL set @ResultType = 'full'
declare @temptable table(SourceID int, [language] nvarchar(10), CultureName nvarchar(100), IDspalte int identity(1,1))
			
	if @ItemType = 'product' goto Product
	else if @ItemType = 'editarticle' goto Article
	else if @ItemType = 'NewLanguage' goto NewLanguage
	else goto endsave
				


Product:
set @ParentID = (select TOP 1 ParentID from Product where [ID] = @ItemID)
--	if focus = master
	if @parentid = 0
		BEGIN
			--aktueller DS
			insert into @temptable (SourceID) 
				values(@ItemID)	 
			
			set @parentid = @ItemID
			
			--suche alle verbundenen Sprachen
			insert into @temptable (SourceID)
				(select ID from Product 
					where [ParentID] = @ParentID
					and ID not in (select SourceID from @temptable)
					and Deleted = 0 and sysDeleted = 0
					)
		END
	ELSE
		BEGIN
--	if focus = slave
			insert into @temptable (SourceID)
				values(@ParentID)	 
				
			--suche alle verbundenen Sprachen
			insert into @temptable (SourceID)
				(select ID from Product 
					where [ParentID] = @ParentID
					and ID not in (select SourceID from @temptable)
					and Deleted = 0 and sysDeleted = 0
					)
		END

	update @temptable
		set temp.[language] = product.[language], temp.CultureName = @DNNInstance.dbo.Languages.CultureName
		-- ACHTUNG: DB muss angepasst werden
		from @temptable temp left join Product on ID = SourceID left join dbo.Languages on CultureCode = Product.[language]
		-- ACHTUNG: DB muss angepasst werden

goto SHOWRESULT

Article:
set @ParentID = (select TOP 1 ParentID from RSEArticle where [DS_ID] = @ItemID)
--	if focus = master
	if @parentid = 0
		BEGIN
			--aktueller DS
			insert into @temptable (SourceID) 
				values(@ItemID)	 
			
			set @parentid = @ItemID
			
			--suche alle verbundenen Sprachen
			insert into @temptable (SourceID)
				(select DS_ID from RSEArticle 
					where [ParentID] = @ParentID
					and DS_ID not in (select SourceID from @temptable)
					and userDeleted = 0 and sysDeleted = 0
					)
		END
	ELSE
		BEGIN
--	if focus = slave
			insert into @temptable (SourceID)
				values(@ParentID)	 
				
			--suche alle verbundenen Sprachen
			insert into @temptable (SourceID)
				(select DS_ID from RSEArticle 
					where [ParentID] = @ParentID
					and DS_ID not in (select SourceID from @temptable)
					and userDeleted = 0 and sysDeleted = 0
					)
		END

	update @temptable
		set temp.[language] = RSEArticle.[language], temp.CultureName = dbo.Languages.CultureName
		-- ACHTUNG: DB muss angepasst werden
		from @temptable temp left join RSEArticle on DS_ID = SourceID left join dbo.Languages on CultureCode = RSEArticle.[language]
		-- ACHTUNG: DB muss angepasst werden

goto SHOWRESULT


NewLanguage:
set @ParentID = (select TOP 1 ParentID from RSEArticle where [DS_ID] = @ItemID)
	if @parentid = 0
		BEGIN
			--aktueller DS
			insert into @temptable (SourceID) 
				values(@ItemID)	 
			
			set @parentid = @ItemID
			
			--suche alle verbundenen Sprachen
			insert into @temptable (SourceID)
				(select DS_ID from RSEArticle 
					where [ParentID] = @ParentID
					and DS_ID not in (select SourceID from @temptable)
					and userDeleted = 0 and sysDeleted = 0
					)
		END
	ELSE
		BEGIN
			insert into @temptable (SourceID)
				values(@ParentID)	 
				
			--suche alle verbundenen Sprachen
			insert into @temptable (SourceID)
				(select DS_ID from RSEArticle 
					where [ParentID] = @ParentID
					and DS_ID not in (select SourceID from @temptable)
					and userDeleted = 0 and sysDeleted = 0
					)
		END

	update @temptable
		set temp.[language] = RSEArticle.[language], temp.CultureName = dbo.Languages.CultureName
		-- ACHTUNG: DB muss angepasst werden
		from @temptable temp left join RSEArticle on DS_ID = SourceID left join dbo.Languages on CultureCode = RSEArticle.[language]
		-- ACHTUNG: DB muss angepasst werden


	select CultureName as NewText, CultureCode as NewEntryID 
	from dbo.Languages 
	where CultureCode not in (select [language] as EntryID from @temptable )
	order by CultureName
	
	GOTO endsave


SHOWRESULT:
if @ResultType = 'full'
	BEGIN
	select CultureName as Text, [language] as EntryID, * from @temptable  order by CultureName
	GOTO endsave
	END
--select * from @temptable  

if @ResultType = 'language'
	BEGIN
	select [language]from @temptable  order by CultureName
	goto endsave
	END



endsave:
end




GO


