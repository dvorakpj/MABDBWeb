CREATE ROLE [aspnet_Roles_BasicAccess]
    AUTHORIZATION [dbo];


GO
ALTER ROLE [aspnet_Roles_BasicAccess] ADD MEMBER [aspnet_Roles_FullAccess];

