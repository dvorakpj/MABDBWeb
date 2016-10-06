CREATE VIEW [dbo].[vw_NewBuyerAppAutoRejectedNotInformed]
	AS SELECT * FROM [dbo].[vw_NewBuyerAppAutoRejected] ia
	WHERE ia.AutoRejectedInformed is NULL
	 
