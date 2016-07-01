
CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [ApplicationId], [PathId], [Path], [LoweredPath]
  FROM [dbo].[aspnet_Paths]
GO
GRANT SELECT
    ON OBJECT::[dbo].[vw_aspnet_WebPartState_Paths] TO [aspnet_Personalization_ReportingAccess]
    AS [dbo];

