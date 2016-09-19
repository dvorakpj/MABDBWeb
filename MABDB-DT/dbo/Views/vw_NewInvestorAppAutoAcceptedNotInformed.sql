CREATE VIEW [dbo].[vw_NewInvestorAppAutoAcceptedNotInformed]
	AS SELECT * FROM [dbo].[InvestorApplications] ia
	WHERE ia.AutoAccepted is not null and ia.AutoAcceptedInformed is NULL
	 
