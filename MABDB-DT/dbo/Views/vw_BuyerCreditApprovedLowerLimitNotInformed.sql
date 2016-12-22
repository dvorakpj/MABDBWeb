CREATE VIEW [dbo].[vw_BuyerCreditApprovedLowerLimitNotInformed]
	AS SELECT * FROM [dbo].[vw_BuyerCreditApprovedLowerLimit] ba
	WHERE ba.CondCreditDecisionInformed IS NULL AND ba.CondCreditDecision IS NOT NULL
	 
