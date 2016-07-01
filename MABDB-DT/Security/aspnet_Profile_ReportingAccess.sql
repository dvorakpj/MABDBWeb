CREATE ROLE [aspnet_Profile_ReportingAccess]
    AUTHORIZATION [dbo];


GO
ALTER ROLE [aspnet_Profile_ReportingAccess] ADD MEMBER [aspnet_Profile_FullAccess];

