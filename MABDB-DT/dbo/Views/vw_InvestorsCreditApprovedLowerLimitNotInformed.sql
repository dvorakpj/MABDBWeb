CREATE VIEW [dbo].[vw_InvestorsCreditApprovedLowerLimitNotInformed]
	AS SELECT * FROM [dbo].[vw_InvestorsCreditApprovedLowerLimit] i
	WHERE i.CreditDecisionInformed IS NULL
	 
