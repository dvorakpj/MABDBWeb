CREATE VIEW [dbo].[vw_BuyerAppCondAccepted]
	AS SELECT * FROM [dbo].[vw_BuyerApplications] ba
	WHERE ba.CondCreditDecisionDate IS NOT NULL AND ba.CondCreditDecision = 'A' 
