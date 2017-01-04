CREATE VIEW [dbo].[vw_BuyersCondAcceptedNotInformed]
	AS SELECT * FROM [vw_BuyersCondAccepted] bca
	WHERE bca.CondCreditDecisionInformed IS NULL
