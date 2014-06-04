--	execute to DNN database
declare @PortalID int = '22'    -your DNN Portal ID
declare @externDB nvarchar(100) = 'mydb.dbo.'	--name of secondary database. If you use DNN-DB, then value = 'dbo.'
declare @externnameDB nvarchar(100) = 'mydb'    --name of secondary database. If you use DNN-DB, then value = ''
declare @MasterLanguage nvarchar(100) = 'de-DE'		--preferred locale for new items


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
           ,'mydb'
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
GO

