
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [PathId], [DataSize]=DATALENGTH([PageSettings]), [LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
GO
GRANT SELECT
    ON OBJECT::[dbo].[vw_aspnet_WebPartState_Shared] TO [aspnet_Personalization_ReportingAccess]
    AS [dbo];

