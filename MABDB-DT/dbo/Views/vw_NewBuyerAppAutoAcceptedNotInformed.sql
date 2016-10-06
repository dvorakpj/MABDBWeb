CREATE VIEW [dbo].[vw_NewBuyerAppAutoAcceptedNotInformed]
	AS 
	SELECT ia.* FROM [dbo].[vw_NewBuyerAppAutoAccepted] ia
	WHERE ia.AutoAcceptedInformed is NULL
	
	 
