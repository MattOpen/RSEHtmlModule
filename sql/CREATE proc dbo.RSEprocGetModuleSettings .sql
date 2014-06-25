/****** Object:  StoredProcedure [dbo].[RSEprocGetModuleSettings]    Script Date: 06/25/2014 19:09:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RSEprocGetModuleSettings] 
(	
	@UserID as NVARCHAR(MAX), 
	@PortalID as NVARCHAR(MAX),
	@SettingName as NVARCHAR(MAX)=''
)
as
BEGIN
/*****
*	liefert Standardwerte
*	use:	execute [dbo].[RSEprocGetModuleSettings] @UserID=1, @PortalID=20
*****/
-- initial check

if 0 in (select top 1 PortalID from dbo.RSEModuleSettings where PortalID = 0)
goto getvalues

declare @externDB nvarchar(100) = 'dbo.'	--default value 'dbo.', if you use an other DB, then value = 'mydb.dbo.' where mydb is other db name.
declare @externnameDB nvarchar(100) = ''    --default value '', if you use an other DB, then value = 'mydb' where mydb is other db name.
declare @MasterLanguage nvarchar(100) = 'en-US'		--default value 'en-US', preferred locale for new items


INSERT INTO [dbo].[RSEModuleSettings]
           ([IPAddress]
           ,[CreatedByUserID]
           ,[LastModifiedByUserID]
           ,[PortalID]
           ,[SettingName]
           ,[SettingValue]
           ,[SettingDescription]
           ,[CultureCode])
     VALUES
           (NULL
           ,'1'
           ,'1'
           ,@PortalID
           ,'externDB'
           ,@externDB
           ,NULL
           ,'en-US')

INSERT INTO [dbo].[RSEModuleSettings]
           ([IPAddress]
           ,[CreatedByUserID]
           ,[LastModifiedByUserID]
           ,[PortalID]
           ,[SettingName]
           ,[SettingValue]
           ,[SettingDescription]
           ,[CultureCode])
     VALUES
           (NULL
           ,'1'
           ,'1'
           ,@PortalID
           ,'externnameDB'
           ,@externnameDB
           ,NULL
           ,'en-US')

INSERT INTO [dbo].[RSEModuleSettings]
           ([IPAddress]
           ,[CreatedByUserID]
           ,[LastModifiedByUserID]
           ,[PortalID]
           ,[SettingName]
           ,[SettingValue]
           ,[SettingDescription]
           ,[CultureCode])
     VALUES
           (NULL
           ,'1'
           ,'1'
           ,@PortalID
           ,'MasterLanguage'
           ,ISNULL(@MasterLanguage,'en-US')
           ,NULL
           ,'en-US')
           
getvalues:





IF @SettingName <> '' GOTO ONEVALUE

DECLARE 
	@cols AS NVARCHAR(MAX),
    @query  AS NVARCHAR(MAX);
    
--ENABLE FOR TEST ONLY
/*declare
    @PortalID as NVARCHAR(MAX),
    @UserID as NVARCHAR(MAX);
    set @UserID = '-1'
    set @PortalID = '5'
*/    
  

SET @cols = STUFF((
			SELECT distinct ',' + QUOTENAME(c.SettingName) 
            FROM (
				select * from RSEModuleSettings as I
				union
				select * from RSEUserSettings as J
				) as c
            FOR XML PATH(''), TYPE
            ).value('.', 'NVARCHAR(MAX)'),1,1,'')

set @query = 'SELECT PortalID, ' + @cols + ' from 
            (
                select 
					SettingName
                    , SettingValue
                    , PortalID
                from RSEModuleSettings
                where PortalID = '+ @PortalID + '
                
                union
                
                select 
					SettingName
                    , SettingValue
                    , PortalID
                from RSEUserSettings
                where PortalID = '+ @PortalID + 'and CreatedByUserID = '+ @UserID +'
           ) x
            pivot 
            (
                max(SettingValue)
                for SettingName in (' + @cols + ')
            ) p '
GOTO STARTQUERY

ONEVALUE:
set @query = '
    			SELECT SettingValue as '+ ''''+ @SettingName + '''' +'
				from RSEUserSettings
                where PortalID = '+ @PortalID + ' and CreatedByUserID = '+ @UserID +' and SettingName = '+''''+ @SettingName + ''''
                


STARTQUERY:
execute(@query)

endsave:
END