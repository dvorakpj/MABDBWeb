﻿CREATE ROLE [aspnet_Membership_ReportingAccess]
    AUTHORIZATION [dbo];


GO
ALTER ROLE [aspnet_Membership_ReportingAccess] ADD MEMBER [aspnet_Membership_FullAccess];

