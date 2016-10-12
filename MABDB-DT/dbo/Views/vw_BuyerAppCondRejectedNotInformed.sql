CREATE VIEW [dbo].[vw_BuyerAppCondRejectedNotInformed]
	AS SELECT * FROM [dbo].[vw_BuyerAppCondRejected] ba
	WHERE ba.CondCreditDecisionInformed IS NULL AND ba.CondCreditDecisionInformedBy iS NULL
