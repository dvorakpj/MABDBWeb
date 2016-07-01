CREATE ROLE [aspnet_Roles_ReportingAccess]
    AUTHORIZATION [dbo];


GO
ALTER ROLE [aspnet_Roles_ReportingAccess] ADD MEMBER [aspnet_Roles_FullAccess];

