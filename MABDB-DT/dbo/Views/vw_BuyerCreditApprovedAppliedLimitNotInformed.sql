CREATE VIEW [dbo].[vw_BuyerCreditApprovedAppliedLimitNotInformed]
	AS SELECT * FROM [dbo].[vw_BuyerCreditApprovedAppliedLimit] ba
	WHERE ba.FinalCreditDecisionInformed IS NULL
	 
