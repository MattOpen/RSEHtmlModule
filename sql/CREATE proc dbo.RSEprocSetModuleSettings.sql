SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[RSEprocSetModuleSettings] 
(	
	@UserID as INT, 
	@PortalID as INT,
	@SettingName as NVARCHAR(50), 
	@SettingValue as NVARCHAR(100)
)
as
BEGIN
/*****
*	setzt Standardwerte
*	use:	execute [dbo].[RSEprocSetModuleSettings] @UserID=1, @PortalID=20, @SettingName='FocusArticleID' ,@SettingValue='63'
*****/


	if @SettingValue = '0' or @SettingValue = NULL goto endsave

	delete from dbo.RSEUserSettings 
	where CreatedByUserID = @UserID and PortalID = @PortalID and SettingName = @SettingName
	
	Insert into dbo.RSEUserSettings(
			CreatedByUserID, PortalID, SettingName, SettingValue
		)
		values(
			@UserID, @PortalID, @SettingName, @SettingValue
		)

--	new settings
execute [dbo].[RSEprocGetModuleSettings] @UserID=@UserID, @PortalID=@PortalID

endsave:
END




GO


