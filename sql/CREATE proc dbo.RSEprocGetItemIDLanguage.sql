/****** Object:  StoredProcedure [dbo].[RSEprocGetItemIDLanguage]    Script Date: 07/14/2014 19:39:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER proc [dbo].[RSEprocGetItemIDLanguage] 

(
 @UserID int ='',
 @ItemID int = '',
 @ItemType nvarchar(50) ,
 @ResultType nvarchar(50) = '',
 @NewType nvarchar(50) = ''
)
AS
/*************************
liefert die DS_ID´s als array von Produkten, Companies etc mit den zugehörigen translation
und Sprachattributen de-DE, en-US
Übergabewerte sind
@ItemID = ProduktID, CompanyID...
@ItemType = Product, Company...
VERSION 09.07.2014

*************************/

	SET NOCOUNT ON

	
BEGIN
declare @ParentID int
declare @DNNInstance VARCHAR(MAX) = (
	select TOP 1 SettingValue 
	from RSEModuleSettings 
	where SettingName = 'DNNInstance')  --'DNN7local.'

DECLARE @SQL_TEMPLATE VARCHAR(MAX)
DECLARE @SQL_SCRIPT VARCHAR(MAX)
DECLARE @tablescope VARCHAR(MAX)
SET @SQL_TEMPLATE = N'
		update #temptable 
		set 
			[language] = {TABLESCOPE}.[language]
			, CultureName = {DBNAME}dbo.Languages.CultureName	
		from #temptable 
			left join {TABLESCOPE} on DS_ID = SourceID 
			left join {DBNAME}dbo.Languages on CultureCode = {TABLESCOPE}.[language]'

create table #temptable (SourceID int, [language] nvarchar(10), CultureName nvarchar(100), IDspalte int identity(1,1))
	
	if @ResultType = '' or @ResultType is NULL set @ResultType = 'full'
	if @NewType = 'newlanguage' goto NewLanguage
	if @ItemType = 'product' goto Product
		else if @ItemType = 'editarticle' goto Article
		else if @ItemType = 'editemailtemplates' goto Emailtemplate
		else goto endsave
				


Product:


goto SHOWRESULT



