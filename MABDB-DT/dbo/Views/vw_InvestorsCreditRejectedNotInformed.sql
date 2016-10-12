CREATE VIEW [dbo].[vw_InvestorsCreditRejectedNotInformed]
	AS SELECT * FROM [dbo].[vw_InvestorsCreditRejected] i
	WHERE i.CreditDecisionInformed IS NULL
