CREATE ROLE [aspnet_Profile_BasicAccess]
    AUTHORIZATION [dbo];


GO
ALTER ROLE [aspnet_Profile_BasicAccess] ADD MEMBER [aspnet_Profile_FullAccess];

