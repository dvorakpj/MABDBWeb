
CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]
  FROM [dbo].[aspnet_Users]
GO
GRANT SELECT
    ON OBJECT::[dbo].[vw_aspnet_Users] TO [aspnet_Membership_ReportingAccess]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[vw_aspnet_Users] TO [aspnet_Personalization_ReportingAccess]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[vw_aspnet_Users] TO [aspnet_Profile_ReportingAccess]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[vw_aspnet_Users] TO [aspnet_Roles_ReportingAccess]
    AS [dbo];

