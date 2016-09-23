CREATE VIEW [dbo].[vw_NewInvestorAppAutoRejectedNotInformed]
	AS SELECT * FROM [dbo].[vw_NewInvestorAppAutoRejected] ia
	WHERE ia.AutoRejectedInformed is NULL
	 
