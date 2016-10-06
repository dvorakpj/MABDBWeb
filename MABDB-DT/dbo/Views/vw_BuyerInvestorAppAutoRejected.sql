CREATE VIEW [dbo].[vw_NewBuyerAppAutoRejected]
	AS SELECT * FROM [dbo].[BuyerApplications] ia
	WHERE ia.AutoRejected is not null AND (( ia.AutoAccepted IS NULL) OR ( (ia.AutoAccepted IS NOT NULL) AND (ia.AutoAccepted < ia.AutoRejected) ))

