/*
List all properties in NEW 
defined as  properties where neither Valuation nor Inspectins was comppleted
*/

CREATE VIEW [dbo].[vw_PropertyNew]
	AS SELECT * FROM Property	pr
	WHERE pr.ValuationCompleted IS NULL 
	AND pr.InspectionCompleted IS NULL 
