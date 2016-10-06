CREATE VIEW [dbo].[vw_NewBuyerAppAutoAccepted]
	AS 
	SELECT ia.* FROM [dbo].[BuyerApplications] ia
	WHERE (ia.AutoAccepted is not null) AND (( ia.AutoRejected IS NULL) OR ( (ia.AutoRejected IS NOT NULL) AND (ia.AutoRejected < ia.AutoAccepted) ))	 
