CREATE VIEW [dbo].[vw_BuyerAppCondRejected]
	AS SELECT * FROM [dbo].[vw_BuyerApplications] ba
		WHERE ba.CondCreditDecisionDate IS NOT NULL AND ba.CondCreditDecision = 'R'  