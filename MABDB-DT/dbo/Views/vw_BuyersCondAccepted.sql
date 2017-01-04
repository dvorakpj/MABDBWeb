CREATE VIEW [dbo].[vw_BuyersCondAccepted]
	AS SELECT * FROM [Buyer] b
	WHERE b.CondCreditDecision = 'A'
