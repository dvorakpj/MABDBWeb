CREATE VIEW [dbo].[vw_BuyersCondAcceptedLowerLimitNotInformed]
	AS SELECT * FROM [vw_BuyersCondAcceptedLowerLimit] bal
	Where bal.CondCreditDecisionInformed IS NULL
