CREATE VIEW [dbo].[vw_BuyersCondAcceptedAppliedLimitNotInformed]
	AS SELECT * FROM [vw_BuyersCondAcceptedAppliedLimit] b
	WHERE b.CondCreditDecisionInformed IS NULL