Article:
set @tablescope = 'RSEArticle'
set @ParentID = (select TOP 1 ParentID from RSEArticle where [DS_ID] = @ItemID)
--	if focus = master
	if @parentid = 0
		BEGIN
			--aktueller DS
			insert into #temptable (SourceID) 
				values(@ItemID)	 
			
			set @parentid = @ItemID
			
			--suche alle verbundenen Sprachen
			insert into #temptable (SourceID)
				(select DS_ID from RSEArticle 
					where [ParentID] = @ParentID
					and DS_ID not in (select SourceID from #temptable)
					and userDeleted = 0 and sysDeleted = 0
					)
		END
	ELSE
		BEGIN
--	if focus = slave
			insert into #temptable (SourceID)
				values(@ParentID)	 
				
			--suche alle verbundenen Sprachen
			insert into #temptable (SourceID)
				(select DS_ID from RSEArticle 
					where [ParentID] = @ParentID
					and DS_ID not in (select SourceID from #temptable)
					and userDeleted = 0 and sysDeleted = 0
					)
		END
	
	SET @SQL_SCRIPT = REPLACE(@SQL_TEMPLATE, '{DBNAME}', @DNNInstance)
	SET @SQL_SCRIPT = REPLACE(@SQL_SCRIPT, '{TABLESCOPE}', @tablescope)
	EXECUTE (@SQL_SCRIPT)	

	goto SHOWRESULT


Emailtemplate:
	set @tablescope = 'RSEEmailtemplates'
	set @ParentID = (select TOP 1 ParentID from RSEEmailtemplates where [DS_ID] = @ItemID)
--	if focus = master
	if @parentid = 0
		BEGIN
			--aktueller DS
			insert into #temptable (SourceID) 
				values(@ItemID)	 
			
			set @parentid = @ItemID
			
			--suche alle verbundenen Sprachen
			insert into #temptable (SourceID)
				(select DS_ID from RSEEmailtemplates 
					where [ParentID] = @ParentID
					and DS_ID not in (select SourceID from #temptable)
					and userDeleted = 0 and sysDeleted = 0
					)
		END
	ELSE
		BEGIN
--	if focus = slave
			insert into #temptable (SourceID)
				values(@ParentID)	 
				
			--suche alle verbundenen Sprachen
			insert into #temptable (SourceID)
				(select DS_ID from RSEEmailtemplates 
					where [ParentID] = @ParentID
					and DS_ID not in (select SourceID from #temptable)
					and userDeleted = 0 and sysDeleted = 0
					)
		END

	
	SET @SQL_SCRIPT = REPLACE(@SQL_TEMPLATE, '{DBNAME}', @DNNInstance)
	SET @SQL_SCRIPT = REPLACE(@SQL_SCRIPT, '{TABLESCOPE}', @tablescope)
	EXECUTE (@SQL_SCRIPT)

goto SHOWRESULT



NewLanguage:
	if @ItemType = 'product' goto NewProductLanguage
	else if @ItemType = 'editarticle' goto NewArticleLanguage
	else if @ItemType = 'editemailtemplates' goto NewEmailtemplateLanguage
	else goto endsave
	
----------------
NewProductLanguage:
	GOTO EndNewLanguage
----------------
NewArticleLanguage:
set @tablescope = 'RSEArticle'
set @ParentID = (select TOP 1 ParentID from RSEArticle where [DS_ID] = @ItemID)
	if @parentid = 0
		BEGIN
			--aktueller DS
			insert into #temptable (SourceID) 
				values(@ItemID)	 
			
			set @parentid = @ItemID
			
			--suche alle verbundenen Sprachen
			insert into #temptable (SourceID)
				(select DS_ID from RSEArticle 
					where [ParentID] = @ParentID
					and DS_ID not in (select SourceID from #temptable)
					and userDeleted = 0 and sysDeleted = 0
					)
		END
	ELSE
		BEGIN
			insert into #temptable (SourceID)
				values(@ParentID)	 
				
			--suche alle verbundenen Sprachen
			insert into #temptable (SourceID)
				(select DS_ID from RSEArticle 
					where [ParentID] = @ParentID
					and DS_ID not in (select SourceID from #temptable)
					and userDeleted = 0 and sysDeleted = 0
					)
		END
	
	SET @SQL_SCRIPT = REPLACE(@SQL_TEMPLATE, '{DBNAME}', @DNNInstance)
	SET @SQL_SCRIPT = REPLACE(@SQL_SCRIPT, '{TABLESCOPE}', @tablescope)
	EXECUTE (@SQL_SCRIPT)	
	GOTO EndNewLanguage
------------
----------------
NewEmailtemplateLanguage:
set @tablescope = 'RSEEmailtemplates'
set @ParentID = (select TOP 1 ParentID from RSEEmailtemplates where [DS_ID] = @ItemID)
	if @parentid = 0
		BEGIN
			--aktueller DS
			insert into #temptable (SourceID) 
				values(@ItemID)	 
			
			set @parentid = @ItemID
			
			--suche alle verbundenen Sprachen
			insert into #temptable (SourceID)
				(select DS_ID from RSEEmailtemplates 
					where [ParentID] = @ParentID
					and DS_ID not in (select SourceID from #temptable)
					and userDeleted = 0 and sysDeleted = 0
					)
		END
	ELSE
		BEGIN
			insert into #temptable (SourceID)
				values(@ParentID)	 
				
			--suche alle verbundenen Sprachen
			insert into #temptable (SourceID)
				(select DS_ID from RSEEmailtemplates 
					where [ParentID] = @ParentID
					and DS_ID not in (select SourceID from #temptable)
					and userDeleted = 0 and sysDeleted = 0
					)
		END

	SET @SQL_SCRIPT = REPLACE(@SQL_TEMPLATE, '{DBNAME}', @DNNInstance)
	SET @SQL_SCRIPT = REPLACE(@SQL_SCRIPT, '{TABLESCOPE}', @tablescope)
	EXECUTE (@SQL_SCRIPT)

------------

EndNewLanguage:
--	gilt für alle
	
	SET @SQL_TEMPLATE = N'
		select CultureName as NewText, CultureCode as NewEntryID 
		from {DBNAME}dbo.Languages 
		where CultureCode not in (select [language] as EntryID from #temptable )
		order by CultureName'
	
	SET @SQL_SCRIPT = REPLACE(@SQL_TEMPLATE, '{DBNAME}', @DNNInstance)
	EXECUTE (@SQL_SCRIPT)
	
	GOTO endsave


SHOWRESULT:
if @ResultType = 'full'
	BEGIN
	select CultureName as Text, [language] as EntryID, * from #temptable  order by CultureName
	GOTO endsave
	END


if @ResultType = 'language'
	BEGIN
	select [language]from #temptable  order by CultureName
	goto endsave
	END



endsave:
DROP table #temptable
end

