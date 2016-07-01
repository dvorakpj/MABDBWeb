
CREATE PROCEDURE [dbo].aspnet_CheckSchemaVersion
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN

    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_SchemaVersions))
    BEGIN
        EXEC [dbo].aspnet_RegisterSchemaVersion N'Common', N'1', 1, 1
        EXEC [dbo].aspnet_RegisterSchemaVersion N'Membership', N'1', 1, 1
        EXEC [dbo].aspnet_RegisterSchemaVersion N'Personalization', N'1', 1, 1
        EXEC [dbo].aspnet_RegisterSchemaVersion N'Profile', N'1', 1, 1
        EXEC [dbo].aspnet_RegisterSchemaVersion N'Role Manager', N'1', 1, 1
        EXEC [dbo].aspnet_RegisterSchemaVersion N'Health Monitoring', N'1', 1, 1
    END

    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[aspnet_CheckSchemaVersion] TO [aspnet_Membership_BasicAccess]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[aspnet_CheckSchemaVersion] TO [aspnet_Membership_ReportingAccess]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[aspnet_CheckSchemaVersion] TO [aspnet_Personalization_BasicAccess]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[aspnet_CheckSchemaVersion] TO [aspnet_Personalization_ReportingAccess]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[aspnet_CheckSchemaVersion] TO [aspnet_Profile_BasicAccess]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[aspnet_CheckSchemaVersion] TO [aspnet_Profile_ReportingAccess]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[aspnet_CheckSchemaVersion] TO [aspnet_Roles_BasicAccess]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[aspnet_CheckSchemaVersion] TO [aspnet_Roles_ReportingAccess]
    AS [dbo];


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[aspnet_CheckSchemaVersion] TO [aspnet_WebEvent_FullAccess]
    AS [dbo];

