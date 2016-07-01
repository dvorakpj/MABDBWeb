
CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [UserId], [RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
GO
GRANT SELECT
    ON OBJECT::[dbo].[vw_aspnet_UsersInRoles] TO [aspnet_Roles_ReportingAccess]
    AS [dbo];

