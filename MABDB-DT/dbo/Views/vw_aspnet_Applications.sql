
CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [ApplicationName], [LoweredApplicationName], [ApplicationId], [Description]
  FROM [dbo].[aspnet_Applications]
GO
GRANT SELECT
    ON OBJECT::[dbo].[vw_aspnet_Applications] TO [aspnet_Membership_ReportingAccess]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[vw_aspnet_Applications] TO [aspnet_Personalization_ReportingAccess]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[vw_aspnet_Applications] TO [aspnet_Profile_ReportingAccess]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[vw_aspnet_Applications] TO [aspnet_Roles_ReportingAccess]
    AS [dbo];

