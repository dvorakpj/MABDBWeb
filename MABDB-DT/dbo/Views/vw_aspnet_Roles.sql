
CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [ApplicationId], [RoleId], [RoleName], [LoweredRoleName], [Description]
  FROM [dbo].[aspnet_Roles]
GO
GRANT SELECT
    ON OBJECT::[dbo].[vw_aspnet_Roles] TO [aspnet_Roles_ReportingAccess]
    AS [dbo];

