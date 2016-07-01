CREATE ROLE [aspnet_Personalization_BasicAccess]
    AUTHORIZATION [dbo];


GO
ALTER ROLE [aspnet_Personalization_BasicAccess] ADD MEMBER [aspnet_Personalization_FullAccess];

