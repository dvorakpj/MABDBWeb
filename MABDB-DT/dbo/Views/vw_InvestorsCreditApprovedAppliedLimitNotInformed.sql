CREATE VIEW [dbo].[vw_InvestorsCreditApprovedAppliedLimitNotInformed]
	AS SELECT * FROM [dbo].[vw_InvestorsCreditApprovedAppliedLimit] i
	WHERE i.FinalCreditDecisionInformed IS NULL
