CREATE VIEW [dbo].[vw_BuyerAppAutoAccepted]
	AS SELECT ba.* FROM [dbo].[vw_BuyerApplications] ba
	WHERE (ba.AutoAccepted is not null) AND (( ba.AutoRejected IS NULL) OR ( (ba.AutoRejected IS NOT NULL) AND (ba.AutoRejected < ba.AutoAccepted) ))	 
