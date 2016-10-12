CREATE VIEW [dbo].[vw_BuyerAppCondAcceptedNotInformed]
	AS SELECT * FROM [dbo].[vw_BuyerAppCondAccepted] ba
	WHERE ba.CondCreditDecisionInformed IS NULL AND ba.CondCreditDecisionInformedBy iS NULL
