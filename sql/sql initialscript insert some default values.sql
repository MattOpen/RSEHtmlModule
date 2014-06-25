BEGIN
if 0 in (select top 1 PortalID from dbo.RSEModuleSettings where PortalID = 0)
goto endsave
declare @PortalID int = '0'    --your DNN Portal ID
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
           
endsave:
end