CREATE VIEW [dbo].[vw_BuyerCreditApprovedLowerLimitNotInformed]
	AS SELECT * FROM [dbo].[vw_BuyerCreditApprovedLowerLimit] ba
	WHERE ba.FinalCreditDecisionInformed IS NULL
	 
