CREATE VIEW [dbo].[vw_InvestorAppCondRejectedNotInformed]
	AS SELECT * FROM [dbo].[vw_InvestorAppCondRejected] ca
WHERE ca.CondCreditDecisionInformed IS NULL AND ca.CondCreditDecisionInformedBy iS NULL