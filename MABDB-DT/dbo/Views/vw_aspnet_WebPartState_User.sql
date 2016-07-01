
CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [PathId], [UserId], [DataSize]=DATALENGTH([PageSettings]), [LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
GO
GRANT SELECT
    ON OBJECT::[dbo].[vw_aspnet_WebPartState_User] TO [aspnet_Personalization_ReportingAccess]
    AS [dbo];

