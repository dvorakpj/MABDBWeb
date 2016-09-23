CREATE VIEW [dbo].[vw_NewInvestorAppAutoAcceptedNotInformed]
	AS 
	SELECT ia.* FROM [dbo].[vw_NewInvestorAppAutoAccepted] ia
	WHERE ia.AutoAcceptedInformed is NULL
	
	 
