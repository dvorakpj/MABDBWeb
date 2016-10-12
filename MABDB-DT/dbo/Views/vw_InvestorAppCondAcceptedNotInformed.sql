CREATE VIEW [dbo].[vw_InvestorAppCondAcceptedNotInformed]
	AS SELECT * FROM [dbo].[vw_InvestorAppCondAccepted] ca
WHERE ca.CondCreditDecisionInformed IS NULL AND ca.CondCreditDecisionInformedBy iS NULL