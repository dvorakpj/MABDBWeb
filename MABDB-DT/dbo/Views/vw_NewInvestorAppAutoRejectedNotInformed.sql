CREATE VIEW [dbo].[vw_NewInvestorAppAutoRejectedNotInformed]
	AS SELECT * FROM [dbo].[InvestorApplications] ia
	WHERE ia.AutoRejected is not null and ia.AutoRejectedInformed is NULL
	 
