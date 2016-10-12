CREATE VIEW [dbo].[vw_InvestorsCreditApprovedAppliedLimitNotInformed]
	AS SELECT * FROM [dbo].[vw_InvestorsCreditApprovedAppliedLimit] i
	WHERE i.CreditDecisionInformed IS NULL
