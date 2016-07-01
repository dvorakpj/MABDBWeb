CREATE ROLE [aspnet_Personalization_ReportingAccess]
    AUTHORIZATION [dbo];


GO
ALTER ROLE [aspnet_Personalization_ReportingAccess] ADD MEMBER [aspnet_Personalization_FullAccess];

